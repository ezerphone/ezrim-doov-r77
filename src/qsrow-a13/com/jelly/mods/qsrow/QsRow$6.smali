.class Lcom/jelly/mods/qsrow/QsRow$6;
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

    .line 126
    iput-object p1, p0, Lcom/jelly/mods/qsrow/QsRow$6;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    invoke-direct {p0}, Lcom/jelly/mods/qsrow/SafeHook;-><init>()V

    return-void
.end method


# virtual methods
.method before(Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;)V
    .registers 5

    .line 129
    iget-object v0, p0, Lcom/jelly/mods/qsrow/QsRow$6;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    # getter for: Lcom/jelly/mods/qsrow/QsRow;->cQqsLayout:Ljava/lang/Class;
    invoke-static {v0}, Lcom/jelly/mods/qsrow/QsRow;->access$300(Lcom/jelly/mods/qsrow/QsRow;)Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12

    return-void

    .line 130
    :cond_12
    iget-object v0, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    aget-object v0, v0, v2

    check-cast v0, Landroid/view/View;

    .line 131
    iget-object p0, p0, Lcom/jelly/mods/qsrow/QsRow$6;->this$0:Lcom/jelly/mods/qsrow/QsRow;

    # invokes: Lcom/jelly/mods/qsrow/QsRow;->rowFor(Landroid/view/View;)Lcom/jelly/mods/qsrow/Row;
    invoke-static {p0, v0}, Lcom/jelly/mods/qsrow/QsRow;->access$500(Lcom/jelly/mods/qsrow/QsRow;Landroid/view/View;)Lcom/jelly/mods/qsrow/Row;

    move-result-object p0

    .line 132
    invoke-virtual {p0, v0}, Lcom/jelly/mods/qsrow/Row;->adopt(Landroid/view/View;)V

    .line 133
    iget-object p1, p1, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->args:[Ljava/lang/Object;

    aput-object p0, p1, v2

    return-void
.end method
