package app.luma.torch.assistant

import android.Manifest
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.net.Uri
import android.provider.CallLog
import android.provider.ContactsContract.CommonDataKinds
import java.time.Instant
import java.time.LocalDate
import java.time.ZoneId

// פקודות הטלפון של עזר (R77): חיוג לאיש קשר, חזרה לשיחה האחרונה, שיחות אחרונות ומספר של איש קשר.
// הכול רק אחרי פתיחת נעילה (הפקודות האלה לא ברשימת FREE_WHEN_LOCKED).
object Phone {
    const val NEED_CONTACTS = "צריך לאשר לעזרים גישה לאנשי הקשר (בהגדרות עזר ← הגדרות נוספות ← הרשאות)"
    const val NEED_CALL = "צריך לאשר לעזרים הרשאה להתקשר (בהגדרות עזר ← הגדרות נוספות ← הרשאות)"
    const val NEED_LOG = "צריך לאשר לעזרים גישה ליומן השיחות (בהגדרות עזר ← הגדרות נוספות ← הרשאות)"

    private class Num(val name: String, val number: String, val type: Int, val primary: Boolean)

    private fun ok(c: Context, p: String) = c.checkSelfPermission(p) == PackageManager.PERMISSION_GRANTED
    private fun n(s: String) = IntentEngine.n(s)

    // "הבית של סבתא" / "בית של סבתא" → "סבתא" (כשאין איש קשר בשם המלא)
    private fun stripHome(q: String): String {
        val w = q.split(' ').filter { it.isNotEmpty() }
        return if (w.size > 2 && n(w[0]) in setOf(n("בית"), n("הבית")) && n(w[1]) == n("של")) w.drop(2).joinToString(" ") else q
    }

    private fun allNumbers(c: Context): List<Num> {
        val out = mutableListOf<Num>()
        c.contentResolver.query(CommonDataKinds.Phone.CONTENT_URI,
            arrayOf(CommonDataKinds.Phone.DISPLAY_NAME, CommonDataKinds.Phone.NUMBER, CommonDataKinds.Phone.TYPE, CommonDataKinds.Phone.IS_SUPER_PRIMARY),
            null, null, null)?.use { cur ->
            while (cur.moveToNext()) {
                val name = cur.getString(0) ?: continue
                val num = cur.getString(1) ?: continue
                out += Num(name, num, cur.getInt(2), cur.getInt(3) != 0)
            }
        }
        return out
    }

    // איש הקשר הכי מתאים לשם שנאמר. null = לא נמצא; רשימה עם יותר משם אחד = כמה אנשי קשר באותה מידה
    private fun find(c: Context, said: String): List<List<Num>> {
        val all = allNumbers(c).groupBy { it.name }
        fun score(name: String, q: String): Int {
            val a = n(name); val b = n(q)
            if (b.isEmpty()) return 0
            if (a == b) return 3
            val qw = b.split(' '); val nw = a.split(' ')
            if (qw.all { it in nw }) return 2              // כל המילים שנאמרו נמצאות בשם ("משה" ← "משה כהן")
            if (a.startsWith(b) || nw.any { it.startsWith(b) }) return 1
            return 0
        }
        for (q in listOf(said, stripHome(said)).distinct()) {
            val scored = all.map { (name, nums) -> score(name, q) to nums }.filter { it.first > 0 }
            val best = scored.maxOfOrNull { it.first } ?: continue
            return scored.filter { it.first == best }.map { it.second }
        }
        return emptyList()
    }

    // המספר הראשי: מסומן כברירת מחדל, אחרת נייד, אחרת הראשון
    private fun pick(nums: List<Num>) = nums.firstOrNull { it.primary }
        ?: nums.firstOrNull { it.type == CommonDataKinds.Phone.TYPE_MOBILE } ?: nums.first()

    private fun list(names: List<String>): String =
        if (names.size == 1) names[0] else names.dropLast(1).joinToString(", ") + " ו" + names.last()

    private fun lookup(c: Context, name: String?, onOne: (Num) -> Assistant.Reply): Assistant.Reply {
        if (name.isNullOrBlank()) return Assistant.Reply("למי?")
        if (!ok(c, Manifest.permission.READ_CONTACTS)) return Assistant.Reply(NEED_CONTACTS)
        val found = try { find(c, name) } catch (_: Exception) { emptyList() }
        return when {
            found.isEmpty() -> Assistant.Reply("לא מצאתי את $name באנשי הקשר")
            found.size > 1 -> Assistant.Reply("מצאתי כמה: " + list(found.take(3).map { it.first().name }) + ". תגיד את השם המלא")
            else -> onOne(pick(found[0]))
        }
    }

    private fun dial(c: Context, number: String) {
        try { c.startActivity(Intent(Intent.ACTION_CALL, Uri.fromParts("tel", number, null)).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)) } catch (_: Exception) {}
    }

    // "תתקשר לאבא" — מחייג מיד
    fun call(c: Context, name: String?): Assistant.Reply = lookup(c, name) { num ->
        if (!ok(c, Manifest.permission.CALL_PHONE)) Assistant.Reply(NEED_CALL)
        else Assistant.Reply("מתקשר ל${num.name}", then = { dial(c, num.number) })
    }

    // "מה המספר של אבא"
    fun number(c: Context, name: String?): Assistant.Reply = lookup(c, name) { num ->
        Assistant.Reply("המספר של ${num.name}: ${spaced(num.number)}")
    }

    // מספר בקבוצות קצרות, כדי שיוקרא ספרה-ספרה ולא כמספר אחד גדול
    private fun spaced(num: String): String {
        val d = num.filter { it.isDigit() || it == '+' }
        return if (d.length == 10 && d.startsWith("0")) "${d.substring(0, 3)} ${d.substring(3, 6)} ${d.substring(6)}" else d.chunked(3).joinToString(" ")
    }

    private class Call(val name: String?, val number: String, val type: Int, val date: Long)

    private fun calls(c: Context, limit: Int, missedOnly: Boolean = false): List<Call> {
        val out = mutableListOf<Call>()
        val sel = if (missedOnly) "${CallLog.Calls.TYPE} = ${CallLog.Calls.MISSED_TYPE}" else null
        c.contentResolver.query(CallLog.Calls.CONTENT_URI,
            arrayOf(CallLog.Calls.CACHED_NAME, CallLog.Calls.NUMBER, CallLog.Calls.TYPE, CallLog.Calls.DATE),
            sel, null, "${CallLog.Calls.DATE} DESC")?.use { cur ->
            while (cur.moveToNext() && out.size < limit) {
                val num = cur.getString(1) ?: continue
                if (num.isBlank()) continue   // מספר חסוי
                out += Call(cur.getString(0)?.takeIf { it.isNotBlank() }, num, cur.getInt(2), cur.getLong(3))
            }
        }
        return out
    }

    private fun who(k: Call) = k.name ?: spaced(k.number)

    private fun whenSaid(ms: Long): String {
        val t = Instant.ofEpochMilli(ms).atZone(ZoneId.systemDefault())
        val hm = "%d:%02d".format(t.hour, t.minute)
        return when (t.toLocalDate()) {
            LocalDate.now() -> "בשעה $hm"
            LocalDate.now().minusDays(1) -> "אתמול בשעה $hm"
            else -> "ב-${t.dayOfMonth}.${t.monthValue} בשעה $hm"
        }
    }

    // "תחזיר צלצול" — למי שהתקשר אחרון (שיחה נכנסת או שלא נענתה)
    fun callBack(c: Context): Assistant.Reply {
        if (!ok(c, Manifest.permission.READ_CALL_LOG)) return Assistant.Reply(NEED_LOG)
        val last = try { calls(c, 20).firstOrNull { it.type == CallLog.Calls.INCOMING_TYPE || it.type == CallLog.Calls.MISSED_TYPE } } catch (_: Exception) { null }
            ?: return Assistant.Reply("לא מצאתי שיחה נכנסת")
        if (!ok(c, Manifest.permission.CALL_PHONE)) return Assistant.Reply(NEED_CALL)
        return Assistant.Reply("מתקשר ל${who(last)}", then = { dial(c, last.number) })
    }

    // "מי התקשר אליי" / "שיחות שלא נענו"
    fun recent(c: Context): Assistant.Reply {
        if (!ok(c, Manifest.permission.READ_CALL_LOG)) return Assistant.Reply(NEED_LOG)
        val since = System.currentTimeMillis() - 24 * 3600_000L
        val missed = try { calls(c, 5, missedOnly = true).filter { it.date >= since } } catch (_: Exception) { emptyList() }
        if (missed.isNotEmpty()) {
            val head = if (missed.size == 1) "יש שיחה אחת שלא נענתה" else "יש ${missed.size} שיחות שלא נענו"
            return Assistant.Reply("$head: " + list(missed.map { "מ${who(it)} ${whenSaid(it.date)}" }))
        }
        val last = try { calls(c, 3) } catch (_: Exception) { emptyList() }
        if (last.isEmpty()) return Assistant.Reply("אין שיחות ביומן")
        return Assistant.Reply("אין שיחות שלא נענו. השיחות האחרונות: " + list(last.map { k ->
            val dir = when (k.type) {
                CallLog.Calls.OUTGOING_TYPE -> "יוצאת"
                CallLog.Calls.MISSED_TYPE -> "לא נענתה"
                else -> "נכנסת"
            }
            "${who(k)}, $dir, ${whenSaid(k.date)}"
        }))
    }
}
