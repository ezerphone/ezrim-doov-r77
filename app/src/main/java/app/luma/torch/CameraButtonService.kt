package app.luma.torch

import android.accessibilityservice.AccessibilityService
import android.content.Intent
import android.media.AudioManager
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.os.PowerManager
import android.os.SystemClock
import android.provider.Settings
import android.view.InputDevice
import android.view.KeyCharacterMap
import android.view.KeyEvent
import android.view.ViewConfiguration
import android.view.accessibility.AccessibilityEvent
import android.view.accessibility.AccessibilityNodeInfo
import android.widget.Toast
import app.luma.torch.dictation.ModelLocator
import app.luma.torch.dictation.PushToTalk
import app.luma.torch.dictation.VoiceIme

// שירות הנגישות "עזרים - קיצורים" של R77 (טלפון מקשים):
//  - לחיצה ארוכה על 0–9 מחוץ לשדה טקסט מפעילה את הפעולה שנבחרה למקש.
//    לא פועל במסך נעול, במסך הבית ובחייגן — שם המקשים עובדים כרגיל.
//  - לחיצה ארוכה על מקש התפריט בשדה טקסט מפעילה הקלדה קולית.
// שירות נגישות מקבל רק לחיצה ושחרור (בלי אירועי "החזקה"), לכן לחיצה ארוכה נמדדת בטיימר:
// הלחיצה נעצרת כאן, ואם המקש שוחרר לפני הזמן — היא נשלחת שוב לאפליקציה כלחיצה רגילה.
// (שם המחלקה נשאר כמו ב-Fanvace: העוזר משתמש בו לפעולות מסך, וההגדרות מזהות את השירות לפיו)
class CameraButtonService : AccessibilityService() {
    private val h = Handler(Looper.getMainLooper())

    companion object {
        // השירות הפעיל — העוזר משתמש בו לפעולות מערכת (מסך הבית, צילום מסך, נעילה…)
        @Volatile var instance: CameraButtonService? = null
            private set
        private val DIALERS = setOf("com.android.dialer", "com.android.incallui", "com.android.server.telecom", "com.android.phone")
    }

    private val edgeMic by lazy { app.luma.torch.dictation.EdgeMic(this) }
    // שליחה חוזרת של לחיצה רגילה נעשית ברקע (ההזרקה ממתינה עד שהאפליקציה מטפלת באירוע)
    private val injector = java.util.concurrent.Executors.newSingleThreadExecutor { Thread(it, "ezrim-keys").apply { isDaemon = true } }

    override fun onServiceConnected() {
        Torch.init(this)
        instance = this
        PushToTalk.indicator = { on -> h.post { if (on) edgeMic.show() else edgeMic.hide() } }
        // כדי לדעת אם המקלדת מוצגת כרגע (חלון המקלדת ברשימת החלונות)
        try { serviceInfo = serviceInfo.apply { flags = flags or android.accessibilityservice.AccessibilityServiceInfo.FLAG_RETRIEVE_INTERACTIVE_WINDOWS } } catch (_: Exception) {}
    }

    override fun onAccessibilityEvent(e: AccessibilityEvent?) {}
    override fun onInterrupt() {}
    override fun onDestroy() {
        if (instance === this) instance = null
        PushToTalk.indicator = null; edgeMic.hide(); h.removeCallbacksAndMessages(null); injector.shutdown()
        super.onDestroy()
    }

    // ---------- הלחיצה שממתינה (עד שיתברר אם היא ארוכה) ----------
    private var pendCode = -1           // המקש שנלחץ ועוד לא שוחרר
    private var pendDigit = -1          // 0–9, או -1 למקש התפריט
    private var longFired = false       // הלחיצה הארוכה כבר בוצעה
    private var holdStarted = false     // מקש התפריט התחיל הקלדה קולית במצב החזקה: השחרור יעצור אותה
    private val swallowUp = HashSet<Int>() // שחרורים שלא מעבירים הלאה (הלחיצה כבר טופלה)

    private val longRun = Runnable {
        if (pendCode == -1) return@Runnable
        longFired = true
        if (pendDigit >= 0) act(Torch.keyAct(pendDigit), Torch.keyPkg(pendDigit))
        else {
            val busy = PushToTalk.active || PushToTalk.keyboard?.pttListening() == true
            if (!busy) { startDictation(); holdStarted = Torch.dictHold }
        }
    }

    // מקש פיזי של המכשיר (ולא לחיצה שעזרים עצמה שלחה שוב, שמגיעה ממקלדת וירטואלית)
    private fun physical(e: KeyEvent): Boolean {
        val d = InputDevice.getDevice(e.deviceId) ?: return false
        return !d.isVirtual && !d.isExternal
    }

    private fun digitOf(code: Int) = if (code in KeyEvent.KEYCODE_0..KeyEvent.KEYCODE_9) code - KeyEvent.KEYCODE_0 else -1

    override fun onKeyEvent(e: KeyEvent): Boolean {
        if (!physical(e)) return false
        val code = e.keyCode
        if (e.action == KeyEvent.ACTION_DOWN) {
            if (e.repeatCount > 0) return code == pendCode || code in swallowUp
            // לחיצה על מקש אחר בזמן שמקש קודם עוד מוחזק: הקודם נשלח מיד כלחיצה רגילה
            if (pendCode != -1 && code != pendCode) flushPending()
            if (code == KeyEvent.KEYCODE_MENU) return menuDown(code)
            val d = digitOf(code)
            if (d < 0 || Torch.keyAct(d) == 0 || !shortcutsAllowed()) return false
            hold(code, d)
            return true
        }
        if (e.action == KeyEvent.ACTION_UP) {
            if (code == pendCode) {
                h.removeCallbacks(longRun)
                val wasLong = longFired
                pendCode = -1; longFired = false
                if (!wasLong) replay(code)                       // לחיצה קצרה: לאפליקציה, כרגיל
                else if (holdStarted) { holdStarted = false; stopDictation() } // החזקה: עזיבה עוצרת את ההקלדה
                return true
            }
            if (swallowUp.remove(code)) return true
        }
        return false
    }

    private fun hold(code: Int, digit: Int) {
        pendCode = code; pendDigit = digit; longFired = false; holdStarted = false
        h.removeCallbacks(longRun)
        h.postDelayed(longRun, ViewConfiguration.getLongPressTimeout().toLong())
    }

    // המקש שממתין נשלח עכשיו כלחיצה רגילה, והשחרור האמיתי שלו (כשיגיע) נבלע
    private fun flushPending() {
        h.removeCallbacks(longRun)
        val code = pendCode
        if (!longFired) replay(code) else if (holdStarted) { holdStarted = false; stopDictation() }
        pendCode = -1; longFired = false
        swallowUp += code
    }

    private fun menuDown(code: Int): Boolean {
        val busy = PushToTalk.active || PushToTalk.keyboard?.pttListening() == true
        if (busy) {
            // באמצע הקלדה קולית: במצב "הפעלה וכיבוי" לחיצה על התפריט עוצרת אותה; במצב החזקה — מתעלמים
            if (!Torch.dictHold) stopDictation()
            swallowUp += code
            return true
        }
        if (!dictationMode()) return false
        hold(code, -1)
        return true
    }

    // שליחה חוזרת של לחיצה רגילה (ממקלדת וירטואלית, כדי שהשירות לא יתפוס אותה שוב)
    private fun replay(code: Int) {
        injector.execute {
            val ok = try {
                val inst = android.app.Instrumentation()
                val t = SystemClock.uptimeMillis()
                inst.sendKeySync(KeyEvent(t, t, KeyEvent.ACTION_DOWN, code, 0, 0, KeyCharacterMap.VIRTUAL_KEYBOARD, 0, 0, InputDevice.SOURCE_KEYBOARD))
                inst.sendKeySync(KeyEvent(t, SystemClock.uptimeMillis(), KeyEvent.ACTION_UP, code, 0, 0, KeyCharacterMap.VIRTUAL_KEYBOARD, 0, 0, InputDevice.SOURCE_KEYBOARD))
                true
            } catch (e: Throwable) { android.util.Log.w("Ezrim", "key replay failed", e); false }
            if (!ok) try { RootShell.run("input keyevent $code", timeoutSec = 10) } catch (_: Exception) {}
        }
    }

    // ---------- איפה הקיצורים של 0–9 פועלים ----------
    private fun shortcutsAllowed(): Boolean {
        if (getSystemService(PowerManager::class.java)?.isInteractive == false) return false
        if (getSystemService(android.app.KeyguardManager::class.java)?.isKeyguardLocked == true) return false
        if (textFocused()) return false
        val pkg = try { rootInActiveWindow?.packageName?.toString() } catch (_: Exception) { null } ?: return false
        if (pkg in homePackages() || pkg in DIALERS) return false
        val dialer = try { getSystemService(android.telecom.TelecomManager::class.java)?.defaultDialerPackage } catch (_: Exception) { null }
        return pkg != dialer
    }

    private fun textFocused(): Boolean = try {
        val n = findFocus(AccessibilityNodeInfo.FOCUS_INPUT)
        n != null && n.isEditable
    } catch (_: Exception) { false }

    // מסך הבית שמוגדר במכשיר (ואם לא נבחר אחד — כל מסכי הבית, חוץ ממסך הגיבוי של ההגדרות)
    private fun homePackages(): Set<String> {
        val home = Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_HOME)
        val def = try { packageManager.resolveActivity(home, android.content.pm.PackageManager.MATCH_DEFAULT_ONLY)?.activityInfo?.packageName } catch (_: Exception) { null }
        if (def != null && def != "android") return setOf(def)
        return try { packageManager.queryIntentActivities(home, 0).map { it.activityInfo.packageName }.filter { it != "com.android.settings" }.toSet() } catch (_: Exception) { emptySet() }
    }

    // ---------- הקלדה קולית ממקש התפריט ----------
    private fun dictationMode(): Boolean {
        if (!Torch.menuDict || !ModelLocator.isInstalled()) return false
        // המשתמש כיבה את המקלדת הקולית: לא מדליקים אותה בשקט
        if (VoiceIme.userOff(this) && !VoiceIme.isEnabled(this)) return false
        if (getSystemService(android.app.KeyguardManager::class.java)?.isKeyguardLocked == true) return false
        return try {
            val n = findFocus(AccessibilityNodeInfo.FOCUS_INPUT)
            n != null && n.isEditable && !n.isPassword
        } catch (_: Exception) { false }
    }

    private fun currentIme(): String? = try { Settings.Secure.getString(contentResolver, Settings.Secure.DEFAULT_INPUT_METHOD) } catch (_: Exception) { null }

    private fun switchIme(id: String?): Boolean {
        if (id.isNullOrEmpty()) return false
        if (Build.VERSION.SDK_INT >= 30) {
            try { if (softKeyboardController.switchToInputMethod(id)) return true } catch (_: Exception) {}
        }
        return try { Settings.Secure.putString(contentResolver, Settings.Secure.DEFAULT_INPUT_METHOD, id) } catch (_: Exception) { false }
    }

    // המקלדת מוצגת עכשיו? (אם אי אפשר לדעת — מניחים שכן)
    private fun imeShown(): Boolean = try {
        windows.any { it.type == android.view.accessibility.AccessibilityWindowInfo.TYPE_INPUT_METHOD }
    } catch (_: Exception) { true }

    // השדה בפוקוס אבל המקלדת מוסתרת: נגיעה בשדה מציגה אותה
    private fun showKeyboard() {
        try { findFocus(AccessibilityNodeInfo.FOCUS_INPUT)?.performAction(AccessibilityNodeInfo.ACTION_CLICK) } catch (_: Exception) {}
        // אם המקלדת בכל זאת לא עלתה ולא התחילה להקשיב — לא משאירים "מקשיב" על המסך
        h.postDelayed({
            if (PushToTalk.active && PushToTalk.keyboard?.pttListening() != true && !imeShown()) PushToTalk.done()
        }, 4000)
    }

    private fun startDictation() {
        val me = VoiceIme.id(this)
        val prev = currentIme()
        val shown = imeShown()
        if (prev?.substringBefore(';') == me) {
            // המקלדת הקולית כבר פתוחה: רק מתחילים להקשיב, ובסיום לא מחליפים מקלדת
            PushToTalk.begin(null)
            if (shown) PushToTalk.keyboard?.pttStart() else showKeyboard()
            return
        }
        if (!VoiceIme.enableNow(this)) { toast("המקלדת הקולית לא מופעלת"); return }
        PushToTalk.begin { switchIme(prev) }
        if (!switchIme(me)) { PushToTalk.done(); toast("לא ניתן לעבור למקלדת הקולית"); return }
        if (!shown) showKeyboard()
        // מכאן המקלדת הקולית עולה ומתחילה להקשיב בעצמה (onStartInputView)
    }

    private fun stopDictation() {
        val k = PushToTalk.keyboard
        when {
            k != null -> k.pttStop()            // עוצרת, מכניסה את הטקסט, ואז done() מחזיר את המקלדת הקודמת
            PushToTalk.active -> PushToTalk.done() // עזיבה לפני שהמקלדת הקולית הספיקה לעלות
        }
    }

    private fun toast(t: String) { h.post { Toast.makeText(this, t, Toast.LENGTH_SHORT).show() } }

    // ---------- הפעולות ----------
    private fun act(a: Int, pkg: String) {
        when (a) {
            1 -> Torch.set(!Torch.on)
            2 -> try { packageManager.getLaunchIntentForPackage(pkg)?.let { startActivity(it.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)) } } catch (_: Exception) {}
            3 -> performGlobalAction(GLOBAL_ACTION_TAKE_SCREENSHOT)
            4 -> performGlobalAction(GLOBAL_ACTION_BACK)
            5 -> performGlobalAction(GLOBAL_ACTION_HOME)
            6 -> try { startActivity(Intent(Intent.ACTION_ASSIST).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)) } catch (_: Exception) {}
            8 -> mediaPlayPause()
            9 -> performGlobalAction(GLOBAL_ACTION_RECENTS)
            10 -> cycleRinger()
            11 -> try { startActivity(Intent(this, app.luma.torch.assistant.AssistActivity::class.java).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)) } catch (_: Exception) {}
        }
    }

    // צלצול ← רטט ← שקט ← צלצול
    private fun cycleRinger() {
        val (next, name) = when (app.luma.torch.assistant.Assistant.ringerNow(this)) {
            AudioManager.RINGER_MODE_NORMAL -> AudioManager.RINGER_MODE_VIBRATE to "רטט"
            AudioManager.RINGER_MODE_VIBRATE -> AudioManager.RINGER_MODE_SILENT to "שקט"
            else -> AudioManager.RINGER_MODE_NORMAL to "צלצול"
        }
        toast(if (app.luma.torch.assistant.Assistant.setRinger(this, next)) name else "לא ניתן לשנות את מצב הצלצול")
    }

    // הפעלה/עצירה של המדיה שמתנגנת כרגע (מוזיקה, שיעור, פודקאסט), כמו מקש play באוזניות
    private fun mediaPlayPause() {
        val am = getSystemService(AudioManager::class.java) ?: return
        am.dispatchMediaKeyEvent(KeyEvent(KeyEvent.ACTION_DOWN, KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE))
        am.dispatchMediaKeyEvent(KeyEvent(KeyEvent.ACTION_UP, KeyEvent.KEYCODE_MEDIA_PLAY_PAUSE))
    }
}
