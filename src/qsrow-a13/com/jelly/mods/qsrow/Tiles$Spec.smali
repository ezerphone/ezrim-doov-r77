.class final Lcom/jelly/mods/qsrow/Tiles$Spec;
.super Ljava/lang/Object;
.source "Tiles.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jelly/mods/qsrow/Tiles;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Spec"
.end annotation


# instance fields
.field b:I

.field circle:I

.field kind:I

.field l:I

.field r:I

.field shaped:Z

.field t:I


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 35
    iput v0, p0, Lcom/jelly/mods/qsrow/Tiles$Spec;->l:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/jelly/mods/qsrow/Tiles$1;)V
    .registers 2

    .line 32
    invoke-direct {p0}, Lcom/jelly/mods/qsrow/Tiles$Spec;-><init>()V

    return-void
.end method
