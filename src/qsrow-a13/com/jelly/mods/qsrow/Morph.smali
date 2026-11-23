.class final Lcom/jelly/mods/qsrow/Morph;
.super Ljava/lang/Object;
.source "Morph.java"


# static fields
.field private static final FADE_END:F = 0.35f

.field private static building:I

.field private static installed:Z


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()I
    .registers 1

    .line 13
    sget v0, Lcom/jelly/mods/qsrow/Morph;->building:I

    return v0
.end method

.method static synthetic access$008()I
    .registers 2

    .line 13
    sget v0, Lcom/jelly/mods/qsrow/Morph;->building:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/jelly/mods/qsrow/Morph;->building:I

    return v0
.end method

.method static synthetic access$010()I
    .registers 2

    .line 13
    sget v0, Lcom/jelly/mods/qsrow/Morph;->building:I

    add-int/lit8 v1, v0, -0x1

    sput v1, Lcom/jelly/mods/qsrow/Morph;->building:I

    return v0
.end method

.method static declared-synchronized install(Ljava/lang/ClassLoader;)V
    .registers 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    move-object/from16 v0, p0

    const-class v1, Lcom/jelly/mods/qsrow/Morph;

    monitor-enter v1

    .line 21
    :try_start_5
    sget-boolean v2, Lcom/jelly/mods/qsrow/Morph;->installed:Z
    :try_end_7
    .catchall {:try_start_5 .. :try_end_7} :catchall_9d

    if-eqz v2, :cond_b

    monitor-exit v1

    return-void

    :cond_b
    :try_start_b
    const-string v2, "TileLayout"

    .line 22
    invoke-static {v0, v2}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "QuickQSPanel$QQSSideLabelTileLayout"

    .line 23
    invoke-static {v0, v3}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    const-string v4, "QSPanel"

    .line 24
    invoke-static {v0, v4}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "QSAnimator"

    .line 25
    invoke-static {v0, v5}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const-string v6, "mTileLayout"

    .line 26
    invoke-static {v4, v6}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v10

    const-string v4, "mQuickQsPanel"

    .line 27
    invoke-static {v5, v4}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v9

    const-string v4, "mQsPanelController"

    .line 28
    invoke-static {v5, v4}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v12

    const-string v4, "QSPanelController"

    .line 29
    invoke-static {v0, v4}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v4, "mView"

    invoke-static {v0, v4}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v13

    const-string v0, "mLastPosition"

    .line 30
    invoke-static {v5, v0}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v11

    const-string v0, "mFirstPageAnimator"

    .line 31
    invoke-static {v5, v0}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    const-string v0, "getNumVisibleTiles"

    const/4 v4, 0x0

    new-array v6, v4, [Ljava/lang/Class;

    .line 32
    invoke-virtual {v2, v0, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const-string v2, "updateAnimators"

    new-array v6, v4, [Ljava/lang/Class;

    .line 33
    invoke-virtual {v5, v2, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const-string v6, "createSecondaryPageAnimators"

    const/4 v14, 0x1

    new-array v7, v14, [Ljava/lang/Class;

    .line 34
    sget-object v15, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v15, v7, v4

    invoke-virtual {v5, v6, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    const-string v7, "setPosition"

    new-array v15, v14, [Ljava/lang/Class;

    .line 35
    sget-object v16, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v16, v15, v4

    invoke-virtual {v5, v7, v15}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 36
    invoke-static {v2}, Lcom/jelly/mods/qsrow/Refl;->deopt(Ljava/lang/reflect/Member;)V

    .line 37
    invoke-static {v6}, Lcom/jelly/mods/qsrow/Refl;->deopt(Ljava/lang/reflect/Member;)V

    .line 40
    new-instance v5, Lcom/jelly/mods/qsrow/Morph$1;

    invoke-direct {v5, v3}, Lcom/jelly/mods/qsrow/Morph$1;-><init>(Ljava/lang/Class;)V

    invoke-static {v0, v5}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 46
    new-instance v0, Lcom/jelly/mods/qsrow/Morph$2;

    invoke-direct {v0}, Lcom/jelly/mods/qsrow/Morph$2;-><init>()V

    .line 57
    invoke-static {v2, v0}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 58
    invoke-static {v6, v0}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 60
    new-instance v0, Lcom/jelly/mods/qsrow/Morph$3;

    move-object v7, v0

    invoke-direct/range {v7 .. v13}, Lcom/jelly/mods/qsrow/Morph$3;-><init>(Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;)V

    invoke-static {v4, v0}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 85
    sput-boolean v14, Lcom/jelly/mods/qsrow/Morph;->installed:Z
    :try_end_9b
    .catchall {:try_start_b .. :try_end_9b} :catchall_9d

    .line 86
    monitor-exit v1

    return-void

    :catchall_9d
    move-exception v0

    monitor-exit v1

    throw v0
.end method
