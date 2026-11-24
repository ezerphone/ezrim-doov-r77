package app.luma.torch

import android.app.AlertDialog
import android.os.Bundle
import android.view.View
import android.widget.*
import java.io.File

// התאמה אישית של R77: הגדרה חד-פעמית (בלתי הפיכה) — הודעות, מציג HTML, שירותי גוגל, מצלמה, חסימת אפליקציות וידאו והתקנת אפליקציות.
// הסימון שההגדרה בוצעה נשמר במחיצת המערכת, כך שהוא שורד איפוס.
class CustomizationActivity : BaseActivity() {
    companion object {
        const val MMS_DIR = "/system/app/MtkMms_r70"
        const val HTML_DIR = "/system/app/HTMLViewer"
        const val CAMERA_DIR = "/system_ext/app/Camera"
        const val GALLERY_DIR = "/system_ext/priv-app/MtkGallery2"
        const val FILES_DIR = "/product/priv-app/FilesGoogle"
        // חסימת אפליקציות וידאו: הגרסאות הכשרות יושבות בקושחה, ועוברות למקומן בזמן ההגדרה (ואז התיקייה נמחקת)
        const val APPS_SRC = "/system/etc/ezrim/apps"
        const val SMART_GALLERY_SRC = "$APPS_SRC/SmartGallery.apk"
        const val FILES_SRC = "$APPS_SRC/FilesGoogle.apk"
        const val SMART_GALLERY_DIR = "/system/app/SmartGallery"
        // שירותי גוגל: החבילות והתיקיות שלהן (כל הרכיבים שעובדים רק יחד עם שירותי Google Play)
        val GOOGLE_PKGS = listOf(
            "com.google.android.gms", "com.google.android.gsf", "com.android.vending", "com.hideps",
            "com.google.android.apps.restore", "com.google.android.partnersetup", "com.google.android.onetimeinitializer",
            "com.google.android.gms.supervision", "com.google.android.gms.location.history", "com.google.android.syncadapters.calendar",
            "com.google.android.feedback", "com.google.android.configupdater", "com.google.android.projection.gearhead",
            "com.google.android.apps.turbo", "com.google.android.apps.carrier.carrierwifi")
        val GOOGLE_DIRS = listOf(
            "/product/priv-app/GmsCore", "/system_ext/priv-app/GoogleServicesFramework", "/product/priv-app/Phonesky",
            "/product/priv-app/HidePlayStore", "/product/priv-app/GoogleRestore", "/product/priv-app/GooglePartnerSetup",
            "/product/priv-app/GoogleOneTimeInitializer", "/product/priv-app/FamilyLinkParentalControls",
            "/product/app/GoogleLocationHistory", "/product/app/GoogleCalendarSyncAdapter", "/system_ext/priv-app/GoogleFeedback",
            "/product/priv-app/ConfigUpdater", "/product/priv-app/AndroidAutoStub", "/product/priv-app/Turbo", "/product/priv-app/GWP")
        private val DONE = listOf("/system/etc/ezrim/setup_done", "/system_ext/etc/ezrim_setup_done")
        fun setupDone() = DONE.any { File(it).exists() }
        // מדיניות המתקין: המתקין קורא את הקובץ בכל ניסיון התקנה (קובץ חסר = פתוח בלי סיסמה)
        const val INSTALLER_CONF = "/system/etc/installer_policy.conf"
        private val INSTALL_MODES = listOf("open", "update_only", "blocked")
        private val INSTALL_NAMES = listOf("פתוח", "רק עדכונים", "חסום")
    }

    // המצב הנוכחי במכשיר
    private var mmsNow = false
    private var htmlNow = false
    private var googleNow = false
    private var camNow = false
    private var videoNow = false   // יש מה להחליף (גלריה או Files) והקבצים הכשרים נמצאים בקושחה
    private var videoSrc = false
    // הבחירות במסך (0 להשאיר, 1 למחוק, -1 לא קיים)
    private var mms = 0; private var html = 0; private var google = 0
    private var cam = 0; private var video = 0
    private var install = 0; private var needPw = false
    private var pwField: EditText? = null

    override fun onCreate(b: Bundle?) {
        super.onCreate(b)
        page(header("התאמה אישית"), TextView(this).apply { text = "בודק…"; setTextColor(dim); textSize = 14f })
        Thread {
            val done = setupDone()
            if (!done) {
                mmsNow = File(MMS_DIR).exists(); htmlNow = File(HTML_DIR).exists()
                googleNow = GOOGLE_DIRS.any { File(it).exists() }
                camNow = File(CAMERA_DIR).exists()
                videoSrc = File(SMART_GALLERY_SRC).exists() && File(FILES_SRC).exists()
                videoNow = videoSrc && (File(GALLERY_DIR).exists() || File(FILES_DIR).exists())
            }
            runOnUiThread { if (!isFinishing) { if (done) buildDone() else buildSetup() } }
        }.start()
    }

    // בחירה בין כמה אפשרויות; אפשרות לא זמינה — אפורה ולא לחיצה (העיצוב המקורי)
    private fun choice(names: List<String>, enabled: List<Boolean>, sel: () -> Int, pick: (Int) -> Unit): LinearLayout {
        val cs = mutableListOf<TextView>()
        fun paint() = cs.forEachIndexed { i, c -> style(c, sel() == i); c.alpha = if (enabled[i]) 1f else 0.35f }
        names.forEachIndexed { i, n -> cs += tv(n, 14f) { if (enabled[i]) { pick(i); paint() } } }
        paint()
        return row(cs)
    }

    private fun note(t: String) = TextView(this).apply { text = t; textSize = 13f; setTextColor(dim); setPadding(dp(2), dp(10), 0, 0) }

    // התקנת אפליקציות: פתוח / רק עדכונים / חסום, ואם רוצים — סיסמה (לא ב"חסום": אין פעולה מותרת להגן עליה)
    private val INSTALL_NOTES = listOf("אפשר להתקין ולעדכן אפליקציות", "אפשר רק לעדכן אפליקציות קיימות", "אי אפשר להתקין ולא לעדכן")
    private fun installPart(): View {
        val modeNote = note("")
        val sw = Switch(this).apply { text = "דרוש סיסמה"; setTextColor(fg); isChecked = needPw; setPadding(dp(2), dp(12), 0, 0) }
        tint(sw); sw.textSize = 14f
        val field = EditText(this).apply {
            hint = "סיסמה"; textSize = 15f; setTextColor(fg); setHintTextColor(dim); isSingleLine = true
            inputType = android.text.InputType.TYPE_CLASS_TEXT or android.text.InputType.TYPE_TEXT_VARIATION_PASSWORD
            background = shape(card, 14, line); setPadding(dp(14), dp(12), dp(14), dp(12))
            layoutParams = LinearLayout.LayoutParams(-1, -2).apply { topMargin = dp(10) }
        }
        pwField = field
        fun paint() {
            modeNote.text = INSTALL_NOTES[install]
            sw.visibility = if (install == 2) View.GONE else View.VISIBLE
            field.visibility = if (needPw && install != 2) View.VISIBLE else View.GONE
        }
        sw.setOnCheckedChangeListener { _, on -> needPw = on; paint() }
        val sec = section("התקנת אפליקציות", choice(INSTALL_NAMES, listOf(true, true, true), { install }) { install = it; paint() }, modeNote, sw, field)
        paint()
        return sec
    }

    // תוכן הקובץ: mode=..., ואם יש סיסמה: salt=<hex> ו-password_sha256=<sha256(salt+password) hex>
    private fun installerConfig(mode: String, password: String): String {
        val sb = StringBuilder("mode=$mode\n")
        if (password.isNotEmpty()) {
            val salt = ByteArray(16).also { java.security.SecureRandom().nextBytes(it) }.joinToString("") { "%02x".format(it) }
            val hash = java.security.MessageDigest.getInstance("SHA-256").digest((salt + password).toByteArray(Charsets.UTF_8))
                .joinToString("") { "%02x".format(it) }
            sb.append("salt=$salt\n").append("password_sha256=$hash\n")
        }
        return sb.toString()
    }

    private fun installText() = INSTALL_NAMES[install] + if (install != 2 && needPw) ", עם סיסמה" else ""

    // ---------- לפני ההגדרה ----------
    private fun keepOrDelete(title: String, now: Boolean, sel: () -> Int, pick: (Int) -> Unit, extra: String? = null): View {
        val sec = section(title, choice(listOf("להשאיר", "למחוק"), listOf(now, now), sel, pick))
        if (!now) sec.addView(note("לא קיים במכשיר")) else if (extra != null) sec.addView(note(extra))
        return sec
    }

    private fun buildSetup() {
        mms = if (mmsNow) 0 else -1; html = if (htmlNow) 0 else -1; google = if (googleNow) 0 else -1
        cam = if (camNow) 0 else -1; video = if (videoNow) 0 else -1
        val mmsSec = keepOrDelete("הודעות", mmsNow, { mms }, { mms = it })
        val htmlSec = keepOrDelete("מציג HTML", htmlNow, { html }, { html = it })
        val googleSec = keepOrDelete("שירותי גוגל", googleNow, { google }, { google = it },
            "חנות Play, שירותי Google Play והרכיבים שתלויים בהם")
        val camSec = keepOrDelete("מצלמה", camNow, { cam }, { cam = it })
        val videoSec = section("חסימת אפליקציות וידאו", choice(listOf("לא", "כן"), listOf(videoNow, videoNow), { video }, { video = it })).apply {
            addView(note(if (videoNow) "מחליף את הגלריה בגלריה כשרה, ואת Files של גוגל בגרסה בלי וידאו"
                else if (!videoSrc) "הקבצים של האפליקציות הכשרות לא נמצאו בקושחה" else "לא קיים במכשיר"))
        }
        val ok = tv("אישור (בלתי הפיך)", 16f) { confirmSetup() }.apply { style(this, true) }
        ok.layoutParams = LinearLayout.LayoutParams(-1, -2).apply { bottomMargin = dp(22) }
        page(header("התאמה אישית", null, "הגדרה חד-פעמית"), mmsSec, htmlSec, googleSec, camSec, videoSec, installPart(), ok)
    }

    private fun buildDone() {
        page(header("התאמה אישית"), section("ההגדרה בוצעה", TextView(this).apply {
            text = "ההגדרה החד-פעמית כבר בוצעה במכשיר הזה."; textSize = 14f; setTextColor(fg)
        }))
    }

    private fun confirmSetup() {
        if (install != 2 && needPw && pwField?.text.isNullOrBlank()) {
            Toast.makeText(this, "הקלד סיסמה, או כבה את \"דרוש סיסמה\"", Toast.LENGTH_SHORT).show(); return
        }
        val lines = listOf(
            "הודעות: " + if (!mmsNow) "לא קיים" else if (mms == 1) "יימחק" else "נשאר",
            "מציג HTML: " + if (!htmlNow) "לא קיים" else if (html == 1) "יימחק" else "נשאר",
            "שירותי גוגל: " + if (!googleNow) "לא קיימים" else if (google == 1) "יימחקו" else "נשארים",
            "מצלמה: " + if (!camNow) "לא קיימת" else if (cam == 1) "תימחק" else "נשארת",
            "חסימת אפליקציות וידאו: " + if (!videoNow) "לא זמין" else if (video == 1) "כן" else "לא",
            "התקנת אפליקציות: " + installText())
        dlg().setTitle("לבצע את השינויים?")
            .setMessage("שים לב: הפעולה בלתי הפיכה.\n\n" + lines.joinToString("\n") +
                if (deletes()) "\n\nבסיום המכשיר יופעל מחדש." else "")
            .setPositiveButton("ביצוע") { _, _ -> runSetup() }
            .setNegativeButton("ביטול", null).show()
    }

    private fun deletes() = (mmsNow && mms == 1) || (htmlNow && html == 1) || (googleNow && google == 1) ||
        (camNow && cam == 1) || (videoNow && video == 1)

    private fun progress(): AlertDialog = dlg().setTitle("מבצע…")
        .setMessage("אל תכבה את המכשיר. הוא יופעל מחדש בסיום.").setCancelable(false).show()

    // ---------- מודול Magisk שמכסה את תיקיות המערכת ----------
    // מודול שמוסיף/מחליף קבצים ב-/system מכסה את התיקייה בעותק בזיכרון: שינוי שנעשה דרכו לא נשמר באמת.
    // במקרה כזה מריצים את הפקודה במרחב פרטי שבו הכיסוי מוסר (רק לפקודה הזו), כך שהשינוי נכתב למחיצה האמיתית,
    // והמודול ממשיך לעבוד כרגיל. אם אי אפשר — מודיעים איזה מודול מפריע.
    private class Blocked(val modules: String) : Exception()
    private val SYS_RE = "^(/system/priv-app|/system/app|/system/etc|/system_ext/priv-app|/system_ext/app|/system_ext/etc|" +
        "/system/system_ext/priv-app|/system/system_ext/app|/system/system_ext/etc|/product/priv-app|/product/app|" +
        "/system/product/priv-app|/system/product/app)(/|\$)"
    private fun covers() = "cut -d' ' -f5 /proc/self/mountinfo | grep -E '$SYS_RE'"

    // השינוי נכתב מתחת לכיסוי של מודול: התהליכים הרגילים יראו אותו רק אחרי הפעלה מחדש
    @Volatile private var underModule = false
    private fun runSystem(cmd: String): String {
        if (runAsRoot(covers() + " | head -1").second.isBlank()) return runAsRoot(cmd).second
        underModule = true
        val f = File(cacheDir, "sys_cmd.sh")
        f.writeText(
            // מרחב פרטי באמת (אחרת הסרת הכיסוי הייתה משפיעה על כל המכשיר) — ואם לא, עוצרים
            // ה-mount של אנדרואיד (toybox) צריך שני ארגומנטים לשינוי הפצה; --make-rprivate לגיבוי (busybox)
            "mount -o rprivate none / 2>/dev/null || mount --make-rprivate / 2>/dev/null\n" +
            "if grep -q ' shared:' /proc/self/mountinfo; then echo NS_FAIL; exit 90; fi\n" +
            "for m in \$(${covers()} | sort -r); do umount -l \"\$m\" 2>/dev/null; done\n" +
            "if [ -n \"\$(${covers()})\" ]; then echo NS_FAIL; exit 90; fi\n" +
            cmd + "\n")
        val out = runAsRoot("if command -v unshare >/dev/null 2>&1; then unshare -m sh ${q(f.path)}; else echo NS_FAIL; fi; rm -f ${q(f.path)}").second
        if (out.contains("NS_FAIL")) throw Blocked(modules())
        return out
    }

    // שמות המודולים הפעילים שמשנים את תיקיות המערכת
    private fun modules() = runAsRoot("for m in /data/adb/modules/*; do [ -e \"\$m/disable\" ] && continue; " +
        "for d in system/priv-app system/app system/etc system/system_ext system/product system_ext product; do [ -e \"\$m/\$d\" ] && { basename \"\$m\"; break; }; done; done")
        .second.lines().map { it.trim() }.filter { it.isNotEmpty() && !it.contains('*') }.joinToString(", ")

    private fun blocked(mods: String) = dlg().setTitle("אי אפשר לשנות כרגע")
        .setMessage("מודול Magisk" + (if (mods.isNotBlank()) " ($mods)" else "") +
            " מכסה את תיקיות המערכת, ולכן השינוי לא יישמר. כבה את המודול, הפעל מחדש את המכשיר ונסה שוב.")
        .setPositiveButton("סגור", null).show()


    private val REMOUNT = "mount -o remount,rw / 2>/dev/null; mount -o remount,rw /system 2>/dev/null; " +
        "mount -o remount,rw /system_ext 2>/dev/null; mount -o remount,rw /product 2>/dev/null; "

    private fun runSetup() {
        val p = progress()
        Thread {
            val steps = mutableListOf<Pair<String, String>>()   // (סימון הצלחה, שם לתצוגה)
            val cmd = StringBuilder(REMOUNT)
            try {
                if (mmsNow && mms == 1) { cmd.append("rm -rf $MMS_DIR; [ -d $MMS_DIR ] || echo M_OK; "); steps += "M_OK" to "הודעות" }
                if (htmlNow && html == 1) { cmd.append("rm -rf $HTML_DIR; [ -d $HTML_DIR ] || echo H_OK; "); steps += "H_OK" to "מציג HTML" }
                if (camNow && cam == 1) { cmd.append("rm -rf $CAMERA_DIR; [ -d $CAMERA_DIR ] || echo C_OK; "); steps += "C_OK" to "מצלמה" }
                if (videoNow && video == 1) {
                    // גלריה: מוחקים את של המכשיר ומעבירים את הכשרה ל-/system/app (לא priv-app — בלי סיכון להרשאות מערכת; אותה מחיצה — העברה מיידית)
                    val sg = "$SMART_GALLERY_DIR/SmartGallery.apk"
                    cmd.append("pm uninstall-system-updates com.android.gallery3d >/dev/null 2>&1; rm -rf $GALLERY_DIR; " +
                        "mkdir -p $SMART_GALLERY_DIR && mv -f $SMART_GALLERY_SRC $sg && chown -R root:root $SMART_GALLERY_DIR && " +
                        "chmod 755 $SMART_GALLERY_DIR && chmod 644 $sg && chcon -R u:object_r:system_file:s0 $SMART_GALLERY_DIR 2>/dev/null; " +
                        "[ ! -d $GALLERY_DIR ] && [ -s $sg ] && echo VG_OK; ")
                    steps += "VG_OK" to "גלריה כשרה"
                    // Files: אותה חבילה ואותה חתימה — מחליפים את הקובץ (קודם מסירים עדכונים שהותקנו מעליו)
                    val fa = "$FILES_DIR/FilesGoogle.apk"
                    cmd.append("pm uninstall-system-updates com.google.android.apps.nbu.files >/dev/null 2>&1; " +
                        "mkdir -p $FILES_DIR && rm -rf $FILES_DIR/oat && cp -f $FILES_SRC $fa && chown -R root:root $FILES_DIR && " +
                        "chmod 755 $FILES_DIR && chmod 644 $fa && chcon -R u:object_r:system_file:s0 $FILES_DIR 2>/dev/null; " +
                        "rm -f /data/dalvik-cache/arm64/*FilesGoogle* 2>/dev/null; cmp -s $FILES_SRC $fa && echo VF_OK; ")
                    steps += "VF_OK" to "Files בלי וידאו"
                }
                if (googleNow && google == 1) {
                    // קודם מסירים עדכונים שהותקנו מעל גרסת המערכת (אחרת הם נשארים כאפליקציה רגילה), ואז את התיקיות
                    val dirs = GOOGLE_DIRS.joinToString(" ")
                    cmd.append("for p in ${GOOGLE_PKGS.joinToString(" ")}; do pm uninstall-system-updates \$p >/dev/null 2>&1; done; ")
                    cmd.append("rm -rf $dirs; G=1; for d in $dirs; do [ -e \$d ] && G=0; done; [ \$G = 1 ] && echo G_OK; ")
                    steps += "G_OK" to "שירותי גוגל"
                }
                // התקנות: תמיד שורת mode; עם סיסמה — salt ו-password_sha256 (הסיסמה עצמה לא נשמרת).
                // הקובץ נכתב קודם ב-filesDir, מועתק כ-root, ונבדק שהתוכן במערכת זהה (אחרת ✗ — לא "הצלחה בשקט")
                val pw = if (install != 2 && needPw) pwField?.text?.toString()?.trim().orEmpty() else ""
                val f = File(filesDir, "installer_policy.conf")
                f.writeText(installerConfig(INSTALL_MODES[install], pw))
                cmd.append("cp -f ${q(f.path)} $INSTALLER_CONF && chmod 0644 $INSTALLER_CONF && chown root:root $INSTALLER_CONF && " +
                    "{ chcon u:object_r:system_file:s0 $INSTALLER_CONF 2>/dev/null; cmp -s ${q(f.path)} $INSTALLER_CONF && echo I_OK; }; rm -f ${q(f.path)}; ")
                steps += "I_OK" to "התקנות"
            } catch (_: Exception) { steps += "X_FAIL" to "הכנת הקבצים" }
            val out = if (steps.any { it.first == "X_FAIL" }) "" else try { runSystem(cmd.toString()) } catch (b: Blocked) {
                File(filesDir, "installer_policy.conf").delete()
                runOnUiThread { p.dismiss(); blocked(b.modules) }; return@Thread
            }
            File(filesDir, "installer_policy.conf").delete()   // הקובץ הזמני (עם טביעת הסיסמה) — תמיד נמחק
            val failed = steps.filter { !out.contains(it.first) }
            // הכול הצליח: מסמנים שההגדרה בוצעה (במחיצת המערכת — שורד איפוס) ומפעילים מחדש
            val marked = failed.isEmpty() && try { runSystem(REMOUNT +
                "{ mkdir -p /system/etc/ezrim && touch /system/etc/ezrim/setup_done; } 2>/dev/null || touch /system_ext/etc/ezrim_setup_done; " +
                "[ -e /system/etc/ezrim/setup_done ] || [ -e /system_ext/etc/ezrim_setup_done ] && echo D_OK; " +
                "rm -rf $APPS_SRC; " +   // ההגדרה חד-פעמית: הקבצים הכשרים כבר במקומם (או שלא נבחרו) — מפנים מקום
                "mount -o ro,remount /system 2>/dev/null || true").contains("D_OK") } catch (_: Blocked) { false }
            runOnUiThread {
                // לא נמחקה אפליקציה (רק הגדרת ההתקנות, שנקראת בכל התקנה) — בלי הפעלה מחדש
                if (marked && steps.none { it.first != "I_OK" } && !underModule) { p.dismiss(); recreate(); return@runOnUiThread }
                if (marked) { Thread { runAsRoot("sync; reboot") }.start(); return@runOnUiThread }
                p.dismiss()
                val report = steps.joinToString("\n") { (k, name) -> (if (k in failed.map { it.first }) "✗  " else "✓  ") + name }
                dlg().setTitle("חלק מהשינויים לא בוצעו")
                    .setMessage((if (report.isBlank()) "הפעולה נכשלה" else report) +
                        "\n\nלא ניתן היה לכתוב למחיצת המערכת. ייתכן שאין הרשאת root או שהמחיצה מוגנת מפני שינוי.")
                    .setPositiveButton("סגור") { _, _ -> recreate() }.setCancelable(false).show()
            }
        }.start()
    }
}
