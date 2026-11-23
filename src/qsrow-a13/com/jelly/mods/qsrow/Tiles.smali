.class final Lcom/jelly/mods/qsrow/Tiles;
.super Ljava/lang/Object;
.source "Tiles.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/jelly/mods/qsrow/Tiles$Spec;,
        Lcom/jelly/mods/qsrow/Tiles$Inset;
    }
.end annotation


# static fields
.field static final BIG:I = 0x0

.field static final CIRCLE:I = 0x1

.field static final CIRCLE_LABEL:I = 0x2

.field private static final ROUND:I = 0x186a0

.field static final SQUARE:I = 0x3

.field private static instance:Lcom/jelly/mods/qsrow/Tiles;


# instance fields
.field private final cIconView:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private final cTileView:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private final fActive:Ljava/lang/reflect/Field;

.field private final fColorBg:Ljava/lang/reflect/Field;

.field private final fIcon:Ljava/lang/reflect/Field;

.field private final fIconSize:Ljava/lang/reflect/Field;

.field private final fInactive:Ljava/lang/reflect/Field;

.field private final fLabel:Ljava/lang/reflect/Field;

.field private final fLabelActive:Ljava/lang/reflect/Field;

.field private final fLabelInactive:Ljava/lang/reflect/Field;

.field private final fLabelUnavailable:Ljava/lang/reflect/Field;

.field private final fLabels:Ljava/lang/reflect/Field;

.field private final fRipple:Ljava/lang/reflect/Field;

.field private final fSecondary:Ljava/lang/reflect/Field;

.field private final fSide:Ljava/lang/reflect/Field;

.field private final specs:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Lcom/jelly/mods/qsrow/Tiles$Spec;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/ClassLoader;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lcom/jelly/mods/qsrow/Tiles;->specs:Ljava/util/Map;

    const-string v0, "tileimpl.QSTileViewImpl"

    .line 57
    invoke-static {p1, v0}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, Lcom/jelly/mods/qsrow/Tiles;->cTileView:Ljava/lang/Class;

    const-string v1, "tileimpl.QSIconViewImpl"

    .line 58
    invoke-static {p1, v1}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    iput-object p1, p0, Lcom/jelly/mods/qsrow/Tiles;->cIconView:Ljava/lang/Class;

    const-string v1, "labelContainer"

    .line 59
    invoke-static {v0, v1}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    iput-object v1, p0, Lcom/jelly/mods/qsrow/Tiles;->fLabels:Ljava/lang/reflect/Field;

    const-string v1, "label"

    .line 60
    invoke-static {v0, v1}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    iput-object v1, p0, Lcom/jelly/mods/qsrow/Tiles;->fLabel:Ljava/lang/reflect/Field;

    const-string v1, "secondaryLabel"

    .line 61
    invoke-static {v0, v1}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    iput-object v1, p0, Lcom/jelly/mods/qsrow/Tiles;->fSecondary:Ljava/lang/reflect/Field;

    const-string v1, "sideView"

    .line 62
    invoke-static {v0, v1}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    iput-object v1, p0, Lcom/jelly/mods/qsrow/Tiles;->fSide:Ljava/lang/reflect/Field;

    const-string v1, "_icon"

    .line 63
    invoke-static {v0, v1}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    iput-object v1, p0, Lcom/jelly/mods/qsrow/Tiles;->fIcon:Ljava/lang/reflect/Field;

    const-string v1, "mIconSizePx"

    .line 64
    invoke-static {p1, v1}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    iput-object p1, p0, Lcom/jelly/mods/qsrow/Tiles;->fIconSize:Ljava/lang/reflect/Field;

    const-string p1, "colorBackgroundDrawable"

    .line 65
    invoke-static {v0, p1}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    iput-object p1, p0, Lcom/jelly/mods/qsrow/Tiles;->fColorBg:Ljava/lang/reflect/Field;

    const-string p1, "ripple"

    .line 66
    invoke-static {v0, p1}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    iput-object p1, p0, Lcom/jelly/mods/qsrow/Tiles;->fRipple:Ljava/lang/reflect/Field;

    const-string p1, "colorActive"

    .line 67
    invoke-static {v0, p1}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    iput-object p1, p0, Lcom/jelly/mods/qsrow/Tiles;->fActive:Ljava/lang/reflect/Field;

    const-string p1, "colorInactive"

    .line 68
    invoke-static {v0, p1}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    iput-object p1, p0, Lcom/jelly/mods/qsrow/Tiles;->fInactive:Ljava/lang/reflect/Field;

    const-string p1, "colorLabelActive"

    .line 69
    invoke-static {v0, p1}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    iput-object p1, p0, Lcom/jelly/mods/qsrow/Tiles;->fLabelActive:Ljava/lang/reflect/Field;

    const-string p1, "colorLabelInactive"

    .line 70
    invoke-static {v0, p1}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    iput-object p1, p0, Lcom/jelly/mods/qsrow/Tiles;->fLabelInactive:Ljava/lang/reflect/Field;

    const-string p1, "colorLabelUnavailable"

    .line 71
    invoke-static {v0, p1}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    iput-object p1, p0, Lcom/jelly/mods/qsrow/Tiles;->fLabelUnavailable:Ljava/lang/reflect/Field;

    return-void
.end method

.method static dp(Landroid/view/View;F)I
    .registers 3

    .line 250
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

.method static declared-synchronized get(Ljava/lang/ClassLoader;)Lcom/jelly/mods/qsrow/Tiles;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-class v0, Lcom/jelly/mods/qsrow/Tiles;

    monitor-enter v0

    .line 52
    :try_start_3
    sget-object v1, Lcom/jelly/mods/qsrow/Tiles;->instance:Lcom/jelly/mods/qsrow/Tiles;

    if-nez v1, :cond_e

    new-instance v1, Lcom/jelly/mods/qsrow/Tiles;

    invoke-direct {v1, p0}, Lcom/jelly/mods/qsrow/Tiles;-><init>(Ljava/lang/ClassLoader;)V

    sput-object v1, Lcom/jelly/mods/qsrow/Tiles;->instance:Lcom/jelly/mods/qsrow/Tiles;

    .line 53
    :cond_e
    sget-object p0, Lcom/jelly/mods/qsrow/Tiles;->instance:Lcom/jelly/mods/qsrow/Tiles;
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_12

    monitor-exit v0

    return-object p0

    :catchall_12
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static gone(Landroid/view/View;)V
    .registers 3

    if-eqz p0, :cond_d

    .line 246
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_d

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_d
    return-void
.end method

.method private icon(Landroid/view/View;II)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 224
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Tiles;->fIcon:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    if-nez p1, :cond_b

    return-void

    .line 226
    :cond_b
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Tiles;->cIconView:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object p0, p0, Lcom/jelly/mods/qsrow/Tiles;->fIconSize:Ljava/lang/reflect/Field;

    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    .line 227
    :cond_18
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    instance-of p0, p0, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz p0, :cond_41

    .line 228
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p0

    check-cast p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 229
    iget v0, p0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    if-ne v0, p2, :cond_36

    iget v0, p0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    if-ne v0, p2, :cond_36

    iget v0, p0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    if-ne v0, p3, :cond_36

    iget v0, p0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    if-eq v0, p3, :cond_41

    .line 230
    :cond_36
    iput p2, p0, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 231
    iput p2, p0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 232
    iput p3, p0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 233
    iput p3, p0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 234
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_41
    return-void
.end method

.method private iconOnly(Landroid/view/View;I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 122
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Tiles;->fLabels:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Lcom/jelly/mods/qsrow/Tiles;->gone(Landroid/view/View;)V

    .line 123
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Tiles;->fSide:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-static {v0}, Lcom/jelly/mods/qsrow/Tiles;->gone(Landroid/view/View;)V

    .line 124
    invoke-static {p1}, Lcom/jelly/mods/qsrow/Tiles;->noPadding(Landroid/view/View;)V

    .line 125
    move-object v0, p1

    check-cast v0, Landroid/widget/LinearLayout;

    .line 126
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_26

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    :cond_26
    const/16 v1, 0x11

    .line 127
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 128
    invoke-direct {p0, p1, p2, v2}, Lcom/jelly/mods/qsrow/Tiles;->icon(Landroid/view/View;II)V

    return-void
.end method

.method private static noPadding(Landroid/view/View;)V
    .registers 2

    .line 240
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v0

    if-nez v0, :cond_18

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    if-eqz v0, :cond_1c

    :cond_18
    const/4 v0, 0x0

    .line 241
    invoke-virtual {p0, v0, v0, v0, v0}, Landroid/view/View;->setPadding(IIII)V

    :cond_1c
    return-void
.end method

.method private round(Landroid/view/View;Lcom/jelly/mods/qsrow/Tiles$Spec;I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 102
    iget-boolean v0, p2, Lcom/jelly/mods/qsrow/Tiles$Spec;->shaped:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    .line 103
    iput-boolean v0, p2, Lcom/jelly/mods/qsrow/Tiles$Spec;->shaped:Z

    .line 104
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Tiles;->fColorBg:Ljava/lang/reflect/Field;

    invoke-virtual {p2, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    .line 105
    instance-of v0, p2, Landroid/graphics/drawable/GradientDrawable;

    if-eqz v0, :cond_18

    check-cast p2, Landroid/graphics/drawable/GradientDrawable;

    int-to-float v0, p3

    invoke-virtual {p2, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 106
    :cond_18
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Tiles;->fRipple:Ljava/lang/reflect/Field;

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    .line 107
    instance-of p1, p0, Landroid/graphics/drawable/RippleDrawable;

    if-eqz p1, :cond_39

    .line 108
    check-cast p0, Landroid/graphics/drawable/RippleDrawable;

    const p1, 0x102002e

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/RippleDrawable;->findDrawableByLayerId(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 109
    instance-of p1, p0, Landroid/graphics/drawable/GradientDrawable;

    if-eqz p1, :cond_39

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    check-cast p0, Landroid/graphics/drawable/GradientDrawable;

    int-to-float p1, p3

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    :cond_39
    return-void
.end method

.method private spec(Landroid/view/View;II)Lcom/jelly/mods/qsrow/Tiles$Spec;
    .registers 6

    .line 79
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Tiles;->specs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jelly/mods/qsrow/Tiles$Spec;

    if-nez v0, :cond_15

    .line 81
    new-instance v0, Lcom/jelly/mods/qsrow/Tiles$Spec;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/jelly/mods/qsrow/Tiles$Spec;-><init>(Lcom/jelly/mods/qsrow/Tiles$1;)V

    .line 82
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Tiles;->specs:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    :cond_15
    iput p2, v0, Lcom/jelly/mods/qsrow/Tiles$Spec;->kind:I

    .line 85
    iput p3, v0, Lcom/jelly/mods/qsrow/Tiles$Spec;->circle:I

    return-object v0
.end method


# virtual methods
.method circle(Landroid/view/View;I)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 91
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Tiles;->cTileView:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 92
    invoke-direct {p0, p1, v0, v1}, Lcom/jelly/mods/qsrow/Tiles;->spec(Landroid/view/View;II)Lcom/jelly/mods/qsrow/Tiles$Spec;

    move-result-object v0

    .line 93
    invoke-direct {p0, p1, p2}, Lcom/jelly/mods/qsrow/Tiles;->iconOnly(Landroid/view/View;I)V

    const p2, 0x186a0

    .line 94
    invoke-direct {p0, p1, v0, p2}, Lcom/jelly/mods/qsrow/Tiles;->round(Landroid/view/View;Lcom/jelly/mods/qsrow/Tiles$Spec;I)V

    return-void
.end method

.method circleLabel(Landroid/view/View;IIF)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 133
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Tiles;->cTileView:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    const/4 v0, 0x2

    .line 134
    invoke-direct {p0, p1, v0, p2}, Lcom/jelly/mods/qsrow/Tiles;->spec(Landroid/view/View;II)Lcom/jelly/mods/qsrow/Tiles$Spec;

    move-result-object v1

    const v2, 0x186a0

    .line 135
    invoke-direct {p0, p1, v1, v2}, Lcom/jelly/mods/qsrow/Tiles;->round(Landroid/view/View;Lcom/jelly/mods/qsrow/Tiles$Spec;I)V

    .line 136
    move-object v1, p1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 137
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getOrientation()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_21

    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    :cond_21
    const/16 v2, 0x31

    .line 138
    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 139
    invoke-static {p1}, Lcom/jelly/mods/qsrow/Tiles;->noPadding(Landroid/view/View;)V

    .line 140
    iget-object v1, p0, Lcom/jelly/mods/qsrow/Tiles;->fSide:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-static {v1}, Lcom/jelly/mods/qsrow/Tiles;->gone(Landroid/view/View;)V

    sub-int/2addr p2, p3

    .line 141
    div-int/2addr p2, v0

    invoke-direct {p0, p1, p3, p2}, Lcom/jelly/mods/qsrow/Tiles;->icon(Landroid/view/View;II)V

    .line 143
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Tiles;->fLabels:Ljava/lang/reflect/Field;

    invoke-virtual {p2, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    const/4 p3, -0x1

    const/4 v1, 0x0

    if-eqz p2, :cond_96

    .line 145
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-eqz v2, :cond_4e

    invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 146
    :cond_4e
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    instance-of v2, v2, Landroid/widget/LinearLayout$LayoutParams;

    if-eqz v2, :cond_8d

    .line 147
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v4, 0x40800000    # 4.0f

    .line 148
    invoke-static {p1, v4}, Lcom/jelly/mods/qsrow/Tiles;->dp(Landroid/view/View;F)I

    move-result v4

    .line 149
    iget v5, v2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    if-ne v5, p3, :cond_7a

    invoke-virtual {v2}, Landroid/widget/LinearLayout$LayoutParams;->getMarginStart()I

    move-result v5

    if-nez v5, :cond_7a

    invoke-virtual {v2}, Landroid/widget/LinearLayout$LayoutParams;->getMarginEnd()I

    move-result v5

    if-nez v5, :cond_7a

    iget v5, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    if-ne v5, v4, :cond_7a

    iget v5, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    if-eq v5, v3, :cond_8d

    .line 151
    :cond_7a
    iput p3, v2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    .line 152
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 153
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 154
    iput v1, v2, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 155
    iput v1, v2, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 156
    iput v4, v2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 157
    iput v3, v2, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 158
    invoke-virtual {p2, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 161
    :cond_8d
    instance-of v2, p2, Landroid/widget/LinearLayout;

    if-eqz v2, :cond_96

    check-cast p2, Landroid/widget/LinearLayout;

    invoke-virtual {p2, v3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 163
    :cond_96
    iget-object p2, p0, Lcom/jelly/mods/qsrow/Tiles;->fLabel:Ljava/lang/reflect/Field;

    invoke-virtual {p2, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    if-eqz p2, :cond_d8

    .line 165
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    invoke-static {v0, p4, v2}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p4

    .line 166
    invoke-virtual {p2}, Landroid/widget/TextView;->getTextSize()F

    move-result v0

    cmpl-float v0, v0, p4

    if-eqz v0, :cond_b7

    invoke-virtual {p2, v1, p4}, Landroid/widget/TextView;->setTextSize(IF)V

    :cond_b7
    const/16 p4, 0x11

    .line 167
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setGravity(I)V

    .line 168
    invoke-virtual {p2}, Landroid/widget/TextView;->getEllipsize()Landroid/text/TextUtils$TruncateAt;

    move-result-object p4

    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    if-eq p4, v0, :cond_c9

    sget-object p4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 169
    :cond_c9
    invoke-virtual {p2}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p4

    if-eqz p4, :cond_d8

    .line 170
    iget v0, p4, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-eq v0, p3, :cond_d8

    .line 171
    iput p3, p4, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 172
    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 176
    :cond_d8
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Tiles;->fSecondary:Ljava/lang/reflect/Field;

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/widget/TextView;

    if-eqz p0, :cond_eb

    .line 177
    invoke-virtual {p0}, Landroid/widget/TextView;->getMaxHeight()I

    move-result p1

    if-eqz p1, :cond_eb

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setMaxHeight(I)V

    :cond_eb
    return-void
.end method

.method colors(Landroid/view/View;)[I
    .registers 6

    const/4 v0, 0x0

    .line 216
    :try_start_1
    iget-object v1, p0, Lcom/jelly/mods/qsrow/Tiles;->cTileView:Ljava/lang/Class;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_a

    return-object v0

    :cond_a
    const/4 v1, 0x4

    new-array v1, v1, [I

    .line 217
    iget-object v2, p0, Lcom/jelly/mods/qsrow/Tiles;->fActive:Ljava/lang/reflect/Field;

    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, 0x0

    aput v2, v1, v3

    iget-object v2, p0, Lcom/jelly/mods/qsrow/Tiles;->fInactive:Ljava/lang/reflect/Field;

    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, 0x1

    aput v2, v1, v3

    iget-object v2, p0, Lcom/jelly/mods/qsrow/Tiles;->fLabelActive:Ljava/lang/reflect/Field;

    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    const/4 v3, 0x2

    aput v2, v1, v3

    iget-object p0, p0, Lcom/jelly/mods/qsrow/Tiles;->fLabelInactive:Ljava/lang/reflect/Field;

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p0

    const/4 p1, 0x3

    aput p0, v1, p1
    :try_end_31
    .catchall {:try_start_1 .. :try_end_31} :catchall_32

    return-object v1

    :catchall_32
    return-object v0
.end method

.method insetBackground(Landroid/view/View;)V
    .registers 11

    .line 182
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Tiles;->specs:Ljava/util/Map;

    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/jelly/mods/qsrow/Tiles$Spec;

    if-eqz p0, :cond_69

    .line 183
    iget v0, p0, Lcom/jelly/mods/qsrow/Tiles$Spec;->kind:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_10

    goto :goto_69

    .line 184
    :cond_10
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v1

    if-lez v0, :cond_69

    if-gtz v1, :cond_1d

    goto :goto_69

    .line 186
    :cond_1d
    iget v2, p0, Lcom/jelly/mods/qsrow/Tiles$Spec;->circle:I

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v2

    sub-int/2addr v0, v2

    .line 187
    div-int/lit8 v5, v0, 0x2

    sub-int v7, v0, v5

    sub-int/2addr v1, v2

    const/4 v0, 0x0

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v8

    .line 188
    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-nez v1, :cond_35

    return-void

    .line 190
    :cond_35
    instance-of v2, v1, Lcom/jelly/mods/qsrow/Tiles$Inset;

    if-eqz v2, :cond_4a

    .line 191
    iget v3, p0, Lcom/jelly/mods/qsrow/Tiles$Spec;->l:I

    if-ne v3, v5, :cond_4a

    iget v3, p0, Lcom/jelly/mods/qsrow/Tiles$Spec;->t:I

    if-nez v3, :cond_4a

    iget v3, p0, Lcom/jelly/mods/qsrow/Tiles$Spec;->r:I

    if-ne v3, v7, :cond_4a

    iget v3, p0, Lcom/jelly/mods/qsrow/Tiles$Spec;->b:I

    if-ne v3, v8, :cond_4a

    return-void

    :cond_4a
    if-eqz v2, :cond_52

    .line 192
    check-cast v1, Lcom/jelly/mods/qsrow/Tiles$Inset;

    invoke-virtual {v1}, Lcom/jelly/mods/qsrow/Tiles$Inset;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    :cond_52
    move-object v4, v1

    .line 193
    iput v5, p0, Lcom/jelly/mods/qsrow/Tiles$Spec;->l:I

    .line 194
    iput v0, p0, Lcom/jelly/mods/qsrow/Tiles$Spec;->t:I

    .line 195
    iput v7, p0, Lcom/jelly/mods/qsrow/Tiles$Spec;->r:I

    .line 196
    iput v8, p0, Lcom/jelly/mods/qsrow/Tiles$Spec;->b:I

    const/4 p0, 0x0

    .line 201
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 202
    new-instance p0, Lcom/jelly/mods/qsrow/Tiles$Inset;

    const/4 v6, 0x0

    move-object v3, p0

    invoke-direct/range {v3 .. v8}, Lcom/jelly/mods/qsrow/Tiles$Inset;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_69
    :goto_69
    return-void
.end method

.method labelColor(Ljava/lang/Object;I)I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 207
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Tiles;->specs:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/jelly/mods/qsrow/Tiles$Spec;

    if-eqz v0, :cond_20

    .line 208
    iget v0, v0, Lcom/jelly/mods/qsrow/Tiles$Spec;->kind:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_10

    goto :goto_20

    .line 209
    :cond_10
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Tiles;->fLabelUnavailable:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v0

    if-ne p2, v0, :cond_19

    goto :goto_1f

    .line 210
    :cond_19
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Tiles;->fLabelInactive:Ljava/lang/reflect/Field;

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v0

    :goto_1f
    return v0

    :cond_20
    :goto_20
    return p2
.end method

.method square(Landroid/view/View;II)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 115
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Tiles;->cTileView:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_9

    return-void

    :cond_9
    const/4 v0, 0x3

    const/4 v1, 0x0

    .line 116
    invoke-direct {p0, p1, v0, v1}, Lcom/jelly/mods/qsrow/Tiles;->spec(Landroid/view/View;II)Lcom/jelly/mods/qsrow/Tiles$Spec;

    move-result-object v0

    .line 117
    invoke-direct {p0, p1, p2}, Lcom/jelly/mods/qsrow/Tiles;->iconOnly(Landroid/view/View;I)V

    .line 118
    invoke-direct {p0, p1, v0, p3}, Lcom/jelly/mods/qsrow/Tiles;->round(Landroid/view/View;Lcom/jelly/mods/qsrow/Tiles$Spec;I)V

    return-void
.end method

.method tileClass()Ljava/lang/Class;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation

    .line 75
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Tiles;->cTileView:Ljava/lang/Class;

    return-object p0
.end method
