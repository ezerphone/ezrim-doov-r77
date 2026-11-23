package app.luma.torch.assistant

import java.time.DayOfWeek
import java.time.Duration
import java.time.LocalDate
import java.time.LocalDateTime
import java.time.temporal.TemporalAdjusters

// חילוץ פרטים מהמשפט, אחרי שמנוע ההבנה (OfflineNlu) בחר פקודה —
// משך זמן, שעה, טקסט תזכורת, שם איש קשר, שם שיר, איזה זמן מזמני היום.
class IntentEngine {

    data class Understanding(
        val intent: String,             // הפקודה (שמות התוויות של מנוע ההבנה), או "other"
        val confidence: Float,
        val duration: Duration? = null, // טיימר, "בעוד…"
        val time: LocalDateTime? = null, // שעון מעורר / תזכורת בשעה מסוימת
        val text: String? = null,       // טקסט התזכורת / שם איש הקשר / שם השיר / שם האפליקציה
        val artist: String? = null,     // "של X" בבקשת שיר
        val zman: String? = null,       // sunset, sunrise, candles, shabbat_end, chatzot, dawn, shema, tefila, mincha, plag, fast_start, fast_end, all
        val dayOffset: Int = 0,         // 0 היום, 1 מחר, 2 מחרתיים
        val hebrew: Boolean = false,    // "תאריך עברי"
        val number: Double? = null      // אחוזים, סכום, כוסות, שנה…
    )

    // מוציא פרטים מהמשפט, לפי הפקודה שמנוע ההבנה בחר
    fun parse(intent: String, conf: Float, text: String, now: LocalDateTime = LocalDateTime.now()): Understanding {
        val t = Tok(text)
        val base = Understanding(intent, conf, dayOffset = t.dayOffset())
        return when (intent) {
            "timer" -> base.copy(duration = t.duration())
            "alarm" -> {
                val d = if (t.has("בעוד")) t.duration() else null
                base.copy(time = d?.let { now.plus(it).withSecond(0).withNano(0) } ?: t.clockTime(now, alarm = true))
            }
            "reminder" -> {
                // רק משך הזמן שמיד אחרי "בעוד" ("בעוד עשר דקות לשים את העוגה לחצי שעה" = 10 דקות)
                val b = t.norm.indexOfFirst { it == n("בעוד") || it == n("עוד") }
                val d = if (b >= 0) t.duration(b + 1, contiguous = true) else null
                val time = d?.let { now.plus(it).withSecond(0).withNano(0) } ?: t.clockTime(now)
                base.copy(duration = d, time = time, text = t.remainder(REMINDER_WORDS).ifBlank { null })
            }
            "call" -> base.copy(text = t.contactName())
            "play_song" -> { val (q, a) = t.song(); base.copy(text = q, artist = a) }
            "open_app" -> base.copy(text = t.remainder(APP_WORDS).ifBlank { null }?.let { stripL(it) })
            "zmanim" -> base.copy(zman = t.zman(), dayOffset = t.dayOrWeekday(now))
            "volume_set", "brightness_set" -> base.copy(number = t.percent())
            "vat" -> base.copy(number = t.amount(), text = if (t.has("בלי") || t.has("לפני") || t.has("ללא") || t.has("נטו")) "minus" else "plus")
            "expense_add" -> base.copy(number = t.amount(), text = t.remainder(LIST_WORDS).let { r -> r.split(' ').filter { w -> w.toDoubleOrNull() == null && w !in setOf("שקל", "שקלים", "ש״ח", "₪") }
                .dropWhile { w -> w in setOf("על", "את", "ב", "בשביל") }.joinToString(" ") }.ifBlank { null })
            "water_add" -> base.copy(number = t.amount() ?: 1.0)
            "years_since" -> base.copy(number = t.amount())
            "sleep_timer" -> base.copy(duration = t.duration())
            "navigate" -> base.copy(text = t.remainder(NAV_WORDS).ifBlank { null }?.let { stripL(it) })
            "world_time" -> base.copy(text = t.remainder(WT_WORDS).ifBlank { null }?.let { stripPrefixB(it) })
            "holiday_when", "date_calc", "hebrew_date_when" -> base.copy(text = t.remainder(WHEN_WORDS).ifBlank { null })
            "note_add", "note_delete", "todo_add", "todo_done", "shopping_add", "shopping_remove", "reminder_cancel" ->
                base.copy(text = t.remainder(LIST_WORDS).ifBlank { null })
            "date_query" -> base.copy(hebrew = t.has("עברי") || t.has("העברי") || t.has("בעברית"), dayOffset = t.dayOrWeekday(now))
            else -> base
        }
    }

    private fun stripPrefixB(s: String): String {
        val w = s.split(' ').toMutableList()
        if (w[0].length > 3 && w[0][0] == 'ב') w[0] = w[0].substring(1)
        return w.joinToString(" ")
    }

    private fun stripL(s: String): String {
        val w = s.split(' ').toMutableList()
        if (w[0].length > 3 && w[0][0] == 'ל') w[0] = w[0].substring(1)
        return w.joinToString(" ")
    }

    companion object {
        val APP_WORDS by lazy { set("תפתח", "תפתחי", "פתח", "פתחי", "לפתוח", "תפעיל", "תפעילי", "הפעל", "להפעיל", "תיכנס", "תכנס", "כנס", "היכנס",
            "להיכנס", "תעלה", "תריץ", "תקפיץ", "תביא", "את", "האפליקציה", "אפליקציה", "אפליקציית", "לאפליקציה", "לאפליקציית", "היישום", "יישום", "ל", "אל") }

        fun n(s: String) = Features.normalize(s) // לנרמול מילים לחיפוש

        private fun set(vararg w: String) = w.map { n(it) }.toHashSet()

        val NAV_WORDS by lazy { set("תנווט", "נווט", "לנווט", "תנווטי", "תחפש", "חפש", "תמצא", "מצא", "באפליקציית", "באפליקציה", "בוויז", "בווייז",
            "במפות", "במפה", "הניווט", "ניווט", "לי", "את", "אל", "איך", "מגיעים", "מגיע", "להגיע", "דרך", "מסלול", "הדרך") }
        val WT_WORDS by lazy { set("מה", "השעה", "שעה", "כמה", "עכשיו", "איזו", "יש", "באיזו", "אצל", "תגיד", "לי") }
        val WHEN_WORDS by lazy { set("מתי", "כמה", "ימים", "יום", "נשארו", "נשאר", "עד", "עוד", "יוצא", "חל", "חלה", "יהיה", "באיזה", "תאריך", "השנה",
            "זה", "יוצאת", "מתחיל", "מתחילה", "לי", "תגיד") }
        val LIST_WORDS by lazy { set("תרשום", "רשום", "תרשמי", "לרשום", "תוסיף", "הוסף", "תוסיפי", "להוסיף", "תכתוב", "כתוב", "תכתבי", "תשמור", "שמור",
            "תמחק", "מחק", "תמחקי", "תוריד", "הורד", "תסיר", "הסר", "תסמן", "סמן", "תבטל", "בטל", "פתק", "הפתק", "בפתק", "לפתקים", "פתקים",
            "משימה", "המשימה", "משימות", "למשימות", "לרשימת", "ברשימת", "מרשימת", "רשימת", "הקניות", "קניות", "לקניות", "הוצאה", "הוצאתי", "שילמתי",
            "קניתי", "על", "את", "ש", "שצריך", "לקנות", "גם", "בוצע", "בוצעה", "סיימתי", "עשיתי", "התזכורת", "תזכורת", "של", "חדש", "חדשה", "לי") }
        val FILLER: Set<String> = set("בבקשה", "היי", "עזרים", "נו", "יאללה", "רגע", "שמע", "תקשיב", "אממ", "אה", "עכשיו", "מהר", "תודה", "כבר", "אם", "אפשר",
            "תוכל", "תוכלי", "אני", "רוצה", "צריך", "צריכה", "לי", "בא", "מבקש", "מבקשת", "תעשה", "טובה", "הייתי", "יכול", "יכולה", "אתה", "פה", "כאן")
        val REMINDER_WORDS = set("תזכיר", "תזכירי", "תזכירו", "הזכר", "להזכיר", "תזכורת", "תרשום", "תקבע", "קבע", "תוסיף", "תיצור", "שים", "תשים",
            "תכניס", "תעדכן", "תודיע", "אותי", "אל", "תתן", "לשכוח", "שלא", "אשכח", "תדאג", "חייב", "לזכור", "תזכור", "לי")
        val CALL_WORDS = set("תתקשר", "תתקשרי", "תתקשרו", "התקשר", "התקשרי", "להתקשר", "תחייג", "תחייגי", "תחייגו", "חייג", "חייגי", "לחייג", "תצלצל",
            "תצלצלי", "צלצל", "צלצלי", "לצלצל", "תטלפן", "טלפן", "טלפני", "לטלפן", "תוציא", "שיחה", "שיחת", "טלפון", "תרים", "תעשה", "תפתח", "תחבר",
            "אותי", "לדבר", "עם", "אל", "תשיג", "תביא", "תשים", "תעלה", "על", "הקו", "בטלפון", "בנייד", "לנייד", "לפלאפון", "לטלפון")
        val SONG_WORDS = set("תנגן", "תנגני", "נגן", "תשמיע", "השמע", "תשים", "שים", "תפעיל", "הפעל", "לשמוע", "לנגן", "תוכל", "את", "השיר", "שיר",
            "משהו", "שירים", "השירים", "מוזיקה", "קצת", "האלבום", "המוזיקה", "ניגון", "ניגונים", "הניגון", "לי")

        private val UNITS = mapOf("אחת" to 1, "אחד" to 1, "שתיים" to 2, "שתים" to 2, "שניים" to 2, "שנים" to 2, "שתי" to 2, "שני" to 2, "שלוש" to 3, "שלושה" to 3,
            "שלושת" to 3, "ארבע" to 4, "ארבעה" to 4, "ארבעת" to 4, "חמש" to 5, "חמישה" to 5, "חמשת" to 5, "שש" to 6, "שישה" to 6, "ששת" to 6, "שבע" to 7,
            "שבעה" to 7, "שבעת" to 7, "שמונה" to 8, "שמונת" to 8, "תשע" to 9, "תשעה" to 9, "תשעת" to 9, "עשר" to 10, "עשרה" to 10, "עשרת" to 10)
            .mapKeys { n(it.key) }
        private val TENS = mapOf("עשרים" to 20, "שלושים" to 30, "ארבעים" to 40, "חמישים" to 50, "שישים" to 60, "שבעים" to 70, "שמונים" to 80, "תשעים" to 90)
            .mapKeys { n(it.key) }
        private val HOURS_WORD = mapOf("שעה" to 1, "שעתיים" to 2).mapKeys { n(it.key) }
        private val MIN_UNIT = set("דקה", "דקות", "דק", "דקת")
        private val HOUR_UNIT = set("שעה", "שעות")
        private val SEC_UNIT = set("שניה", "שנייה", "שניות")
        private val WEEKDAYS = mapOf("ראשון" to DayOfWeek.SUNDAY, "שני" to DayOfWeek.MONDAY, "שלישי" to DayOfWeek.TUESDAY, "רביעי" to DayOfWeek.WEDNESDAY,
            "חמישי" to DayOfWeek.THURSDAY, "שישי" to DayOfWeek.FRIDAY, "שבת" to DayOfWeek.SATURDAY).mapKeys { n(it.key) }

        private val FAST_WORDS = listOf("צום", "הצום", "תענית", "התענית", "בצום", "בתענית")
        private val FAST_END = listOf("סוף", "נגמר", "נגמרת", "צאת", "יציאת", "יוצא", "יוצאת", "מסתיים", "מסתיימת", "עד", "מוצאי")
        // זמני היום: מילת מפתח → מזהה (הראשונה שמתאימה)
        private val ZMANIM = listOf(
            "הדלקת" to "candles", "נרות" to "candles", "כניסת" to "candles", "נכנסת" to "candles", "מתחילה" to "candles",
            "יציאת" to "shabbat_end", "יוצאת" to "shabbat_end", "צאת" to "shabbat_end", "מוצאי" to "shabbat_end", "נגמרת" to "shabbat_end",
            "הצום" to "fast", "צום" to "fast", "שקיעה" to "sunset", "השקיעה" to "sunset", "שקיעת" to "sunset", "שוקעת" to "sunset",
            "זריחה" to "sunrise", "הזריחה" to "sunrise", "הנץ" to "sunrise", "נץ" to "sunrise", "החמה" to "sunrise", "זורחת" to "sunrise", "חצות" to "chatzot", "עלות" to "dawn",
            "שמע" to "shema", "תפילה" to "tefila", "שחרית" to "tefila", "פלג" to "plag", "מנחה" to "mincha", "זמני" to "all", "זמנים" to "all", "הזמנים" to "all"
        ).map { n(it.first) to it.second }
    }

    // ---------- מילים במשפט ----------
    class Tok(text: String) {
        // גרשיים בתוך מילה נמחקים ("ל״ג" → "לג", "ק״ג" → "קג", "אחה״צ" → "אחהצ"); פסיק אחרי מילה נשמר בצד (רשימת קניות)
        private val toks: List<Pair<String, Boolean>> = text.replace(Regex("([בלמ])-(\\d)"), "$1$2")
            .replace(Regex("(?<=\\p{L})[״\"׳'](?=\\p{L}|\\s|$)"), "")
            .let { t -> Regex("[\\p{L}\\p{N}:.%]+").findAll(t).map { m -> m.value.trim('.') to (t.substring(m.range.last + 1).trimStart().startsWith(",")) } }
            .filter { it.first.isNotEmpty() }.toList()
        val orig: List<String> = toks.map { it.first }
        private val commaAfter: List<Boolean> = toks.map { it.second }
        // כמו הנרמול של המסווג, אבל שומר נקודתיים (7:30) ומספרים עשרוניים
        val norm: List<String> = orig.map { w ->
            if (Regex("^[בלמ]?\\d+(\\.\\d+)?%?$").matches(w)) w.removeSuffix("%")
            else w.split(':').joinToString(":") { n(it).replace(" ", "") }
        }

        fun has(w: String) = norm.contains(n(w))
        // כמה מילים ברצף ("הכי חזק", "אחר הצהריים")
        fun phrase(p: String): Boolean {
            val ws = p.split(' ').map { n(it) }
            return (0..norm.size - ws.size).any { i -> ws.indices.all { norm[i + it] == ws[it] } }
        }

        // מספר ראשון במשפט: ספרות (כולל עשרוני / אחוזים) או מילים ("מאתיים וחמישים", "שלושים")
        fun amount(): Double? {
            for (w in orig) Regex("^[בלמ]?-?(\\d+(?:\\.\\d+)?)%?$").find(w)?.let { return it.groupValues[1].toDouble() }
            // הסכום במילים ("מאה", "מאתיים וחמישים") מסומן — לא נכנס לתיאור ההוצאה
            for (i in norm.indices) number(i)?.let { use(i, i + it.second); return it.first.toDouble() }
            return null
        }

        fun percent(): Double? = when {
            has("מקסימום") || has("למקסימום") || has("מלא") || phrase("הכי חזק") || phrase("הכי גבוה") -> 100.0
            has("מינימום") || has("למינימום") || phrase("הכי חלש") || phrase("הכי נמוך") -> 0.0
            has("חצי") || has("לחצי") -> 50.0
            else -> amount()
        }

        private val HUNDREDS = mapOf("מאה" to 100, "מאתיים" to 200).mapKeys { n(it.key) }
        private val THOUSANDS = mapOf("אלף" to 1000, "אלפיים" to 2000).mapKeys { n(it.key) }
        private fun numWord(w: String) = UNITS.containsKey(w) || TENS.containsKey(w) || HUNDREDS.containsKey(w) || THOUSANDS.containsKey(w)

        // מילים שכבר שימשו כזמן (שעה / משך / יום) — לא נכנסות לטקסט התזכורת
        private val used = BooleanArray(norm.size)
        private fun use(from: Int, to: Int) { for (k in from until minOf(to, norm.size)) used[k] = true }

        fun dayOffset(): Int {
            // "בעוד 3 ימים", "בעוד יומיים", "בעוד שבוע"
            val b = norm.indexOf(n("בעוד"))
            if (b >= 0) {
                val nx = norm.getOrNull(b + 1)
                if (nx == n("יומיים")) { use(b, b + 2); return 2 }
                if (nx == n("שבוע")) { use(b, b + 2); return 7 }
                if (nx == n("שבועיים")) { use(b, b + 2); return 14 }
                // חודש / חודשיים / חצי שנה / שנה — לפי לוח השנה
                val today = LocalDate.now()
                fun months(m: Long, k: Int): Int { use(b, b + 1 + k); return java.time.temporal.ChronoUnit.DAYS.between(today, today.plusMonths(m)).toInt() }
                if (nx == n("חודש")) return months(1, 1)
                if (nx == n("חודשיים")) return months(2, 1)
                if (nx == n("שנה")) return months(12, 1)
                if (nx == n("חצי") && norm.getOrNull(b + 2) == n("שנה")) return months(6, 2)
                number(b + 1)?.let { (v, k) ->
                    when (norm.getOrNull(b + 1 + k)) {
                        n("ימים"), n("יום") -> { use(b, b + 2 + k); return v }
                        n("שבועות") -> { use(b, b + 2 + k); return v * 7 }
                        n("חודשים") -> return months(v.toLong(), k + 1)
                        else -> {}
                    }
                }
            }
            return when {
                has("מחרתיים") -> 2
                has("מחר") -> 1
                has("שלשום") -> -2
                has("אתמול") -> -1
                else -> 0
            }
        }

        private fun stripPrefix(w: String): String {
            if (w.toIntOrNull() != null || numWord(w)) return w
            for (p in listOf("וב", "ול", "של", "ב", "ל", "ו", "ש", "מ")) {
                if (w.startsWith(p)) {
                    val r = w.substring(p.length)
                    if (r.toIntOrNull() != null || numWord(r)) return r
                }
            }
            return w
        }

        // מספר שמתחיל במילה i, בספרות או במילים עד 9999 ("שלוש מאות ועשרים וחמש", "אלפיים", "מאה דקות").
        // מחזיר ערך ומספר המילים שנצרכו
        fun number(i: Int): Pair<Int, Int>? {
            if (i >= norm.size) return null
            stripPrefix(norm[i]).toIntOrNull()?.let { return it to 1 }
            // "כמה שנים עברו" / "שנים מאז" — כאן "שנים" זה שנים, לא 2 ("שניים" במקום אחר — כן 2)
            if (norm[i] == n("שנים") && (norm.getOrNull(i - 1) == n("כמה") || norm.getOrNull(i + 1) in setOf(n("עברו"), n("מאז"), n("לפני"), n("עוד")))) return null
            fun w(j: Int): String? {
                val t = norm.getOrNull(j) ?: return null
                if (j == i) return stripPrefix(t)
                return if (t.length > 2 && t.startsWith("ו") && numWord(t.substring(1))) t.substring(1) else t
            }
            var k = i; var total = 0; var level = 4   // 3 אלפים, 2 מאות, 1 עשרות, 0 יחידות
            while (level > 0) {
                val a = w(k) ?: break; val b = norm.getOrNull(k + 1)
                when {
                    level > 3 && a in THOUSANDS -> { total += THOUSANDS[a]!!; k++; level = 3 }
                    level > 3 && a in UNITS && (b == n("אלף") || b == n("אלפים")) -> { total += UNITS[a]!! * 1000; k += 2; level = 3 }
                    level > 2 && a in HUNDREDS -> { total += HUNDREDS[a]!!; k++; level = 2 }
                    level > 2 && a in UNITS && b == n("מאות") -> { total += UNITS[a]!! * 100; k += 2; level = 2 }
                    level > 1 && a in TENS -> { total += TENS[a]!!; k++; level = 1 }
                    a in UNITS -> {
                        val u = UNITS[a]!!
                        if (u < 10 && (b == n("עשרה") || b == n("עשר"))) { total += 10 + u; k += 2 } else { total += u; k++ }
                        level = 0
                    }
                    else -> break
                }
            }
            return if (k > i) total to (k - i) else null
        }

        // מילת כמות/יחידה בלי ל/ב/ו בהתחלה ("לשלושת", "בחצי", "לשעה", "ודקה") — אותו טיפול לכל המילים
        private val UNIT_WORDS by lazy { MIN_UNIT + HOUR_UNIT + SEC_UNIT + HOURS_WORD.keys + setOf(n("חצי"), n("רבע"), n("שלושת"), n("רבעי"), n("דקותיים")) }
        private fun unitWord(w: String?): String? {
            if (w == null) return null
            if (w in UNIT_WORDS) return w
            for (p in listOf("ל", "ב", "ו")) if (w.length > 2 && w.startsWith(p) && w.substring(1) in UNIT_WORDS) return w.substring(1)
            return w
        }

        // משך זמן: "עשר דקות", "חצי שעה", "שעה וחצי", "שעתיים", "רבע שעה", "שלושת רבעי שעה", "30 שניות", "דקה וחצי", "מאה דקות"
        // contiguous: רק רצף אחד שמתחיל ב-from (אחרי "בעוד"), עוצרים במילה הראשונה שאינה חלק ממשך זמן
        fun duration(from: Int = 0, contiguous: Boolean = false): Duration? {
            var total = Duration.ZERO
            var found = false
            var i = from
            while (i < norm.size) {
                val before = i
                val raw = norm[i]
                val w = if (raw == n("וחצי") || raw == n("ורבע")) raw else unitWord(raw)!!
                val next = unitWord(norm.getOrNull(i + 1))
                when {
                    w == n("שלושת") && next == n("רבעי") && unitWord(norm.getOrNull(i + 2)) in HOUR_UNIT -> { total += Duration.ofMinutes(45); found = true; use(i, i + 3); i += 3; continue }
                    w == n("חצי") && next in HOUR_UNIT -> { total += Duration.ofMinutes(30); found = true; use(i, i + 2); i += 2; continue }
                    w == n("חצי") && next in MIN_UNIT -> { total += Duration.ofSeconds(30); found = true; use(i, i + 2); i += 2; continue }
                    w == n("רבע") && next in HOUR_UNIT -> { total += Duration.ofMinutes(15); found = true; use(i, i + 2); i += 2; continue }
                    w == n("דקותיים") -> { total += Duration.ofMinutes(2); found = true; use(i, i + 1) }
                    w in HOURS_WORD.keys && (i == 0 || number(i - 1) == null) -> { total += Duration.ofHours(HOURS_WORD[w]!!.toLong()); found = true; use(i, i + 1) }
                    w in MIN_UNIT && (i == 0 || number(i - 1) == null) -> { total += Duration.ofMinutes(1); found = true; use(i, i + 1) }
                    w == n("וחצי") && found -> {
                        // "שעה וחצי" / "דקה וחצי"
                        val prev = unitWord(norm[i - 1])
                        total += if (prev in MIN_UNIT) Duration.ofSeconds(30) else Duration.ofMinutes(30); use(i, i + 1)
                    }
                    w == n("ורבע") && found -> { total += Duration.ofMinutes(15); use(i, i + 1) }
                    else -> {
                        val num = number(i)
                        if (num != null) {
                            // "שלוש וחצי דקות" / "עשר ורבע שעות": המספר, אחריו חצי/רבע, ואז היחידה
                            var k = num.second; var frac = 0.0
                            if (norm.getOrNull(i + k) == n("וחצי")) { frac = 0.5; k++ } else if (norm.getOrNull(i + k) == n("ורבע")) { frac = 0.25; k++ }
                            val unit = unitWord(norm.getOrNull(i + k))
                            val sec = when (unit) { in MIN_UNIT -> 60L; in HOUR_UNIT -> 3600L; in SEC_UNIT -> 1L; else -> 0L }
                            if (sec > 0) {
                                total += Duration.ofSeconds(((num.first + frac) * sec).toLong()); found = true
                                use(i, i + k + 1); i += k + 1; continue
                            }
                        }
                    }
                }
                if (contiguous && !used[before] && (found || i > from + 1)) break
                i++
            }
            return if (found && !total.isZero) total else null
        }

        private val AT_WORDS by lazy { setOf(n("בשעה"), n("לשעה"), n("השעה")) }
        private val PARTS by lazy { setOf(n("בבוקר"), n("בערב"), n("בלילה"), n("בצהריים"), n("בצהרים"), n("אחהצ"), n("הצהריים"), n("הצהרים"),
            n("אחרי"), n("אחר"), n("לפנות"), n("הערב")) }
        // מסמנים רק את מילות חלק היום עצמן ("ארוחת ערב" נשאר בטקסט)
        private fun markParts() {
            val single = setOf(n("בבוקר"), n("בערב"), n("בלילה"), n("בצהריים"), n("בצהרים"), n("אחהצ"), n("הערב"))
            for (i in norm.indices) {
                if (norm[i] in single) use(i, i + 1)
                if (norm[i] == n("לפנות") && norm.getOrNull(i + 1) in setOf(n("בוקר"), n("ערב"))) use(i, i + 2)
                if ((norm[i] == n("אחר") || norm[i] == n("אחרי")) && norm.getOrNull(i + 1) in setOf(n("הצהריים"), n("הצהרים"))) use(i, i + 2)
            }
        }
        // חלק היום שנאמר: am / pm / noon / night, או null
        private fun dayPart(): String? = when {
            phrase("לפנות בוקר") || has("בבוקר") -> "am"
            phrase("לפנות ערב") || has("בערב") || has("הערב") || has("אחהצ") || ((has("אחרי") || has("אחר")) && (has("הצהריים") || has("הצהרים"))) -> "pm"
            has("בצהריים") || has("בצהרים") -> "noon"
            has("בלילה") -> "night"
            else -> null
        }
        private class Cand(val hour: Int, val minute: Int, val start: Int, val end: Int, val kind: Int)  // kind: 3 ודאי (7:30, "בשעה"), 2 ב-, 1 ל-

        // שעה: "בשש וחצי", "רבע לשבע", "בשבע ועשרים", "ב-7:30", "ב-7.30", "בשעה שמונה בערב", "מחר בחמש".
        // אוספים את כל המועמדים במשפט ובוחרים: "בשעה"/ספרות → ב- → ל- (ל- רק כשאין אחר וזה סוף המשפט או לפני בוקר/ערב —
        // כדי ש"להתקשר לשני בשש" ייקבע לשש ו"לשני" יישאר בטקסט). alarm = שעון מעורר: ל- מותר תמיד ("תעיר אותי לשש")
        fun clockTime(now: LocalDateTime, alarm: Boolean = false): LocalDateTime? {
            val cands = mutableListOf<Cand>()
            for (i in norm.indices) {
                val w = norm[i]
                val at = i > 0 && norm[i - 1] in AT_WORDS
                val from = if (at) i - 1 else i
                // 7:30 / 7.30 (עם נקודה — רק עם ב/ל או אחרי "בשעה", כדי לא לבלבל עם מספר עשרוני)
                val dm = Regex("^(ב|ל)?(\\d{1,2})([:.])(\\d{2})$").find(w)
                if (dm != null) {
                    val dot = dm.groupValues[3] == "."
                    val pre = dm.groupValues[1]
                    if (!dot || pre.isNotEmpty() || at) {
                        val h = dm.groupValues[2].toInt(); val m = dm.groupValues[4].toInt()
                        if (h in 0..23 && m in 0..59) cands += Cand(h, m, from, i + 1, if (pre == "ל" && !at) 1 else 3)
                    }
                    continue
                }
                // רבע ל-X / עשרים ל-X / עשרה ל-X / עשר ל-X / חמש(ה) ל-X / עשרים וחמש ל-X (גם "לשתים עשרה")
                val before = mapOf(n("רבע") to 15, n("עשרים") to 20, n("עשרה") to 10, n("עשר") to 10, n("חמש") to 5, n("חמישה") to 5)
                val bw = if (w.length > 3 && (w[0] == 'ב' || w[0] == 'ל')) w.substring(1) else w
                var bi = i + 1; var mins = before[bw]
                if (bw == n("עשרים") && norm.getOrNull(i + 1) in setOf(n("וחמש"), n("וחמישה"))) { mins = 25; bi = i + 2 }
                if (mins != null && bi < norm.size && norm[bi].startsWith("ל")) {
                    var h = hourWord(norm[bi].substring(1))
                    var end = bi + 1
                    if (h != null && h in 1..2 && norm.getOrNull(end) in setOf(n("עשרה"), n("עשר"))) { h += 10; end++ }
                    if (h != null) {
                        var hh = (h + 11) % 12; if (hh == 0) hh = 12
                        cands += Cand(hh, 60 - mins, from, end, if (at || w[0] == 'ב') 3 else 2); continue
                    }
                }
                // ב/ל/בשעה X
                if (i > 0 && (norm[i - 1] == n("ביום") || norm[i - 1] == n("יום"))) continue   // "ביום שני"
                val pre = if (at) "" else if (w.startsWith("ב")) "ב" else if (w.startsWith("ל")) "ל" else continue
                val h0 = hourWord(if (at) w else w.substring(1)) ?: continue
                var hour = h0
                var j = i + 1
                if (j < norm.size && (norm[j] == n("עשרה") || norm[j] == n("עשר")) && h0 in 1..2) { hour = 10 + h0; j++ }
                // דקות אחרי: וחצי / ורבע / ועשרים [וחמש] / וחמש / ו-X דקות
                var minute = 0
                val m = norm.getOrNull(j)
                val less = mapOf(n("רבע") to 15, n("עשרה") to 10, n("עשר") to 10, n("חמש") to 5, n("חמישה") to 5, n("עשרים") to 20)
                if (m != null) when {
                    m == n("וחצי") -> { minute = 30; j++ }
                    m == n("ורבע") -> { minute = 15; j++ }
                    // "שמונה פחות רבע" = 7:45
                    m == n("פחות") && norm.getOrNull(j + 1) in less -> {
                        minute = 60 - less[norm[j + 1]]!!; hour = if (hour == 1) 12 else if (hour == 13) 12 else hour - 1; j += 2
                    }
                    m.startsWith("ו") && number(j) != null -> {
                        val (v, k) = number(j)!!
                        if (v in 1..59) { minute = v; j += k; if (norm.getOrNull(j) in MIN_UNIT) j++ }
                    }
                    // "שבע ארבעים" / "שמונה חמישים וחמש" — דקות בלי ו'
                    m in TENS && number(j) != null -> {
                        val (v, k) = number(j)!!
                        if (v in 20..59) { minute = v; j += k; if (norm.getOrNull(j) in MIN_UNIT) j++ }
                    }
                }
                cands += Cand(hour, minute, from, j, if (at) 3 else if (pre == "ב") 2 else 1)
            }
            val part = dayPart()
            val off = dayOffset()
            val wd = weekday()
            var day = now.toLocalDate().plusDays(off.toLong())
            wd?.let { day = now.toLocalDate().with(TemporalAdjusters.next(it)) }
            // אחרי חצות (עד 4 לפנות בוקר) "מחר" = היום שמתחיל עכשיו — עוד לא ישנו, וזה ה"מחר" שהתכוונו אליו
            val lateNight = off == 1 && wd == null && now.hour < 4
            if (cands.isEmpty()) {
                // "מחר בערב" / "ביום שישי בצהריים" בלי שעה: שעה רגילה לחלק היום (לא בשעון מעורר — שם שואלים)
                if (alarm || part == null || (off == 0 && wd == null && !has("הערב"))) return null
                val h = when { phrase("לפנות בוקר") -> 6; part == "am" -> 9; part == "noon" -> 12; part == "night" -> 21
                    has("אחהצ") || has("אחרי") || has("אחר") -> 16; else -> 19 }
                markParts()
                var t = day.atTime(h, 0)
                if (lateNight && t.minusDays(1).isAfter(now)) t = t.minusDays(1)
                return if (t.isAfter(now)) t else null
            }
            val partAt = norm.indexOfFirst { it in PARTS }
            fun pick(list: List<Cand>) = list.firstOrNull { partAt >= 0 && partAt == it.end } ?: list.last()
            // ל- (בלי "בשעה") רק כשאין שעה עם ב- / ספרות: "תזכורת לשמונה וחצי לקחת תרופה" = 20:30, "להתקשר לשני בשש" = 18:00
            val best = cands.filter { it.kind == 3 }.takeIf { it.isNotEmpty() }?.let { pick(it) }
                ?: cands.filter { it.kind == 2 }.takeIf { it.isNotEmpty() }?.let { pick(it) }
                ?: cands.filter { it.kind == 1 }.takeIf { it.isNotEmpty() }?.let { pick(it) }
                ?: return null
            use(best.start, best.end)
            markParts()
            val hour = best.hour; val minute = best.minute
            val half = when (part) {
                "am" -> "am"
                "pm" -> "pm"
                "night" -> if (hour in 7..11) "pm" else "am"
                // "שתיים עשרה בצהריים" = 12:00 (לא חצות); 1–5 בצהריים = אחר הצהריים
                "noon" -> if (hour in 1..5 || hour == 12) "pm" else "am"
                else -> null
            }
            var h24 = hour % 24
            if (half == "pm" && h24 < 12) h24 += 12
            if (half == "am" && h24 == 12) h24 = 0
            var t = day.atTime(h24, minute)
            if (half == null && hour in 1..12) {
                if (alarm && (off != 0 || wd != null)) {
                    // שעון מעורר למחר / ליום X בלי בוקר/ערב: בוקר ("תעיר אותי מחר בשש" = 06:00), 12 = צהריים
                    t = day.atTime(hour % 12 + if (hour == 12) 12 else 0, minute)
                } else if (off == 0 && wd == null) {
                    // היום, בלי בוקר/ערב: השעה הקרובה הבאה (6 → 06:00 או 18:00)
                    val am = day.atTime(hour % 12, minute)
                    val pm = day.atTime(hour % 12 + 12, minute)
                    t = listOf(am, pm, am.plusDays(1)).first { it.isAfter(now) }
                } else {
                    // מחר / ביום X, בלי בוקר/ערב: 1–6 = אחר הצהריים, 7–11 = בוקר, 12 = צהריים
                    t = day.atTime(if (hour in 1..6) hour + 12 else hour, minute)
                }
            } else if (!t.isAfter(now) && off == 0 && wd == null) t = t.plusDays(1)
            if (lateNight && t.minusDays(1).isAfter(now)) t = t.minusDays(1)
            return t
        }

        // שעה במילים: רק הצורות של שעה ("שתיים", "שלוש", "חמש"), לא "שני", "חמישה", "שלושת" — כדי ש"לשני" (שם)
        // או "לחמישה ילדים" לא ייחשבו לשעה
        private val HOUR_WORDS = mapOf("אחת" to 1, "שתיים" to 2, "שתים" to 2, "שלוש" to 3, "ארבע" to 4, "חמש" to 5, "שש" to 6, "שבע" to 7,
            "שמונה" to 8, "תשע" to 9, "עשר" to 10).mapKeys { n(it.key) }
        private fun hourWord(w: String): Int? {
            w.toIntOrNull()?.let { return it.takeIf { h -> h in 0..23 } }
            return HOUR_WORDS[w]
        }

        // היום שעליו שואלים: מחר / אתמול / בעוד N ימים, או "ביום שישי" (הקרוב)
        fun dayOrWeekday(now: LocalDateTime): Int {
            val off = dayOffset()
            if (off != 0) return off
            val wd = weekday() ?: (if (has("בשבת") || has("בשבת הזאת") || phrase("בשבת הקרובה")) DayOfWeek.SATURDAY else null) ?: return 0
            return java.time.temporal.ChronoUnit.DAYS.between(now.toLocalDate(), now.toLocalDate().with(TemporalAdjusters.next(wd))).toInt()
        }

        fun weekday(): DayOfWeek? {
            val i = norm.indexOf(n("ביום")).takeIf { it >= 0 } ?: norm.indexOf(n("יום")).takeIf { it >= 0 }
            if (i != null) WEEKDAYS[norm.getOrNull(i + 1)]?.let { use(i, i + 2); return it }
            norm.forEachIndexed { k, w -> if (w.startsWith("ב")) WEEKDAYS[w.substring(1)]?.let { if (it != DayOfWeek.SATURDAY) { use(k, k + 1); return it } } }
            return null
        }

        // מה שנשאר אחרי שמורידים מילות פקודה, מילות מילוי ומילים ששימשו לזמן — בכתיב המקורי.
        // מילות פקודה ומילוי יורדות רק מההתחלה ומהסוף; באמצע (התוכן עצמו) נשאר הכול כמו שנאמר,
        // חוץ ממילים של זמן ("תזכיר לי שאני צריך לקנות את החלב מחר" → "שאני צריך לקנות את החלב")
        private val TIME_WORDS by lazy { set("בעוד", "מחר", "מחרתיים", "היום", "הערב", "בבוקר", "בערב", "בלילה", "בצהריים", "בשעה", "לשעה", "ביום") }
        fun remainder(cmd: Set<String>): String {
            val size = norm.size
            val drop = BooleanArray(orig.size)
            fun time(i: Int) = used[i] || norm[i] in TIME_WORDS || (i > 0 && norm[i - 1] == n("ביום") && WEEKDAYS.containsKey(norm[i]))
            fun noise(i: Int) = time(i) || norm[i] in cmd || norm[i] in FILLER || norm[i] == n("עוד")
            var s = 0; while (s < size && noise(s)) s++
            var e = size - 1; while (e >= s && noise(e)) e--
            for (i in 0 until size) if (i < s || i > e || time(i)) drop[i] = true
            // פסיק שאחרי מילה נשמר ("חלב, לחם, ביצים" — שלושה פריטים)
            return orig.indices.filter { !drop[it] }.joinToString(" ") { orig[it] + if (commaAfter[it] && it < e) "," else "" }.trim()
        }

        // שם איש הקשר: מה שנשאר אחרי מילות החיוג, בלי ה-ל בהתחלה ("לאמא" → "אמא")
        fun contactName(): String? {
            val r = remainder(CALL_WORDS).split(' ').filter { it.isNotEmpty() }.toMutableList()
            if (r.isEmpty()) return null
            if (r.size > 1 && n(r.last()) in setOf(n("בבית"), n("לבית"))) r.removeAt(r.size - 1)
            if (r.size > 1 && r[0] == "את") r.removeAt(0)
            r[0] = r[0].let { if (it.startsWith("ל") && it.length > 2) it.substring(1) else it }
            return r.joinToString(" ").ifBlank { null }
        }

        // שיר: "תנגן את ידיד נפש של אברהם פריד" → ("ידיד נפש", "אברהם פריד"); "משהו של X" → (null, "X")
        fun song(): Pair<String?, String?> {
            val shel = norm.indexOf(n("של"))
            val artist = if (shel >= 0) orig.drop(shel + 1).filter { n(it) !in FILLER }.joinToString(" ").ifBlank { null } else null
            val head = if (shel >= 0) Tok(orig.take(shel).joinToString(" ")) else this
            // מורידים רק את מילות הבקשה שבתחילת המשפט ("תנגן לי את השיר…") ומילות נימוס בסופו,
            // כדי ששם השיר יישאר שלם ("אני מאמין" לא יהפוך ל"מאמין")
            var i = 0
            while (i < head.norm.size && (head.norm[i] in SONG_WORDS || head.norm[i] in FILLER)) {
                i++
                if (head.norm[i - 1] == n("השיר") || head.norm[i - 1] == n("שיר")) break   // אחרי "השיר" מתחיל שם השיר
            }
            var j = head.norm.size
            while (j > i && head.norm[j - 1] in FILLER) j--
            val q = head.orig.subList(i, j).joinToString(" ").ifBlank { null }
            return q to artist
        }

        // צום מסוים לפי שמו
        private fun fastKey(): String? = when {
            has("גדליה") -> "gedalia"
            has("כיפור") || has("הכיפורים") || has("כיפורים") -> "kippur"
            has("טבת") || has("בטבת") -> "tevet10"
            has("אסתר") -> "esther"
            has("תמוז") || has("בתמוז") -> "tammuz17"
            has("באב") -> "av9"
            else -> null
        }

        fun zman(): String {
            // צום / תענית — לפני שאר המילים ("מתי מתחילה התענית" זה לא הדלקת נרות, "מתי נגמרת התענית" זה לא צאת שבת)
            if (FAST_WORDS.any { has(it) })
                return (if (FAST_END.any { has(it) }) "fast_end" else "fast_start") + (fastKey()?.let { ":$it" } ?: "")
            // צאת הכוכבים = של היום (לא צאת שבת)
            if (has("הכוכבים") || has("כוכבים")) return "tzeit"
            for ((k, v) in ZMANIM) if (norm.any { it == k || (it.length > 3 && it.substring(1) == k) }) {
                // "מתי צאת" / "מתי יוצאת" בלי "שבת": בשישי ובשבת — צאת השבת, בשאר הימים — צאת הכוכבים
                if (v == "shabbat_end" && !has("שבת") && !has("השבת") && !has("מוצאי") && !has("מוצש")) return "exit"
                if (v == "fast") return if (has("סוף") || has("נגמר") || has("צאת") || has("יציאת")) "fast_end" else "fast_start"
                if (v == "mincha" && has("קטנה")) return "mincha_ketana"
                if (v == "mincha" && has("גדולה")) return "mincha"
                if (v == "shema" || v == "tefila") return v
                if (v == "chatzot" && has("הלילה")) return "chatzot_night"
                return v
            }
            // "עד מתי שבת" = צאת השבת
            if (has("שבת") || has("השבת")) return if (has("עד") || has("סוף") || has("נגמר") || has("מסתיים") || has("מסתיימת")) "shabbat_end" else "candles"
            return "all"
        }
    }
}
