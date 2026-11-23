.class final Lcom/jelly/mods/qsrow/Row;
.super Lcom/jelly/mods/qsrow/Scroller;
.source "Row.java"


# instance fields
.field cell:I

.field gap:I


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 4

    .line 21
    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/Scroller;-><init>(Landroid/content/Context;)V

    const/4 p1, -0x1

    .line 18
    iput p1, p0, Lcom/jelly/mods/qsrow/Row;->cell:I

    iput p1, p0, Lcom/jelly/mods/qsrow/Row;->gap:I

    .line 22
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, p1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0}, Lcom/jelly/mods/qsrow/Row;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method adopt(Landroid/view/View;)V
    .registers 4

    .line 27
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-ne v0, p0, :cond_7

    return-void

    .line 28
    :cond_7
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_18

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 29
    :cond_18
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Row;->removeAllViews()V

    .line 30
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p1, v0}, Lcom/jelly/mods/qsrow/Row;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .registers 5

    .line 45
    invoke-super {p0, p1, p2, p3, p4}, Lcom/jelly/mods/qsrow/Scroller;->onSizeChanged(IIII)V

    .line 46
    new-instance p3, Landroid/graphics/Rect;

    const/4 p4, 0x0

    invoke-direct {p3, p4, p4, p1, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p0, p3}, Lcom/jelly/mods/qsrow/Row;->setClipBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method setCells(II)V
    .registers 3

    .line 34
    iput p1, p0, Lcom/jelly/mods/qsrow/Row;->cell:I

    .line 35
    iput p2, p0, Lcom/jelly/mods/qsrow/Row;->gap:I

    return-void
.end method

.method step()I
    .registers 2

    .line 40
    iget v0, p0, Lcom/jelly/mods/qsrow/Row;->cell:I

    if-lez v0, :cond_8

    iget p0, p0, Lcom/jelly/mods/qsrow/Row;->gap:I

    add-int/2addr v0, p0

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method
