.class Lcom/jelly/mods/qsrow/QsRow$7;
.super Lcom/jelly/mods/qsrow/SafeHook;
.source "QsRow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/jelly/mods/qsrow/QsRow;->install()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/jelly/mods/qsrow/QsRow;


# direct methods
.method constructor <init>(Lcom/jelly/mods/qsrow/QsRow;)V
    .registers 2

    .line 136
    iput-object p1, p0, Lcom/jelly/mods/qsrow/QsRow$7;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    invoke-direct {p0}, Lcom/jelly/mods/qsrow/SafeHook;-><init>()V

    return-void
.end method


# virtual methods
.method before(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 139
    iget-object v0, p0, Lcom/jelly/mods/qsrow/QsRow$7;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    # getter for: Lcom/jelly/mods/qsrow/QsRow;->cQqsPanel:Ljava/lang/Class;
    invoke-static {v0}, Lcom/jelly/mods/qsrow/QsRow;->access$600(Lcom/jelly/mods/qsrow/QsRow;)Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    iget-object p0, p0, Lcom/jelly/mods/qsrow/QsRow$7;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    iget-object p1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    # invokes: Lcom/jelly/mods/qsrow/QsRow;->ensureWrapped(Ljava/lang/Object;)V
    invoke-static {p0, p1}, Lcom/jelly/mods/qsrow/QsRow;->access$700(Lcom/jelly/mods/qsrow/QsRow;Ljava/lang/Object;)V

    :cond_15
    return-void
.end method
