.class public Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;
.super Ljava/lang/Object;


# instance fields
.field public args:[Ljava/lang/Object;

.field public result:Ljava/lang/Object;

.field public returnEarly:Z

.field public thisObject:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public setResult(Ljava/lang/Object;)V
    .registers 3

    iput-object p1, p0, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->result:Ljava/lang/Object;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;->returnEarly:Z

    return-void
.end method
