.class final Lcom/jelly/mods/qsrow/VSlider$Brightness;
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
    name = "Brightness"
.end annotation


# instance fields
.field private final dm:Landroid/hardware/display/DisplayManager;

.field private final fMax:Ljava/lang/reflect/Field;

.field private final fMin:Ljava/lang/reflect/Field;

.field private final fValue:Ljava/lang/reflect/Field;

.field private final getInfo:Ljava/lang/reflect/Method;

.field private final setBrightness:Ljava/lang/reflect/Method;

.field private final setTemporary:Ljava/lang/reflect/Method;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 147
    const-class v0, Landroid/hardware/display/DisplayManager;

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/display/DisplayManager;

    iput-object p1, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->dm:Landroid/hardware/display/DisplayManager;

    .line 148
    const-class p1, Landroid/hardware/display/DisplayManager;

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    filled-new-array {v0, v1}, [Ljava/lang/Class;

    move-result-object v0

    const-string v1, "setBrightness"

    invoke-virtual {p1, v1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    iput-object p1, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->setBrightness:Ljava/lang/reflect/Method;

    .line 149
    const-class p1, Landroid/hardware/display/DisplayManager;

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    filled-new-array {v0, v1}, [Ljava/lang/Class;

    move-result-object v0

    const-string v1, "setTemporaryBrightness"

    invoke-virtual {p1, v1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    iput-object p1, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->setTemporary:Ljava/lang/reflect/Method;

    .line 150
    const-class p1, Landroid/view/Display;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Class;

    const-string v1, "getBrightnessInfo"

    invoke-virtual {p1, v1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    iput-object p1, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->getInfo:Ljava/lang/reflect/Method;

    const-string p1, "android.hardware.display.BrightnessInfo"

    .line 151
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    const-string v0, "brightness"

    .line 152
    invoke-virtual {p1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    iput-object v0, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->fValue:Ljava/lang/reflect/Field;

    const-string v0, "brightnessMinimum"

    .line 153
    invoke-virtual {p1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    iput-object v0, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->fMin:Ljava/lang/reflect/Field;

    const-string v0, "brightnessMaximum"

    .line 154
    invoke-virtual {p1, v0}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    iput-object p1, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->fMax:Ljava/lang/reflect/Field;

    return-void
.end method

.method private display(Landroid/view/View;)Landroid/view/Display;
    .registers 2

    .line 159
    invoke-virtual {p1}, Landroid/view/View;->getDisplay()Landroid/view/Display;

    move-result-object p1

    if-eqz p1, :cond_7

    goto :goto_e

    .line 160
    :cond_7
    iget-object p0, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->dm:Landroid/hardware/display/DisplayManager;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/hardware/display/DisplayManager;->getDisplay(I)Landroid/view/Display;

    move-result-object p1

    :goto_e
    return-object p1
.end method

.method static toGamma(FFF)I
    .registers 5

    cmpl-float v0, p2, p1

    const/4 v1, 0x0

    if-lez v0, :cond_f

    sub-float/2addr p0, p1

    sub-float/2addr p2, p1

    div-float/2addr p0, p2

    const/high16 p1, 0x41400000    # 12.0f

    mul-float/2addr p0, p1

    .line 186
    invoke-static {v1, p0}, Ljava/lang/Math;->max(FF)F

    move-result v1

    :cond_f
    const/high16 p0, 0x3f800000    # 1.0f

    cmpg-float p0, v1, p0

    if-gtz p0, :cond_1f

    float-to-double p0, v1

    .line 187
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p0

    double-to-float p0, p0

    const/high16 p1, 0x3f000000    # 0.5f

    mul-float/2addr p0, p1

    goto :goto_35

    :cond_1f
    const p0, 0x3e91c020

    sub-float/2addr v1, p0

    float-to-double p0, v1

    invoke-static {p0, p1}, Ljava/lang/Math;->log(D)D

    move-result-wide p0

    const-wide v0, 0x3fc6e3fe00000000L    # 0.1788327693939209

    mul-double/2addr p0, v0

    const-wide v0, 0x3fe1eac9e0000000L    # 0.5599107146263123

    add-double/2addr p0, v0

    double-to-float p0, p0

    :goto_35
    const p1, 0x477fff00    # 65535.0f

    mul-float/2addr p0, p1

    .line 188
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    return p0
.end method

.method static toLinear(IFF)F
    .registers 5

    int-to-float p0, p0

    const v0, 0x477fff00    # 65535.0f

    div-float/2addr p0, v0

    const/high16 v0, 0x3f000000    # 0.5f

    cmpg-float v1, p0, v0

    if-gtz v1, :cond_e

    div-float/2addr p0, v0

    mul-float/2addr p0, p0

    goto :goto_20

    :cond_e
    const v0, 0x3f0f564f

    sub-float/2addr p0, v0

    const v0, 0x3e371ff0

    div-float/2addr p0, v0

    float-to-double v0, p0

    .line 180
    invoke-static {v0, v1}, Ljava/lang/Math;->exp(D)D

    move-result-wide v0

    double-to-float p0, v0

    const v0, 0x3e91c020

    add-float/2addr p0, v0

    :goto_20
    sub-float/2addr p2, p1

    const/4 v0, 0x0

    const/high16 v1, 0x41400000    # 12.0f

    .line 181
    invoke-static {v1, p0}, Ljava/lang/Math;->min(FF)F

    move-result p0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(FF)F

    move-result p0

    div-float/2addr p0, v1

    mul-float/2addr p2, p0

    add-float/2addr p1, p2

    return p1
.end method


# virtual methods
.method public get(Landroid/view/View;)F
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 165
    iget-object v0, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->getInfo:Ljava/lang/reflect/Method;

    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/VSlider$Brightness;->display(Landroid/view/View;)Landroid/view/Display;

    move-result-object p1

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 166
    iget-object v0, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->fValue:Ljava/lang/reflect/Field;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v0

    iget-object v1, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->fMin:Ljava/lang/reflect/Field;

    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v1

    iget-object p0, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->fMax:Ljava/lang/reflect/Field;

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result p0

    invoke-static {v0, v1, p0}, Lcom/jelly/mods/qsrow/VSlider$Brightness;->toGamma(FFF)I

    move-result p0

    int-to-float p0, p0

    const p1, 0x477fff00    # 65535.0f

    div-float/2addr p0, p1

    return p0
.end method

.method public set(Landroid/view/View;FZ)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 171
    invoke-direct {p0, p1}, Lcom/jelly/mods/qsrow/VSlider$Brightness;->display(Landroid/view/View;)Landroid/view/Display;

    move-result-object p1

    .line 172
    iget-object v0, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->getInfo:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    const v1, 0x477fff00    # 65535.0f

    mul-float/2addr p2, v1

    .line 173
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    iget-object v1, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->fMin:Ljava/lang/reflect/Field;

    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v1

    iget-object v2, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->fMax:Ljava/lang/reflect/Field;

    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v0

    invoke-static {p2, v1, v0}, Lcom/jelly/mods/qsrow/VSlider$Brightness;->toLinear(IFF)F

    move-result p2

    if-eqz p3, :cond_2a

    .line 174
    iget-object p3, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->setBrightness:Ljava/lang/reflect/Method;

    goto :goto_2c

    :cond_2a
    iget-object p3, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->setTemporary:Ljava/lang/reflect/Method;

    :goto_2c
    iget-object p0, p0, Lcom/jelly/mods/qsrow/VSlider$Brightness;->dm:Landroid/hardware/display/DisplayManager;

    invoke-virtual {p1}, Landroid/view/Display;->getDisplayId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    filled-new-array {p1, p2}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p3, p0, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
