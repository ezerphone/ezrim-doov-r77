.class Lcom/jelly/mods/qsrow/FullPanel$5;
.super Lcom/jelly/mods/qsrow/SafeHook;
.source "FullPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jelly/mods/qsrow/FullPanel;->install()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jelly/mods/qsrow/FullPanel;


# direct methods
.method constructor <init>(Lcom/jelly/mods/qsrow/FullPanel;)V
    .registers 2

    .line 99
    iput-object p1, p0, Lcom/jelly/mods/qsrow/FullPanel$5;->this$0:Lcom/jelly/mods/qsrow/FullPanel;

    invoke-direct {p0}, Lcom/jelly/mods/qsrow/SafeHook;-><init>()V

    return-void
.end method


# virtual methods
.method after(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 2

    .line 102
    iget-object p0, p0, Lcom/jelly/mods/qsrow/FullPanel$5;->this$0:Lcom/jelly/mods/qsrow/FullPanel;

    # getter for: Lcom/jelly/mods/qsrow/FullPanel;->tiles:Lcom/jelly/mods/qsrow/Tiles;
    invoke-static {p0}, Lcom/jelly/mods/qsrow/FullPanel;->access$400(Lcom/jelly/mods/qsrow/FullPanel;)Lcom/jelly/mods/qsrow/Tiles;

    move-result-object p0

    iget-object p1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/jelly/mods/qsrow/Tiles;->insetBackground(Landroid/view/View;)V

    return-void
.end method
