.class final Lcom/jelly/mods/qsrow/QsRow;
.super Ljava/lang/Object;
.source "QsRow.java"


# static fields
.field private static final ALL:I = 0x3e8

.field private static final GAP_DP:I = 0x8


# instance fields
.field private cQqsLayout:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private cQqsPanel:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private final cl:Ljava/lang/ClassLoader;

.field private final count:I

.field private fCellWidth:Ljava/lang/reflect/Field;

.field private fColumns:Ljava/lang/reflect/Field;

.field private fCtrlView:Ljava/lang/reflect/Field;

.field private fMarginH:Ljava/lang/reflect/Field;

.field private fMaxCellHeight:Ljava/lang/reflect/Field;

.field private fMaxTiles:Ljava/lang/reflect/Field;

.field private fRecords:Ljava/lang/reflect/Field;

.field private fRows:Ljava/lang/reflect/Field;

.field private fSidePadding:Ljava/lang/reflect/Field;

.field private fTileLayout:Ljava/lang/reflect/Field;

.field private fTileView:Ljava/lang/reflect/Field;

.field private lastLogged:Ljava/lang/String;

.field private tiles:Lcom/jelly/mods/qsrow/Tiles;


# direct methods
.method constructor <init>(Ljava/lang/ClassLoader;I)V
    .registers 4

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 33
    iput-object v0, p0, Lcom/jelly/mods/qsrow/QsRow;->lastLogged:Ljava/lang/String;

    .line 36
    iput-object p1, p0, Lcom/jelly/mods/qsrow/QsRow;->cl:Ljava/lang/ClassLoader;

    const/4 p1, 0x1

    .line 37
    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/jelly/mods/qsrow/QsRow;->count:I

    return-void
.end method

.method static synthetic access$000(Lcom/jelly/mods/qsrow/QsRow;)Ljava/lang/reflect/Field;
    .registers 1

    .line 20
    iget-object p0, p0, Lcom/jelly/mods/qsrow/QsRow;->fMaxTiles:Ljava/lang/reflect/Field;

    return-object p0
.end method

.method static synthetic access$100(Lcom/jelly/mods/qsrow/QsRow;)Ljava/lang/reflect/Field;
    .registers 1

    .line 20
    iget-object p0, p0, Lcom/jelly/mods/qsrow/QsRow;->fCtrlView:Ljava/lang/reflect/Field;

    return-object p0
.end method

.method static synthetic access$200(Lcom/jelly/mods/qsrow/QsRow;Landroid/view/View;I)I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 20
    invoke-direct {p0, p1, p2}, Lcom/jelly/mods/qsrow/QsRow;->prepare(Landroid/view/View;I)I

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/jelly/mods/qsrow/QsRow;)Ljava/lang/Class;
    .registers 1

    .line 20
    iget-object p0, p0, Lcom/jelly/mods/qsrow/QsRow;->cQqsLayout:Ljava/lang/Class;

    return-object p0
.end method

.method static synthetic access$400(Lcom/jelly/mods/qsrow/QsRow;Landroid/view/View;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 20
    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/QsRow;->grid(Landroid/view/View;)V

    return-void
.end method

.method static synthetic access$500(Lcom/jelly/mods/qsrow/QsRow;Landroid/view/View;)Lcom/jelly/mods/qsrow/Row;
    .registers 2

    .line 20
    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/QsRow;->rowFor(Landroid/view/View;)Lcom/jelly/mods/qsrow/Row;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Lcom/jelly/mods/qsrow/QsRow;)Ljava/lang/Class;
    .registers 1

    .line 20
    iget-object p0, p0, Lcom/jelly/mods/qsrow/QsRow;->cQqsPanel:Ljava/lang/Class;

    return-object p0
.end method

.method static synthetic access$700(Lcom/jelly/mods/qsrow/QsRow;Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 20
    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/QsRow;->ensureWrapped(Ljava/lang/Object;)V

    return-void
.end method

.method private ensureWrapped(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 206
    iget-object v0, p0, Lcom/jelly/mods/qsrow/QsRow;->fTileLayout:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 207
    iget-object v0, p0, Lcom/jelly/mods/qsrow/QsRow;->cQqsLayout:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_f

    return-void

    .line 208
    :cond_f
    check-cast p1, Landroid/view/View;

    .line 209
    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/QsRow;->rowFor(Landroid/view/View;)Lcom/jelly/mods/qsrow/Row;

    move-result-object p0

    .line 210
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eq v0, p0, :cond_56

    .line 211
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-nez v1, :cond_20

    goto :goto_56

    .line 212
    :cond_20
    check-cast v0, Landroid/view/ViewGroup;

    .line 213
    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Row;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_33

    invoke-virtual {p0}, Lcom/jelly/mods/qsrow/Row;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 214
    :cond_33
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v1

    .line 215
    invoke-virtual {p0, p1}, Lcom/jelly/mods/qsrow/Row;->adopt(Landroid/view/View;)V

    .line 216
    invoke-virtual {v0, p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 217
    new-instance p0, Ljava/lang/StringBuilder;

    const-string p1, "QsRow: wrapped late in "

    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->log(Ljava/lang/String;)V

    :cond_56
    :goto_56
    return-void
.end method

.method private grid(Landroid/view/View;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 180
    sget-object v0, Lcom/jelly/mods/qsrow/Registry;->rows:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jelly/mods/qsrow/Row;

    .line 181
    iget-object v1, p0, Lcom/jelly/mods/qsrow/QsRow;->fRecords:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eqz v0, :cond_22

    .line 182
    iget v2, v0, Lcom/jelly/mods/qsrow/Row;->cell:I

    if-lez v2, :cond_22

    iget v2, v0, Lcom/jelly/mods/qsrow/Row;->cell:I

    iget v0, v0, Lcom/jelly/mods/qsrow/Row;->gap:I

    invoke-direct {p0, p1, v1, v2, v0}, Lcom/jelly/mods/qsrow/QsRow;->grid(Landroid/view/View;III)V

    goto :goto_31

    :cond_22
    const/high16 v0, 0x42580000    # 54.0f

    .line 183
    invoke-static {p1, v0}, Lcom/jelly/mods/qsrow/QsRow;->px(Landroid/view/View;F)I

    move-result v0

    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {p1, v2}, Lcom/jelly/mods/qsrow/QsRow;->px(Landroid/view/View;F)I

    move-result v2

    invoke-direct {p0, p1, v1, v0, v2}, Lcom/jelly/mods/qsrow/QsRow;->grid(Landroid/view/View;III)V

    :goto_31
    return-void
.end method

.method private grid(Landroid/view/View;III)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 187
    iget-object v0, p0, Lcom/jelly/mods/qsrow/QsRow;->fColumns:Ljava/lang/reflect/Field;

    const/4 v1, 0x1

    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    invoke-virtual {v0, p1, p2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 188
    iget-object p2, p0, Lcom/jelly/mods/qsrow/QsRow;->fRows:Ljava/lang/reflect/Field;

    invoke-virtual {p2, p1, v1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 189
    iget-object p2, p0, Lcom/jelly/mods/qsrow/QsRow;->fCellWidth:Ljava/lang/reflect/Field;

    invoke-virtual {p2, p1, p3}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 190
    iget-object p2, p0, Lcom/jelly/mods/qsrow/QsRow;->fMaxCellHeight:Ljava/lang/reflect/Field;

    invoke-virtual {p2, p1, p3}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 191
    iget-object p2, p0, Lcom/jelly/mods/qsrow/QsRow;->fMarginH:Ljava/lang/reflect/Field;

    invoke-virtual {p2, p1, p4}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 192
    iget-object p0, p0, Lcom/jelly/mods/qsrow/QsRow;->fSidePadding:Ljava/lang/reflect/Field;

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    return-void
.end method

.method static portraitWidth(Landroid/view/View;I)I
    .registers 4

    .line 222
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    .line 223
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    iget v0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v1, p0, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    if-gt p1, v0, :cond_17

    return p1

    .line 226
    :cond_17
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    sub-int/2addr p0, p1

    const/4 p1, 0x0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    sub-int/2addr v0, p0

    return v0
.end method

.method private prepare(Landroid/view/View;I)I
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 150
    invoke-virtual {p1}, Landroid/view/View;->getPaddingStart()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getPaddingEnd()I

    move-result v1

    add-int/2addr v0, v1

    .line 151
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    sub-int/2addr v1, v0

    const/high16 v2, 0x41000000    # 8.0f

    .line 152
    invoke-static {p1, v2}, Lcom/jelly/mods/qsrow/QsRow;->px(Landroid/view/View;F)I

    move-result v2

    const/high16 v3, 0x42580000    # 54.0f

    .line 153
    invoke-static {p1, v3}, Lcom/jelly/mods/qsrow/QsRow;->px(Landroid/view/View;F)I

    move-result v3

    const/4 v4, 0x1

    if-lez v1, :cond_3f

    .line 157
    invoke-static {p1, p2}, Lcom/jelly/mods/qsrow/QsRow;->portraitWidth(Landroid/view/View;I)I

    move-result p2

    sub-int/2addr p2, v0

    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    iget v3, p0, Lcom/jelly/mods/qsrow/QsRow;->count:I

    add-int/lit8 v5, v3, -0x1

    mul-int/2addr v5, v2

    sub-int/2addr p2, v5

    div-int/2addr p2, v3

    add-int v5, v1, v2

    add-int v6, p2, v2

    .line 158
    div-int/2addr v5, v6

    invoke-static {v3, v5}, Ljava/lang/Math;->max(II)I

    move-result v3

    if-le v3, v4, :cond_3e

    mul-int v2, v3, p2

    sub-int v2, v1, v2

    sub-int/2addr v3, v4

    .line 159
    div-int/2addr v2, v3

    :cond_3e
    move v3, p2

    :cond_3f
    int-to-float p2, v3

    const/high16 v5, 0x3f000000    # 0.5f

    mul-float/2addr p2, v5

    .line 161
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    .line 162
    iget-object v5, p0, Lcom/jelly/mods/qsrow/QsRow;->fRecords:Ljava/lang/reflect/Field;

    invoke-virtual {v5, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    .line 163
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_53
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6b

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    iget-object v8, p0, Lcom/jelly/mods/qsrow/QsRow;->tiles:Lcom/jelly/mods/qsrow/Tiles;

    iget-object v9, p0, Lcom/jelly/mods/qsrow/QsRow;->fTileView:Ljava/lang/reflect/Field;

    invoke-virtual {v9, v7}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/View;

    invoke-virtual {v8, v7, p2}, Lcom/jelly/mods/qsrow/Tiles;->circle(Landroid/view/View;I)V

    goto :goto_53

    .line 165
    :cond_6b
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result p2

    .line 166
    sget-object v5, Lcom/jelly/mods/qsrow/Registry;->rows:Ljava/util/Map;

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/jelly/mods/qsrow/Row;

    if-eqz v5, :cond_7c

    .line 167
    invoke-virtual {v5, v3, v2}, Lcom/jelly/mods/qsrow/Row;->setCells(II)V

    .line 168
    :cond_7c
    invoke-direct {p0, p1, p2, v3, v2}, Lcom/jelly/mods/qsrow/QsRow;->grid(Landroid/view/View;III)V

    .line 170
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " tiles, cell "

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, "px, gap "

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, "px, avail "

    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "px, in row: "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    if-eqz v5, :cond_a9

    move v5, v4

    goto :goto_aa

    :cond_a9
    move v5, v1

    :goto_aa
    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 171
    iget-object v5, p0, Lcom/jelly/mods/qsrow/QsRow;->lastLogged:Ljava/lang/String;

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_cc

    .line 172
    iput-object p1, p0, Lcom/jelly/mods/qsrow/QsRow;->lastLogged:Ljava/lang/String;

    .line 173
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v5, "QsRow: "

    invoke-direct {p0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->log(Ljava/lang/String;)V

    :cond_cc
    mul-int/2addr v3, p2

    add-int/2addr v0, v3

    sub-int/2addr p2, v4

    .line 175
    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    move-result p0

    mul-int/2addr p0, v2

    add-int/2addr v0, p0

    const/high16 p0, 0x40000000    # 2.0f

    .line 176
    invoke-static {v0, p0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p0

    return p0
.end method

.method private static px(Landroid/view/View;F)I
    .registers 3

    .line 230
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

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

.method private rowFor(Landroid/view/View;)Lcom/jelly/mods/qsrow/Row;
    .registers 3

    .line 196
    sget-object p0, Lcom/jelly/mods/qsrow/Registry;->rows:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/jelly/mods/qsrow/Row;

    if-nez p0, :cond_18

    .line 198
    new-instance p0, Lcom/jelly/mods/qsrow/Row;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/jelly/mods/qsrow/Row;-><init>(Landroid/content/Context;)V

    .line 199
    sget-object v0, Lcom/jelly/mods/qsrow/Registry;->rows:Ljava/util/Map;

    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_18
    return-object p0
.end method


# virtual methods
.method install()V
    .registers 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    move-object/from16 v0, p0

    .line 41
    iget-object v1, v0, Lcom/jelly/mods/qsrow/QsRow;->cl:Ljava/lang/ClassLoader;

    invoke-static {v1}, Lcom/jelly/mods/qsrow/Tiles;->get(Ljava/lang/ClassLoader;)Lcom/jelly/mods/qsrow/Tiles;

    move-result-object v1

    iput-object v1, v0, Lcom/jelly/mods/qsrow/QsRow;->tiles:Lcom/jelly/mods/qsrow/Tiles;

    .line 42
    iget-object v1, v0, Lcom/jelly/mods/qsrow/QsRow;->cl:Ljava/lang/ClassLoader;

    const-string v2, "TileLayout"

    invoke-static {v1, v2}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 43
    iget-object v2, v0, Lcom/jelly/mods/qsrow/QsRow;->cl:Ljava/lang/ClassLoader;

    const-string v3, "QSPanel"

    invoke-static {v2, v3}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 44
    iget-object v3, v0, Lcom/jelly/mods/qsrow/QsRow;->cl:Ljava/lang/ClassLoader;

    const-string v4, "QuickQSPanelController"

    invoke-static {v3, v4}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 45
    iget-object v4, v0, Lcom/jelly/mods/qsrow/QsRow;->cl:Ljava/lang/ClassLoader;

    const-string v5, "QSPanelControllerBase$TileRecord"

    invoke-static {v4, v5}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    .line 46
    iget-object v5, v0, Lcom/jelly/mods/qsrow/QsRow;->cl:Ljava/lang/ClassLoader;

    const-string v6, "QuickQSPanel$QQSSideLabelTileLayout"

    invoke-static {v5, v6}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    iput-object v5, v0, Lcom/jelly/mods/qsrow/QsRow;->cQqsLayout:Ljava/lang/Class;

    .line 47
    iget-object v5, v0, Lcom/jelly/mods/qsrow/QsRow;->cl:Ljava/lang/ClassLoader;

    const-string v6, "QuickQSPanel"

    invoke-static {v5, v6}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    iput-object v5, v0, Lcom/jelly/mods/qsrow/QsRow;->cQqsPanel:Ljava/lang/Class;

    const-string v5, "mRecords"

    .line 50
    invoke-static {v1, v5}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    iput-object v5, v0, Lcom/jelly/mods/qsrow/QsRow;->fRecords:Ljava/lang/reflect/Field;

    const-string v5, "mColumns"

    .line 51
    invoke-static {v1, v5}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    iput-object v5, v0, Lcom/jelly/mods/qsrow/QsRow;->fColumns:Ljava/lang/reflect/Field;

    const-string v5, "mRows"

    .line 52
    invoke-static {v1, v5}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    iput-object v5, v0, Lcom/jelly/mods/qsrow/QsRow;->fRows:Ljava/lang/reflect/Field;

    const-string v5, "mCellWidth"

    .line 53
    invoke-static {v1, v5}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    iput-object v5, v0, Lcom/jelly/mods/qsrow/QsRow;->fCellWidth:Ljava/lang/reflect/Field;

    const-string v5, "mMaxCellHeight"

    .line 54
    invoke-static {v1, v5}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    iput-object v5, v0, Lcom/jelly/mods/qsrow/QsRow;->fMaxCellHeight:Ljava/lang/reflect/Field;

    const-string v5, "mCellMarginHorizontal"

    .line 55
    invoke-static {v1, v5}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    iput-object v5, v0, Lcom/jelly/mods/qsrow/QsRow;->fMarginH:Ljava/lang/reflect/Field;

    const-string v5, "mSidePadding"

    .line 56
    invoke-static {v1, v5}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v5

    iput-object v5, v0, Lcom/jelly/mods/qsrow/QsRow;->fSidePadding:Ljava/lang/reflect/Field;

    const-string v5, "tileView"

    .line 57
    invoke-static {v4, v5}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, v0, Lcom/jelly/mods/qsrow/QsRow;->fTileView:Ljava/lang/reflect/Field;

    .line 58
    iget-object v4, v0, Lcom/jelly/mods/qsrow/QsRow;->cQqsPanel:Ljava/lang/Class;

    const-string v5, "mMaxTiles"

    invoke-static {v4, v5}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, v0, Lcom/jelly/mods/qsrow/QsRow;->fMaxTiles:Ljava/lang/reflect/Field;

    const-string v4, "mTileLayout"

    .line 59
    invoke-static {v2, v4}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, v0, Lcom/jelly/mods/qsrow/QsRow;->fTileLayout:Ljava/lang/reflect/Field;

    const-string v4, "mView"

    .line 60
    invoke-static {v3, v4}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, v0, Lcom/jelly/mods/qsrow/QsRow;->fCtrlView:Ljava/lang/reflect/Field;

    .line 62
    iget-object v4, v0, Lcom/jelly/mods/qsrow/QsRow;->cQqsLayout:Ljava/lang/Class;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v5, v6}, [Ljava/lang/Class;

    move-result-object v5

    const-string v6, "onMeasure"

    invoke-virtual {v4, v6, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 63
    iget-object v5, v0, Lcom/jelly/mods/qsrow/QsRow;->cQqsLayout:Ljava/lang/Class;

    const/4 v7, 0x0

    new-array v8, v7, [Ljava/lang/Class;

    const-string v9, "updateResources"

    invoke-virtual {v5, v9, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 64
    sget-object v8, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v12, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v8, v9, v10, v11, v12}, [Ljava/lang/Class;

    move-result-object v8

    const-string v9, "onLayout"

    invoke-virtual {v1, v9, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    .line 65
    sget-object v9, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    filled-new-array {v9}, [Ljava/lang/Class;

    move-result-object v9

    const-string v10, "setSquishinessFraction"

    invoke-virtual {v1, v10, v9}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v9

    .line 66
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v10}, [Ljava/lang/Class;

    move-result-object v10

    const-string v11, "setMaxColumns"

    invoke-virtual {v1, v11, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 67
    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v10, v11}, [Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v2, v6, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v6

    .line 68
    const-class v10, Landroid/view/View;

    const-class v11, Landroid/view/ViewGroup;

    sget-object v12, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-class v13, Ljava/lang/String;

    filled-new-array {v10, v11, v12, v13}, [Ljava/lang/Class;

    move-result-object v10

    const-string v11, "switchToParent"

    invoke-virtual {v2, v11, v10}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v10

    .line 69
    iget-object v12, v0, Lcom/jelly/mods/qsrow/QsRow;->cQqsPanel:Ljava/lang/Class;

    sget-object v13, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v13}, [Ljava/lang/Class;

    move-result-object v13

    const-string v14, "setMaxTiles"

    invoke-virtual {v12, v14, v13}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v12

    const-string v13, "setTiles"

    new-array v15, v7, [Ljava/lang/Class;

    .line 70
    invoke-virtual {v3, v13, v15}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v13

    .line 73
    sget-object v15, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v15}, [Ljava/lang/Class;

    move-result-object v15

    invoke-static {v3, v14, v15}, Lcom/jelly/mods/qsrow/Refl;->deopt(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)V

    .line 74
    invoke-virtual {v3}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v3

    array-length v14, v3

    :goto_121
    if-ge v7, v14, :cond_13f

    aget-object v15, v3, v7

    move-object/from16 v16, v3

    .line 75
    invoke-virtual {v15}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v3

    move/from16 v17, v14

    const-string v14, "lambda$"

    invoke-virtual {v3, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_138

    invoke-static {v15}, Lcom/jelly/mods/qsrow/Refl;->deopt(Ljava/lang/reflect/Member;)V

    :cond_138
    add-int/lit8 v7, v7, 0x1

    move-object/from16 v3, v16

    move/from16 v14, v17

    goto :goto_121

    .line 77
    :cond_13f
    const-class v3, Landroid/view/ViewGroup;

    iget-object v7, v0, Lcom/jelly/mods/qsrow/QsRow;->cl:Ljava/lang/ClassLoader;

    const-string v14, "QSPanel$QSTileLayout"

    invoke-static {v7, v14}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    filled-new-array {v3, v7}, [Ljava/lang/Class;

    move-result-object v3

    const-string v7, "switchAllContentToParent"

    invoke-static {v2, v7, v3}, Lcom/jelly/mods/qsrow/Refl;->deopt(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)V

    .line 78
    const-class v3, Landroid/view/View;

    const-class v7, Landroid/view/ViewGroup;

    sget-object v14, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v3, v7, v14}, [Ljava/lang/Class;

    move-result-object v3

    invoke-static {v2, v11, v3}, Lcom/jelly/mods/qsrow/Refl;->deopt(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)V

    .line 79
    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const-class v7, Landroid/view/ViewGroup;

    sget-object v11, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v3, v7, v11}, [Ljava/lang/Class;

    move-result-object v3

    const-string v7, "setUsingHorizontalLayout"

    invoke-static {v2, v7, v3}, Lcom/jelly/mods/qsrow/Refl;->deopt(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)V

    .line 82
    iget-object v2, v0, Lcom/jelly/mods/qsrow/QsRow;->cQqsPanel:Ljava/lang/Class;

    new-instance v3, Lcom/jelly/mods/qsrow/QsRow$1;

    invoke-direct {v3, v0}, Lcom/jelly/mods/qsrow/QsRow$1;-><init>(Lcom/jelly/mods/qsrow/QsRow;)V

    invoke-static {v2, v3}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookAllConstructors(Ljava/lang/Class;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Ljava/util/Set;

    .line 88
    new-instance v2, Lcom/jelly/mods/qsrow/QsRow$2;

    invoke-direct {v2, v0}, Lcom/jelly/mods/qsrow/QsRow$2;-><init>(Lcom/jelly/mods/qsrow/QsRow;)V

    invoke-static {v12, v2}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 94
    new-instance v2, Lcom/jelly/mods/qsrow/QsRow$3;

    invoke-direct {v2, v0}, Lcom/jelly/mods/qsrow/QsRow$3;-><init>(Lcom/jelly/mods/qsrow/QsRow;)V

    invoke-static {v13, v2}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 103
    new-instance v2, Lcom/jelly/mods/qsrow/QsRow$4;

    invoke-direct {v2, v0}, Lcom/jelly/mods/qsrow/QsRow$4;-><init>(Lcom/jelly/mods/qsrow/QsRow;)V

    invoke-static {v4, v2}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 109
    new-instance v2, Lcom/jelly/mods/qsrow/QsRow$5;

    invoke-direct {v2, v0}, Lcom/jelly/mods/qsrow/QsRow$5;-><init>(Lcom/jelly/mods/qsrow/QsRow;)V

    .line 120
    invoke-static {v5, v2}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 121
    invoke-static {v1, v2}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 122
    invoke-static {v8, v2}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 123
    invoke-static {v9, v2}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 126
    new-instance v1, Lcom/jelly/mods/qsrow/QsRow$6;

    invoke-direct {v1, v0}, Lcom/jelly/mods/qsrow/QsRow$6;-><init>(Lcom/jelly/mods/qsrow/QsRow;)V

    invoke-static {v10, v1}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 136
    new-instance v1, Lcom/jelly/mods/qsrow/QsRow$7;

    invoke-direct {v1, v0}, Lcom/jelly/mods/qsrow/QsRow$7;-><init>(Lcom/jelly/mods/qsrow/QsRow;)V

    invoke-static {v6, v1}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    return-void
.end method
