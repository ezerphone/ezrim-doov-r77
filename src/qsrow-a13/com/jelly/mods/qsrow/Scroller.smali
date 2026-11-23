.class Lcom/jelly/mods/qsrow/Scroller;
.super Landroid/widget/HorizontalScrollView;
.source "Scroller.java"


# instance fields
.field downOffset:I

.field private downX:F

.field private downY:F

.field private lastRange:I

.field private final settle:Ljava/lang/Runnable;

.field private sideways:Z

.field private final slop:I

.field private touching:Z


# direct methods
.method public static synthetic $r8$lambda$HyplK9Snun2GKDiWGXimwmYE45Q(Lcom/jelly/mods/qsrow/Scroller;)V
    .registers 1

    invoke-direct {p0}, Lcom/jelly/mods/qsrow/Scroller;->snap()V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 23
    invoke-direct {p0, p1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    const/4 v0, -0x1

    .line 17
    iput v0, p0, Lcom/jelly/mods/qsrow/Scroller;->lastRange:I

    .line 20
    new-instance v0, Lcom/jelly/mods/qsrow/Scroller$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0}, Lcom/jelly/mods/qsrow/Scroller$$ExternalSyntheticLambda0;-><init>(Lcom/jelly/mods/qsrow/Scroller;)V

    iput-object v0, p0, Lcom/jelly/mods/qsrow/Scroller;->settle:Ljava/lang/Runnable;

    .line 24
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    iput p1, p0, Lcom/jelly/mods/qsrow/Scroller;->slop:I

    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1}, Lcom/jelly/mods/qsrow/Scroller;->setHorizontalScrollBarEnabled(Z)V

    return-void
.end method

.method private notMine(Landroid/view/MotionEvent;)Z
    .registers 6

    .line 59
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_16

    .line 61
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/jelly/mods/qsrow/Scroller;->downX:F

    .line 62
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Lcom/jelly/mods/qsrow/Scroller;->downY:F

    .line 63
    iput-boolean v1, p0, Lcom/jelly/mods/qsrow/Scroller;->sideways:Z

    return v1

    :cond_16
    const/4 v2, 0x2

    if-ne v0, v2, :cond_43

    .line 66
    iget-boolean v0, p0, Lcom/jelly/mods/qsrow/Scroller;->sideways:Z

    if-nez v0, :cond_43

    .line 67
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget v2, p0, Lcom/jelly/mods/qsrow/Scroller;->downX:F

    sub-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget v2, p0, Lcom/jelly/mods/qsrow/Scroller;->downY:F

    sub-float/2addr p1, v2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    .line 68
    iget v2, p0, Lcom/jelly/mods/qsrow/Scroller;->slop:I

    int-to-float v2, v2

    cmpl-float v2, v0, v2

    const/4 v3, 0x1

    if-lez v2, :cond_42

    cmpl-float p1, v0, p1

    if-lez p1, :cond_42

    iput-boolean v3, p0, Lcom/jelly/mods/qsrow/Scroller;->sideways:Z

    goto :goto_43

    :cond_42
    return v3

    :cond_43
    :goto_43
    return v1
.end method

.method private settleSoon()V
    .registers 4

    .line 108
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Scroller;->settle:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/jelly/mods/qsrow/Scroller;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 109
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Scroller;->settle:Ljava/lang/Runnable;

    const-wide/16 v1, 0x50

    invoke-virtual {p0, v0, v1, v2}, Lcom/jelly/mods/qsrow/Scroller;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private snap()V
    .registers 6

    .line 114
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->step()I

    move-result v0

    .line 115
    iget-boolean v1, p0, Lcom/jelly/mods/qsrow/Scroller;->touching:Z

    if-nez v1, :cond_2c

    if-gtz v0, :cond_b

    goto :goto_2c

    .line 116
    :cond_b
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->range()I

    move-result v1

    .line 117
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->fromStart()I

    move-result v2

    int-to-float v3, v2

    int-to-float v4, v0

    div-float/2addr v3, v4

    .line 118
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    mul-int/2addr v3, v0

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    sub-int v4, v1, v3

    .line 119
    div-int/lit8 v0, v0, 0x2

    if-ge v4, v0, :cond_26

    goto :goto_27

    :cond_26
    move v1, v3

    :goto_27
    if-eq v1, v2, :cond_2c

    .line 120
    invoke-virtual {p0, v1}, Lcom/jelly/mods/qsrow/Scroller;->goTo(I)V

    :cond_2c
    :goto_2c
    return-void
.end method


# virtual methods
.method afterLayout()V
    .registers 1

    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 5

    .line 76
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_14

    .line 78
    iput-boolean v1, p0, Lcom/jelly/mods/qsrow/Scroller;->touching:Z

    .line 79
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->fromStart()I

    move-result v2

    iput v2, p0, Lcom/jelly/mods/qsrow/Scroller;->downOffset:I

    .line 80
    iget-object v2, p0, Lcom/jelly/mods/qsrow/Scroller;->settle:Ljava/lang/Runnable;

    invoke-virtual {p0, v2}, Lcom/jelly/mods/qsrow/Scroller;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 82
    :cond_14
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eq v0, v1, :cond_1d

    const/4 v1, 0x3

    if-ne v0, v1, :cond_23

    :cond_1d
    const/4 v0, 0x0

    .line 84
    iput-boolean v0, p0, Lcom/jelly/mods/qsrow/Scroller;->touching:Z

    .line 85
    invoke-direct {p0}, Lcom/jelly/mods/qsrow/Scroller;->settleSoon()V

    :cond_23
    return p1
.end method

.method final fromStart()I
    .registers 2

    .line 50
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->rtl()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->range()I

    move-result v0

    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->getScrollX()I

    move-result p0

    sub-int/2addr v0, p0

    goto :goto_14

    :cond_10
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->getScrollX()I

    move-result v0

    :goto_14
    return v0
.end method

.method final goTo(I)V
    .registers 3

    .line 54
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->rtl()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->range()I

    move-result v0

    sub-int p1, v0, p1

    :cond_c
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/jelly/mods/qsrow/Scroller;->smoothScrollTo(II)V

    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    .line 92
    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/Scroller;->notMine(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_e

    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    goto :goto_f

    :cond_e
    const/4 p0, 0x0

    :goto_f
    return p0
.end method

.method protected onLayout(ZIIII)V
    .registers 10

    .line 125
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->rtl()Z

    move-result v0

    .line 126
    iget v1, p0, Lcom/jelly/mods/qsrow/Scroller;->lastRange:I

    const/4 v2, 0x0

    if-gez v1, :cond_b

    move v1, v2

    goto :goto_17

    :cond_b
    if-eqz v0, :cond_13

    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->getScrollX()I

    move-result v3

    sub-int/2addr v1, v3

    goto :goto_17

    :cond_13
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->getScrollX()I

    move-result v1

    .line 127
    :goto_17
    invoke-super/range {p0 .. p5}, Landroid/widget/HorizontalScrollView;->onLayout(ZIIII)V

    .line 128
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->range()I

    move-result p1

    .line 129
    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-static {v2, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    if-eqz v0, :cond_2a

    sub-int p2, p1, p2

    .line 130
    :cond_2a
    invoke-virtual {p0, p2, v2}, Lcom/jelly/mods/qsrow/Scroller;->scrollTo(II)V

    .line 131
    iput p1, p0, Lcom/jelly/mods/qsrow/Scroller;->lastRange:I

    .line 132
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->afterLayout()V

    return-void
.end method

.method protected onScrollChanged(IIII)V
    .registers 5

    .line 102
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/HorizontalScrollView;->onScrollChanged(IIII)V

    .line 103
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->onScrolled()V

    .line 104
    iget-boolean p1, p0, Lcom/jelly/mods/qsrow/Scroller;->touching:Z

    if-nez p1, :cond_d

    invoke-direct {p0}, Lcom/jelly/mods/qsrow/Scroller;->settleSoon()V

    :cond_d
    return-void
.end method

.method onScrolled()V
    .registers 1

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 3

    .line 97
    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/Scroller;->notMine(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_f

    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    if-eqz p0, :cond_d

    goto :goto_f

    :cond_d
    const/4 p0, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 p0, 0x1

    :goto_10
    return p0
.end method

.method final range()I
    .registers 5

    .line 44
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_10

    invoke-virtual {p0, v1}, Lcom/jelly/mods/qsrow/Scroller;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    goto :goto_11

    :cond_10
    move v0, v1

    .line 45
    :goto_11
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->getPaddingLeft()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->getPaddingRight()I

    move-result p0

    sub-int/2addr v2, p0

    sub-int/2addr v0, v2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method final rtl()Z
    .registers 2

    .line 40
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Scroller;->getLayoutDirection()I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_8

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method step()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
