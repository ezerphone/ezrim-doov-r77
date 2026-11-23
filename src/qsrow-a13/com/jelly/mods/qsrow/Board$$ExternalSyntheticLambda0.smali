.class public final synthetic Lcom/jelly/mods/qsrow/Board$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/jelly/mods/qsrow/Board;

.field public final synthetic f$1:I


# direct methods
.method public synthetic constructor <init>(Lcom/jelly/mods/qsrow/Board;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/jelly/mods/qsrow/Board$$ExternalSyntheticLambda0;->f$0:Lcom/jelly/mods/qsrow/Board;

    iput p2, p0, Lcom/jelly/mods/qsrow/Board$$ExternalSyntheticLambda0;->f$1:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    iget-object v0, p0, Lcom/jelly/mods/qsrow/Board$$ExternalSyntheticLambda0;->f$0:Lcom/jelly/mods/qsrow/Board;

    iget p0, p0, Lcom/jelly/mods/qsrow/Board$$ExternalSyntheticLambda0;->f$1:I

    invoke-virtual {v0, p0}, Lcom/jelly/mods/qsrow/Board;->lambda$showPages$0$com-jelly-mods-qsrow-Board(I)V

    return-void
.end method
