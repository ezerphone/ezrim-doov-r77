package app.luma.torch.assistant

// ניסוחים נוספים לאותן פקודות. מנגנון ההבנה של עזר מאומן מראש, ולכן במקום ללמד אותו מילים חדשות
// מתרגמים כאן ניסוחים שהוא לא מכיר לניסוח שהוא כן מכיר ("שים שיר", "תדליק מוזיקה" → "תנגן שיר").
// נבדק מול מנוע ההבנה עצמו: רשימת ניסוחים לכל פקודה, לפני ואחרי.
object Phrases {
    private fun n(s: String) = IntentEngine.n(s)

    // צורות נוספות של אותו פועל → הצורה שעזר מכיר (נקבה, ציווי קצר, שם פועל)
    private val VERBS: Map<String, String> = listOf(
        "תדליק" to "תדליקי הדלק להדליק",
        "תכבה" to "תכבי כבה לכבות",
        "תפעיל" to "תפעילי הפעל להפעיל",
        "תפתח" to "תפתחי פתח לפתוח",
        "תסגור" to "תסגרי סגור לסגור",
        "תעצור" to "תעצרי עצור לעצור",
        "תפסיק" to "תפסיקי הפסק להפסיק",
        "תמשיך" to "תמשיכי המשך להמשיך",
        "תנגן" to "תנגני נגן לנגן",
        "תשים" to "תשימי לשים",
        "תשמיע" to "תשמיעי להשמיע",
        "תעביר" to "תעבירי העבר להעביר",
        "תחזור" to "תחזרי חזור לחזור",
        "תגביר" to "תגבירי הגבר להגביר",
        "תנמיך" to "תנמיכי הנמך להנמיך תחליש תחלישי החלש להחליש",
        "תעלה" to "תעלי להעלות",
        "תוריד" to "תורידי הורד להוריד",
        "תבטל" to "תבטלי בטל לבטל",
        "תמחק" to "תמחקי מחק למחוק",
        "תוסיף" to "תוסיפי הוסף להוסיף",
        "תרשום" to "תרשמי רשום לרשום",
        "תזכיר" to "תזכירי",
        "תגיד" to "תגידי",
        "תקריא" to "תקריאי הקרא להקריא",
        "תצלם" to "תצלמי צלם לצלם",
        "תנעל" to "תנעלי נעל לנעול",
        "תגלול" to "תגללי גלול לגלול",
        "תכוון" to "תכווני כוון לכוון",
        "תעיר" to "תעירי",
    ).flatMap { (to, from) -> from.split(' ').map { n(it) to to } }.toMap()

    // פתיח מנומס לפני שם פועל ("אפשר להדליק", "תוכל לכבות") — מורידים
    private val POLITE = setOf("אפשר", "תוכל", "תוכלי").map { n(it) }.toSet()

    private val MUSIC = setOf("מוזיקה", "המוזיקה", "שיר", "השיר", "שירים", "השירים", "ניגון", "הניגון", "ניגונים", "מנגינה", "הנגינה",
        "בשיר", "במוזיקה", "לשיר", "למוזיקה", "בניגון").map { n(it) }.toSet()
    // "מוזיקה" בלי שם שיר: עזר מבין טוב יותר "שיר" (עם "מוזיקה" הוא חושב שזה "תמשיך")
    private val MUSIC_WORD = setOf("מוזיקה", "המוזיקה").map { n(it) }.toSet()
    private val PLAY = setOf("תנגן", "תפעיל", "תדליק", "תשים", "שים", "תשמיע").map { n(it) }.toSet()
    private val STOP = setOf("תעצור", "תכבה", "תסגור", "תפסיק", "תשהה").map { n(it) }.toSet()
    // מילים של פקודות אחרות: "תשים טיימר", "תשים ווליום על" — לא שיר
    private val NOT_SONG = setOf("טיימר", "שעון", "מעורר", "ווליום", "עוצמה", "בהירות", "רטט", "תזכורת", "פתק", "פנס", "בלוטוס",
        "שקט", "צלצול", "התראות", "הגדרות").map { n(it) }.toSet()
    private val FAST = setOf("צום", "הצום", "תענית", "התענית").map { n(it) }.toSet()
    private val FAST_END = setOf("סוף", "נגמר", "נגמרת", "צאת", "יציאת", "יוצא", "יוצאת", "מסתיים", "מסתיימת", "עד").map { n(it) }.toSet()
    private val FAST_START = setOf("מתחיל", "מתחילה", "תחילת", "נכנס", "נכנסת", "מתחילים").map { n(it) }.toSet()
    private val FAST_NAMES = setOf("גדליה", "כיפור", "הכיפורים", "כיפורים", "טבת", "בטבת", "אסתר", "תמוז", "בתמוז", "באב").map { n(it) }.toSet()
    private val NEXT = setOf("הבא", "הבאה", "הקרוב", "הקרובה", "יש", "יהיה", "תהיה").map { n(it) }.toSet()
    private val ASK = setOf("מתי", "באיזו", "באיזה", "עד", "זמן", "שעת", "מה", "תגיד", "סוף", "תחילת").map { n(it) }.toSet()
    private val LIGHT = setOf("אור", "האור").map { n(it) }.toSet()
    private val SCREEN = setOf("מסך", "המסך", "במסך", "בהירות", "הבהירות").map { n(it) }.toSet()
    private val MORE = setOf("יותר", "תגביר", "תעלה").map { n(it) }.toSet()
    private val LESS = setOf("פחות", "תוריד", "תנמיך").map { n(it) }.toSet()

    // הניסוח ש-rewrite יוצר לשאלה על שעת צום
    fun isFastTime(s: String) = s.startsWith("מתי צאת הצום") || s.startsWith("מתי עלות השחר של הצום")

    fun rewrite(said: String): String {
        var w = said.trim().split(Regex("\\s+")).filter { it.isNotEmpty() }.toMutableList()
        if (w.isEmpty()) return said
        // "אפשר / תוכל" + פועל
        if (w.size > 1 && n(w[0]) in POLITE) w.removeAt(0)
        if (w.size > 2 && n(w[0]) in setOf(n("אתה"), n("את")) && n(w[1]) in setOf(n("יכול"), n("יכולה"))) { w.removeAt(0); w.removeAt(0) }
        // פועל בצורה אחרת → הצורה המוכרת: רק פועל הפקודה (המילה הראשונה), לא בתוכן —
        // "תזכיר לי לכבות את הגז" נשמר כמו שנאמר, לא "תכבה את הגז"
        val vi = w.indexOfFirst { n(it) !in IntentEngine.FILLER }
        if (vi >= 0) VERBS[n(w[vi])]?.let { w[vi] = it }
        val ns = w.map { n(it) }
        val text = w.joinToString(" ")
        val has = { set: Set<String> -> ns.any { it in set } }
        val first = ns.firstOrNull { it !in IntentEngine.FILLER } ?: return text

        // שאלה על שעת הצום / התענית ("מתי מתחילה התענית", "עד מתי הצום") → ניסוח שעזר מבין כזמני היום
        if (has(FAST) && first in ASK) {
            // שם הצום נשמר ("מתי מתחיל תענית אסתר" — על תענית אסתר, לא על הצום הקרוב)
            val names = w.filter { n(it) in FAST_NAMES }.joinToString(" ").let { if (it.isEmpty()) "" else " $it" }
            if (has(FAST_END)) return "מתי צאת הצום$names"
            if (has(FAST_START)) return "מתי עלות השחר של הצום$names"
            // "מתי הצום" / "מתי התענית הבאה" (בלי שם של צום) — הצום הקרוב: התאריך ומתי מתחיל
            if (ns.count { it !in IntentEngine.FILLER && it !in FAST && it !in ASK && it !in NEXT } == 0) return "מתי עלות השחר של הצום"
        }

        // "אל תיתן לי לשכוח…" = תזכורת
        if (text.startsWith("אל תיתן לי לשכוח") || text.startsWith("אל תתן לי לשכוח"))
            return "תזכיר לי" + text.substringAfter("לשכוח")

        // נא לא להפריע: כיבוי בכל פועל ("תכבה / תסגור / תוציא ממצב")
        if (ns.any { it == n("להפריע") } && (first in STOP || first == n("תבטל") || first == n("תוציא")))
            return "תבטל נא לא להפריע"

        // אור: במסך = בהירות, אחרת = פנס
        if (has(LIGHT)) {
            if (has(SCREEN) || first in MORE || first in LESS) {
                if (ns.any { it in MORE }) return "תגביר בהירות"
                if (ns.any { it in LESS }) return "תוריד בהירות"
            } else {
                if (first in STOP) return "תכבה את הפנס"
                if (first in setOf(n("תדליק"), n("תעשה"), n("תן"), n("תפעיל")) || first in LIGHT) return "תדליק את הפנס"
            }
        }

        // מוזיקה
        val music = has(MUSIC)
        if (music && !has(NOT_SONG)) {
            if (ns.any { it == n("אחר") } && ns.size <= 3) return "השיר הבא"
            if ((first in STOP && ns.none { it == n("בעוד") }) || text.startsWith("די עם") || ns.any { it == n("הפסקה") })
                return "תעצור את המוזיקה"
            if (first in PLAY) {
                val i = ns.indexOf(first)
                return w.mapIndexed { k, s -> when { k == i -> "תנגן"; ns[k] in MUSIC_WORD -> "שיר"; else -> s } }.joinToString(" ")
            }
        }
        // "תשים / תשמיע את X" — שיר (אם זה לא טיימר, ווליום וכד')
        if (!music && !has(NOT_SONG) && first in setOf(n("תשים"), n("שים"), n("תשמיע")) &&
            ns.any { it == n("את") || it == n("לי") }) return replaceFirst(w, ns, first, "תנגן")
        return text
    }

    private fun replaceFirst(w: List<String>, ns: List<String>, first: String, to: String): String {
        val i = ns.indexOf(first)
        return w.mapIndexed { k, s -> if (k == i) to else s }.joinToString(" ")
    }
}
