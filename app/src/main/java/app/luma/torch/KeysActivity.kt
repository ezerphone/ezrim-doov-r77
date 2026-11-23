package app.luma.torch

import android.content.Intent
import android.graphics.Typeface
import android.os.Bundle
import android.view.Gravity
import android.view.View
import android.widget.*
import app.luma.torch.dictation.ModelLocator
import app.luma.torch.dictation.VoiceIme

// מקשים: מה תעשה לחיצה ארוכה על כל אחד מהמקשים 0–9 (הבחירה עצמה במסך KeyActionActivity),
// והקלדה קולית בלחיצה ארוכה על מקש התפריט בשדה טקסט. מבוצע על ידי שירות הנגישות "עזרים - קיצורים".
class KeysActivity : BaseActivity() {
    private lateinit var banner: View
    private lateinit var shield: View
    private lateinit var rows: LinearLayout
    private lateinit var dictSec: View

    companion object {
        fun summary(c: BaseActivity, act: Int, pkg: String) = when (act) {
            1 -> "פנס"
            2 -> if (pkg.isEmpty()) "לא נבחרה אפליקציה" else "פתיחת " + try {
                c.packageManager.getApplicationInfo(pkg, 0).loadLabel(c.packageManager).toString()
            } catch (_: Exception) { "אפליקציה שלא נמצאה" }
            3 -> "צילום מסך"
            4 -> "חזרה אחורה"
            5 -> "חזרה למסך הבית"
            6 -> "עוזר אישי"
            8 -> "הפעלה / עצירה של מדיה"
            9 -> "אפליקציות אחרונות"
            10 -> "שקט / רטט / צלצול"
            11 -> "עזר"
            else -> "אף אחד"
        }
    }

    private fun keyRow(d: Int) = LinearLayout(this).apply {
        gravity = Gravity.CENTER_VERTICAL; background = shape(card, 18, line); setPadding(dp(12), dp(10), dp(14), dp(10))
        layoutParams = LinearLayout.LayoutParams(-1, -2).apply { bottomMargin = dp(8) }
        addView(TextView(this@KeysActivity).apply {
            text = d.toString(); textSize = 18f; setTextColor(acc); typeface = Typeface.DEFAULT_BOLD; gravity = Gravity.CENTER
            background = shape(accSoft, 12)
        }, LinearLayout.LayoutParams(dp(38), dp(38)).apply { marginEnd = dp(12) })
        addView(LinearLayout(this@KeysActivity).apply {
            orientation = LinearLayout.VERTICAL
            addView(TextView(this@KeysActivity).apply { text = "מקש $d"; textSize = 15f; setTextColor(fg); typeface = Typeface.DEFAULT_BOLD })
            val a = Torch.keyAct(d)
            addView(TextView(this@KeysActivity).apply {
                text = summary(this@KeysActivity, a, Torch.keyPkg(d)); textSize = 13f; setTextColor(if (a == 0) dim else acc); setPadding(0, dp(1), 0, 0)
            })
        }, LinearLayout.LayoutParams(0, -2, 1f))
        addView(ImageView(this@KeysActivity).apply { setImageDrawable(icon(R.drawable.ic_chevron, dim)) }, LinearLayout.LayoutParams(dp(18), dp(18)))
        setOnClickListener { startActivity(Intent(this@KeysActivity, KeyActionActivity::class.java).putExtra("key", d)) }
    }

    override fun onCreate(b: Bundle?) {
        super.onCreate(b)
        val goA11y = tv("הפעלת השירות") { enableA11y(); refreshState() }
        style(goA11y, true)
        val bannerText = TextView(this).apply {
            text = "כדי לבחור פעולות למקשים צריך קודם להפעיל את שירות הנגישות \"עזרים - קיצורים\"."
            setTextColor(fg); textSize = 14f; setPadding(0, 0, 0, dp(12))
        }
        banner = section("נדרשת הפעלת שירות", bannerText, goA11y)
        rows = LinearLayout(this).apply { orientation = LinearLayout.VERTICAL }
        dictSec = dictationSection()
        shield = View(this).apply { isClickable = true }
        val locked = FrameLayout(this).apply {
            addView(rows)
            addView(shield, FrameLayout.LayoutParams(-1, -1))
        }
        page(header("מקשים", null, "מה תעשה לחיצה ארוכה על כל מקש"), banner, locked)
        refreshState()
    }

    private fun note(t: String) = TextView(this).apply {
        text = t; textSize = 12f; setTextColor(dim); setLineSpacing(0f, 1.2f); setPadding(dp(4), 0, dp(4), dp(12))
    }

    // כל עוד שירות הנגישות כבוי, אי אפשר לבחור פעולות. הסיכומים מתעדכנים בכל חזרה למסך
    private fun refreshState() {
        rows.removeAllViews()
        rows.addView(note("לא פועל במסך נעול, במסך הבית, בחייגן ובשדה טקסט. לחיצה קצרה עובדת כרגיל."))
        (listOf(1, 2, 3, 4, 5, 6, 7, 8, 9, 0)).forEach { rows.addView(keyRow(it)) }
        rows.addView(View(this), LinearLayout.LayoutParams(-1, dp(8)))
        rows.addView(dictSec)
        val on = a11yOn()
        banner.visibility = if (on) View.GONE else View.VISIBLE
        shield.visibility = if (on) View.GONE else View.VISIBLE
        rows.alpha = if (on) 1f else 0.4f
    }

    // מקש התפריט בשדה טקסט: לחיצה ארוכה מכתיבה לתוך השדה
    private fun dictationSection(): View {
        val installed = ModelLocator.isInstalled()
        val sw = Switch(this).apply { text = "לחיצה ארוכה: הקלדה קולית"; setTextColor(fg); isChecked = Torch.menuDict && installed }
        tint(sw)
        var repaint: () -> Unit = {}
        val mode = group(listOf("החזקה", "הפעלה וכיבוי"), { if (Torch.dictHold) 0 else 1 }) { Torch.dictHold = it == 0; repaint() }
        mode.layoutParams = LinearLayout.LayoutParams(-1, -2).apply { topMargin = dp(12) }
        val hint = TextView(this).apply {
            textSize = 12f; setTextColor(dim); setLineSpacing(0f, 1.2f); setPadding(dp(2), dp(10), 0, 0)
        }
        fun paint() {
            val on = sw.isChecked
            mode.visibility = if (on) View.VISIBLE else View.GONE
            hint.text = when {
                !installed -> "מודל זיהוי הדיבור לא נמצא בקושחה."
                !on -> "כשהסמן בשדה טקסט, לחיצה ארוכה על מקש התפריט תכתיב לתוך השדה."
                Torch.dictHold -> "מחזיקים את מקש התפריט, מדברים ועוזבים. הטקסט נכנס והמקלדת הרגילה חוזרת."
                else -> "לחיצה ארוכה מתחילה להכתיב, לחיצה נוספת על התפריט עוצרת. הטקסט נכנס והמקלדת הרגילה חוזרת."
            }
        }
        repaint = { paint() }
        sw.isEnabled = installed
        sw.setOnCheckedChangeListener { _, c ->
            Torch.menuDict = c
            // המקלדת הקולית חייבת להיות ברשימת המקלדות; אם המשתמש כיבה אותה — לא מדליקים בשקט, אומרים לו
            if (c && !VoiceIme.enableNow(this)) Toast.makeText(this, "כדי להכתיב צריך להפעיל את המקלדת הקולית במסך ההקלדה הקולית", Toast.LENGTH_LONG).show()
            paint()
        }
        paint()
        return section("מקש התפריט בשדה טקסט", sw, mode, hint)
    }

    override fun onResume() { super.onResume(); refreshState() }
}
