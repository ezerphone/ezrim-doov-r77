package app.luma.torch.assistant

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.ServiceInfo
import android.os.BatteryManager
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import app.luma.torch.R
import app.luma.torch.dictation.ModelLocator
import app.luma.torch.dictation.SpeechEngine

// "היי עזר": תיאום בין ההאזנה ברקע לבין מי שצריך את המיקרופון (העוזר, המקלדת הקולית)
object Hotword {
    private var holds = 0
    // סוד פנימי: רק "היי עזר" של עזרים עצמה יכולה לשלוח לחלונית פקודה לביצוע (אפליקציה אחרת לא מכירה אותו)
    val token: String = java.util.UUID.randomUUID().toString()
    var service: HotwordService? = null

    fun enabled(c: Context) = Assistant.prefs(c).getBoolean("hotword", false)
    fun chargingOnly(c: Context) = Assistant.prefs(c).getBoolean("hotword_charging", false)
    fun whenLocked(c: Context) = Assistant.prefs(c).getBoolean("hotword_locked", false)
    fun whenOff(c: Context) = Assistant.prefs(c).getBoolean("hotword_off", false)

    // צליל "עזר מקשיב": שלושה תווים קצרים עולים (צליל C), מסונתז — בלי קובץ
    fun chime() {
        try {
            val sr = 44100
            val notes = listOf(Triple(0.0, 880.0, 0.12), Triple(0.075, 1175.0, 0.12), Triple(0.15, 1760.0, 0.25))
            val n = (sr * 0.45).toInt(); val buf = DoubleArray(n)
            for ((off, f, d) in notes) {
                val s0 = (off * sr).toInt(); val len = (d * sr).toInt(); val amp = if (f > 1500) 0.35 else 0.45
                for (k in 0 until len) {
                    if (s0 + k >= n) break
                    val t = k.toDouble() / sr; val ph = 2 * Math.PI * f * t
                    val env = minOf(1.0, t / 0.012) * Math.exp(-t * 4 / d)
                    buf[s0 + k] += amp * env * (Math.sin(ph) + 0.08 * Math.sin(2 * ph))
                }
            }
            val peak = buf.maxOf { Math.abs(it) }.coerceAtLeast(1e-6)
            val pcm = ShortArray(n) { (buf[it] / peak * 0.6 * Short.MAX_VALUE).toInt().toShort() }
            val at = android.media.AudioTrack.Builder()
                .setAudioAttributes(android.media.AudioAttributes.Builder().setUsage(android.media.AudioAttributes.USAGE_ASSISTANCE_SONIFICATION)
                    .setContentType(android.media.AudioAttributes.CONTENT_TYPE_SONIFICATION).build())
                .setAudioFormat(android.media.AudioFormat.Builder().setEncoding(android.media.AudioFormat.ENCODING_PCM_16BIT).setSampleRate(sr)
                    .setChannelMask(android.media.AudioFormat.CHANNEL_OUT_MONO).build())
                .setTransferMode(android.media.AudioTrack.MODE_STATIC).setBufferSizeInBytes(n * 2).build()
            at.write(pcm, 0, n); at.play()
            Handler(Looper.getMainLooper()).postDelayed({ try { at.release() } catch (_: Exception) {} }, 800)
        } catch (_: Exception) {}
    }

    // כשעזר מקשיב לפקודה / מדבר: המוזיקה מונמכת (לא נעצרת), ואחר כך חוזרת לעוצמה הרגילה
    private var duck: android.media.AudioFocusRequest? = null
    fun duckOn(c: Context) {
        if (duck != null) return
        try {
            val r = android.media.AudioFocusRequest.Builder(android.media.AudioManager.AUDIOFOCUS_GAIN_TRANSIENT_MAY_DUCK)
                .setAudioAttributes(android.media.AudioAttributes.Builder().setUsage(android.media.AudioAttributes.USAGE_ASSISTANT)
                    .setContentType(android.media.AudioAttributes.CONTENT_TYPE_SPEECH).build()).build()
            if (c.getSystemService(android.media.AudioManager::class.java).requestAudioFocus(r) == android.media.AudioManager.AUDIOFOCUS_REQUEST_GRANTED) duck = r
        } catch (_: Exception) {}
        // רשת ביטחון: אם משהו לא שחרר (החלונית לא נפתחה וכד') — המוזיקה חוזרת לעוצמה אחרי 2 דקות
        val app = c.applicationContext
        duckH.removeCallbacksAndMessages(null)
        duckH.postDelayed({ duckOff(app) }, 120_000)
    }
    private val duckH = android.os.Handler(android.os.Looper.getMainLooper())
    fun duckOff(c: Context) {
        duckH.removeCallbacksAndMessages(null)
        val r = duck ?: return; duck = null
        try { c.getSystemService(android.media.AudioManager::class.java).abandonAudioFocusRequest(r) } catch (_: Exception) {}
    }

    fun hold() { holds++; service?.pauseListening() }
    fun release() { if (holds > 0) holds--; if (holds == 0) service?.resumeSoon() }
    val held get() = holds > 0

    // אם השירות לא רץ למרות שההגדרה דלוקה (אנדרואיד דחה אותו ברקע) — מנסים שוב (נקרא כשהמסך נדלק / הנעילה נפתחת)
    fun retry(c: Context) { if (service == null && enabled(c)) sync(c) }

    fun hasMic(c: Context) = c.checkSelfPermission(android.Manifest.permission.RECORD_AUDIO) == android.content.pm.PackageManager.PERMISSION_GRANTED

    // מפעיל / עוצר את השירות לפי ההגדרה (נקרא מההגדרות, מפתיחת עזרים ומאתחול).
    // בלי הרשאת מיקרופון השירות לא עולה (אחרת הוא "מקשיב" בלי לשמוע ומנסה שוב בלי סוף)
    fun sync(c: Context) {
        if (enabled(c)) allowOverlay(c)
        val i = Intent(c, HotwordService::class.java)
        try {
            if (enabled(c) && ModelLocator.isInstalled() && hasMic(c)) c.startForegroundService(i) else c.stopService(i)
        } catch (_: Exception) {}
    }
}

// "הצגה מעל אפליקציות אחרות" — בלעדיה אנדרואיד חוסם את פתיחת החלונית מהרקע.
// "הדלקת המסך" (אנדרואיד 14) — בלעדיה "היי עזר" במסך כבוי פותח את החלונית אבל המסך לא נדלק.
// ההרשאות ניתנות בזכות חתימת המערכת; כאן מוודאים שגם ה-appop שלהן מאושר (MANAGE_APP_OPS_MODES שכבר יש לעזרים)
fun allowOverlay(c: Context) {
    val ops = c.getSystemService(android.app.AppOpsManager::class.java) ?: return
    val set = try { ops.javaClass.getMethod("setMode", String::class.java, Int::class.javaPrimitiveType, String::class.java, Int::class.javaPrimitiveType) } catch (_: Throwable) { return }
    fun allow(op: String) = try { set.invoke(ops, op, android.os.Process.myUid(), c.packageName, android.app.AppOpsManager.MODE_ALLOWED) } catch (_: Throwable) {}
    if (!android.provider.Settings.canDrawOverlays(c)) allow(android.app.AppOpsManager.OPSTR_SYSTEM_ALERT_WINDOW)
    if (android.os.Build.VERSION.SDK_INT >= 34) {
        val now = try { ops.unsafeCheckOpNoThrow("android:turn_screen_on", android.os.Process.myUid(), c.packageName) } catch (_: Throwable) { -1 }
        if (now != android.app.AppOpsManager.MODE_ALLOWED) allow("android:turn_screen_on")
    }
}

class HotwordService : Service() {
    private var failed = false
    private val h = Handler(Looper.getMainLooper())
    private lateinit var engine: SpeechEngine
    private var mine = false
    private var charging = false
    // סלחני לשגיאות זיהוי: "היי עזר", "איי אזר", "אייזר", "היעזר", "היי עזרא", "שלום עזר"… (אחרי נרמול: אותיות סופיות רגילות)
    private val wake = Regex("(^|\\s)([האע]?י+|שלומ|אהלנ)\\s?[עאה]?זר")
    private val restart = Runnable { listen() }
    private val fireMax = Runnable { fire.run() }
    private var woke = false
    private var lastText = ""
    private var wakeWords = 0
    private var echo = false   // ההאזנה הנוכחית עם ביטול הד (כי מתנגנת מוזיקה)
    private fun musicOn() = try { getSystemService(android.media.AudioManager::class.java).isMusicActive } catch (_: Exception) { false }
    // מוזיקה התחילה / נגמרה: מתחילים את ההאזנה מחדש במצב המתאים (עם ביטול הד רק כשצריך — בלעדיו הזיהוי מעט טוב יותר)
    private val musicCheck = object : Runnable {
        override fun run() {
            if (!mine) return
            if (!woke && musicOn() != echo) { mine = false; engine.cancel(); listen(); return }
            h.postDelayed(this, 3000)
        }
    }
    // אחרי "היי עזר": פותחים את החלונית; אם נאמרה פקודה באותו משפט — היא נשלחת ישר לביצוע
    private val fire = Runnable {
        if (!woke) return@Runnable
        woke = false; h.removeCallbacksAndMessages(null)
        val words = lastText.trim().split(Regex("\\s+"))
        val q = words.drop(wakeWords).joinToString(" ").trim()
        mine = false; engine.cancel()
        allowOverlay(this)
        try {
            @Suppress("DEPRECATION")
            getSystemService(android.os.PowerManager::class.java).newWakeLock(
                android.os.PowerManager.SCREEN_BRIGHT_WAKE_LOCK or android.os.PowerManager.ACQUIRE_CAUSES_WAKEUP, "luma:hotword").acquire(3000)
        } catch (_: Exception) {}
        try {
            startActivity(Intent(this, AssistActivity::class.java).putExtra("q", q).putExtra("hotword", true).putExtra("token", Hotword.token)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP))
        } catch (_: Exception) { Hotword.duckOff(this) }
    }
    private val power = object : BroadcastReceiver() {
        override fun onReceive(c: Context, i: Intent) { charging = isCharging(); if (shouldListen()) resumeSoon() else pauseListening() }
    }

    override fun onBind(i: Intent?): IBinder? = null

    override fun onCreate() {
        super.onCreate()
        engine = SpeechEngine.get(this)
        val nm = getSystemService(NotificationManager::class.java)
        nm.createNotificationChannel(NotificationChannel("hotword", "היי עזר", NotificationManager.IMPORTANCE_MIN))
        val n = Notification.Builder(this, "hotword").setSmallIcon(R.drawable.ic_mic).setContentTitle("עזר מקשיב ל״היי עזר״").setOngoing(true).build()
        // אנדרואיד 14: שירות מיקרופון שעולה מהרקע (אחרי הפעלה מחדש) נדחה אם אין פטור.
        // הפטור: START_ACTIVITIES_FROM_BACKGROUND. ואם בכל זאת נדחה — לא קורסים: נסגרים, ושירות המקשים
        // מנסה שוב כשהמסך נדלק / הנעילה נפתחת
        try {
            if (android.os.Build.VERSION.SDK_INT >= 30) startForeground(77, n, ServiceInfo.FOREGROUND_SERVICE_TYPE_MICROPHONE) else startForeground(77, n)
        } catch (e: Exception) {
            android.util.Log.w("Ezrim", "hotword: startForeground refused", e)
            failed = true; stopSelf(); return
        }
        registerReceiver(power, IntentFilter().apply { addAction(Intent.ACTION_POWER_CONNECTED); addAction(Intent.ACTION_POWER_DISCONNECTED)
            addAction(Intent.ACTION_SCREEN_ON); addAction(Intent.ACTION_SCREEN_OFF); addAction(Intent.ACTION_USER_PRESENT) })
        charging = isCharging()
        Hotword.service = this
        engine.warm()
        resumeSoon()
    }

    override fun onStartCommand(i: Intent?, f: Int, id: Int) = if (failed) START_NOT_STICKY else START_STICKY

    override fun onDestroy() {
        if (failed) { super.onDestroy(); return }
        Hotword.service = null
        h.removeCallbacksAndMessages(null)
        if (mine) engine.cancel()
        try { unregisterReceiver(power) } catch (_: Exception) {}
        super.onDestroy()
    }

    // צליל קצר שמאשר ש"היי עזר" נקלט
    private fun beep() {
        Hotword.chime()
    }

    private fun isCharging() = getSystemService(BatteryManager::class.java).isCharging
    private fun shouldListen(): Boolean {
        if (Hotword.held || (Hotword.chargingOnly(this) && !charging)) return false
        val on = getSystemService(android.os.PowerManager::class.java).isInteractive
        if (!on) return Hotword.whenOff(this)                       // מסך כבוי
        val locked = getSystemService(android.app.KeyguardManager::class.java).isKeyguardLocked
        return !locked || Hotword.whenLocked(this)                  // מסך נעול
    }

    fun pauseListening() { h.removeCallbacks(restart); if (mine) { mine = false; engine.cancel() } }
    fun resumeSoon() { h.removeCallbacks(restart); h.postDelayed(restart, 800) }

    private fun listen() {
        // ההרשאה בוטלה בזמן שהשירות רץ: עוצרים (לא מנסים שוב כל כמה שניות)
        if (!Hotword.hasMic(this)) { stopSelf(); return }
        if (!shouldListen() || mine) return
        if (engine.state() != "ready" || engine.isListening) { engine.warm(); h.postDelayed(restart, 1500); return }
        val echoNow = musicOn()
        mine = engine.start(object : SpeechEngine.Session {
            override fun onText(text: String) {
                val t = IntentEngine.n(text)
                if (woke) { lastText = text; h.removeCallbacks(fire); h.postDelayed(fire, 1200); return } // ממשיכים לשמוע את הפקודה
                val m = wake.find(t)
                if (m != null) {
                    woke = true; lastText = text; wakeWords = t.substring(0, m.range.last + 1).split(' ').count { it.isNotEmpty() }
                    Hotword.duckOn(this@HotwordService)   // מנמיכים מוזיקה, כדי לשמוע את הפקודה
                    beep()
                    h.postDelayed(fire, 1200); h.postDelayed(fireMax, 4000)  // שקט של 1.2 שנ' אחרי הפקודה, או 4 שנ' לכל היותר
                } else if (t.length > 40) engine.resetTranscript() // לא צוברים טקסט ארוך ברקע
            }
            override fun onFinished() { mine = false; resumeSoon() }
            override fun onError(message: String) { mine = false; h.postDelayed(restart, 5000) }
        }, echoNow)
        echo = echoNow
        if (!mine) h.postDelayed(restart, 1500) else { h.removeCallbacks(musicCheck); h.postDelayed(musicCheck, 3000) }
    }
}
