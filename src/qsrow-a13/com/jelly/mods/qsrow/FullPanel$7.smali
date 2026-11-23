.class Lcom/jelly/mods/qsrow/FullPanel$7;
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

    .line 113
    iput-object p1, p0, Lcom/jelly/mods/qsrow/FullPanel$7;->this$0:Lcom/jelly/mods/qsrow/FullPanel;

    invoke-direct {p0}, Lcom/jelly/mods/qsrow/SafeHook;-><init>()V

    return-void
.end method


# virtual methods
.method before(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 116
    iget-object v0, p0, Lcom/jelly/mods/qsrow/FullPanel$7;->this$0:Lcom/jelly/mods/qsrow/FullPanel;

    # getter for: Lcom/jelly/mods/qsrow/FullPanel;->cQsPanel:Ljava/lang/Class;
    invoke-static {v0}, Lcom/jelly/mods/qsrow/FullPanel;->access$500(Lcom/jelly/mods/qsrow/FullPanel;)Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object v0, p0, Lcom/jelly/mods/qsrow/FullPanel$7;->this$0:Lcom/jelly/mods/qsrow/FullPanel;

    # getter for: Lcom/jelly/mods/qsrow/FullPanel;->cQqsPanel:Ljava/lang/Class;
    invoke-static {v0}, Lcom/jelly/mods/qsrow/FullPanel;->access$600(Lcom/jelly/mods/qsrow/FullPanel;)Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_30

    .line 117
    iget-object p0, p0, Lcom/jelly/mods/qsrow/FullPanel$7;->this$0:Lcom/jelly/mods/qsrow/FullPanel;

    iget-object v0, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewGroup;

    iget-object p1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v1, 0x1

    aget-object p1, p1, v1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    # invokes: Lcom/jelly/mods/qsrow/FullPanel;->place(Landroid/view/ViewGroup;I)V
    invoke-static {p0, v0, p1}, Lcom/jelly/mods/qsrow/FullPanel;->access$700(Lcom/jelly/mods/qsrow/FullPanel;Landroid/view/ViewGroup;I)V

    :cond_30
    return-void
.end method
