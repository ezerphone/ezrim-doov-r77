package app.luma.torch

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.hardware.input.InputManager
import android.provider.Settings
import android.view.InputDevice
import android.widget.Toast

// כיבוי והפעלה של מסך המגע (R77: טלפון מקשים — המקשים ממשיכים לעבוד).
// משתמש בפונקציה המוסתרת InputManager.disableInputDevice (הרשאת DISABLE_INPUT_DEVICE, בזכות חתימת המערכת).
// המצב נשמר ב-Settings.Global ומוחזר אחרי הפעלה מחדש. גיבוי: הקוד *#*#8682#*#* בחייגן מפעיל את המגע.
object Touch {
    const val CODE = "8682"
    private const val KEY = "ezrim_touch_off"

    // כל מסכי המגע הפיזיים (גם אלה שכבויים כרגע — הם נשארים ברשימה)
    private fun devices(): List<InputDevice> = InputDevice.getDeviceIds().toList()
        .mapNotNull { InputDevice.getDevice(it) }
        .filter { !it.isVirtual && it.supportsSource(InputDevice.SOURCE_TOUCHSCREEN) }

    fun available() = devices().isNotEmpty()

    fun isOff(c: Context): Boolean {
        val d = devices()
        return if (d.isNotEmpty()) d.all { !it.isEnabled } else flag(c)
    }

    private fun flag(c: Context) = try { Settings.Global.getInt(c.contentResolver, KEY, 0) == 1 } catch (_: Exception) { false }

    private fun apply(c: Context, off: Boolean): Boolean {
        val im = c.getSystemService(InputManager::class.java) ?: return false
        val m = try { InputManager::class.java.getMethod(if (off) "disableInputDevice" else "enableInputDevice", Int::class.javaPrimitiveType) }
            catch (_: Exception) { return false }
        var ok = false
        for (d in devices()) ok = try { m.invoke(im, d.id); true } catch (e: Throwable) { android.util.Log.w("Ezrim", "touch $off failed", e); ok }
        return ok
    }

    // false = נכשל (המצב לא נשמר)
    fun set(c: Context, off: Boolean): Boolean {
        val ok = apply(c, off)
        if (ok || !off) try { Settings.Global.putInt(c.contentResolver, KEY, if (off) 1 else 0) } catch (_: Exception) {}
        return ok
    }

    // באתחול: אם המגע היה כבוי — מכבים שוב
    fun restore(c: Context) { if (flag(c)) apply(c, true) }
}

// גיבוי: *#*#8682#*#* בחייגן מפעיל את המגע
class TouchCodeReceiver : BroadcastReceiver() {
    override fun onReceive(c: Context, i: Intent) {
        if (i.data?.host != Touch.CODE) return
        val ok = Touch.set(c, false)
        Toast.makeText(c, if (ok) "המגע הופעל" else "לא ניתן להפעיל את המגע", Toast.LENGTH_SHORT).show()
    }
}
