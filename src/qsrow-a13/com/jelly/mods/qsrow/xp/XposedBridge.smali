.class public final Lcom/jelly/mods/qsrow/xp/XposedBridge;
.super Ljava/lang/Object;


# static fields
.field public static final hooks:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hooks:Ljava/util/HashMap;

    return-void
.end method

.method static add(Ljava/lang/String;Ljava/lang/String;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)V
    .registers 6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/jelly/mods/qsrow/xp/XposedBridge;->hooks:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    if-nez v2, :cond_26

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_26
    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static deoptimizeMethod(Ljava/lang/reflect/Member;)V
    .registers 1

    return-void
.end method

.method public static hookAllConstructors(Ljava/lang/Class;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Ljava/util/Set;
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "<init>"

    invoke-static {v0, v1, p1}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->add(Ljava/lang/String;Ljava/lang/String;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method public static hookMethod(Ljava/lang/reflect/Member;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;
    .registers 4

    invoke-interface {p0}, Ljava/lang/reflect/Member;->getDeclaringClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p0}, Ljava/lang/reflect/Member;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->add(Ljava/lang/String;Ljava/lang/String;Lcom/jelly/mods/qsrow/xp/XC_MethodHook;)V

    new-instance v0, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;

    invoke-direct {v0}, Lcom/jelly/mods/qsrow/xp/XC_MethodHook$Unhook;-><init>()V

    return-object v0
.end method

.method public static log(Ljava/lang/String;)V
    .registers 2

    const-string v0, "QsRowBake"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public static log(Ljava/lang/Throwable;)V
    .registers 3

    const-string v0, "QsRowBake"

    const-string v1, "error"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
