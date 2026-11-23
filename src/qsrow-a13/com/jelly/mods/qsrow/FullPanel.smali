.class final Lcom/jelly/mods/qsrow/FullPanel;
.super Ljava/lang/Object;
.source "FullPanel.java"


# instance fields
.field private api:Lcom/jelly/mods/qsrow/Api;

.field private cQqsPanel:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private cQsCtrl:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private cQsPanel:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private final cl:Ljava/lang/ClassLoader;

.field private final count:I

.field private fBrightness:Ljava/lang/reflect/Field;

.field private fCtrlView:Ljava/lang/reflect/Field;

.field private fFooter:Ljava/lang/reflect/Field;

.field private fHost:Ljava/lang/reflect/Field;

.field private fIndicator:Ljava/lang/reflect/Field;

.field private fMedia:Ljava/lang/reflect/Field;

.field private fTileLayout:Ljava/lang/reflect/Field;

.field private final fit:Z

.field private final style:I

.field private tiles:Lcom/jelly/mods/qsrow/Tiles;


# direct methods
.method constructor <init>(Ljava/lang/ClassLoader;IIZ)V
    .registers 5

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/jelly/mods/qsrow/FullPanel;->cl:Ljava/lang/ClassLoader;

    .line 29
    iput p2, p0, Lcom/jelly/mods/qsrow/FullPanel;->style:I

    .line 30
    iput p3, p0, Lcom/jelly/mods/qsrow/FullPanel;->count:I

    .line 31
    iput-boolean p4, p0, Lcom/jelly/mods/qsrow/FullPanel;->fit:Z

    return-void
.end method

.method static synthetic access$000(Lcom/jelly/mods/qsrow/FullPanel;)Ljava/lang/Class;
    .registers 1

    .line 17
    iget-object p0, p0, Lcom/jelly/mods/qsrow/FullPanel;->cQsCtrl:Ljava/lang/Class;

    return-object p0
.end method

.method static synthetic access$100(Lcom/jelly/mods/qsrow/FullPanel;)Ljava/lang/reflect/Field;
    .registers 1

    .line 17
    iget-object p0, p0, Lcom/jelly/mods/qsrow/FullPanel;->fCtrlView:Ljava/lang/reflect/Field;

    return-object p0
.end method

.method static synthetic access$200(Lcom/jelly/mods/qsrow/FullPanel;)Ljava/lang/reflect/Field;
    .registers 1

    .line 17
    iget-object p0, p0, Lcom/jelly/mods/qsrow/FullPanel;->fHost:Ljava/lang/reflect/Field;

    return-object p0
.end method

.method static synthetic access$300(Lcom/jelly/mods/qsrow/FullPanel;Landroid/view/View;)Lcom/jelly/mods/qsrow/Board;
    .registers 2

    .line 17
    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/FullPanel;->boardFor(Landroid/view/View;)Lcom/jelly/mods/qsrow/Board;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/jelly/mods/qsrow/FullPanel;)Lcom/jelly/mods/qsrow/Tiles;
    .registers 1

    .line 17
    iget-object p0, p0, Lcom/jelly/mods/qsrow/FullPanel;->tiles:Lcom/jelly/mods/qsrow/Tiles;

    return-object p0
.end method

.method static synthetic access$500(Lcom/jelly/mods/qsrow/FullPanel;)Ljava/lang/Class;
    .registers 1

    .line 17
    iget-object p0, p0, Lcom/jelly/mods/qsrow/FullPanel;->cQsPanel:Ljava/lang/Class;

    return-object p0
.end method

.method static synthetic access$600(Lcom/jelly/mods/qsrow/FullPanel;)Ljava/lang/Class;
    .registers 1

    .line 17
    iget-object p0, p0, Lcom/jelly/mods/qsrow/FullPanel;->cQqsPanel:Ljava/lang/Class;

    return-object p0
.end method

.method static synthetic access$700(Lcom/jelly/mods/qsrow/FullPanel;Landroid/view/ViewGroup;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 17
    invoke-direct {p0, p1, p2}, Lcom/jelly/mods/qsrow/FullPanel;->place(Landroid/view/ViewGroup;I)V

    return-void
.end method

.method private boardFor(Landroid/view/View;)Lcom/jelly/mods/qsrow/Board;
    .registers 11

    .line 125
    sget-object v0, Lcom/jelly/mods/qsrow/Registry;->boards:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jelly/mods/qsrow/Board;

    if-nez v0, :cond_58

    .line 129
    sget-object v0, Lcom/jelly/mods/qsrow/Registry;->boards:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_14
    :goto_14
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3f

    .line 130
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 131
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_14

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v2

    if-nez v2, :cond_14

    .line 132
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/jelly/mods/qsrow/Board;

    invoke-virtual {v1}, Lcom/jelly/mods/qsrow/Board;->release()V

    .line 133
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_14

    .line 136
    :cond_3f
    new-instance v0, Lcom/jelly/mods/qsrow/Board;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget v4, p0, Lcom/jelly/mods/qsrow/FullPanel;->style:I

    iget v5, p0, Lcom/jelly/mods/qsrow/FullPanel;->count:I

    iget-boolean v6, p0, Lcom/jelly/mods/qsrow/FullPanel;->fit:Z

    iget-object v7, p0, Lcom/jelly/mods/qsrow/FullPanel;->api:Lcom/jelly/mods/qsrow/Api;

    iget-object v8, p0, Lcom/jelly/mods/qsrow/FullPanel;->tiles:Lcom/jelly/mods/qsrow/Tiles;

    move-object v2, v0

    invoke-direct/range {v2 .. v8}, Lcom/jelly/mods/qsrow/Board;-><init>(Landroid/content/Context;IIZLcom/jelly/mods/qsrow/Api;Lcom/jelly/mods/qsrow/Tiles;)V

    .line 137
    sget-object p0, Lcom/jelly/mods/qsrow/Registry;->boards:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_58
    return-object v0
.end method

.method private place(Landroid/view/ViewGroup;I)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 144
    iget-object v0, p0, Lcom/jelly/mods/qsrow/FullPanel;->fTileLayout:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-nez v0, :cond_b

    return-void

    .line 146
    :cond_b
    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/FullPanel;->boardFor(Landroid/view/View;)Lcom/jelly/mods/qsrow/Board;

    move-result-object v1

    .line 148
    iput-object p1, v1, Lcom/jelly/mods/qsrow/Board;->panel:Landroid/view/View;

    .line 149
    iget-object v2, p0, Lcom/jelly/mods/qsrow/FullPanel;->fMedia:Ljava/lang/reflect/Field;

    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    iput-object v2, v1, Lcom/jelly/mods/qsrow/Board;->media:Landroid/view/View;

    .line 150
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    if-lez p2, :cond_3d

    .line 151
    iget v2, v1, Lcom/jelly/mods/qsrow/Board;->space:I

    if-eq p2, v2, :cond_3d

    .line 152
    iput p2, v1, Lcom/jelly/mods/qsrow/Board;->space:I

    .line 153
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "QsRow: panel space "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "px"

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->log(Ljava/lang/String;)V

    .line 155
    :cond_3d
    sget-object p2, Lcom/jelly/mods/qsrow/Registry;->byLayout:Ljava/util/Map;

    invoke-interface {p2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    iget-object p2, p0, Lcom/jelly/mods/qsrow/FullPanel;->fIndicator:Ljava/lang/reflect/Field;

    invoke-virtual {p2, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 157
    instance-of v2, p2, Landroid/view/View;

    if-eqz v2, :cond_59

    iget-object v2, v1, Lcom/jelly/mods/qsrow/Board;->indicator:Landroid/view/View;

    if-eq v2, p2, :cond_59

    .line 158
    check-cast p2, Landroid/view/View;

    iput-object p2, v1, Lcom/jelly/mods/qsrow/Board;->indicator:Landroid/view/View;

    .line 159
    sget-object v2, Lcom/jelly/mods/qsrow/Registry;->byIndicator:Ljava/util/Map;

    invoke-interface {v2, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 161
    :cond_59
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    .line 162
    instance-of v2, p2, Landroid/view/ViewGroup;

    if-nez v2, :cond_62

    return-void

    .line 163
    :cond_62
    check-cast p2, Landroid/view/ViewGroup;

    .line 164
    invoke-virtual {v1}, Lcom/jelly/mods/qsrow/Board;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    const/4 v3, 0x1

    if-ne v2, p2, :cond_76

    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v4

    sub-int/2addr v4, v3

    if-eq v2, v4, :cond_a1

    .line 165
    :cond_76
    invoke-virtual {v1}, Lcom/jelly/mods/qsrow/Board;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_87

    invoke-virtual {v1}, Lcom/jelly/mods/qsrow/Board;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 166
    :cond_87
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    invoke-virtual {p2, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 167
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v2, "QsRow: board placed, style "

    invoke-direct {p2, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/jelly/mods/qsrow/FullPanel;->style:I

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->log(Ljava/lang/String;)V

    .line 169
    :cond_a1
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result p2

    const/16 v2, 0x8

    if-eq p2, v2, :cond_ac

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 171
    :cond_ac
    invoke-virtual {v1}, Lcom/jelly/mods/qsrow/Board;->forceLayout()V

    .line 173
    iget-object p2, p0, Lcom/jelly/mods/qsrow/FullPanel;->fBrightness:Ljava/lang/reflect/Field;

    invoke-virtual {p2, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    if-nez p2, :cond_ba

    return-void

    .line 175
    :cond_ba
    iget v0, p0, Lcom/jelly/mods/qsrow/FullPanel;->style:I

    const/4 v4, 0x2

    if-ne v0, v4, :cond_c9

    .line 177
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p0

    if-eq p0, v2, :cond_10e

    invoke-virtual {p2, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_10e

    :cond_c9
    if-ne v0, v3, :cond_10e

    .line 178
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-ne v0, p1, :cond_10e

    .line 180
    iget-object p0, p0, Lcom/jelly/mods/qsrow/FullPanel;->fFooter:Ljava/lang/reflect/Field;

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    .line 181
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v0

    if-eqz p0, :cond_ed

    .line 182
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-ne v2, p1, :cond_ed

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 183
    :cond_ed
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v2

    if-ge v2, v0, :cond_10e

    .line 184
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 185
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result v0

    if-eqz p0, :cond_10a

    .line 186
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-ne v1, p1, :cond_10a

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result v0

    :cond_10a
    add-int/2addr v0, v3

    .line 187
    invoke-virtual {p1, p2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    :cond_10e
    :goto_10e
    return-void
.end method


# virtual methods
.method install()V
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 35
    new-instance v0, Lcom/jelly/mods/qsrow/Api;

    iget-object v1, p0, Lcom/jelly/mods/qsrow/FullPanel;->cl:Ljava/lang/ClassLoader;

    invoke-direct {v0, v1}, Lcom/jelly/mods/qsrow/Api;-><init>(Ljava/lang/ClassLoader;)V

    iput-object v0, p0, Lcom/jelly/mods/qsrow/FullPanel;->api:Lcom/jelly/mods/qsrow/Api;

    .line 36
    iget-object v0, p0, Lcom/jelly/mods/qsrow/FullPanel;->cl:Ljava/lang/ClassLoader;

    invoke-static {v0}, Lcom/jelly/mods/qsrow/Tiles;->get(Ljava/lang/ClassLoader;)Lcom/jelly/mods/qsrow/Tiles;

    move-result-object v0

    iput-object v0, p0, Lcom/jelly/mods/qsrow/FullPanel;->tiles:Lcom/jelly/mods/qsrow/Tiles;

    .line 37
    iget-object v0, p0, Lcom/jelly/mods/qsrow/FullPanel;->cl:Ljava/lang/ClassLoader;

    const-string v1, "QSPanel"

    invoke-static {v0, v1}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/jelly/mods/qsrow/FullPanel;->cQsPanel:Ljava/lang/Class;

    .line 38
    iget-object v0, p0, Lcom/jelly/mods/qsrow/FullPanel;->cl:Ljava/lang/ClassLoader;

    const-string v1, "QuickQSPanel"

    invoke-static {v0, v1}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/jelly/mods/qsrow/FullPanel;->cQqsPanel:Ljava/lang/Class;

    .line 39
    iget-object v0, p0, Lcom/jelly/mods/qsrow/FullPanel;->cl:Ljava/lang/ClassLoader;

    const-string v1, "QSPanelController"

    invoke-static {v0, v1}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/jelly/mods/qsrow/FullPanel;->cQsCtrl:Ljava/lang/Class;

    .line 40
    iget-object v0, p0, Lcom/jelly/mods/qsrow/FullPanel;->cl:Ljava/lang/ClassLoader;

    const-string v1, "QSPanelControllerBase"

    invoke-static {v0, v1}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 41
    iget-object v1, p0, Lcom/jelly/mods/qsrow/FullPanel;->cl:Ljava/lang/ClassLoader;

    const-string v2, "PagedTileLayout"

    invoke-static {v1, v2}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 42
    iget-object v2, p0, Lcom/jelly/mods/qsrow/FullPanel;->cl:Ljava/lang/ClassLoader;

    const-string v3, "PageIndicator"

    invoke-static {v2, v3}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 43
    iget-object v3, p0, Lcom/jelly/mods/qsrow/FullPanel;->tiles:Lcom/jelly/mods/qsrow/Tiles;

    invoke-virtual {v3}, Lcom/jelly/mods/qsrow/Tiles;->tileClass()Ljava/lang/Class;

    move-result-object v3

    .line 46
    iget-object v4, p0, Lcom/jelly/mods/qsrow/FullPanel;->cQsPanel:Ljava/lang/Class;

    const-string v5, "mTileLayout"

    invoke-static {v4, v5}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/jelly/mods/qsrow/FullPanel;->fTileLayout:Ljava/lang/reflect/Field;

    .line 47
    iget-object v4, p0, Lcom/jelly/mods/qsrow/FullPanel;->cQsPanel:Ljava/lang/Class;

    const-string v5, "mBrightnessView"

    invoke-static {v4, v5}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/jelly/mods/qsrow/FullPanel;->fBrightness:Ljava/lang/reflect/Field;

    .line 48
    iget-object v4, p0, Lcom/jelly/mods/qsrow/FullPanel;->cQsPanel:Ljava/lang/Class;

    const-string v5, "mFooter"

    invoke-static {v4, v5}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/jelly/mods/qsrow/FullPanel;->fFooter:Ljava/lang/reflect/Field;

    .line 49
    iget-object v4, p0, Lcom/jelly/mods/qsrow/FullPanel;->cQsPanel:Ljava/lang/Class;

    const-string v5, "mFooterPageIndicator"

    invoke-static {v4, v5}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/jelly/mods/qsrow/FullPanel;->fIndicator:Ljava/lang/reflect/Field;

    .line 50
    iget-object v4, p0, Lcom/jelly/mods/qsrow/FullPanel;->cQsPanel:Ljava/lang/Class;

    const-string v5, "mMediaHostView"

    invoke-static {v4, v5}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/jelly/mods/qsrow/FullPanel;->fMedia:Ljava/lang/reflect/Field;

    .line 51
    iget-object v4, p0, Lcom/jelly/mods/qsrow/FullPanel;->cQsCtrl:Ljava/lang/Class;

    const-string v5, "mView"

    invoke-static {v4, v5}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/jelly/mods/qsrow/FullPanel;->fCtrlView:Ljava/lang/reflect/Field;

    const-string v4, "mHost"

    .line 52
    invoke-static {v0, v4}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    iput-object v4, p0, Lcom/jelly/mods/qsrow/FullPanel;->fHost:Ljava/lang/reflect/Field;

    .line 53
    iget-object v4, p0, Lcom/jelly/mods/qsrow/FullPanel;->cQsPanel:Ljava/lang/Class;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v5, v6}, [Ljava/lang/Class;

    move-result-object v5

    const-string v6, "onMeasure"

    invoke-virtual {v4, v6, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 54
    const-class v5, Ljava/util/Collection;

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v5, v6}, [Ljava/lang/Class;

    move-result-object v5

    const-string v6, "setTiles"

    invoke-virtual {v0, v6, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    .line 55
    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v6}, [Ljava/lang/Class;

    move-result-object v6

    const-string v7, "setListening"

    invoke-virtual {v0, v7, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v6, 0x0

    new-array v7, v6, [Ljava/lang/Class;

    const-string v8, "getTilesHeight"

    .line 56
    invoke-virtual {v1, v8, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 57
    sget-object v7, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v7}, [Ljava/lang/Class;

    move-result-object v7

    const-string v8, "setNumPages"

    invoke-virtual {v2, v8, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 58
    sget-object v7, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v7}, [Ljava/lang/Class;

    move-result-object v7

    const-string v8, "setClickable"

    invoke-virtual {v3, v8, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    .line 59
    sget-object v8, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v8}, [Ljava/lang/Class;

    move-result-object v8

    const-string v9, "setLabelColor"

    invoke-virtual {v3, v9, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v8

    .line 61
    iget-object v9, p0, Lcom/jelly/mods/qsrow/FullPanel;->cQsPanel:Ljava/lang/Class;

    const-string v10, "updateViewPositions"

    new-array v6, v6, [Ljava/lang/Class;

    invoke-static {v9, v10, v6}, Lcom/jelly/mods/qsrow/Refl;->deopt(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)V

    .line 62
    iget-object v6, p0, Lcom/jelly/mods/qsrow/FullPanel;->cl:Ljava/lang/ClassLoader;

    const-string v9, "com.android.systemui.plugins.qs.QSTile$State"

    invoke-virtual {v6, v9}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    filled-new-array {v6}, [Ljava/lang/Class;

    move-result-object v6

    const-string v9, "handleStateChanged"

    invoke-static {v3, v9, v6}, Lcom/jelly/mods/qsrow/Refl;->deopt(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)V

    .line 63
    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v9, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v10, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v11, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v6, v9, v10, v11}, [Ljava/lang/Class;

    move-result-object v6

    const-string v9, "setAllColors"

    invoke-static {v3, v9, v6}, Lcom/jelly/mods/qsrow/Refl;->deopt(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)V

    .line 66
    new-instance v3, Lcom/jelly/mods/qsrow/FullPanel$1;

    invoke-direct {v3, p0}, Lcom/jelly/mods/qsrow/FullPanel$1;-><init>(Lcom/jelly/mods/qsrow/FullPanel;)V

    invoke-static {v5, v3}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 74
    new-instance v3, Lcom/jelly/mods/qsrow/FullPanel$2;

    invoke-direct {v3, p0}, Lcom/jelly/mods/qsrow/FullPanel$2;-><init>(Lcom/jelly/mods/qsrow/FullPanel;)V

    invoke-static {v0, v3}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 84
    new-instance v0, Lcom/jelly/mods/qsrow/FullPanel$3;

    invoke-direct {v0, p0}, Lcom/jelly/mods/qsrow/FullPanel$3;-><init>(Lcom/jelly/mods/qsrow/FullPanel;)V

    invoke-static {v1, v0}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 90
    new-instance v0, Lcom/jelly/mods/qsrow/FullPanel$4;

    invoke-direct {v0, p0}, Lcom/jelly/mods/qsrow/FullPanel$4;-><init>(Lcom/jelly/mods/qsrow/FullPanel;)V

    invoke-static {v2, v0}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 99
    new-instance v0, Lcom/jelly/mods/qsrow/FullPanel$5;

    invoke-direct {v0, p0}, Lcom/jelly/mods/qsrow/FullPanel$5;-><init>(Lcom/jelly/mods/qsrow/FullPanel;)V

    invoke-static {v7, v0}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 105
    new-instance v0, Lcom/jelly/mods/qsrow/FullPanel$6;

    invoke-direct {v0, p0}, Lcom/jelly/mods/qsrow/FullPanel$6;-><init>(Lcom/jelly/mods/qsrow/FullPanel;)V

    invoke-static {v8, v0}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    .line 113
    new-instance v0, Lcom/jelly/mods/qsrow/FullPanel$7;

    invoke-direct {v0, p0}, Lcom/jelly/mods/qsrow/FullPanel$7;-><init>(Lcom/jelly/mods/qsrow/FullPanel;)V

    invoke-static {v4, v0}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    const/4 p0, 0x1

    .line 121
    sput-boolean p0, Lcom/jelly/mods/qsrow/Registry;->panelActive:Z

    return-void
.end method
