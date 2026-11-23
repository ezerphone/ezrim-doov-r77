.class final Lcom/jelly/mods/qsrow/Tiles$Inset;
.super Landroid/graphics/drawable/InsetDrawable;
.source "Tiles.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jelly/mods/qsrow/Tiles;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Inset"
.end annotation


# direct methods
.method constructor <init>(Landroid/graphics/drawable/Drawable;IIII)V
    .registers 6

    .line 41
    invoke-direct/range {p0 .. p5}, Landroid/graphics/drawable/InsetDrawable;-><init>(Landroid/graphics/drawable/Drawable;IIII)V

    return-void
.end method


# virtual methods
.method public getPadding(Landroid/graphics/Rect;)Z
    .registers 2

    const/4 p0, 0x0

    .line 46
    invoke-virtual {p1, p0, p0, p0, p0}, Landroid/graphics/Rect;->set(IIII)V

    return p0
.end method
