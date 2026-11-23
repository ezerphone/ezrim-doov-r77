.class final Lcom/jelly/mods/qsrow/Board$Pager;
.super Lcom/jelly/mods/qsrow/Scroller;
.source "Board.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jelly/mods/qsrow/Board;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Pager"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jelly/mods/qsrow/Board;


# direct methods
.method constructor <init>(Lcom/jelly/mods/qsrow/Board;Landroid/content/Context;)V
    .registers 3

    .line 343
    iput-object p1, p0, Lcom/jelly/mods/qsrow/Board$Pager;->this$0:Lcom/jelly/mods/qsrow/Board;

    .line 344
    invoke-direct {p0, p2}, Lcom/jelly/mods/qsrow/Scroller;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fling(I)V
    .registers 7

    .line 360
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board$Pager;->step()I

    move-result v0

    if-gtz v0, :cond_a

    .line 362
    invoke-super {p0, p1}, Lcom/jelly/mods/qsrow/Scroller;->fling(I)V

    return-void

    .line 365
    :cond_a
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board$Pager;->rtl()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_15

    if-gez p1, :cond_19

    goto :goto_17

    :cond_15
    if-lez p1, :cond_19

    :goto_17
    move p1, v3

    goto :goto_1a

    :cond_19
    move p1, v2

    .line 366
    :goto_1a
    iget v1, p0, Lcom/jelly/mods/qsrow/Board$Pager;->downOffset:I

    int-to-float v1, v1

    int-to-float v4, v0

    div-float/2addr v1, v4

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    if-eqz p1, :cond_27

    move p1, v3

    goto :goto_28

    :cond_27
    const/4 p1, -0x1

    :goto_28
    add-int/2addr v1, p1

    .line 367
    iget-object p1, p0, Lcom/jelly/mods/qsrow/Board$Pager;->this$0:Lcom/jelly/mods/qsrow/Board;

    invoke-virtual {p1}, Lcom/jelly/mods/qsrow/Board;->pages()I

    move-result p1

    sub-int/2addr p1, v3

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 368
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board$Pager;->range()I

    move-result v1

    mul-int/2addr p1, v0

    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/jelly/mods/qsrow/Board$Pager;->goTo(I)V

    return-void
.end method

.method onScrolled()V
    .registers 1

    .line 354
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Board$Pager;->this$0:Lcom/jelly/mods/qsrow/Board;

    # invokes: Lcom/jelly/mods/qsrow/Board;->onPageScroll()V
    invoke-static {p0}, Lcom/jelly/mods/qsrow/Board;->access$200(Lcom/jelly/mods/qsrow/Board;)V

    return-void
.end method

.method step()I
    .registers 1

    .line 349
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board$Pager;->getWidth()I

    move-result p0

    return p0
.end method
