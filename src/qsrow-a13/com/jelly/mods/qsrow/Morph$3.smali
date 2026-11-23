.class Lcom/jelly/mods/qsrow/Morph$3;
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


# instance fields
.field final synthetic val$fCtrlView:Ljava/lang/reflect/Field;

.field final synthetic val$fFirstPage:Ljava/lang/reflect/Field;

.field final synthetic val$fPosition:Ljava/lang/reflect/Field;

.field final synthetic val$fQqs:Ljava/lang/reflect/Field;

.field final synthetic val$fQsCtrl:Ljava/lang/reflect/Field;

.field final synthetic val$fTileLayout:Ljava/lang/reflect/Field;


# direct methods
.method constructor <init>(Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;Ljava/lang/reflect/Field;)V
    .registers 7

    .line 60
    iput-object p1, p0, Lcom/jelly/mods/qsrow/Morph$3;->val$fFirstPage:Ljava/lang/reflect/Field;

    iput-object p2, p0, Lcom/jelly/mods/qsrow/Morph$3;->val$fQqs:Ljava/lang/reflect/Field;

    iput-object p3, p0, Lcom/jelly/mods/qsrow/Morph$3;->val$fTileLayout:Ljava/lang/reflect/Field;

    iput-object p4, p0, Lcom/jelly/mods/qsrow/Morph$3;->val$fPosition:Ljava/lang/reflect/Field;

    iput-object p5, p0, Lcom/jelly/mods/qsrow/Morph$3;->val$fQsCtrl:Ljava/lang/reflect/Field;

    iput-object p6, p0, Lcom/jelly/mods/qsrow/Morph$3;->val$fCtrlView:Ljava/lang/reflect/Field;

    invoke-direct {p0}, Lcom/jelly/mods/qsrow/SafeHook;-><init>()V

    return-void
.end method


# virtual methods
.method after(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 63
    iget-object p1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    .line 64
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Morph$3;->val$fFirstPage:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_b

    return-void

    .line 65
    :cond_b
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Morph$3;->val$fQqs:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_49

    .line 67
    iget-object v2, p0, Lcom/jelly/mods/qsrow/Morph$3;->val$fTileLayout:Ljava/lang/reflect/Field;

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 68
    sget-object v2, Lcom/jelly/mods/qsrow/Registry;->rows:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/jelly/mods/qsrow/Row;

    if-eqz v2, :cond_28

    move-object v0, v2

    goto :goto_2e

    .line 69
    :cond_28
    sget-boolean v2, Lcom/jelly/mods/qsrow/Registry;->panelActive:Z

    if-eqz v2, :cond_2d

    goto :goto_2e

    :cond_2d
    move-object v0, v1

    :goto_2e
    if-eqz v0, :cond_49

    .line 71
    iget-object v2, p0, Lcom/jelly/mods/qsrow/Morph$3;->val$fPosition:Ljava/lang/reflect/Field;

    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v2

    const v3, 0x3eb33333    # 0.35f

    div-float/2addr v2, v3

    const/high16 v3, 0x3f800000    # 1.0f

    .line 72
    invoke-static {v3, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    const/4 v4, 0x0

    invoke-static {v4, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    sub-float/2addr v3, v2

    invoke-virtual {v0, v3}, Landroid/view/View;->setAlpha(F)V

    .line 76
    :cond_49
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Morph$3;->val$fQsCtrl:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_53

    move-object p1, v1

    goto :goto_59

    .line 77
    :cond_53
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Morph$3;->val$fCtrlView:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    :goto_59
    if-nez p1, :cond_5c

    goto :goto_65

    .line 78
    :cond_5c
    sget-object v0, Lcom/jelly/mods/qsrow/Registry;->boards:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/jelly/mods/qsrow/Board;

    :goto_65
    if-eqz v1, :cond_78

    .line 80
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Morph$3;->val$fTileLayout:Ljava/lang/reflect/Field;

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    if-eqz p0, :cond_78

    .line 81
    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result p0

    invoke-virtual {v1, p0}, Lcom/jelly/mods/qsrow/Board;->setAlpha(F)V

    :cond_78
    return-void
.end method
