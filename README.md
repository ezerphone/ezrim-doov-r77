# עזרים R77

עזרים לטלפון Doov R77 (MT6765, אנדרואיד 14, טלפון מקשים עם מסך מגע).
פרויקט נפרד מעזרים של Fanvace: אותו שם חבילה (`com.android.adds`), חתימה אחרת (של ה-R77).

## מה יש בגרסה
- פנס
- מקשים: לחיצה ארוכה על 0–9 מפעילה פעולה לבחירה (לא במסך נעול, במסך הבית, בחייגן ובשדה טקסט).
  לחיצה ארוכה על מקש התפריט בשדה טקסט: הקלדה קולית.
- עזר (כולל "היי עזר" והקול העברי), הקלדה קולית, הגדרות מערכת, הסתרת אייקונים
- התאמה אישית (חד-פעמית): הודעות, מציג HTML, שירותי גוגל, התקנת אפליקציות

## בנייה
GitHub Actions בונה בכל push ומשתיל לקובץ את החתימה של `donor/MtkSystemUI.apk` (ה-SystemUI של ה-R77).
התוצאה: `Luma-system.apk` בתוצרי הריצה.

## מה צריך בקושחה (בסדר הזה!)
במכשיר `ro.control_privapp_permissions=enforce`: קובץ הרשאות חסר או לא מעודכן = המכשיר לא עולה.

| # | קובץ | מיקום |
|---|------|-------|
| 1 | `firmware/privapp-permissions-ezrim.xml` | `/system/etc/permissions/` |
| 2 | `firmware/default-permissions-ezrim.xml` (לא חובה) | `/system/etc/default-permissions/` |
| 3 | `libsherpa-onnx-jni.so` (מתוך ה-AAR, `jni/arm64-v8a/`) | `/system/priv-app/Ezrim/lib/arm64/` |
| 4 | ה-APK | `/system/priv-app/Ezrim/ezrim.apk` |
| 5 | מודל הדיבור (7 קבצים, כמו ב-Fanvace) | `/system/etc/ezrim/hebrew-asr/` |
| 6 | `tts_he.zip` (לא חובה) | `/system/etc/ezrim/` |

הכול: `root:root`, קבצים `0644`, תיקיות `0755`, תווית `u:object_r:system_file:s0`.

התקנה עם root (אחרי `adb push` של הקבצים ל-`/sdcard/ez/`):
```
adb shell su -c "mount -o remount,rw / && \
  cp /sdcard/ez/privapp-permissions-ezrim.xml /system/etc/permissions/ && \
  mkdir -p /system/etc/default-permissions /system/priv-app/Ezrim/lib/arm64 /system/etc/ezrim/hebrew-asr && \
  cp /sdcard/ez/default-permissions-ezrim.xml /system/etc/default-permissions/ && \
  cp /sdcard/ez/libsherpa-onnx-jni.so /system/priv-app/Ezrim/lib/arm64/ && \
  cp /sdcard/ez/ezrim.apk /system/priv-app/Ezrim/ && \
  cp /sdcard/ez/hebrew-asr/* /system/etc/ezrim/hebrew-asr/ && \
  cp /sdcard/ez/tts_he.zip /system/etc/ezrim/ ; \
  chmod -R 755 /system/priv-app/Ezrim /system/etc/ezrim && \
  find /system/priv-app/Ezrim /system/etc/ezrim -type f -exec chmod 644 {} + && \
  chmod 644 /system/etc/permissions/privapp-permissions-ezrim.xml /system/etc/default-permissions/default-permissions-ezrim.xml && \
  chcon -R u:object_r:system_file:s0 /system/priv-app/Ezrim /system/etc/ezrim /system/etc/permissions/privapp-permissions-ezrim.xml /system/etc/default-permissions/default-permissions-ezrim.xml && \
  sync && reboot"
```

## בדיקה אחרי ההתקנה
```
adb shell pm list packages -f com.android.adds
adb shell "dumpsys package com.android.adds | grep -E 'INJECT_EVENTS|WRITE_SECURE_SETTINGS'"
adb shell ls -l /system/priv-app/Ezrim/lib/arm64 /system/etc/ezrim/hebrew-asr
```
בשורה הראשונה צריך להופיע `/system/priv-app/Ezrim/ezrim.apk`, ובשנייה `granted=true` לשתי ההרשאות.
