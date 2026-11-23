.class Lcom/jelly/mods/qsrow/QsRow$5;
.super Lcom/jelly/mods/qsrow/SafeHook;
.source "QsRow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jelly/mods/qsrow/QsRow;->install()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jelly/mods/qsrow/QsRow;


# direct methods
.method constructor <init>(Lcom/jelly/mods/qsrow/QsRow;)V
    .registers 2

    .line 109
    iput-object p1, p0, Lcom/jelly/mods/qsrow/QsRow$5;->this$0:Lcom/jelly/mods/qsrow/QsRow;

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

    .line 117
    iget-object v0, p0, Lcom/jelly/mods/qsrow/QsRow$5;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    # getter for: Lcom/jelly/mods/qsrow/QsRow;->cQqsLayout:Ljava/lang/Class;
    invoke-static {v0}, Lcom/jelly/mods/qsrow/QsRow;->access$300(Lcom/jelly/mods/qsrow/QsRow;)Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object p0, p0, Lcom/jelly/mods/qsrow/QsRow$5;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    iget-object p1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    # invokes: Lcom/jelly/mods/qsrow/QsRow;->grid(Landroid/view/View;)V
    invoke-static {p0, p1}, Lcom/jelly/mods/qsrow/QsRow;->access$400(Lcom/jelly/mods/qsrow/QsRow;Landroid/view/View;)V

    :cond_17
    return-void
.end method

.method before(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 112
    iget-object v0, p0, Lcom/jelly/mods/qsrow/QsRow$5;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    # getter for: Lcom/jelly/mods/qsrow/QsRow;->cQqsLayout:Ljava/lang/Class;
    invoke-static {v0}, Lcom/jelly/mods/qsrow/QsRow;->access$300(Lcom/jelly/mods/qsrow/QsRow;)Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    iget-object p0, p0, Lcom/jelly/mods/qsrow/QsRow$5;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    iget-object p1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    check-cast p1, Landroid/view/View;

    # invokes: Lcom/jelly/mods/qsrow/QsRow;->grid(Landroid/view/View;)V
    invoke-static {p0, p1}, Lcom/jelly/mods/qsrow/QsRow;->access$400(Lcom/jelly/mods/qsrow/QsRow;Landroid/view/View;)V

    :cond_17
    return-void
.end method
