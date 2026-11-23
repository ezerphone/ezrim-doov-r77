.class final Lcom/jelly/mods/qsrow/Registry;
.super Ljava/lang/Object;
.source "Registry.java"


# static fields
.field static final boards:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Lcom/jelly/mods/qsrow/Board;",
            ">;"
        }
    .end annotation
.end field

.field static final byIndicator:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Lcom/jelly/mods/qsrow/Board;",
            ">;"
        }
    .end annotation
.end field

.field static final byLayout:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Lcom/jelly/mods/qsrow/Board;",
            ">;"
        }
    .end annotation
.end field

.field static panelActive:Z

.field static final rows:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Lcom/jelly/mods/qsrow/Row;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 10
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/jelly/mods/qsrow/Registry;->rows:Ljava/util/Map;

    .line 12
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/jelly/mods/qsrow/Registry;->boards:Ljava/util/Map;

    .line 14
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/jelly/mods/qsrow/Registry;->byLayout:Ljava/util/Map;

    .line 16
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/jelly/mods/qsrow/Registry;->byIndicator:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
