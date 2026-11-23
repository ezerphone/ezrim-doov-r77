.class Lcom/jelly/mods/qsrow/Morph$2;
.super Lcom/jelly/mods/qsrow/SafeHook;
.source "Morph.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jelly/mods/qsrow/Morph;->install(Ljava/lang/ClassLoader;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 46
    invoke-direct {p0}, Lcom/jelly/mods/qsrow/SafeHook;-><init>()V

    return-void
.end method


# virtual methods
.method after(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 2

    .line 54
    # operator-- for: Lcom/jelly/mods/qsrow/Morph;->building:I
    invoke-static {}, Lcom/jelly/mods/qsrow/Morph;->access$010()I

    return-void
.end method

.method before(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 2

    .line 49
    # operator++ for: Lcom/jelly/mods/qsrow/Morph;->building:I
    invoke-static {}, Lcom/jelly/mods/qsrow/Morph;->access$008()I

    return-void
.end method
