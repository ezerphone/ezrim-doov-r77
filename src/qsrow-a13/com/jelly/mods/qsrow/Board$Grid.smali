.class final Lcom/jelly/mods/qsrow/Board$Grid;
.super Landroid/view/ViewGroup;
.source "Board.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jelly/mods/qsrow/Board;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Grid"
.end annotation


# static fields
.field private static final MAX_ROWS:I = 0x8


# instance fields
.field private baseRows:I

.field private cellH:I

.field private cellW:I

.field private circleNow:I

.field private colGap:I

.field private cols:I

.field private kind:I

.field lastSpace:I

.field private offset:I

.field pages:I

.field private rowGap:I

.field rows:I

.field final synthetic this$0:Lcom/jelly/mods/qsrow/Board;

.field private tileW:I


# direct methods
.method constructor <init>(Lcom/jelly/mods/qsrow/Board;Landroid/content/Context;)V
    .registers 6

    .line 380
    iput-object p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    .line 381
    invoke-direct {p0, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    const/high16 p2, -0x80000000

    .line 376
    iput p2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->lastSpace:I

    const/4 p2, 0x1

    .line 377
    iput p2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->pages:I

    .line 382
    # getter for: Lcom/jelly/mods/qsrow/Board;->style:I
    invoke-static {p1}, Lcom/jelly/mods/qsrow/Board;->access$300(Lcom/jelly/mods/qsrow/Board;)I

    move-result v0

    const/4 v1, 0x3

    const/4 v2, 0x2

    if-eq v0, p2, :cond_28

    if-eq v0, v2, :cond_23

    if-eq v0, v1, :cond_1e

    .line 396
    iput v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->kind:I

    const/4 p2, 0x4

    .line 397
    iput p2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rows:I

    goto :goto_2c

    .line 392
    :cond_1e
    iput v1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->kind:I

    .line 393
    iput v1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rows:I

    goto :goto_2c

    .line 388
    :cond_23
    iput p2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->kind:I

    .line 389
    iput v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rows:I

    goto :goto_2c

    .line 384
    :cond_28
    iput v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->kind:I

    .line 385
    iput v1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rows:I

    .line 400
    :goto_2c
    # getter for: Lcom/jelly/mods/qsrow/Board;->count:I
    invoke-static {p1}, Lcom/jelly/mods/qsrow/Board;->access$400(Lcom/jelly/mods/qsrow/Board;)I

    move-result p1

    iput p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cols:I

    .line 401
    iget p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rows:I

    iput p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->baseRows:I

    return-void
.end method

.method private fitRows(II)I
    .registers 3

    .line 406
    iget p0, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rowGap:I

    add-int/2addr p1, p0

    add-int/2addr p2, p0

    div-int/2addr p1, p2

    const/16 p0, 0x8

    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/4 p1, 0x1

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method private measureCircles(I)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 479
    iput p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->circleNow:I

    .line 480
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board$Grid;->getChildCount()I

    move-result v0

    int-to-float v1, p1

    const v2, 0x3ee147ae    # 0.44f

    mul-float/2addr v1, v2

    .line 481
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    .line 482
    iget v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->kind:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ne v2, v3, :cond_36

    .line 483
    iput p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->tileW:I

    .line 484
    iput p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellH:I

    :goto_19
    if-ge v4, v0, :cond_82

    .line 486
    invoke-virtual {p0, v4}, Lcom/jelly/mods/qsrow/Board$Grid;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 487
    iget-object v3, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # getter for: Lcom/jelly/mods/qsrow/Board;->tiles:Lcom/jelly/mods/qsrow/Tiles;
    invoke-static {v3}, Lcom/jelly/mods/qsrow/Board;->access$800(Lcom/jelly/mods/qsrow/Board;)Lcom/jelly/mods/qsrow/Tiles;

    move-result-object v3

    invoke-virtual {v3, v2, v1}, Lcom/jelly/mods/qsrow/Tiles;->circle(Landroid/view/View;I)V

    .line 488
    # invokes: Lcom/jelly/mods/qsrow/Board;->exactly(I)I
    invoke-static {p1}, Lcom/jelly/mods/qsrow/Board;->access$900(I)I

    move-result v3

    # invokes: Lcom/jelly/mods/qsrow/Board;->exactly(I)I
    invoke-static {p1}, Lcom/jelly/mods/qsrow/Board;->access$900(I)I

    move-result v5

    invoke-virtual {v2, v3, v5}, Landroid/view/View;->measure(II)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_19

    .line 491
    :cond_36
    iget v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellW:I

    iput v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->tileW:I

    .line 492
    iput p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellH:I

    move v2, v4

    :goto_3d
    if-ge v2, v0, :cond_6a

    .line 494
    invoke-virtual {p0, v2}, Lcom/jelly/mods/qsrow/Board$Grid;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 495
    iget-object v5, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # getter for: Lcom/jelly/mods/qsrow/Board;->tiles:Lcom/jelly/mods/qsrow/Tiles;
    invoke-static {v5}, Lcom/jelly/mods/qsrow/Board;->access$800(Lcom/jelly/mods/qsrow/Board;)Lcom/jelly/mods/qsrow/Tiles;

    move-result-object v5

    const/high16 v6, 0x41300000    # 11.0f

    invoke-virtual {v5, v3, p1, v1, v6}, Lcom/jelly/mods/qsrow/Tiles;->circleLabel(Landroid/view/View;IIF)V

    .line 496
    iget v5, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellW:I

    # invokes: Lcom/jelly/mods/qsrow/Board;->exactly(I)I
    invoke-static {v5}, Lcom/jelly/mods/qsrow/Board;->access$900(I)I

    move-result v5

    invoke-static {v4, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    invoke-virtual {v3, v5, v6}, Landroid/view/View;->measure(II)V

    .line 497
    iget v5, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellH:I

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iput v3, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellH:I

    add-int/lit8 v2, v2, 0x1

    goto :goto_3d

    :cond_6a
    :goto_6a
    if-ge v4, v0, :cond_82

    .line 499
    invoke-virtual {p0, v4}, Lcom/jelly/mods/qsrow/Board$Grid;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    iget v1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellW:I

    # invokes: Lcom/jelly/mods/qsrow/Board;->exactly(I)I
    invoke-static {v1}, Lcom/jelly/mods/qsrow/Board;->access$900(I)I

    move-result v1

    iget v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellH:I

    # invokes: Lcom/jelly/mods/qsrow/Board;->exactly(I)I
    invoke-static {v2}, Lcom/jelly/mods/qsrow/Board;->access$900(I)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Landroid/view/View;->measure(II)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_6a

    :cond_82
    return-void
.end method

.method private measureSquares(I)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 504
    iput p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellH:I

    const/4 v0, 0x0

    .line 505
    :goto_3
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board$Grid;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_36

    .line 506
    invoke-virtual {p0, v0}, Lcom/jelly/mods/qsrow/Board$Grid;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 507
    iget-object v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # getter for: Lcom/jelly/mods/qsrow/Board;->tiles:Lcom/jelly/mods/qsrow/Tiles;
    invoke-static {v2}, Lcom/jelly/mods/qsrow/Board;->access$800(Lcom/jelly/mods/qsrow/Board;)Lcom/jelly/mods/qsrow/Tiles;

    move-result-object v2

    iget-object v3, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    const/high16 v4, 0x41c00000    # 24.0f

    # invokes: Lcom/jelly/mods/qsrow/Board;->dp(F)I
    invoke-static {v3, v4}, Lcom/jelly/mods/qsrow/Board;->access$600(Lcom/jelly/mods/qsrow/Board;F)I

    move-result v3

    iget-object v4, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    const/high16 v5, 0x41900000    # 18.0f

    # invokes: Lcom/jelly/mods/qsrow/Board;->dp(F)I
    invoke-static {v4, v5}, Lcom/jelly/mods/qsrow/Board;->access$600(Lcom/jelly/mods/qsrow/Board;F)I

    move-result v4

    invoke-virtual {v2, v1, v3, v4}, Lcom/jelly/mods/qsrow/Tiles;->square(Landroid/view/View;II)V

    .line 508
    iget v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->tileW:I

    # invokes: Lcom/jelly/mods/qsrow/Board;->exactly(I)I
    invoke-static {v2}, Lcom/jelly/mods/qsrow/Board;->access$900(I)I

    move-result v2

    # invokes: Lcom/jelly/mods/qsrow/Board;->exactly(I)I
    invoke-static {p1}, Lcom/jelly/mods/qsrow/Board;->access$900(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/view/View;->measure(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_36
    return-void
.end method

.method private oneMoreRow(II)I
    .registers 7

    const/4 v0, 0x0

    if-lez p1, :cond_30

    .line 470
    iget v1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellH:I

    if-gtz v1, :cond_8

    goto :goto_30

    .line 471
    :cond_8
    invoke-direct {p0, p1, v1}, Lcom/jelly/mods/qsrow/Board$Grid;->fitRows(II)I

    move-result v1

    const/16 v2, 0x8

    if-ge v1, v2, :cond_30

    .line 472
    iget v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cols:I

    mul-int/2addr v2, v1

    if-gt p2, v2, :cond_16

    goto :goto_30

    .line 473
    :cond_16
    iget p2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellH:I

    mul-int v2, v1, p2

    add-int/lit8 v3, v1, -0x1

    iget p0, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rowGap:I

    mul-int/2addr v3, p0

    add-int/2addr v2, v3

    sub-int v2, p1, v2

    add-int/2addr p2, p0

    mul-int/lit8 p2, p2, 0x6

    .line 474
    div-int/lit8 p2, p2, 0xa

    if-ge v2, p2, :cond_2a

    return v0

    :cond_2a
    mul-int/2addr p0, v1

    sub-int/2addr p1, p0

    add-int/lit8 v1, v1, 0x1

    .line 475
    div-int/2addr p1, v1

    return p1

    :cond_30
    :goto_30
    return v0
.end method


# virtual methods
.method protected onLayout(ZIIII)V
    .registers 14

    .line 514
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board$Grid;->getChildCount()I

    move-result p1

    if-nez p1, :cond_7

    return-void

    :cond_7
    sub-int/2addr p4, p2

    .line 516
    iget p2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->pages:I

    div-int/2addr p4, p2

    .line 517
    iget p2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cols:I

    iget p3, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rows:I

    mul-int/2addr p2, p3

    .line 518
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board$Grid;->getLayoutDirection()I

    move-result p3

    const/4 p5, 0x0

    const/4 v0, 0x1

    if-ne p3, v0, :cond_1a

    move p3, v0

    goto :goto_1b

    :cond_1a
    move p3, p5

    :goto_1b
    move v1, p5

    :goto_1c
    if-ge v1, p1, :cond_6c

    .line 520
    invoke-virtual {p0, v1}, Lcom/jelly/mods/qsrow/Board$Grid;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 521
    div-int v3, v1, p2

    rem-int v4, v1, p2

    iget v5, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cols:I

    div-int v6, v4, v5

    rem-int/2addr v4, v5

    if-eqz p3, :cond_32

    .line 522
    iget v7, p0, Lcom/jelly/mods/qsrow/Board$Grid;->pages:I

    sub-int/2addr v7, v0

    sub-int v3, v7, v3

    :cond_32
    mul-int/2addr v3, p4

    if-eqz p3, :cond_39

    add-int/lit8 v5, v5, -0x1

    sub-int v4, v5, v4

    .line 524
    :cond_39
    iget v5, p0, Lcom/jelly/mods/qsrow/Board$Grid;->offset:I

    add-int/2addr v3, v5

    iget v5, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellW:I

    mul-int/2addr v4, v5

    add-int/2addr v3, v4

    iget v4, p0, Lcom/jelly/mods/qsrow/Board$Grid;->kind:I

    const/4 v7, 0x3

    if-ne v4, v7, :cond_47

    move v5, p5

    goto :goto_4c

    :cond_47
    iget v4, p0, Lcom/jelly/mods/qsrow/Board$Grid;->tileW:I

    sub-int/2addr v5, v4

    div-int/lit8 v5, v5, 0x2

    :goto_4c
    add-int/2addr v3, v5

    .line 525
    iget v4, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellH:I

    iget v5, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rowGap:I

    add-int/2addr v4, v5

    mul-int/2addr v6, v4

    .line 526
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    add-int/2addr v4, v3

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    add-int/2addr v5, v6

    invoke-virtual {v2, v3, v6, v4, v5}, Landroid/view/View;->layout(IIII)V

    .line 527
    iget-object v3, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # getter for: Lcom/jelly/mods/qsrow/Board;->tiles:Lcom/jelly/mods/qsrow/Tiles;
    invoke-static {v3}, Lcom/jelly/mods/qsrow/Board;->access$800(Lcom/jelly/mods/qsrow/Board;)Lcom/jelly/mods/qsrow/Tiles;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/jelly/mods/qsrow/Tiles;->insetBackground(Landroid/view/View;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1c

    :cond_6c
    return-void
.end method

.method protected onMeasure(II)V
    .registers 12

    .line 416
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    .line 417
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Board$Grid;->getChildCount()I

    move-result v0

    .line 418
    iget-object v1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # invokes: Lcom/jelly/mods/qsrow/Board;->gridSpace()I
    invoke-static {v1}, Lcom/jelly/mods/qsrow/Board;->access$500(Lcom/jelly/mods/qsrow/Board;)I

    move-result v1

    .line 419
    iput v1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->lastSpace:I

    .line 422
    invoke-static {p0, p1}, Lcom/jelly/mods/qsrow/QsRow;->portraitWidth(Landroid/view/View;I)I

    move-result p1

    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 423
    iget-object v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # getter for: Lcom/jelly/mods/qsrow/Board;->count:I
    invoke-static {v2}, Lcom/jelly/mods/qsrow/Board;->access$400(Lcom/jelly/mods/qsrow/Board;)I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    iget-object v4, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    const/high16 v5, 0x41000000    # 8.0f

    # invokes: Lcom/jelly/mods/qsrow/Board;->dp(F)I
    invoke-static {v4, v5}, Lcom/jelly/mods/qsrow/Board;->access$600(Lcom/jelly/mods/qsrow/Board;F)I

    move-result v4

    mul-int/2addr v2, v4

    sub-int v2, p1, v2

    iget-object v4, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # getter for: Lcom/jelly/mods/qsrow/Board;->count:I
    invoke-static {v4}, Lcom/jelly/mods/qsrow/Board;->access$400(Lcom/jelly/mods/qsrow/Board;)I

    move-result v4

    div-int/2addr v2, v4

    .line 424
    iget-object v4, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # getter for: Lcom/jelly/mods/qsrow/Board;->count:I
    invoke-static {v4}, Lcom/jelly/mods/qsrow/Board;->access$400(Lcom/jelly/mods/qsrow/Board;)I

    move-result v4

    iget-object v6, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # getter for: Lcom/jelly/mods/qsrow/Board;->count:I
    invoke-static {v6}, Lcom/jelly/mods/qsrow/Board;->access$400(Lcom/jelly/mods/qsrow/Board;)I

    move-result v6

    div-int/2addr p1, v6

    invoke-static {v3, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    div-int p1, p2, p1

    invoke-static {v4, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cols:I

    const/4 v4, 0x0

    .line 426
    :try_start_4c
    iget v6, p0, Lcom/jelly/mods/qsrow/Board$Grid;->kind:I

    const/4 v7, 0x3

    const/4 v8, 0x2

    if-ne v6, v7, :cond_be

    .line 427
    iget-object p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # invokes: Lcom/jelly/mods/qsrow/Board;->dp(F)I
    invoke-static {p1, v5}, Lcom/jelly/mods/qsrow/Board;->access$600(Lcom/jelly/mods/qsrow/Board;F)I

    move-result p1

    iput p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->colGap:I

    .line 428
    iget-object p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # invokes: Lcom/jelly/mods/qsrow/Board;->dp(F)I
    invoke-static {p1, v5}, Lcom/jelly/mods/qsrow/Board;->access$600(Lcom/jelly/mods/qsrow/Board;F)I

    move-result p1

    iput p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rowGap:I

    .line 429
    iget p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cols:I

    add-int/lit8 v2, p1, -0x1

    iget v5, p0, Lcom/jelly/mods/qsrow/Board$Grid;->colGap:I

    mul-int/2addr v2, v5

    sub-int v2, p2, v2

    div-int/2addr v2, p1

    iput v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->tileW:I

    add-int/2addr v2, v5

    .line 430
    iput v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellW:I

    .line 431
    iput v4, p0, Lcom/jelly/mods/qsrow/Board$Grid;->offset:I

    .line 432
    iget-object p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    const/high16 v2, 0x42600000    # 56.0f

    # invokes: Lcom/jelly/mods/qsrow/Board;->dp(F)I
    invoke-static {p1, v2}, Lcom/jelly/mods/qsrow/Board;->access$600(Lcom/jelly/mods/qsrow/Board;F)I

    move-result p1

    .line 433
    iget-object v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # getter for: Lcom/jelly/mods/qsrow/Board;->fit:Z
    invoke-static {v2}, Lcom/jelly/mods/qsrow/Board;->access$700(Lcom/jelly/mods/qsrow/Board;)Z

    move-result v2

    const/high16 v5, 0x42300000    # 44.0f

    if-eqz v2, :cond_a0

    if-lez v1, :cond_a0

    invoke-direct {p0, v1, p1}, Lcom/jelly/mods/qsrow/Board$Grid;->fitRows(II)I

    move-result v2

    if-ge v2, v8, :cond_a0

    iget-object v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # invokes: Lcom/jelly/mods/qsrow/Board;->dp(F)I
    invoke-static {v2, v5}, Lcom/jelly/mods/qsrow/Board;->access$600(Lcom/jelly/mods/qsrow/Board;F)I

    move-result v2

    iget v6, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rowGap:I

    sub-int v6, v1, v6

    div-int/2addr v6, v8

    invoke-static {p1, v6}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 434
    :cond_a0
    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/Board$Grid;->measureSquares(I)V

    .line 435
    iget-object p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # getter for: Lcom/jelly/mods/qsrow/Board;->fit:Z
    invoke-static {p1}, Lcom/jelly/mods/qsrow/Board;->access$700(Lcom/jelly/mods/qsrow/Board;)Z

    move-result p1

    if-eqz p1, :cond_b0

    invoke-direct {p0, v1, v0}, Lcom/jelly/mods/qsrow/Board$Grid;->oneMoreRow(II)I

    move-result p1

    goto :goto_b1

    :cond_b0
    move p1, v4

    .line 436
    :goto_b1
    iget-object v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # invokes: Lcom/jelly/mods/qsrow/Board;->dp(F)I
    invoke-static {v2, v5}, Lcom/jelly/mods/qsrow/Board;->access$600(Lcom/jelly/mods/qsrow/Board;F)I

    move-result v2

    if-lt p1, v2, :cond_147

    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/Board$Grid;->measureSquares(I)V

    goto/16 :goto_147

    .line 438
    :cond_be
    div-int v7, p2, p1

    iput v7, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellW:I

    mul-int/2addr v7, p1

    sub-int p1, p2, v7

    .line 439
    div-int/2addr p1, v8

    iput p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->offset:I

    .line 440
    iget-object p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    if-ne v6, v3, :cond_ce

    move v6, v5

    goto :goto_d0

    :cond_ce
    const/high16 v6, 0x41400000    # 12.0f

    :goto_d0
    # invokes: Lcom/jelly/mods/qsrow/Board;->dp(F)I
    invoke-static {p1, v6}, Lcom/jelly/mods/qsrow/Board;->access$600(Lcom/jelly/mods/qsrow/Board;F)I

    move-result p1

    iput p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rowGap:I

    .line 441
    iget p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellW:I

    iget-object v6, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    iget v7, p0, Lcom/jelly/mods/qsrow/Board$Grid;->kind:I

    if-ne v7, v3, :cond_df

    goto :goto_e1

    :cond_df
    const/high16 v5, 0x40c00000    # 6.0f

    :goto_e1
    # invokes: Lcom/jelly/mods/qsrow/Board;->dp(F)I
    invoke-static {v6, v5}, Lcom/jelly/mods/qsrow/Board;->access$600(Lcom/jelly/mods/qsrow/Board;F)I

    move-result v5

    sub-int/2addr p1, v5

    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 442
    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/Board$Grid;->measureCircles(I)V

    .line 443
    iget-object v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # getter for: Lcom/jelly/mods/qsrow/Board;->fit:Z
    invoke-static {v2}, Lcom/jelly/mods/qsrow/Board;->access$700(Lcom/jelly/mods/qsrow/Board;)Z

    move-result v2

    if-eqz v2, :cond_11e

    if-lez v1, :cond_11e

    iget v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellH:I

    invoke-direct {p0, v1, v2}, Lcom/jelly/mods/qsrow/Board$Grid;->fitRows(II)I

    move-result v2

    if-ge v2, v8, :cond_11e

    .line 444
    iget v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellH:I

    sub-int/2addr v2, p1

    int-to-float v5, p1

    const v6, 0x3f333333    # 0.7f

    mul-float/2addr v5, v6

    .line 445
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    iget v6, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rowGap:I

    sub-int v6, v1, v6

    div-int/2addr v6, v8

    sub-int/2addr v6, v2

    invoke-static {p1, v6}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v5, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    if-ge v2, p1, :cond_11e

    .line 446
    invoke-direct {p0, v2}, Lcom/jelly/mods/qsrow/Board$Grid;->measureCircles(I)V

    .line 448
    :cond_11e
    iget-object v2, p0, Lcom/jelly/mods/qsrow/Board$Grid;->this$0:Lcom/jelly/mods/qsrow/Board;

    # getter for: Lcom/jelly/mods/qsrow/Board;->fit:Z
    invoke-static {v2}, Lcom/jelly/mods/qsrow/Board;->access$700(Lcom/jelly/mods/qsrow/Board;)Z

    move-result v2

    if-eqz v2, :cond_12b

    invoke-direct {p0, v1, v0}, Lcom/jelly/mods/qsrow/Board$Grid;->oneMoreRow(II)I

    move-result v2

    goto :goto_12c

    :cond_12b
    move v2, v4

    :goto_12c
    if-lez v2, :cond_147

    .line 450
    iget v5, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellH:I

    iget v6, p0, Lcom/jelly/mods/qsrow/Board$Grid;->circleNow:I

    sub-int/2addr v5, v6

    sub-int/2addr v2, v5

    int-to-float p1, p1

    const v5, 0x3f4ccccd    # 0.8f

    mul-float/2addr p1, v5

    .line 451
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    if-lt v2, p1, :cond_147

    invoke-direct {p0, v2}, Lcom/jelly/mods/qsrow/Board$Grid;->measureCircles(I)V
    :try_end_142
    .catchall {:try_start_4c .. :try_end_142} :catchall_143

    goto :goto_147

    :catchall_143
    move-exception p1

    .line 455
    invoke-static {p1}, Lcom/jelly/mods/qsrow/SafeHook;->report(Ljava/lang/Throwable;)V

    :cond_147
    :goto_147
    if-lez v1, :cond_152

    .line 457
    iget p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellH:I

    if-lez p1, :cond_152

    invoke-direct {p0, v1, p1}, Lcom/jelly/mods/qsrow/Board$Grid;->fitRows(II)I

    move-result p1

    goto :goto_154

    :cond_152
    iget p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->baseRows:I

    :goto_154
    iput p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rows:I

    .line 458
    iget v1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cols:I

    mul-int/2addr v1, p1

    add-int p1, v0, v1

    sub-int/2addr p1, v3

    .line 459
    div-int/2addr p1, v1

    invoke-static {v3, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->pages:I

    if-le p1, v3, :cond_168

    .line 460
    iget p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rows:I

    goto :goto_171

    :cond_168
    iget p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cols:I

    add-int/2addr v0, p1

    sub-int/2addr v0, v3

    div-int/2addr v0, p1

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    :goto_171
    if-lez p1, :cond_17c

    .line 461
    iget v0, p0, Lcom/jelly/mods/qsrow/Board$Grid;->cellH:I

    mul-int/2addr v0, p1

    sub-int/2addr p1, v3

    iget v1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->rowGap:I

    mul-int/2addr p1, v1

    add-int v4, v0, p1

    .line 462
    :cond_17c
    iget p1, p0, Lcom/jelly/mods/qsrow/Board$Grid;->pages:I

    mul-int/2addr p1, p2

    invoke-virtual {p0, p1, v4}, Lcom/jelly/mods/qsrow/Board$Grid;->setMeasuredDimension(II)V

    return-void
.end method
