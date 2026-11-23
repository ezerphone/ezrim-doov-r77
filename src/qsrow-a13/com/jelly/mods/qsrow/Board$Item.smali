.class final Lcom/jelly/mods/qsrow/Board$Item;
.super Ljava/lang/Object;
.source "Board.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jelly/mods/qsrow/Board;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Item"
.end annotation


# instance fields
.field final callback:Ljava/lang/Object;

.field final synthetic this$0:Lcom/jelly/mods/qsrow/Board;

.field final tile:Ljava/lang/Object;

.field final view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/jelly/mods/qsrow/Board;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 54
    iput-object p1, p0, Lcom/jelly/mods/qsrow/Board$Item;->this$0:Lcom/jelly/mods/qsrow/Board;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p3, p0, Lcom/jelly/mods/qsrow/Board$Item;->tile:Ljava/lang/Object;

    .line 56
    # getter for: Lcom/jelly/mods/qsrow/Board;->api:Lcom/jelly/mods/qsrow/Api;
    invoke-static {p1}, Lcom/jelly/mods/qsrow/Board;->access$000(Lcom/jelly/mods/qsrow/Board;)Lcom/jelly/mods/qsrow/Api;

    move-result-object v0

    invoke-virtual {p1}, Lcom/jelly/mods/qsrow/Board;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, p2, v1, p3}, Lcom/jelly/mods/qsrow/Api;->newTileView(Ljava/lang/Object;Landroid/content/Context;Ljava/lang/Object;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/jelly/mods/qsrow/Board$Item;->view:Landroid/view/View;

    .line 57
    # getter for: Lcom/jelly/mods/qsrow/Board;->api:Lcom/jelly/mods/qsrow/Api;
    invoke-static {p1}, Lcom/jelly/mods/qsrow/Board;->access$000(Lcom/jelly/mods/qsrow/Board;)Lcom/jelly/mods/qsrow/Api;

    move-result-object p2

    new-instance v0, Lcom/jelly/mods/qsrow/Board$Item$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/jelly/mods/qsrow/Board$Item$$ExternalSyntheticLambda0;-><init>(Lcom/jelly/mods/qsrow/Board$Item;)V

    invoke-virtual {p2, v0}, Lcom/jelly/mods/qsrow/Api;->callback(Ljava/util/function/Consumer;)Ljava/lang/Object;

    move-result-object p2

    iput-object p2, p0, Lcom/jelly/mods/qsrow/Board$Item;->callback:Ljava/lang/Object;

    .line 64
    # getter for: Lcom/jelly/mods/qsrow/Board;->api:Lcom/jelly/mods/qsrow/Api;
    invoke-static {p1}, Lcom/jelly/mods/qsrow/Board;->access$000(Lcom/jelly/mods/qsrow/Board;)Lcom/jelly/mods/qsrow/Api;

    move-result-object p0

    invoke-virtual {p0, p3, p2}, Lcom/jelly/mods/qsrow/Api;->addCallback(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 65
    # getter for: Lcom/jelly/mods/qsrow/Board;->listening:Z
    invoke-static {p1}, Lcom/jelly/mods/qsrow/Board;->access$100(Lcom/jelly/mods/qsrow/Board;)Z

    move-result p0

    if-eqz p0, :cond_39

    # getter for: Lcom/jelly/mods/qsrow/Board;->api:Lcom/jelly/mods/qsrow/Api;
    invoke-static {p1}, Lcom/jelly/mods/qsrow/Board;->access$000(Lcom/jelly/mods/qsrow/Board;)Lcom/jelly/mods/qsrow/Api;

    move-result-object p0

    const/4 p2, 0x1

    invoke-virtual {p0, p3, p1, p2}, Lcom/jelly/mods/qsrow/Api;->setListening(Ljava/lang/Object;Ljava/lang/Object;Z)V

    .line 66
    :cond_39
    # getter for: Lcom/jelly/mods/qsrow/Board;->api:Lcom/jelly/mods/qsrow/Api;
    invoke-static {p1}, Lcom/jelly/mods/qsrow/Board;->access$000(Lcom/jelly/mods/qsrow/Board;)Lcom/jelly/mods/qsrow/Api;

    move-result-object p0

    invoke-virtual {p0, p3}, Lcom/jelly/mods/qsrow/Api;->refresh(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$new$0$com-jelly-mods-qsrow-Board$Item(Ljava/lang/Object;)V
    .registers 3

    .line 59
    :try_start_0
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board$Item;->this$0:Lcom/jelly/mods/qsrow/Board;

    # getter for: Lcom/jelly/mods/qsrow/Board;->api:Lcom/jelly/mods/qsrow/Api;
    invoke-static {v0}, Lcom/jelly/mods/qsrow/Board;->access$000(Lcom/jelly/mods/qsrow/Board;)Lcom/jelly/mods/qsrow/Api;

    move-result-object v0

    iget-object p0, p0, Lcom/jelly/mods/qsrow/Board$Item;->view:Landroid/view/View;

    invoke-virtual {v0, p0, p1}, Lcom/jelly/mods/qsrow/Api;->showState(Landroid/view/View;Ljava/lang/Object;)V
    :try_end_b
    .catchall {:try_start_0 .. :try_end_b} :catchall_c

    goto :goto_10

    :catchall_c
    move-exception p0

    .line 61
    invoke-static {p0}, Lcom/jelly/mods/qsrow/SafeHook;->report(Ljava/lang/Throwable;)V

    :goto_10
    return-void
.end method

.method release()V
    .registers 4

    .line 71
    :try_start_0
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board$Item;->this$0:Lcom/jelly/mods/qsrow/Board;

    # getter for: Lcom/jelly/mods/qsrow/Board;->api:Lcom/jelly/mods/qsrow/Api;
    invoke-static {v0}, Lcom/jelly/mods/qsrow/Board;->access$000(Lcom/jelly/mods/qsrow/Board;)Lcom/jelly/mods/qsrow/Api;

    move-result-object v0

    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board$Item;->tile:Ljava/lang/Object;

    iget-object v2, p0, Lcom/jelly/mods/qsrow/Board$Item;->callback:Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Lcom/jelly/mods/qsrow/Api;->removeCallback(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 72
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board$Item;->this$0:Lcom/jelly/mods/qsrow/Board;

    # getter for: Lcom/jelly/mods/qsrow/Board;->api:Lcom/jelly/mods/qsrow/Api;
    invoke-static {v0}, Lcom/jelly/mods/qsrow/Board;->access$000(Lcom/jelly/mods/qsrow/Board;)Lcom/jelly/mods/qsrow/Api;

    move-result-object v0

    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board$Item;->tile:Ljava/lang/Object;

    iget-object p0, p0, Lcom/jelly/mods/qsrow/Board$Item;->this$0:Lcom/jelly/mods/qsrow/Board;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, v2}, Lcom/jelly/mods/qsrow/Api;->setListening(Ljava/lang/Object;Ljava/lang/Object;Z)V
    :try_end_1b
    .catchall {:try_start_0 .. :try_end_1b} :catchall_1c

    goto :goto_20

    :catchall_1c
    move-exception p0

    .line 74
    invoke-static {p0}, Lcom/jelly/mods/qsrow/SafeHook;->report(Ljava/lang/Throwable;)V

    :goto_20
    return-void
.end method
