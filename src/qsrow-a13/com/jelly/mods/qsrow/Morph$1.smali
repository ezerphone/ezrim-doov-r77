.class Lcom/jelly/mods/qsrow/Morph$1;
.super Lcom/jelly/mods/qsrow/SafeHook;
.source "Morph.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jelly/mods/qsrow/Morph;->install(Ljava/lang/ClassLoader;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$cQqsLayout:Ljava/lang/Class;


# direct methods
.method constructor <init>(Ljava/lang/Class;)V
    .registers 2

    .line 40
    iput-object p1, p0, Lcom/jelly/mods/qsrow/Morph$1;->val$cQqsLayout:Ljava/lang/Class;

    invoke-direct {p0}, Lcom/jelly/mods/qsrow/SafeHook;-><init>()V

    return-void
.end method


# virtual methods
.method after(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 3

    .line 43
    # getter for: Lcom/jelly/mods/qsrow/Morph;->building:I
    invoke-static {}, Lcom/jelly/mods/qsrow/Morph;->access$000()I

    move-result v0

    if-lez v0, :cond_18

    iget-object p0, p0, Lcom/jelly/mods/qsrow/Morph$1;->val$cQqsLayout:Ljava/lang/Class;

    iget-object v0, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_18

    const/4 p0, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->setResult(Ljava/lang/Object;)V

    :cond_18
    return-void
.end method
