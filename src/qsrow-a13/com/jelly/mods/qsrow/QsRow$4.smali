.class Lcom/jelly/mods/qsrow/QsRow$4;
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

    .line 103
    iput-object p1, p0, Lcom/jelly/mods/qsrow/QsRow$4;->this$0:Lcom/jelly/mods/qsrow/QsRow;

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

    .line 106
    iget-object v0, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    iget-object p0, p0, Lcom/jelly/mods/qsrow/QsRow$4;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    iget-object v1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->thisObject:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    iget-object p1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v2, 0x0

    aget-object p1, p1, v2

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    # invokes: Lcom/jelly/mods/qsrow/QsRow;->prepare(Landroid/view/View;I)I
    invoke-static {p0, v1, p1}, Lcom/jelly/mods/qsrow/QsRow;->access$200(Lcom/jelly/mods/qsrow/QsRow;Landroid/view/View;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    aput-object p0, v0, v2

    return-void
.end method
