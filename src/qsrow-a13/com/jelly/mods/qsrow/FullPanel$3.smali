.class Lcom/jelly/mods/qsrow/FullPanel$3;
.super Lcom/jelly/mods/qsrow/SafeHook;
.source "FullPanel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jelly/mods/qsrow/FullPanel;->install()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jelly/mods/qsrow/FullPanel;


# direct methods
.method constructor <init>(Lcom/jelly/mods/qsrow/FullPanel;)V
    .registers 2

    .line 84
    iput-object p1, p0, Lcom/jelly/mods/qsrow/FullPanel$3;->this$0:Lcom/jelly/mods/qsrow/FullPanel;

    invoke-direct {p0}, Lcom/jelly/mods/qsrow/SafeHook;-><init>()V

    return-void
.end method


# virtual methods
.method after(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 3

    .line 87
    sget-object p0, Lcom/jelly/mods/qsrow/Registry;->byLayout:Ljava/util/Map;

    iget-object v0, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->setResult(Ljava/lang/Object;)V

    :cond_12
    return-void
.end method
