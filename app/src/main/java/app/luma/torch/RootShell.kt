package app.luma.torch

import java.io.BufferedReader
import java.io.BufferedWriter
import java.io.IOException

// מעטפת root אחת שנשארת פתוחה. הרשאת ה-root נבדקת פעם אחת בלבד — בכניסה לאפליקציה (warmUp),
// והתוצאה נשמרת; שאר האפליקציה משתמשת בתוצאה הזו ולא מבקשת שוב.
object RootShell {
    private var proc: Process? = null
    private var w: BufferedWriter? = null
    private var r: BufferedReader? = null
    @Volatile private var checked = false   // נבדק בכניסה הנוכחית
    @Volatile private var ok = false        // יש root
    private var plainSu = false             // אם "su --mount-master" לא נתמך — su רגיל
    // שומר זמן: פקודה שנתקעת (pm שלא עונה וכד') נעצרת אחרי זמן קצוב, כדי שלא תחסום את כל פעולות ה-root באפליקציה
    private val timer = java.util.concurrent.Executors.newSingleThreadScheduledExecutor { Thread(it, "root-timeout").apply { isDaemon = true } }
    private const val TIMEOUT_SEC = 120L      // פקודה רגילה (העתקה, התקנת קול וכד')
    private const val CHECK_TIMEOUT_SEC = 30L // בדיקת root בכניסה

    // נקרא בכל כניסה לעזרים: הבדיקה היחידה של root
    fun warmUp() {
        // בדיקה חוזרת אחרי כישלון: לנסות שוב קודם את המצב המלא (--mount-master)
        if (checked && !ok) plainSu = false
        checked = false
        Thread { hasRoot() }.start()
    }

    // הבדיקה נכשלה (אין root / נדחה / Magisk עוד לא היה מוכן)
    val failed get() = checked && !ok

    // יש root? (נבדק פעם אחת בכניסה; אחר כך מחזיר את התוצאה השמורה)
    @Synchronized
    fun hasRoot(): Boolean {
        if (checked) return ok
        val (code, out) = exec("id", timeoutSec = CHECK_TIMEOUT_SEC)
        ok = code == 0 && out.contains("uid=0")
        checked = true
        return ok
    }

    private fun alive(): Boolean {
        val p = proc ?: return false
        return try { p.exitValue(); false } catch (_: IllegalThreadStateException) { true }
    }

    private fun close() {
        try { proc?.destroy() } catch (_: Exception) {}
        proc = null; w = null; r = null
    }

    // פקודה כ-root. אם הבדיקה בכניסה נכשלה — לא מבקשים שוב (עד הכניסה הבאה)
    @Synchronized
    fun run(cmd: String, timeoutSec: Long = TIMEOUT_SEC): Pair<Int, String> {
        if (checked && !ok) return -1 to "denied"
        if (!checked && !hasRoot()) return -1 to "denied"
        return exec(cmd, timeoutSec = timeoutSec)
    }

    private fun open(): Boolean {
        close()
        return try {
            // --mount-master: ה-root רואה את כל המערכת (גם תיקיות של אפליקציות אחרות), ולא רק את מה שעזרים רואה
            val p = ProcessBuilder(if (plainSu) listOf("su") else listOf("su", "--mount-master")).redirectErrorStream(true).start()
            proc = p; w = p.outputStream.bufferedWriter(); r = p.inputStream.bufferedReader()
            true
        } catch (_: Exception) { false }
    }

    private fun exec(cmd: String, retry: Boolean = true, timeoutSec: Long = TIMEOUT_SEC): Pair<Int, String> {
        if (!alive() && !open()) return -1 to "su not found"
        val marker = "__EZRIM_END_${System.nanoTime()}__"
        val timedOut = java.util.concurrent.atomic.AtomicBoolean(false)
        val p = proc
        // עבר הזמן: סוגרים את המעטפת — הקריאה למטה משתחררת, והמעטפת נפתחת מחדש בפקודה הבאה
        val watchdog = timer.schedule({ timedOut.set(true); try { p?.destroy() } catch (_: Exception) {} }, timeoutSec, java.util.concurrent.TimeUnit.SECONDS)
        return try {
            // הפקודה רצה בתת-מעטפת: גם exit או שגיאה בתוכה לא סוגרים את חיבור ה-root
            w!!.write("( $cmd\n) < /dev/null\nrc=\$?\necho\necho \"$marker\$rc\"\n")
            w!!.flush()
            val sb = StringBuilder()
            var code: Int
            while (true) {
                val line = r!!.readLine() ?: throw IOException("closed")
                if (line.startsWith(marker)) { code = line.removePrefix(marker).trim().toIntOrNull() ?: -1; break }
                sb.append(line).append('\n')
            }
            code to sb.toString().trim()
        } catch (e: Exception) {
            close()
            // נעצרה בגלל זמן: לא מריצים אותה שוב (היא אולי עוד רצה, או כבר עשתה חלק)
            if (timedOut.get()) return -1 to "timeout"
            // המעטפת נסגרה: אם זה עוד לפני שהיה root — אולי "--mount-master" לא נתמך; מנסים פעם אחת עם su רגיל.
            // אם כבר היה root — פשוט פותחים מחדש בשקט
            if (retry) {
                if (!ok && !plainSu) { plainSu = true; return exec(cmd, false, timeoutSec) }
                if (ok) return exec(cmd, false, timeoutSec)
            }
            -1 to (e.message ?: "denied")
        } finally {
            watchdog.cancel(false)
        }
    }
}
