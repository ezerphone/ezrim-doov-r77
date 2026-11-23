.class public final Lcom/jelly/mods/qsrow/Cust$L;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# static fields
.field public static final I:Lcom/jelly/mods/qsrow/Cust$L;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/jelly/mods/qsrow/Cust$L;

    invoke-direct {v0}, Lcom/jelly/mods/qsrow/Cust$L;-><init>()V

    sput-object v0, Lcom/jelly/mods/qsrow/Cust$L;->I:Lcom/jelly/mods/qsrow/Cust$L;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .registers 12

    :try_start_0
    invoke-static {}, Lcom/jelly/mods/qsrow/Bake;->full()Z

    move-result v0

    if-eqz v0, :cond_13

    const-class v0, Lcom/jelly/mods/qsrow/Bake;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-static {v0}, Lcom/jelly/mods/qsrow/Tiles;->get(Ljava/lang/ClassLoader;)Lcom/jelly/mods/qsrow/Tiles;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/jelly/mods/qsrow/Tiles;->insetBackground(Landroid/view/View;)V

    :cond_13
    return-void
    :try_end_14
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_14} :catch_14

    :catch_14
    move-exception v0

    return-void
.end method
