.class final Lcom/jelly/mods/qsrow/Board;
.super Landroid/view/ViewGroup;
.source "Board.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jelly/mods/qsrow/Board$Grid;,
        Lcom/jelly/mods/qsrow/Board$Pager;,
        Lcom/jelly/mods/qsrow/Board$Item;
    }
.end annotation


# instance fields
.field private final api:Lcom/jelly/mods/qsrow/Api;

.field private bigH:I

.field private bright:Lcom/jelly/mods/qsrow/VSlider;

.field private colW:I

.field private colored:Z

.field private final count:I

.field private final fit:Z

.field private final grid:Lcom/jelly/mods/qsrow/Board$Grid;

.field private final hero:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/jelly/mods/qsrow/Board$Item;",
            ">;"
        }
    .end annotation
.end field

.field private heroH:I

.field indicator:Landroid/view/View;

.field private final items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/jelly/mods/qsrow/Board$Item;",
            ">;"
        }
    .end annotation
.end field

.field private lastPages:I

.field private lastWhy:Ljava/lang/String;

.field private listening:Z

.field media:Landroid/view/View;

.field private final pager:Lcom/jelly/mods/qsrow/Board$Pager;

.field panel:Landroid/view/View;

.field private postedSpace:I

.field space:I

.field private final style:I

.field private final tiles:Lcom/jelly/mods/qsrow/Tiles;

.field private volume:Lcom/jelly/mods/qsrow/VSlider;


# direct methods
.method constructor <init>(Landroid/content/Context;IIZLcom/jelly/mods/qsrow/Api;Lcom/jelly/mods/qsrow/Tiles;)V
    .registers 9

    .line 80
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 30
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/jelly/mods/qsrow/Board;->items:Ljava/util/List;

    .line 31
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/jelly/mods/qsrow/Board;->hero:Ljava/util/List;

    const/high16 v0, -0x80000000

    .line 44
    iput v0, p0, Lcom/jelly/mods/qsrow/Board;->postedSpace:I

    const/4 v0, -0x1

    .line 45
    iput v0, p0, Lcom/jelly/mods/qsrow/Board;->lastPages:I

    const-string v1, ""

    .line 268
    iput-object v1, p0, Lcom/jelly/mods/qsrow/Board;->lastWhy:Ljava/lang/String;

    .line 81
    iput p2, p0, Lcom/jelly/mods/qsrow/Board;->style:I

    const/4 v1, 0x1

    .line 82
    invoke-static {v1, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    iput p3, p0, Lcom/jelly/mods/qsrow/Board;->count:I

    .line 83
    iput-boolean p4, p0, Lcom/jelly/mods/qsrow/Board;->fit:Z

    .line 84
    iput-object p5, p0, Lcom/jelly/mods/qsrow/Board;->api:Lcom/jelly/mods/qsrow/Api;

    .line 85
    iput-object p6, p0, Lcom/jelly/mods/qsrow/Board;->tiles:Lcom/jelly/mods/qsrow/Tiles;

    .line 86
    new-instance p3, Lcom/jelly/mods/qsrow/Board$Grid;

    invoke-direct {p3, p0, p1}, Lcom/jelly/mods/qsrow/Board$Grid;-><init>(Lcom/jelly/mods/qsrow/Board;Landroid/content/Context;)V

    iput-object p3, p0, Lcom/jelly/mods/qsrow/Board;->grid:Lcom/jelly/mods/qsrow/Board$Grid;

    .line 87
    new-instance p4, Lcom/jelly/mods/qsrow/Board$Pager;

    invoke-direct {p4, p0, p1}, Lcom/jelly/mods/qsrow/Board$Pager;-><init>(Lcom/jelly/mods/qsrow/Board;Landroid/content/Context;)V

    iput-object p4, p0, Lcom/jelly/mods/qsrow/Board;->pager:Lcom/jelly/mods/qsrow/Board$Pager;

    .line 88
    new-instance p5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 p6, -0x2

    invoke-direct {p5, p6, p6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p4, p3, p5}, Lcom/jelly/mods/qsrow/Board$Pager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 89
    invoke-virtual {p0, p4}, Lcom/jelly/mods/qsrow/Board;->addView(Landroid/view/View;)V

    const/4 p3, 0x2

    if-ne p2, p3, :cond_73

    .line 92
    :try_start_48
    new-instance p2, Lcom/jelly/mods/qsrow/VSlider;

    new-instance p3, Lcom/jelly/mods/qsrow/VSlider$Brightness;

    invoke-direct {p3, p1}, Lcom/jelly/mods/qsrow/VSlider$Brightness;-><init>(Landroid/content/Context;)V

    const-string p4, "ic_brightness_full"

    const-string p5, "\u05d1\u05d4\u05d9\u05e8\u05d5\u05ea"

    invoke-direct {p2, p1, p3, p4, p5}, Lcom/jelly/mods/qsrow/VSlider;-><init>(Landroid/content/Context;Lcom/jelly/mods/qsrow/VSlider$Model;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/jelly/mods/qsrow/Board;->bright:Lcom/jelly/mods/qsrow/VSlider;

    .line 93
    invoke-virtual {p0, p2}, Lcom/jelly/mods/qsrow/Board;->addView(Landroid/view/View;)V
    :try_end_5b
    .catchall {:try_start_48 .. :try_end_5b} :catchall_5c

    goto :goto_60

    :catchall_5c
    move-exception p2

    .line 95
    invoke-static {p2}, Lcom/jelly/mods/qsrow/SafeHook;->report(Ljava/lang/Throwable;)V

    .line 97
    :goto_60
    new-instance p2, Lcom/jelly/mods/qsrow/VSlider;

    new-instance p3, Lcom/jelly/mods/qsrow/VSlider$Volume;

    invoke-direct {p3, p1}, Lcom/jelly/mods/qsrow/VSlider$Volume;-><init>(Landroid/content/Context;)V

    const-string p4, "ic_volume_media"

    const-string p5, "\u05e2\u05d5\u05e6\u05de\u05ea \u05de\u05d3\u05d9\u05d4"

    invoke-direct {p2, p1, p3, p4, p5}, Lcom/jelly/mods/qsrow/VSlider;-><init>(Landroid/content/Context;Lcom/jelly/mods/qsrow/VSlider$Model;Ljava/lang/String;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/jelly/mods/qsrow/Board;->volume:Lcom/jelly/mods/qsrow/VSlider;

    .line 98
    invoke-virtual {p0, p2}, Lcom/jelly/mods/qsrow/Board;->addView(Landroid/view/View;)V

    .line 100
    :cond_73
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p1, v0, p6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p1}, Lcom/jelly/mods/qsrow/Board;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method static synthetic access$000(Lcom/jelly/mods/qsrow/Board;)Lcom/jelly/mods/qsrow/Api;
    .registers 1

    .line 23
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Board;->api:Lcom/jelly/mods/qsrow/Api;

    return-object p0
.end method

.method static synthetic access$100(Lcom/jelly/mods/qsrow/Board;)Z
    .registers 1

    .line 23
    iget-boolean p0, p0, Lcom/jelly/mods/qsrow/Board;->listening:Z

    return p0
.end method

.method static synthetic access$200(Lcom/jelly/mods/qsrow/Board;)V
    .registers 1

    .line 23
    invoke-direct {p0}, Lcom/jelly/mods/qsrow/Board;->onPageScroll()V

    return-void
.end method

.method static synthetic access$300(Lcom/jelly/mods/qsrow/Board;)I
    .registers 1

    .line 23
    iget p0, p0, Lcom/jelly/mods/qsrow/Board;->style:I

    return p0
.end method

.method static synthetic access$400(Lcom/jelly/mods/qsrow/Board;)I
    .registers 1

    .line 23
    iget p0, p0, Lcom/jelly/mods/qsrow/Board;->count:I

    return p0
.end method

.method static synthetic access$500(Lcom/jelly/mods/qsrow/Board;)I
    .registers 1

    .line 23
    invoke-direct {p0}, Lcom/jelly/mods/qsrow/Board;->gridSpace()I

    move-result p0

    return p0
.end method

.method static synthetic access$600(Lcom/jelly/mods/qsrow/Board;F)I
    .registers 2

    .line 23
    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/Board;->dp(F)I

    move-result p0

    return p0
.end method

.method static synthetic access$700(Lcom/jelly/mods/qsrow/Board;)Z
    .registers 1

    .line 23
    iget-boolean p0, p0, Lcom/jelly/mods/qsrow/Board;->fit:Z

    return p0
.end method

.method static synthetic access$800(Lcom/jelly/mods/qsrow/Board;)Lcom/jelly/mods/qsrow/Tiles;
    .registers 1

    .line 23
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Board;->tiles:Lcom/jelly/mods/qsrow/Tiles;

    return-object p0
.end method

.method static synthetic access$900(I)I
    .registers 1

    .line 23
    invoke-static {p0}, Lcom/jelly/mods/qsrow/Board;->exactly(I)I

    move-result p0

    return p0
.end method

.method private bigTileHeight()I
    .registers 5

    .line 325
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "qs_tile_height"

    const-string v3, "dimen"

    invoke-virtual {v0, v2, v3, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_1f

    .line 327
    :try_start_16
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0
    :try_end_1e
    .catchall {:try_start_16 .. :try_end_1e} :catchall_1f

    return p0

    :catchall_1f
    :cond_1f
    const/high16 v0, 0x42900000    # 72.0f

    .line 330
    invoke-direct {p0, v0}, Lcom/jelly/mods/qsrow/Board;->dp(F)I

    move-result p0

    return p0
.end method

.method private colX(IIIZ)I
    .registers 5

    if-eqz p4, :cond_b

    add-int/lit8 p4, p1, 0x1

    .line 321
    iget p0, p0, Lcom/jelly/mods/qsrow/Board;->colW:I

    mul-int/2addr p4, p0

    sub-int/2addr p2, p4

    mul-int/2addr p1, p3

    sub-int/2addr p2, p1

    goto :goto_10

    :cond_b
    iget p0, p0, Lcom/jelly/mods/qsrow/Board;->colW:I

    add-int/2addr p0, p3

    mul-int p2, p1, p0

    :goto_10
    return p2
.end method

.method private dp(F)I
    .registers 3

    .line 334
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board;->getResources()Landroid/content/res/Resources;

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

.method private static exactly(I)I
    .registers 2

    const/4 v0, 0x0

    .line 338
    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p0

    return p0
.end method

.method private gridSpace()I
    .registers 7

    .line 247
    iget v0, p0, Lcom/jelly/mods/qsrow/Board;->space:I

    if-lez v0, :cond_c1

    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board;->panel:Landroid/view/View;

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_c1

    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board;->panel:Landroid/view/View;

    if-eq v0, v1, :cond_14

    goto/16 :goto_c1

    .line 248
    :cond_14
    check-cast v1, Landroid/view/ViewGroup;

    .line 249
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v0

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v2

    add-int/2addr v0, v2

    const/4 v2, 0x0

    .line 250
    :goto_20
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_59

    .line 251
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    if-eq v3, p0, :cond_56

    .line 252
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v4

    const/16 v5, 0x8

    if-eq v4, v5, :cond_56

    iget-boolean v4, p0, Lcom/jelly/mods/qsrow/Board;->fit:Z

    if-nez v4, :cond_3d

    iget-object v4, p0, Lcom/jelly/mods/qsrow/Board;->media:Landroid/view/View;

    if-ne v3, v4, :cond_3d

    goto :goto_56

    .line 253
    :cond_3d
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    add-int/2addr v0, v4

    .line 254
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    instance-of v4, v4, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v4, :cond_56

    .line 255
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 256
    iget v4, v3, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget v3, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v4, v3

    add-int/2addr v0, v4

    :cond_56
    :goto_56
    add-int/lit8 v2, v2, 0x1

    goto :goto_20

    .line 259
    :cond_59
    iget v2, p0, Lcom/jelly/mods/qsrow/Board;->space:I

    sub-int/2addr v2, v0

    invoke-direct {p0}, Lcom/jelly/mods/qsrow/Board;->gridTop()I

    move-result v3

    sub-int/2addr v2, v3

    .line 260
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "space "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p0, Lcom/jelly/mods/qsrow/Board;->space:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " pad "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getPaddingBottom()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " used "

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " top "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/jelly/mods/qsrow/Board;->gridTop()I

    move-result v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " left "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 261
    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board;->lastWhy:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_c0

    .line 262
    iput-object v0, p0, Lcom/jelly/mods/qsrow/Board;->lastWhy:Ljava/lang/String;

    .line 263
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "QsRow: "

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->log(Ljava/lang/String;)V

    :cond_c0
    return v2

    :cond_c1
    :goto_c1
    const/4 p0, -0x1

    return p0
.end method

.method private gridTop()I
    .registers 3

    .line 271
    iget v0, p0, Lcom/jelly/mods/qsrow/Board;->heroH:I

    if-lez v0, :cond_16

    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board;->grid:Lcom/jelly/mods/qsrow/Board$Grid;

    invoke-virtual {v0}, Lcom/jelly/mods/qsrow/Board$Grid;->getChildCount()I

    move-result v0

    if-lez v0, :cond_16

    iget v0, p0, Lcom/jelly/mods/qsrow/Board;->heroH:I

    const/high16 v1, 0x41400000    # 12.0f

    invoke-direct {p0, v1}, Lcom/jelly/mods/qsrow/Board;->dp(F)I

    move-result p0

    add-int/2addr v0, p0

    goto :goto_18

    :cond_16
    iget v0, p0, Lcom/jelly/mods/qsrow/Board;->heroH:I

    :goto_18
    return v0
.end method

.method private onPageScroll()V
    .registers 4

    .line 197
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board;->indicator:Landroid/view/View;

    if-eqz v0, :cond_28

    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board;->pager:Lcom/jelly/mods/qsrow/Board$Pager;

    invoke-virtual {v0}, Lcom/jelly/mods/qsrow/Board$Pager;->getWidth()I

    move-result v0

    if-gtz v0, :cond_d

    goto :goto_28

    .line 200
    :cond_d
    :try_start_d
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board;->api:Lcom/jelly/mods/qsrow/Api;

    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board;->indicator:Landroid/view/View;

    iget-object v2, p0, Lcom/jelly/mods/qsrow/Board;->pager:Lcom/jelly/mods/qsrow/Board$Pager;

    invoke-virtual {v2}, Lcom/jelly/mods/qsrow/Board$Pager;->getScrollX()I

    move-result v2

    int-to-float v2, v2

    iget-object p0, p0, Lcom/jelly/mods/qsrow/Board;->pager:Lcom/jelly/mods/qsrow/Board$Pager;

    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board$Pager;->getWidth()I

    move-result p0

    int-to-float p0, p0

    div-float/2addr v2, p0

    invoke-virtual {v0, v1, v2}, Lcom/jelly/mods/qsrow/Api;->setLocation(Landroid/view/View;F)V
    :try_end_23
    .catchall {:try_start_d .. :try_end_23} :catchall_24

    goto :goto_28

    :catchall_24
    move-exception p0

    .line 202
    invoke-static {p0}, Lcom/jelly/mods/qsrow/SafeHook;->report(Ljava/lang/Throwable;)V

    :cond_28
    :goto_28
    return-void
.end method

.method private pick([Ljava/lang/String;)V
    .registers 9

    .line 147
    array-length v0, p1

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v0, :cond_37

    aget-object v2, p1, v1

    .line 148
    iget-object v3, p0, Lcom/jelly/mods/qsrow/Board;->items:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_c
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_34

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jelly/mods/qsrow/Board$Item;

    .line 149
    iget-object v5, p0, Lcom/jelly/mods/qsrow/Board;->hero:Ljava/util/List;

    invoke-interface {v5, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_c

    iget-object v5, p0, Lcom/jelly/mods/qsrow/Board;->api:Lcom/jelly/mods/qsrow/Api;

    iget-object v6, v4, Lcom/jelly/mods/qsrow/Board$Item;->tile:Ljava/lang/Object;

    invoke-virtual {v5, v6}, Lcom/jelly/mods/qsrow/Api;->spec(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 150
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Board;->hero:Ljava/util/List;

    invoke-interface {p0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    :cond_34
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_37
    return-void
.end method

.method private pickHero()V
    .registers 5

    .line 134
    iget v0, p0, Lcom/jelly/mods/qsrow/Board;->style:I

    const/4 v1, 0x1

    const/4 v2, 0x3

    const/4 v3, 0x2

    if-eq v0, v1, :cond_f

    if-ne v0, v3, :cond_a

    goto :goto_f

    :cond_a
    if-ne v0, v2, :cond_e

    const/4 v3, 0x4

    goto :goto_f

    :cond_e
    const/4 v3, 0x0

    :cond_f
    :goto_f
    if-nez v3, :cond_12

    return-void

    :cond_12
    if-eq v0, v2, :cond_28

    const-string v0, "internet"

    const-string v1, "wifi"

    .line 137
    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/jelly/mods/qsrow/Board;->pick([Ljava/lang/String;)V

    const-string v0, "bt"

    .line 138
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/jelly/mods/qsrow/Board;->pick([Ljava/lang/String;)V

    .line 140
    :cond_28
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board;->items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2e
    :goto_2e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_51

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jelly/mods/qsrow/Board$Item;

    .line 141
    iget-object v2, p0, Lcom/jelly/mods/qsrow/Board;->hero:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lt v2, v3, :cond_43

    goto :goto_51

    .line 142
    :cond_43
    iget-object v2, p0, Lcom/jelly/mods/qsrow/Board;->hero:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2e

    iget-object v2, p0, Lcom/jelly/mods/qsrow/Board;->hero:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2e

    :cond_51
    :goto_51
    return-void
.end method

.method private showPages()V
    .registers 3

    .line 183
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board;->pages()I

    move-result v0

    .line 184
    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board;->indicator:Landroid/view/View;

    if-eqz v1, :cond_17

    iget v1, p0, Lcom/jelly/mods/qsrow/Board;->lastPages:I

    if-ne v0, v1, :cond_d

    goto :goto_17

    .line 185
    :cond_d
    iput v0, p0, Lcom/jelly/mods/qsrow/Board;->lastPages:I

    .line 186
    new-instance v1, Lcom/jelly/mods/qsrow/Board$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, v0}, Lcom/jelly/mods/qsrow/Board$$ExternalSyntheticLambda0;-><init>(Lcom/jelly/mods/qsrow/Board;I)V

    invoke-virtual {p0, v1}, Lcom/jelly/mods/qsrow/Board;->post(Ljava/lang/Runnable;)Z

    :cond_17
    :goto_17
    return-void
.end method


# virtual methods
.method synthetic lambda$showPages$0$com-jelly-mods-qsrow-Board(I)V
    .registers 4

    .line 188
    :try_start_0
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board;->api:Lcom/jelly/mods/qsrow/Api;

    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board;->indicator:Landroid/view/View;

    invoke-virtual {v0, v1, p1}, Lcom/jelly/mods/qsrow/Api;->setNumPages(Landroid/view/View;I)V

    .line 189
    iget-object p1, p0, Lcom/jelly/mods/qsrow/Board;->api:Lcom/jelly/mods/qsrow/Api;

    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board;->indicator:Landroid/view/View;

    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board;->pager:Lcom/jelly/mods/qsrow/Board$Pager;

    invoke-virtual {v1}, Lcom/jelly/mods/qsrow/Board$Pager;->getWidth()I

    move-result v1

    if-lez v1, :cond_23

    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board;->pager:Lcom/jelly/mods/qsrow/Board$Pager;

    invoke-virtual {v1}, Lcom/jelly/mods/qsrow/Board$Pager;->getScrollX()I

    move-result v1

    int-to-float v1, v1

    iget-object p0, p0, Lcom/jelly/mods/qsrow/Board;->pager:Lcom/jelly/mods/qsrow/Board$Pager;

    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board$Pager;->getWidth()I

    move-result p0

    int-to-float p0, p0

    div-float/2addr v1, p0

    goto :goto_24

    :cond_23
    const/4 v1, 0x0

    :goto_24
    invoke-virtual {p1, v0, v1}, Lcom/jelly/mods/qsrow/Api;->setLocation(Landroid/view/View;F)V
    :try_end_27
    .catchall {:try_start_0 .. :try_end_27} :catchall_28

    goto :goto_2c

    :catchall_28
    move-exception p0

    .line 191
    invoke-static {p0}, Lcom/jelly/mods/qsrow/SafeHook;->report(Ljava/lang/Throwable;)V

    :goto_2c
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 12

    sub-int/2addr p4, p2

    const/high16 p1, 0x41000000    # 8.0f

    .line 276
    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/Board;->dp(F)I

    move-result p1

    .line 277
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board;->getLayoutDirection()I

    move-result p2

    const/4 p3, 0x0

    const/4 p5, 0x1

    if-ne p2, p5, :cond_11

    move p2, p5

    goto :goto_12

    :cond_11
    move p2, p3

    :goto_12
    move v0, p3

    .line 278
    :goto_13
    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board;->hero:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x2

    if-ge v0, v1, :cond_53

    .line 279
    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board;->hero:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jelly/mods/qsrow/Board$Item;

    iget-object v1, v1, Lcom/jelly/mods/qsrow/Board$Item;->view:Landroid/view/View;

    .line 281
    iget v3, p0, Lcom/jelly/mods/qsrow/Board;->style:I

    if-ne v3, v2, :cond_31

    .line 283
    iget v2, p0, Lcom/jelly/mods/qsrow/Board;->bigH:I

    add-int/2addr v2, p1

    mul-int/2addr v2, v0

    move v3, v2

    move v2, p3

    goto :goto_3f

    :cond_31
    const/4 v2, 0x3

    if-ne v3, v2, :cond_3d

    .line 285
    rem-int/lit8 v2, v0, 0x2

    .line 286
    div-int/lit8 v3, v0, 0x2

    iget v4, p0, Lcom/jelly/mods/qsrow/Board;->bigH:I

    add-int/2addr v4, p1

    mul-int/2addr v3, v4

    goto :goto_3f

    :cond_3d
    move v3, p3

    move v2, v0

    .line 291
    :goto_3f
    invoke-direct {p0, v2, p4, p1, p2}, Lcom/jelly/mods/qsrow/Board;->colX(IIIZ)I

    move-result v2

    .line 292
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    add-int/2addr v4, v2

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    add-int/2addr v5, v3

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/view/View;->layout(IIII)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 294
    :cond_53
    iget v0, p0, Lcom/jelly/mods/qsrow/Board;->style:I

    if-ne v0, v2, :cond_8b

    .line 295
    invoke-direct {p0, p5, p4, p1, p2}, Lcom/jelly/mods/qsrow/Board;->colX(IIIZ)I

    move-result p5

    .line 296
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board;->bright:Lcom/jelly/mods/qsrow/VSlider;

    if-eqz v0, :cond_61

    move-object v1, v0

    goto :goto_63

    :cond_61
    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board;->volume:Lcom/jelly/mods/qsrow/VSlider;

    :goto_63
    if-eqz v0, :cond_68

    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board;->volume:Lcom/jelly/mods/qsrow/VSlider;

    goto :goto_69

    :cond_68
    const/4 v0, 0x0

    :goto_69
    if-eqz v1, :cond_8b

    .line 298
    invoke-virtual {v1}, Lcom/jelly/mods/qsrow/VSlider;->getMeasuredWidth()I

    move-result v2

    if-eqz p2, :cond_75

    .line 299
    iget v3, p0, Lcom/jelly/mods/qsrow/Board;->colW:I

    add-int/2addr p5, v3

    sub-int/2addr p5, v2

    :cond_75
    add-int v3, p5, v2

    .line 300
    iget v4, p0, Lcom/jelly/mods/qsrow/Board;->heroH:I

    invoke-virtual {v1, p5, p3, v3, v4}, Lcom/jelly/mods/qsrow/VSlider;->layout(IIII)V

    if-eqz v0, :cond_8b

    if-eqz p2, :cond_83

    sub-int/2addr p5, p1

    sub-int/2addr p5, v2

    goto :goto_85

    :cond_83
    add-int p5, v3, p1

    :goto_85
    add-int/2addr v2, p5

    .line 303
    iget p1, p0, Lcom/jelly/mods/qsrow/Board;->heroH:I

    invoke-virtual {v0, p5, p3, v2, p1}, Lcom/jelly/mods/qsrow/VSlider;->layout(IIII)V

    .line 307
    :cond_8b
    invoke-direct {p0}, Lcom/jelly/mods/qsrow/Board;->gridTop()I

    move-result p1

    .line 308
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Board;->pager:Lcom/jelly/mods/qsrow/Board$Pager;

    invoke-virtual {p2}, Lcom/jelly/mods/qsrow/Board$Pager;->getMeasuredHeight()I

    move-result p5

    add-int/2addr p5, p1

    invoke-virtual {p2, p3, p1, p4, p5}, Lcom/jelly/mods/qsrow/Board$Pager;->layout(IIII)V

    .line 312
    invoke-direct {p0}, Lcom/jelly/mods/qsrow/Board;->gridSpace()I

    move-result p1

    .line 313
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Board;->grid:Lcom/jelly/mods/qsrow/Board$Grid;

    iget p2, p2, Lcom/jelly/mods/qsrow/Board$Grid;->lastSpace:I

    if-eq p1, p2, :cond_b1

    iget p2, p0, Lcom/jelly/mods/qsrow/Board;->postedSpace:I

    if-eq p1, p2, :cond_b1

    .line 314
    iput p1, p0, Lcom/jelly/mods/qsrow/Board;->postedSpace:I

    .line 315
    new-instance p1, Lcom/jelly/mods/qsrow/Board$$ExternalSyntheticLambda1;

    invoke-direct {p1, p0}, Lcom/jelly/mods/qsrow/Board$$ExternalSyntheticLambda1;-><init>(Lcom/jelly/mods/qsrow/Board;)V

    invoke-virtual {p0, p1}, Lcom/jelly/mods/qsrow/Board;->post(Ljava/lang/Runnable;)Z

    :cond_b1
    return-void
.end method

.method protected onMeasure(II)V
    .registers 10

    .line 208
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    const/high16 p2, 0x41000000    # 8.0f

    .line 209
    invoke-direct {p0, p2}, Lcom/jelly/mods/qsrow/Board;->dp(F)I

    move-result p2

    .line 210
    invoke-direct {p0}, Lcom/jelly/mods/qsrow/Board;->bigTileHeight()I

    move-result v0

    iput v0, p0, Lcom/jelly/mods/qsrow/Board;->bigH:I

    sub-int v0, p1, p2

    const/4 v1, 0x2

    .line 211
    div-int/2addr v0, v1

    iput v0, p0, Lcom/jelly/mods/qsrow/Board;->colW:I

    const/4 v0, 0x0

    .line 212
    iput v0, p0, Lcom/jelly/mods/qsrow/Board;->heroH:I

    .line 213
    iget-object v2, p0, Lcom/jelly/mods/qsrow/Board;->hero:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    .line 214
    iget-object v3, p0, Lcom/jelly/mods/qsrow/Board;->hero:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_25
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_43

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/jelly/mods/qsrow/Board$Item;

    iget-object v4, v4, Lcom/jelly/mods/qsrow/Board$Item;->view:Landroid/view/View;

    iget v5, p0, Lcom/jelly/mods/qsrow/Board;->colW:I

    invoke-static {v5}, Lcom/jelly/mods/qsrow/Board;->exactly(I)I

    move-result v5

    iget v6, p0, Lcom/jelly/mods/qsrow/Board;->bigH:I

    invoke-static {v6}, Lcom/jelly/mods/qsrow/Board;->exactly(I)I

    move-result v6

    invoke-virtual {v4, v5, v6}, Landroid/view/View;->measure(II)V

    goto :goto_25

    .line 215
    :cond_43
    iget v3, p0, Lcom/jelly/mods/qsrow/Board;->style:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_51

    if-lez v2, :cond_4d

    .line 216
    iget p2, p0, Lcom/jelly/mods/qsrow/Board;->bigH:I

    goto :goto_4e

    :cond_4d
    move p2, v0

    :goto_4e
    iput p2, p0, Lcom/jelly/mods/qsrow/Board;->heroH:I

    goto :goto_91

    :cond_51
    if-ne v3, v1, :cond_80

    .line 218
    iget v2, p0, Lcom/jelly/mods/qsrow/Board;->bigH:I

    mul-int/2addr v2, v1

    add-int/2addr v2, p2

    iput v2, p0, Lcom/jelly/mods/qsrow/Board;->heroH:I

    .line 219
    iget v2, p0, Lcom/jelly/mods/qsrow/Board;->colW:I

    sub-int/2addr v2, p2

    div-int/2addr v2, v1

    .line 220
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Board;->bright:Lcom/jelly/mods/qsrow/VSlider;

    if-eqz p2, :cond_6e

    invoke-static {v2}, Lcom/jelly/mods/qsrow/Board;->exactly(I)I

    move-result v1

    iget v3, p0, Lcom/jelly/mods/qsrow/Board;->heroH:I

    invoke-static {v3}, Lcom/jelly/mods/qsrow/Board;->exactly(I)I

    move-result v3

    invoke-virtual {p2, v1, v3}, Lcom/jelly/mods/qsrow/VSlider;->measure(II)V

    .line 221
    :cond_6e
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Board;->volume:Lcom/jelly/mods/qsrow/VSlider;

    if-eqz p2, :cond_91

    invoke-static {v2}, Lcom/jelly/mods/qsrow/Board;->exactly(I)I

    move-result v1

    iget v2, p0, Lcom/jelly/mods/qsrow/Board;->heroH:I

    invoke-static {v2}, Lcom/jelly/mods/qsrow/Board;->exactly(I)I

    move-result v2

    invoke-virtual {p2, v1, v2}, Lcom/jelly/mods/qsrow/VSlider;->measure(II)V

    goto :goto_91

    :cond_80
    const/4 v5, 0x3

    if-ne v3, v5, :cond_91

    add-int/2addr v2, v4

    .line 223
    div-int/2addr v2, v1

    if-lez v2, :cond_8e

    .line 224
    iget v1, p0, Lcom/jelly/mods/qsrow/Board;->bigH:I

    mul-int/2addr v1, v2

    sub-int/2addr v2, v4

    mul-int/2addr v2, p2

    add-int/2addr v1, v2

    goto :goto_8f

    :cond_8e
    move v1, v0

    :goto_8f
    iput v1, p0, Lcom/jelly/mods/qsrow/Board;->heroH:I

    .line 226
    :cond_91
    :goto_91
    iget-boolean p2, p0, Lcom/jelly/mods/qsrow/Board;->colored:Z

    if-nez p2, :cond_bf

    iget-object p2, p0, Lcom/jelly/mods/qsrow/Board;->items:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_bf

    .line 227
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Board;->tiles:Lcom/jelly/mods/qsrow/Tiles;

    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board;->items:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jelly/mods/qsrow/Board$Item;

    iget-object v1, v1, Lcom/jelly/mods/qsrow/Board$Item;->view:Landroid/view/View;

    invoke-virtual {p2, v1}, Lcom/jelly/mods/qsrow/Tiles;->colors(Landroid/view/View;)[I

    move-result-object p2

    if-eqz p2, :cond_bf

    .line 229
    iput-boolean v4, p0, Lcom/jelly/mods/qsrow/Board;->colored:Z

    .line 230
    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board;->bright:Lcom/jelly/mods/qsrow/VSlider;

    if-eqz v1, :cond_b8

    invoke-virtual {v1, p2}, Lcom/jelly/mods/qsrow/VSlider;->setColors([I)V

    .line 231
    :cond_b8
    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board;->volume:Lcom/jelly/mods/qsrow/VSlider;

    if-eqz v1, :cond_bf

    invoke-virtual {v1, p2}, Lcom/jelly/mods/qsrow/VSlider;->setColors([I)V

    .line 235
    :cond_bf
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Board;->pager:Lcom/jelly/mods/qsrow/Board$Pager;

    invoke-virtual {p2}, Lcom/jelly/mods/qsrow/Board$Pager;->forceLayout()V

    .line 236
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Board;->grid:Lcom/jelly/mods/qsrow/Board$Grid;

    invoke-virtual {p2}, Lcom/jelly/mods/qsrow/Board$Grid;->forceLayout()V

    .line 237
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Board;->pager:Lcom/jelly/mods/qsrow/Board$Pager;

    invoke-static {p1}, Lcom/jelly/mods/qsrow/Board;->exactly(I)I

    move-result v1

    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-virtual {p2, v1, v0}, Lcom/jelly/mods/qsrow/Board$Pager;->measure(II)V

    .line 238
    invoke-direct {p0}, Lcom/jelly/mods/qsrow/Board;->gridTop()I

    move-result p2

    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board;->pager:Lcom/jelly/mods/qsrow/Board$Pager;

    invoke-virtual {v0}, Lcom/jelly/mods/qsrow/Board$Pager;->getMeasuredHeight()I

    move-result v0

    add-int/2addr p2, v0

    invoke-virtual {p0, p1, p2}, Lcom/jelly/mods/qsrow/Board;->setMeasuredDimension(II)V

    .line 239
    invoke-direct {p0}, Lcom/jelly/mods/qsrow/Board;->showPages()V

    return-void
.end method

.method pages()I
    .registers 2

    .line 179
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Board;->grid:Lcom/jelly/mods/qsrow/Board$Grid;

    iget p0, p0, Lcom/jelly/mods/qsrow/Board$Grid;->pages:I

    const/4 v0, 0x1

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method release()V
    .registers 2

    .line 159
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Board;->items:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_6
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jelly/mods/qsrow/Board$Item;

    invoke-virtual {v0}, Lcom/jelly/mods/qsrow/Board$Item;->release()V

    goto :goto_6

    :cond_16
    return-void
.end method

.method setListening(Z)V
    .registers 5

    .line 163
    iget-boolean v0, p0, Lcom/jelly/mods/qsrow/Board;->listening:Z

    if-ne v0, p1, :cond_5

    return-void

    .line 164
    :cond_5
    iput-boolean p1, p0, Lcom/jelly/mods/qsrow/Board;->listening:Z

    .line 165
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board;->items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_d
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jelly/mods/qsrow/Board$Item;

    .line 167
    :try_start_19
    iget-object v2, p0, Lcom/jelly/mods/qsrow/Board;->api:Lcom/jelly/mods/qsrow/Api;

    iget-object v1, v1, Lcom/jelly/mods/qsrow/Board$Item;->tile:Ljava/lang/Object;

    invoke-virtual {v2, v1, p0, p1}, Lcom/jelly/mods/qsrow/Api;->setListening(Ljava/lang/Object;Ljava/lang/Object;Z)V
    :try_end_20
    .catchall {:try_start_19 .. :try_end_20} :catchall_21

    goto :goto_d

    :catchall_21
    move-exception v1

    .line 169
    invoke-static {v1}, Lcom/jelly/mods/qsrow/SafeHook;->report(Ljava/lang/Throwable;)V

    goto :goto_d

    :cond_26
    if-eqz p1, :cond_36

    .line 173
    iget-object p1, p0, Lcom/jelly/mods/qsrow/Board;->bright:Lcom/jelly/mods/qsrow/VSlider;

    if-eqz p1, :cond_2f

    invoke-virtual {p1}, Lcom/jelly/mods/qsrow/VSlider;->refresh()V

    .line 174
    :cond_2f
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Board;->volume:Lcom/jelly/mods/qsrow/VSlider;

    if-eqz p0, :cond_36

    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/VSlider;->refresh()V

    :cond_36
    return-void
.end method

.method setTiles(Ljava/lang/Object;Ljava/util/Collection;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/Collection<",
            "*>;)V"
        }
    .end annotation

    .line 105
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 106
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result p2

    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board;->items:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    if-ne p2, v1, :cond_36

    const/4 p2, 0x1

    move v3, p2

    move v1, v2

    .line 108
    :goto_15
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_33

    if-eqz v3, :cond_33

    iget-object v3, p0, Lcom/jelly/mods/qsrow/Board;->items:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/jelly/mods/qsrow/Board$Item;

    iget-object v3, v3, Lcom/jelly/mods/qsrow/Board$Item;->tile:Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-ne v3, v4, :cond_2f

    move v3, p2

    goto :goto_30

    :cond_2f
    move v3, v2

    :goto_30
    add-int/lit8 v1, v1, 0x1

    goto :goto_15

    :cond_33
    if-eqz v3, :cond_36

    return-void

    .line 111
    :cond_36
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Board;->items:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_3c
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4c

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jelly/mods/qsrow/Board$Item;

    invoke-virtual {v1}, Lcom/jelly/mods/qsrow/Board$Item;->release()V

    goto :goto_3c

    .line 112
    :cond_4c
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Board;->hero:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_52
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_64

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jelly/mods/qsrow/Board$Item;

    iget-object v1, v1, Lcom/jelly/mods/qsrow/Board$Item;->view:Landroid/view/View;

    invoke-virtual {p0, v1}, Lcom/jelly/mods/qsrow/Board;->removeView(Landroid/view/View;)V

    goto :goto_52

    .line 113
    :cond_64
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Board;->grid:Lcom/jelly/mods/qsrow/Board$Grid;

    invoke-virtual {p2}, Lcom/jelly/mods/qsrow/Board$Grid;->removeAllViews()V

    .line 114
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Board;->items:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 115
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Board;->hero:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->clear()V

    .line 116
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_77
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_91

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 118
    :try_start_81
    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board;->items:Ljava/util/List;

    new-instance v3, Lcom/jelly/mods/qsrow/Board$Item;

    invoke-direct {v3, p0, p1, v0}, Lcom/jelly/mods/qsrow/Board$Item;-><init>(Lcom/jelly/mods/qsrow/Board;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_8b
    .catchall {:try_start_81 .. :try_end_8b} :catchall_8c

    goto :goto_77

    :catchall_8c
    move-exception v0

    .line 120
    invoke-static {v0}, Lcom/jelly/mods/qsrow/SafeHook;->report(Ljava/lang/Throwable;)V

    goto :goto_77

    .line 123
    :cond_91
    invoke-direct {p0}, Lcom/jelly/mods/qsrow/Board;->pickHero()V

    .line 124
    iget-object p1, p0, Lcom/jelly/mods/qsrow/Board;->items:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_9a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_bc

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/jelly/mods/qsrow/Board$Item;

    .line 125
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board;->hero:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b4

    iget-object p2, p2, Lcom/jelly/mods/qsrow/Board$Item;->view:Landroid/view/View;

    invoke-virtual {p0, p2}, Lcom/jelly/mods/qsrow/Board;->addView(Landroid/view/View;)V

    goto :goto_9a

    .line 126
    :cond_b4
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board;->grid:Lcom/jelly/mods/qsrow/Board$Grid;

    iget-object p2, p2, Lcom/jelly/mods/qsrow/Board$Item;->view:Landroid/view/View;

    invoke-virtual {v0, p2}, Lcom/jelly/mods/qsrow/Board$Grid;->addView(Landroid/view/View;)V

    goto :goto_9a

    .line 128
    :cond_bc
    iput-boolean v2, p0, Lcom/jelly/mods/qsrow/Board;->colored:Z

    .line 129
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board;->requestLayout()V

    return-void
.end method
