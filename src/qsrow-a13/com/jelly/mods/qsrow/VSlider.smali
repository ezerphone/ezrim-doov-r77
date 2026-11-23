.class final Lcom/jelly/mods/qsrow/VSlider;
.super Landroid/view/View;
.source "VSlider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jelly/mods/qsrow/VSlider$Model;,
        Lcom/jelly/mods/qsrow/VSlider$Volume;,
        Lcom/jelly/mods/qsrow/VSlider$Brightness;
    }
.end annotation


# instance fields
.field private final clip:Landroid/graphics/Path;

.field private fill:I

.field private final icon:Landroid/graphics/drawable/Drawable;

.field private final model:Lcom/jelly/mods/qsrow/VSlider$Model;

.field private onFill:I

.field private onTrack:I

.field private final paint:Landroid/graphics/Paint;

.field private final rect:Landroid/graphics/RectF;

.field private track:I

.field private value:F


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/jelly/mods/qsrow/VSlider$Model;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    .line 35
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 28
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/jelly/mods/qsrow/VSlider;->paint:Landroid/graphics/Paint;

    .line 29
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/jelly/mods/qsrow/VSlider;->clip:Landroid/graphics/Path;

    .line 30
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/jelly/mods/qsrow/VSlider;->rect:Landroid/graphics/RectF;

    const v0, -0xd1d0cd

    .line 32
    iput v0, p0, Lcom/jelly/mods/qsrow/VSlider;->track:I

    const v0, -0x2c1c03

    iput v0, p0, Lcom/jelly/mods/qsrow/VSlider;->fill:I

    const v0, -0xefece6

    iput v0, p0, Lcom/jelly/mods/qsrow/VSlider;->onFill:I

    const v0, -0x1b1d1a

    iput v0, p0, Lcom/jelly/mods/qsrow/VSlider;->onTrack:I

    .line 36
    iput-object p2, p0, Lcom/jelly/mods/qsrow/VSlider;->model:Lcom/jelly/mods/qsrow/VSlider$Model;

    .line 37
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const-string v0, "drawable"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, p3, v0, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p2

    const/4 p3, 0x0

    if-eqz p2, :cond_49

    .line 40
    :try_start_40
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_48
    .catchall {:try_start_40 .. :try_end_48} :catchall_49

    move-object p3, p1

    .line 43
    :catchall_49
    :cond_49
    iput-object p3, p0, Lcom/jelly/mods/qsrow/VSlider;->icon:Landroid/graphics/drawable/Drawable;

    .line 44
    invoke-virtual {p0, p4}, Lcom/jelly/mods/qsrow/VSlider;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 45
    invoke-virtual {p0, v1}, Lcom/jelly/mods/qsrow/VSlider;->setFocusable(Z)V

    return-void
.end method

.method private static clamp(F)F
    .registers 2

    const/high16 v0, 0x3f800000    # 1.0f

    .line 130
    invoke-static {v0, p0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    const/4 v0, 0x0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    return p0
.end method

.method private dp(F)I
    .registers 3

    .line 134
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/VSlider;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/4 v0, 0x1

    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method private update(FZ)V
    .registers 4

    .line 118
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/VSlider;->getHeight()I

    move-result v0

    if-gtz v0, :cond_7

    return-void

    :cond_7
    int-to-float v0, v0

    div-float/2addr p1, v0

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p1

    .line 120
    invoke-static {v0}, Lcom/jelly/mods/qsrow/VSlider;->clamp(F)F

    move-result p1

    iput p1, p0, Lcom/jelly/mods/qsrow/VSlider;->value:F

    .line 121
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/VSlider;->invalidate()V

    .line 123
    :try_start_15
    iget-object p1, p0, Lcom/jelly/mods/qsrow/VSlider;->model:Lcom/jelly/mods/qsrow/VSlider$Model;

    iget v0, p0, Lcom/jelly/mods/qsrow/VSlider;->value:F

    invoke-interface {p1, p0, v0, p2}, Lcom/jelly/mods/qsrow/VSlider$Model;->set(Landroid/view/View;FZ)V
    :try_end_1c
    .catchall {:try_start_15 .. :try_end_1c} :catchall_1d

    goto :goto_21

    :catchall_1d
    move-exception p0

    .line 125
    invoke-static {p0}, Lcom/jelly/mods/qsrow/SafeHook;->report(Ljava/lang/Throwable;)V

    :goto_21
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .registers 1

    .line 68
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 69
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/VSlider;->refresh()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 13

    .line 74
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/VSlider;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/VSlider;->getHeight()I

    move-result v1

    int-to-float v5, v0

    const/high16 v8, 0x40000000    # 2.0f

    div-float v2, v5, v8

    const/high16 v9, 0x41c00000    # 24.0f

    .line 75
    invoke-direct {p0, v9}, Lcom/jelly/mods/qsrow/VSlider;->dp(F)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    .line 76
    iget-object v3, p0, Lcom/jelly/mods/qsrow/VSlider;->rect:Landroid/graphics/RectF;

    int-to-float v6, v1

    const/4 v4, 0x0

    invoke-virtual {v3, v4, v4, v5, v6}, Landroid/graphics/RectF;->set(FFFF)V

    .line 77
    iget-object v3, p0, Lcom/jelly/mods/qsrow/VSlider;->clip:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    .line 78
    iget-object v3, p0, Lcom/jelly/mods/qsrow/VSlider;->clip:Landroid/graphics/Path;

    iget-object v4, p0, Lcom/jelly/mods/qsrow/VSlider;->rect:Landroid/graphics/RectF;

    sget-object v7, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v3, v4, v2, v2, v7}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 79
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 80
    iget-object v2, p0, Lcom/jelly/mods/qsrow/VSlider;->clip:Landroid/graphics/Path;

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 81
    iget-object v2, p0, Lcom/jelly/mods/qsrow/VSlider;->paint:Landroid/graphics/Paint;

    iget v3, p0, Lcom/jelly/mods/qsrow/VSlider;->track:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 82
    iget-object v2, p0, Lcom/jelly/mods/qsrow/VSlider;->rect:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/jelly/mods/qsrow/VSlider;->paint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 83
    iget v2, p0, Lcom/jelly/mods/qsrow/VSlider;->value:F

    mul-float/2addr v2, v6

    sub-float v10, v6, v2

    .line 84
    iget-object v2, p0, Lcom/jelly/mods/qsrow/VSlider;->paint:Landroid/graphics/Paint;

    iget v3, p0, Lcom/jelly/mods/qsrow/VSlider;->fill:I

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    const/4 v3, 0x0

    .line 85
    iget-object v7, p0, Lcom/jelly/mods/qsrow/VSlider;->paint:Landroid/graphics/Paint;

    move-object v2, p1

    move v4, v10

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 86
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 87
    iget-object v2, p0, Lcom/jelly/mods/qsrow/VSlider;->icon:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_8d

    .line 88
    invoke-direct {p0, v9}, Lcom/jelly/mods/qsrow/VSlider;->dp(F)I

    move-result v2

    sub-int/2addr v0, v2

    .line 89
    div-int/lit8 v0, v0, 0x2

    const/high16 v3, 0x41600000    # 14.0f

    invoke-direct {p0, v3}, Lcom/jelly/mods/qsrow/VSlider;->dp(F)I

    move-result v3

    sub-int/2addr v1, v3

    sub-int/2addr v1, v2

    .line 90
    iget-object v3, p0, Lcom/jelly/mods/qsrow/VSlider;->icon:Landroid/graphics/drawable/Drawable;

    add-int v4, v0, v2

    add-int v5, v1, v2

    invoke-virtual {v3, v0, v1, v4, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 91
    iget-object v0, p0, Lcom/jelly/mods/qsrow/VSlider;->icon:Landroid/graphics/drawable/Drawable;

    int-to-float v1, v1

    int-to-float v2, v2

    div-float/2addr v2, v8

    add-float/2addr v1, v2

    cmpg-float v1, v10, v1

    if-gtz v1, :cond_83

    iget v1, p0, Lcom/jelly/mods/qsrow/VSlider;->onFill:I

    goto :goto_85

    :cond_83
    iget v1, p0, Lcom/jelly/mods/qsrow/VSlider;->onTrack:I

    :goto_85
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setTint(I)V

    .line 92
    iget-object p0, p0, Lcom/jelly/mods/qsrow/VSlider;->icon:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_8d
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6

    .line 98
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_28

    if-eq v0, v2, :cond_1d

    const/4 v3, 0x2

    if-eq v0, v3, :cond_15

    const/4 v3, 0x3

    if-eq v0, v3, :cond_1d

    .line 113
    invoke-super {p0, p1}, Landroid/view/View;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p0

    return p0

    .line 105
    :cond_15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-direct {p0, p1, v1}, Lcom/jelly/mods/qsrow/VSlider;->update(FZ)V

    return v2

    .line 109
    :cond_1d
    invoke-virtual {p0, v1}, Lcom/jelly/mods/qsrow/VSlider;->setPressed(Z)V

    .line 110
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-direct {p0, p1, v2}, Lcom/jelly/mods/qsrow/VSlider;->update(FZ)V

    return v2

    .line 100
    :cond_28
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/VSlider;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_35

    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/VSlider;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 101
    :cond_35
    invoke-virtual {p0, v2}, Lcom/jelly/mods/qsrow/VSlider;->setPressed(Z)V

    .line 102
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-direct {p0, p1, v1}, Lcom/jelly/mods/qsrow/VSlider;->update(FZ)V

    return v2
.end method

.method refresh()V
    .registers 2

    .line 59
    :try_start_0
    iget-object v0, p0, Lcom/jelly/mods/qsrow/VSlider;->model:Lcom/jelly/mods/qsrow/VSlider$Model;

    invoke-interface {v0, p0}, Lcom/jelly/mods/qsrow/VSlider$Model;->get(Landroid/view/View;)F

    move-result v0

    invoke-static {v0}, Lcom/jelly/mods/qsrow/VSlider;->clamp(F)F

    move-result v0

    iput v0, p0, Lcom/jelly/mods/qsrow/VSlider;->value:F
    :try_end_c
    .catchall {:try_start_0 .. :try_end_c} :catchall_d

    goto :goto_11

    :catchall_d
    move-exception v0

    .line 61
    invoke-static {v0}, Lcom/jelly/mods/qsrow/SafeHook;->report(Ljava/lang/Throwable;)V

    .line 63
    :goto_11
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/VSlider;->invalidate()V

    return-void
.end method

.method setColors([I)V
    .registers 3

    if-nez p1, :cond_3

    return-void

    :cond_3
    const/4 v0, 0x0

    .line 50
    aget v0, p1, v0

    iput v0, p0, Lcom/jelly/mods/qsrow/VSlider;->fill:I

    const/4 v0, 0x1

    .line 51
    aget v0, p1, v0

    iput v0, p0, Lcom/jelly/mods/qsrow/VSlider;->track:I

    const/4 v0, 0x2

    .line 52
    aget v0, p1, v0

    iput v0, p0, Lcom/jelly/mods/qsrow/VSlider;->onFill:I

    const/4 v0, 0x3

    .line 53
    aget p1, p1, v0

    iput p1, p0, Lcom/jelly/mods/qsrow/VSlider;->onTrack:I

    .line 54
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/VSlider;->invalidate()V

    return-void
.end method
