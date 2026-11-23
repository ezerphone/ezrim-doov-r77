.class Lcom/jelly/mods/qsrow/QsRow$1;
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

    .line 82
    iput-object p1, p0, Lcom/jelly/mods/qsrow/QsRow$1;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    invoke-direct {p0}, Lcom/jelly/mods/qsrow/SafeHook;-><init>()V

    return-void
.end method


# virtual methods
.method after(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 85
    iget-object p0, p0, Lcom/jelly/mods/qsrow/QsRow$1;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    # getter for: Lcom/jelly/mods/qsrow/QsRow;->fMaxTiles:Ljava/lang/reflect/Field;
    invoke-static {p0}, Lcom/jelly/mods/qsrow/QsRow;->access$000(Lcom/jelly/mods/qsrow/QsRow;)Ljava/lang/reflect/Field;

    move-result-object p0

    iget-object p1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    const/16 v0, 0x3e8

    invoke-virtual {p0, p1, v0}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    return-void
.end method
