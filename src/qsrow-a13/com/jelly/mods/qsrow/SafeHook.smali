.class abstract Lcom/jelly/mods/qsrow/SafeHook;
.super Lcom/jelly/mods/qsrow/xp/XC_MethodHook;
.source "SafeHook.java"


# static fields
.field private static errors:I


# direct methods
.method constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Lcom/jelly/mods/qsrow/xp/XC_MethodHook;-><init>()V

    return-void
.end method

.method static report(Ljava/lang/Throwable;)V
    .registers 3

    .line 34
    sget v0, Lcom/jelly/mods/qsrow/SafeHook;->errors:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/jelly/mods/qsrow/SafeHook;->errors:I

    const/16 v1, 0x1e

    if-ge v0, v1, :cond_12

    const-string v0, "QsRow: hook error"

    .line 35
    invoke-static {v0}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->log(Ljava/lang/String;)V

    .line 36
    invoke-static {p0}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->log(Ljava/lang/Throwable;)V

    :cond_12
    return-void
.end method


# virtual methods
.method after(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    return-void
.end method

.method protected final afterHookedMethod(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 2

    .line 26
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/jelly/mods/qsrow/SafeHook;->after(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_4

    goto :goto_8

    :catchall_4
    move-exception p0

    .line 28
    invoke-static {p0}, Lcom/jelly/mods/qsrow/SafeHook;->report(Ljava/lang/Throwable;)V

    :goto_8
    return-void
.end method

.method before(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    return-void
.end method

.method protected final beforeHookedMethod(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 2

    .line 17
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/jelly/mods/qsrow/SafeHook;->before(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_4

    goto :goto_8

    :catchall_4
    move-exception p0

    .line 19
    invoke-static {p0}, Lcom/jelly/mods/qsrow/SafeHook;->report(Ljava/lang/Throwable;)V

    :goto_8
    return-void
.end method
