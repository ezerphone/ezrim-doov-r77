.class public final Lcom/jelly/mods/qsrow/Bake;
.super Ljava/lang/Object;


# static fields
.field public static ctx:Landroid/content/Context;

.field public static mode:I

.field public static panelOk:Z

.field public static state:I


# direct methods
.method public static after(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;
    .registers 10

    :try_start_0
    invoke-static {p0}, Lcom/jelly/mods/qsrow/Bake;->grab(Ljava/lang/Object;)V

    invoke-static {}, Lcom/jelly/mods/qsrow/Bake;->ensure()Z

    move-result v0

    if-eqz v0, :cond_32

    sget-object v0, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hooks:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_32

    new-instance v1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;

    invoke-direct {v1}, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;-><init>()V

    iput-object p0, v1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    iput-object p2, v1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    iput-object p3, v1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->result:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_23
    if-ge v3, v2, :cond_31

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jelly/mods/qsrow/xp/XC_MethodHook;

    invoke-virtual {v4, v1}, Lcom/jelly/mods/qsrow/xp/XC_MethodHook;->callAfter(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_23

    :cond_31
    return-object v1
    :try_end_32
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_32} :catch_32

    :catch_32
    :cond_32
    const/4 v0, 0x0

    return-object v0
.end method

.method public static afterInit(Ljava/lang/Object;)V
    .registers 4

    const-string v0, "com.android.systemui.qs.QuickQSPanel#<init>"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1, v1}, Lcom/jelly/mods/qsrow/Bake;->after(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;

    return-void
.end method

.method public static before(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;
    .registers 9

    :try_start_0
    invoke-static {p0}, Lcom/jelly/mods/qsrow/Bake;->grab(Ljava/lang/Object;)V

    invoke-static {}, Lcom/jelly/mods/qsrow/Bake;->ensure()Z

    move-result v0

    if-eqz v0, :cond_30

    sget-object v0, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hooks:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_30

    new-instance v1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;

    invoke-direct {v1}, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;-><init>()V

    iput-object p0, v1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    iput-object p2, v1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_21
    if-ge v3, v2, :cond_2f

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jelly/mods/qsrow/xp/XC_MethodHook;

    invoke-virtual {v4, v1}, Lcom/jelly/mods/qsrow/xp/XC_MethodHook;->callBefore(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_21

    :cond_2f
    return-object v1
    :try_end_30
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_30} :catch_30

    :catch_30
    :cond_30
    const/4 v0, 0x0

    return-object v0
.end method

.method private static declared-synchronized ensure()Z
    .registers 8

    sget v0, Lcom/jelly/mods/qsrow/Bake;->state:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_6

    return v1

    :cond_6
    if-eqz v0, :cond_a

    const/4 v0, 0x0

    return v0

    :cond_a
    sget-object v6, Lcom/jelly/mods/qsrow/Bake;->ctx:Landroid/content/Context;

    if-nez v6, :cond_10

    const/4 v0, 0x0

    return v0

    :cond_10
    const/4 v0, 0x3

    sput v0, Lcom/jelly/mods/qsrow/Bake;->state:I

    :try_start_13
    const/4 v2, 0x0

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "qsrow_mode"

    invoke-static {v3, v4, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-eqz v2, :cond_21

    const/4 v2, 0x2

    :cond_21
    invoke-static {v4}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v5

    new-instance v7, Lcom/jelly/mods/qsrow/ModeWatcher;

    invoke-direct {v7, v6}, Lcom/jelly/mods/qsrow/ModeWatcher;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x0

    invoke-virtual {v3, v5, v4, v7}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    sput v2, Lcom/jelly/mods/qsrow/Bake;->mode:I

    if-nez v2, :cond_37

    const/4 v0, 0x2

    sput v0, Lcom/jelly/mods/qsrow/Bake;->state:I

    const/4 v0, 0x0

    return v0

    :cond_37
    const-class v0, Lcom/jelly/mods/qsrow/Bake;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    new-instance v3, Lcom/jelly/mods/qsrow/QsRow;

    const/4 v4, 0x5

    invoke-direct {v3, v0, v4}, Lcom/jelly/mods/qsrow/QsRow;-><init>(Ljava/lang/ClassLoader;I)V

    invoke-virtual {v3}, Lcom/jelly/mods/qsrow/QsRow;->install()V

    const/4 v3, 0x2

    if-ne v2, v3, :cond_5b
    :try_end_49
    .catch Ljava/lang/Throwable; {:try_start_13 .. :try_end_49} :catch_62

    :try_start_49
    new-instance v3, Lcom/jelly/mods/qsrow/FullPanel;

    const/4 v4, 0x4

    const/4 v5, 0x5

    const/4 v7, 0x1

    invoke-direct {v3, v0, v4, v5, v7}, Lcom/jelly/mods/qsrow/FullPanel;-><init>(Ljava/lang/ClassLoader;IIZ)V

    invoke-virtual {v3}, Lcom/jelly/mods/qsrow/FullPanel;->install()V

    sput-boolean v7, Lcom/jelly/mods/qsrow/Bake;->panelOk:Z
    :try_end_56
    .catch Ljava/lang/Throwable; {:try_start_49 .. :try_end_56} :catch_57

    :try_start_56
    goto :goto_5b

    :catch_57
    move-exception v3

    invoke-static {v3}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->log(Ljava/lang/Throwable;)V

    :cond_5b
    :goto_5b
    invoke-static {v0}, Lcom/jelly/mods/qsrow/Morph;->install(Ljava/lang/ClassLoader;)V

    const/4 v0, 0x1

    sput v0, Lcom/jelly/mods/qsrow/Bake;->state:I
    :try_end_61
    .catch Ljava/lang/Throwable; {:try_start_56 .. :try_end_61} :catch_62

    return v1

    :catch_62
    move-exception v0

    invoke-static {v0}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->log(Ljava/lang/Throwable;)V

    const/4 v0, 0x2

    sput v0, Lcom/jelly/mods/qsrow/Bake;->state:I

    const/4 v0, 0x0

    return v0
.end method

.method public static full()Z
    .registers 2

    invoke-static {}, Lcom/jelly/mods/qsrow/Bake;->ensure()Z

    move-result v0

    if-eqz v0, :cond_e

    sget v0, Lcom/jelly/mods/qsrow/Bake;->mode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_e

    sget-boolean v0, Lcom/jelly/mods/qsrow/Bake;->panelOk:Z

    return v0

    :cond_e
    const/4 v0, 0x0

    return v0
.end method

.method private static grab(Ljava/lang/Object;)V
    .registers 3

    sget-object v0, Lcom/jelly/mods/qsrow/Bake;->ctx:Landroid/content/Context;

    if-nez v0, :cond_19

    instance-of v0, p0, Landroid/view/View;

    if-eqz v0, :cond_19

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    if-eqz v1, :cond_17

    sput-object v1, Lcom/jelly/mods/qsrow/Bake;->ctx:Landroid/content/Context;

    return-void

    :cond_17
    sput-object v0, Lcom/jelly/mods/qsrow/Bake;->ctx:Landroid/content/Context;

    :cond_19
    return-void
.end method
