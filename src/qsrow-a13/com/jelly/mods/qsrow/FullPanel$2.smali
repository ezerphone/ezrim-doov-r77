.class Lcom/jelly/mods/qsrow/FullPanel$2;
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

    .line 74
    iput-object p1, p0, Lcom/jelly/mods/qsrow/FullPanel$2;->this$0:Lcom/jelly/mods/qsrow/FullPanel;

    invoke-direct {p0}, Lcom/jelly/mods/qsrow/SafeHook;-><init>()V

    return-void
.end method


# virtual methods
.method after(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/jelly/mods/qsrow/FullPanel$2;->this$0:Lcom/jelly/mods/qsrow/FullPanel;

    # getter for: Lcom/jelly/mods/qsrow/FullPanel;->cQsCtrl:Ljava/lang/Class;
    invoke-static {v0}, Lcom/jelly/mods/qsrow/FullPanel;->access$000(Lcom/jelly/mods/qsrow/FullPanel;)Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    return-void

    .line 78
    :cond_f
    iget-object v0, p0, Lcom/jelly/mods/qsrow/FullPanel$2;->this$0:Lcom/jelly/mods/qsrow/FullPanel;

    # getter for: Lcom/jelly/mods/qsrow/FullPanel;->fCtrlView:Ljava/lang/reflect/Field;
    invoke-static {v0}, Lcom/jelly/mods/qsrow/FullPanel;->access$100(Lcom/jelly/mods/qsrow/FullPanel;)Ljava/lang/reflect/Field;

    move-result-object v0

    iget-object v1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_33

    .line 79
    iget-object p0, p0, Lcom/jelly/mods/qsrow/FullPanel$2;->this$0:Lcom/jelly/mods/qsrow/FullPanel;

    check-cast v0, Landroid/view/View;

    # invokes: Lcom/jelly/mods/qsrow/FullPanel;->boardFor(Landroid/view/View;)Lcom/jelly/mods/qsrow/Board;
    invoke-static {p0, v0}, Lcom/jelly/mods/qsrow/FullPanel;->access$300(Lcom/jelly/mods/qsrow/FullPanel;Landroid/view/View;)Lcom/jelly/mods/qsrow/Board;

    move-result-object p0

    iget-object p1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v0, 0x0

    aget-object p1, p1, v0

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-virtual {p0, p1}, Lcom/jelly/mods/qsrow/Board;->setListening(Z)V

    :cond_33
    return-void
.end method
