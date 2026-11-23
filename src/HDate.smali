.class public Lcom/android/systemui/HDate;
.super Ljava/lang/Object;


# direct methods
.method public static combine(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    if-nez p0, :cond_3

    return-object p1

    :cond_3
    const/4 v0, 0x0

    :try_start_4
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "lock_date_mode"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_e} :catch_f

    goto :goto_11

    :catch_f
    move-exception v1

    const/4 v0, 0x0

    :goto_11
    if-nez v0, :cond_14

    return-object p1

    :cond_14
    :try_start_14
    new-instance v1, Landroid/icu/util/ULocale;

    const-string v2, "he@calendar=hebrew;numbers=hebr"

    invoke-direct {v1, v2}, Landroid/icu/util/ULocale;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-static {v2, v1}, Landroid/icu/text/DateFormat;->getDateInstance(ILandroid/icu/util/ULocale;)Landroid/icu/text/DateFormat;

    move-result-object v1

    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Landroid/icu/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1
    :try_end_29
    .catch Ljava/lang/Throwable; {:try_start_14 .. :try_end_29} :catch_2a

    goto :goto_2c

    :catch_2a
    move-exception v2

    return-object p1

    :goto_2c
    const/4 v2, 0x1

    if-ne v0, v2, :cond_30

    return-object v1

    :cond_30
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "  \u00b7  "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method
