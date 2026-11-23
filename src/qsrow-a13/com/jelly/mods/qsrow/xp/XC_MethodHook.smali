.class public abstract Lcom/jelly/mods/qsrow/xp/XC_MethodHook;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected afterHookedMethod(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 2

    return-void
.end method

.method protected beforeHookedMethod(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 2

    return-void
.end method

.method public final callAfter(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 2

    invoke-virtual {p0, p1}, Lcom/jelly/mods/qsrow/xp/XC_MethodHook;->afterHookedMethod(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V

    return-void
.end method

.method public final callBefore(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 2

    invoke-virtual {p0, p1}, Lcom/jelly/mods/qsrow/xp/XC_MethodHook;->beforeHookedMethod(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V

    return-void
.end method
