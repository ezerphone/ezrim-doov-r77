package app.luma.torch

import android.content.Context
import android.content.SharedPreferences
import android.hardware.camera2.CameraCharacteristics
import android.hardware.camera2.CameraManager
import android.os.Handler
import android.os.Looper

object Torch {
    var on = false
    var blink = false
    var busy = false // camera used by another app
    val listeners = mutableListOf<() -> Unit>()
    lateinit var sp: SharedPreferences
    private var cm: CameraManager? = null
    private var id: String? = null
    private var lastSet = 0L
    private val h = Handler(Looper.getMainLooper())
    private const val BLINK_MS = 300L

    // שניות, 0 = כבוי. שינוי בזמן שהפנס דלוק חל מיד: כיבוי אוטומטי מתוזמן (מעכשיו) או מבוטל
    var timer: Int get() = sp.getInt("t", 0)
        set(v) {
            sp.edit().putInt("t", v).apply()
            h.removeCallbacks(autoOff)
            if (on && v > 0) h.postDelayed(autoOff, v * 1000L)
        }
    private val autoOff = Runnable { set(false) }
    var timerLast: Int get() = sp.getInt("tl", 300); set(v) = sp.edit().putInt("tl", v).apply()
    var shake: Boolean get() = sp.getBoolean("s", false); set(v) = sp.edit().putBoolean("s", v).apply()
    var sens: Int get() = sp.getInt("sn", 0); set(v) = sp.edit().putInt("sn", v).apply() // רגישות ניעור: 0 נמוכה, 1 בינונית, 2 גבוהה
    var sound: Boolean get() = sp.getBoolean("snd", true); set(v) = sp.edit().putBoolean("snd", v).apply()
    var theme: Int get() = sp.getInt("th", 0); set(v) = sp.edit().putInt("th", v).apply() // 0 auto,1 light,2 dark
    // מקשי 0–9: הפעולה ללחיצה ארוכה (מחוץ לשדה טקסט). הקודים כמו ברשימת הפעולות:
    // 0 כלום, 1 פנס, 2 אפליקציה, 3 צילום מסך, 4 אחורה, 5 מסך הבית, 6 עוזר אישי, 8 מדיה, 9 אחרונות, 10 שקט/רטט/צלצול, 11 עזר
    fun keyAct(d: Int) = sp.getInt("ka$d", 0)
    fun setKeyAct(d: Int, v: Int) = sp.edit().putInt("ka$d", v).apply()
    fun keyPkg(d: Int) = sp.getString("kp$d", "") ?: ""
    fun setKeyPkg(d: Int, v: String) = sp.edit().putString("kp$d", v).apply()
    // מקש התפריט בשדה טקסט: לחיצה ארוכה מפעילה הקלדה קולית
    var menuDict: Boolean get() = sp.getBoolean("mdi", true); set(v) = sp.edit().putBoolean("mdi", v).apply()
    var dictHold: Boolean get() = sp.getBoolean("dho", true); set(v) = sp.edit().putBoolean("dho", v).apply() // true החזקה, false הפעלה וכיבוי

    fun init(c: Context) {
        if (cm != null) return
        sp = c.applicationContext.getSharedPreferences("luma", 0)
        val m = c.getSystemService(CameraManager::class.java)
        cm = m
        id = m.cameraIdList.firstOrNull { m.getCameraCharacteristics(it).get(CameraCharacteristics.FLASH_INFO_AVAILABLE) == true }
        m.registerTorchCallback(object : CameraManager.TorchCallback() {
            override fun onTorchModeChanged(c: String, e: Boolean) {
                if (c != id) return
                busy = false
                if (!blink && e != on && System.currentTimeMillis() - lastSet > 700) on = e
                emit()
            }
            override fun onTorchModeUnavailable(c: String) {
                if (c != id) return
                busy = true; h.removeCallbacksAndMessages(null); on = false; blink = false; emit()
            }
        }, h)
    }

    private fun hw(v: Boolean) {
        val i = id ?: return
        val m = cm ?: return
        try { m.setTorchMode(i, v) } catch (_: Exception) {}
    }

    private fun emit() = listeners.toList().forEach { it() }

    fun set(v: Boolean) {
        if (v && busy) { emit(); return }
        h.removeCallbacksAndMessages(null)
        lastSet = System.currentTimeMillis()
        blink = false; on = v; hw(v)
        if (v && timer > 0) h.postDelayed(autoOff, timer * 1000L)
        emit()
    }

    // הבהוב פנס: דלוק/כבוי לסירוגין עד שעוצרים (או עד שהטיימר מכבה)
    fun blink(v: Boolean) {
        if (!v) { set(false); return }
        set(true)
        if (!on) return
        blink = true; emit()
        var lit = true
        val r = object : Runnable {
            override fun run() {
                if (!blink) return
                lit = !lit; hw(lit)
                h.postDelayed(this, BLINK_MS)
            }
        }
        h.postDelayed(r, BLINK_MS)
    }
}
