.class final Lcom/jelly/mods/qsrow/VSlider$Volume;
.super Ljava/lang/Object;
.source "VSlider.java"

# interfaces
.implements Lcom/jelly/mods/qsrow/VSlider$Model;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/jelly/mods/qsrow/VSlider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Volume"
.end annotation


# instance fields
.field private final am:Landroid/media/AudioManager;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 197
    const-class v0, Landroid/media/AudioManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/media/AudioManager;

    iput-object p1, p0, Lcom/jelly/mods/qsrow/VSlider$Volume;->am:Landroid/media/AudioManager;

    return-void
.end method


# virtual methods
.method public get(Landroid/view/View;)F
    .registers 3

    .line 202
    iget-object p1, p0, Lcom/jelly/mods/qsrow/VSlider$Volume;->am:Landroid/media/AudioManager;

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result p1

    if-lez p1, :cond_13

    .line 203
    iget-object p0, p0, Lcom/jelly/mods/qsrow/VSlider$Volume;->am:Landroid/media/AudioManager;

    invoke-virtual {p0, v0}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result p0

    int-to-float p0, p0

    int-to-float p1, p1

    div-float/2addr p0, p1

    goto :goto_14

    :cond_13
    const/4 p0, 0x0

    :goto_14
    return p0
.end method

.method public set(Landroid/view/View;FZ)V
    .registers 4

    .line 208
    iget-object p1, p0, Lcom/jelly/mods/qsrow/VSlider$Volume;->am:Landroid/media/AudioManager;

    const/4 p3, 0x3

    invoke-virtual {p1, p3}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result p1

    int-to-float p1, p1

    mul-float/2addr p2, p1

    .line 209
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p1

    .line 210
    iget-object p2, p0, Lcom/jelly/mods/qsrow/VSlider$Volume;->am:Landroid/media/AudioManager;

    invoke-virtual {p2, p3}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result p2

    if-eq p1, p2, :cond_1b

    iget-object p0, p0, Lcom/jelly/mods/qsrow/VSlider$Volume;->am:Landroid/media/AudioManager;

    const/4 p2, 0x0

    invoke-virtual {p0, p3, p1, p2}, Landroid/media/AudioManager;->setStreamVolume(III)V

    :cond_1b
    return-void
.end method
