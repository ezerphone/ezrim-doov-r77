# ezrim-doov-r77

SystemUI ל-Doov R77 (MT6765, אנדרואיד 14, k62v1_64_bsp) עם שתי תכונות מהקושחה הישנה (אנדרואיד 13):

1. **שורת עיגולים** (`com.jelly.mods.qsrow`), מופעלת לפי `Settings.System qsrow_mode` (0 ברירת מחדל, 1 שורת עיגולים).
2. **תאריך עברי במסך הנעילה**, לפי `Settings.System lock_date_mode` (0 לועזי, 1 עברי, 2 שניהם), locale ‏`he@calendar=hebrew;numbers=hebr`.

הבסיס הוא ה-MtkSystemUI.apk של r77 עם תיקון חלון הווליום (md5 `9b2c33b31ad7db40e2864e34394dc308`). הבנייה משנה רק את `classes.dex` ו-`classes2.dex`. החתימה (בלוק v2/v3 ו-META-INF) מושתלת מאותו APK עם `tools/graft_sig.py` מהריפו ezerphone/luma, בלי שינוי.

## בנייה
```
./build.sh MtkSystemUI_R77_volumefix_9b2c33b3.apk out
```
צריך java 17 ו-python3. הסקריפט מוריד את smali/baksmali 2.5.2 ובודק את ה-sha256 שלהם. הבנייה דטרמיניסטית: מאותו קלט יוצא תמיד אותו APK (md5 `21655eb2ddba2930f58b827474532a73`).

ב-GitHub Actions: מעלים פעם אחת את ה-APK הבסיסי כקובץ של release בשם `base`, ומריצים את ה-workflow ‏"build MtkSystemUI (r77)". שימו לב: release בריפו ציבורי גלוי לכולם.

## מה הבנייה עושה
- `src/qsrow-a13/`: החבילה המקורית (51 מחלקות smali) מה-classes2.dex הישן.
- `tools/port_qsrow.py`: תיקוני אנדרואיד 14 בתוך החבילה:
  - `TileLayout.mMaxCellHeight` לא קיים יותר. גובה התא הוא max(`mResourceCellHeight`, `mEstimatedCellHeight`), ולכן מציבים את שניהם.
  - `QSAnimator.createSecondaryPageAnimators` מוזג לתוך `addNonFirstPageAnimators(I)`, ולכן Morph נתלה עליה.
  - `QSPanelControllerBase.mHost` הוא עכשיו `QSHost` (או QSTileHost או QSHostAdapter), ולכן `createTileView` נקראת דרך הממשק.
- `tools/patch_r77.py`: משנה את קוד ה-SystemUI של r77:
  - "אופה" את ה-hooks (`tools/bake.py`): המתודה המקורית הופכת ל-`name$bk` פרטית, ונוספת עוטפת שקוראת ל-`Bake.before`, אחר כך למקור ואז ל-`Bake.after`. זה אותו חוזה כמו בקושחה הישנה. המתודות שנאפות: 19, בהן PageIndicator, PagedTileLayout, QSAnimator, QSPanel, QSPanelControllerBase, QuickQSPanel, QuickQSPanelController, TileLayout ו-QSTileViewImpl.
  - מחזיר את `QuickQSPanel.setMaxTiles(I)` ואת `QSTileViewImpl.setLabelColor(I)`, ש-R8 שתל ישירות במקומות שקראו להן, ומפנה את אותם מקומות לקרוא להן שוב.
  - מוסיף `Bake.afterInit` בבנאי של QuickQSPanel.
  - מוסיף את `Cust.cols` ו-`Cust.bind` ל-TileAdapter ול-QSCustomizerController$3 (מסך עריכת האריחים).
  - מוסיף `HDate.combine` בתוך `KeyguardSliceProvider.updateClockLocked`.
  - שם את המחלקות החדשות ב-classes2.dex, כי ב-classes.dex יש כבר 65.4 אלף מתודות.
- בדיקות בזמן הבנייה:
  - מספר המתודות ב-classes.dex נשאר עד 65,535.
  - תיקון הווליום (`0x10e0020`) קיים.
  - כל ההפניות מהקוד ששונה נמצאות (`tools/refcheck.py`).

## התקנה ובדיקה
ראו את ההוראות בשיחה ובמסמך `luma-porting-r77.md` בפרויקט.
