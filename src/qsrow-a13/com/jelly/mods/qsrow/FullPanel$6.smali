.class Lcom/jelly/mods/qsrow/FullPanel$6;
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

    .line 105
    iput-object p1, p0, Lcom/jelly/mods/qsrow/FullPanel$6;->this$0:Lcom/jelly/mods/qsrow/FullPanel;

    invoke-direct {p0}, Lcom/jelly/mods/qsrow/SafeHook;-><init>()V

    return-void
.end method


# virtual methods
.method before(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 108
    iget-object v0, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    iget-object p0, p0, Lcom/jelly/mods/qsrow/FullPanel$6;->this$0:Lcom/jelly/mods/qsrow/FullPanel;

    # getter for: Lcom/jelly/mods/qsrow/FullPanel;->tiles:Lcom/jelly/mods/qsrow/Tiles;
    invoke-static {p0}, Lcom/jelly/mods/qsrow/FullPanel;->access$400(Lcom/jelly/mods/qsrow/FullPanel;)Lcom/jelly/mods/qsrow/Tiles;

    move-result-object p0

    iget-object v1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    iget-object p1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v2, 0x0

    aget-object p1, p1, v2

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, v1, p1}, Lcom/jelly/mods/qsrow/Tiles;->labelColor(Ljava/lang/Object;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v0, v2

    return-void
.end method
