.class Lcom/jelly/mods/qsrow/QsRow$3;
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

    .line 94
    iput-object p1, p0, Lcom/jelly/mods/qsrow/QsRow$3;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    invoke-direct {p0}, Lcom/jelly/mods/qsrow/SafeHook;-><init>()V

    return-void
.end method


# virtual methods
.method before(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 97
    iget-object v0, p0, Lcom/jelly/mods/qsrow/QsRow$3;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    # getter for: Lcom/jelly/mods/qsrow/QsRow;->fCtrlView:Ljava/lang/reflect/Field;
    invoke-static {v0}, Lcom/jelly/mods/qsrow/QsRow;->access$100(Lcom/jelly/mods/qsrow/QsRow;)Ljava/lang/reflect/Field;

    move-result-object v0

    iget-object p1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_19

    .line 98
    iget-object p0, p0, Lcom/jelly/mods/qsrow/QsRow$3;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    # getter for: Lcom/jelly/mods/qsrow/QsRow;->fMaxTiles:Ljava/lang/reflect/Field;
    invoke-static {p0}, Lcom/jelly/mods/qsrow/QsRow;->access$000(Lcom/jelly/mods/qsrow/QsRow;)Ljava/lang/reflect/Field;

    move-result-object p0

    const/16 v0, 0x3e8

    invoke-virtual {p0, p1, v0}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    :cond_19
    return-void
.end method
