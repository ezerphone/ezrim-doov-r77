.class final Lcom/jelly/mods/qsrow/Api;
.super Ljava/lang/Object;
.source "Api.java"


# instance fields
.field private final addCallback:Ljava/lang/reflect/Method;

.field private final cCallback:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private final createTileView:Ljava/lang/reflect/Method;

.field private final getTileSpec:Ljava/lang/reflect/Method;

.field private final init:Ljava/lang/reflect/Method;

.field private final onStateChanged:Ljava/lang/reflect/Method;

.field private final refreshState:Ljava/lang/reflect/Method;

.field private final removeCallback:Ljava/lang/reflect/Method;

.field private final setListening:Ljava/lang/reflect/Method;

.field private final setLocation:Ljava/lang/reflect/Method;

.field private final setNumPages:Ljava/lang/reflect/Method;


# direct methods
.method constructor <init>(Ljava/lang/ClassLoader;)V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "com.android.systemui.plugins.qs.QSTile"

    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "com.android.systemui.plugins.qs.QSTile$State"

    .line 17
    invoke-virtual {p1, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "com.android.systemui.plugins.qs.QSTileView"

    .line 18
    invoke-virtual {p1, v2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "com.android.systemui.plugins.qs.QSTile$Callback"

    .line 19
    invoke-virtual {p1, v3}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    iput-object v3, p0, Lcom/jelly/mods/qsrow/Api;->cCallback:Ljava/lang/Class;

    const-string v4, "QSTileHost"

    .line 20
    invoke-static {p1, v4}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-class v5, Landroid/content/Context;

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v5, v0, v6}, [Ljava/lang/Class;

    move-result-object v5

    const-string v6, "createTileView"

    invoke-virtual {v4, v6, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    iput-object v4, p0, Lcom/jelly/mods/qsrow/Api;->createTileView:Ljava/lang/reflect/Method;

    const-string v4, "init"

    .line 21
    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    iput-object v4, p0, Lcom/jelly/mods/qsrow/Api;->init:Ljava/lang/reflect/Method;

    const-string v4, "onStateChanged"

    .line 22
    filled-new-array {v1}, [Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v2, v4, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lcom/jelly/mods/qsrow/Api;->onStateChanged:Ljava/lang/reflect/Method;

    const-string v1, "addCallback"

    .line 23
    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lcom/jelly/mods/qsrow/Api;->addCallback:Ljava/lang/reflect/Method;

    const-string v1, "removeCallback"

    .line 24
    filled-new-array {v3}, [Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lcom/jelly/mods/qsrow/Api;->removeCallback:Ljava/lang/reflect/Method;

    .line 25
    const-class v1, Ljava/lang/Object;

    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    filled-new-array {v1, v2}, [Ljava/lang/Class;

    move-result-object v1

    const-string v2, "setListening"

    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lcom/jelly/mods/qsrow/Api;->setListening:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    const-string v3, "refreshState"

    .line 26
    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    iput-object v2, p0, Lcom/jelly/mods/qsrow/Api;->refreshState:Ljava/lang/reflect/Method;

    const-string v2, "getTileSpec"

    new-array v1, v1, [Ljava/lang/Class;

    .line 27
    invoke-virtual {v0, v2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/jelly/mods/qsrow/Api;->getTileSpec:Ljava/lang/reflect/Method;

    const-string v0, "PageIndicator"

    .line 28
    invoke-static {p1, v0}, Lcom/jelly/mods/qsrow/Refl;->qs(Ljava/lang/ClassLoader;Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    .line 29
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    const-string v1, "setNumPages"

    invoke-virtual {p1, v1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iput-object v0, p0, Lcom/jelly/mods/qsrow/Api;->setNumPages:Ljava/lang/reflect/Method;

    .line 30
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    filled-new-array {v0}, [Ljava/lang/Class;

    move-result-object v0

    const-string v1, "setLocation"

    invoke-virtual {p1, v1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    iput-object p1, p0, Lcom/jelly/mods/qsrow/Api;->setLocation:Ljava/lang/reflect/Method;

    return-void
.end method

.method static synthetic lambda$callback$0(Ljava/util/function/Consumer;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 43
    invoke-virtual {p2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, -0x1

    sparse-switch v0, :sswitch_data_60

    goto :goto_3d

    :sswitch_12
    const-string v0, "hashCode"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1b

    goto :goto_3d

    :cond_1b
    const/4 v3, 0x3

    goto :goto_3d

    :sswitch_1d
    const-string v0, "equals"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_26

    goto :goto_3d

    :cond_26
    const/4 v3, 0x2

    goto :goto_3d

    :sswitch_28
    const-string v0, "onStateChanged"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_31

    goto :goto_3d

    :cond_31
    move v3, v1

    goto :goto_3d

    :sswitch_33
    const-string v0, "toString"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3c

    goto :goto_3d

    :cond_3c
    move v3, v2

    :goto_3d
    const/4 p2, 0x0

    packed-switch v3, :pswitch_data_72

    return-object p2

    .line 50
    :pswitch_42
    invoke-static {p1}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    .line 48
    :pswitch_4b
    aget-object p0, p3, v2

    if-ne p1, p0, :cond_50

    goto :goto_51

    :cond_50
    move v1, v2

    :goto_51
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    .line 45
    :pswitch_56
    aget-object p1, p3, v2

    invoke-interface {p0, p1}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    return-object p2

    :pswitch_5c
    const-string p0, "QsRow.Callback"

    return-object p0

    nop

    :sswitch_data_60
    .sparse-switch
        -0x69e9ad94 -> :sswitch_33
        -0x545e539e -> :sswitch_28
        -0x4d378041 -> :sswitch_1d
        0x8cdac1b -> :sswitch_12
    .end sparse-switch

    :pswitch_data_72
    .packed-switch 0x0
        :pswitch_5c
        :pswitch_56
        :pswitch_4b
        :pswitch_42
    .end packed-switch
.end method


# virtual methods
.method addCallback(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 64
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Api;->addCallback:Ljava/lang/reflect/Method;

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method callback(Ljava/util/function/Consumer;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Ljava/lang/Object;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Api;->cCallback:Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    iget-object p0, p0, Lcom/jelly/mods/qsrow/Api;->cCallback:Ljava/lang/Class;

    filled-new-array {p0}, [Ljava/lang/Class;

    move-result-object p0

    new-instance v1, Lcom/jelly/mods/qsrow/Api$$ExternalSyntheticLambda0;

    invoke-direct {v1, p1}, Lcom/jelly/mods/qsrow/Api$$ExternalSyntheticLambda0;-><init>(Ljava/util/function/Consumer;)V

    invoke-static {v0, p0, v1}, Ljava/lang/reflect/Proxy;->newProxyInstance(Ljava/lang/ClassLoader;[Ljava/lang/Class;Ljava/lang/reflect/InvocationHandler;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method newTileView(Ljava/lang/Object;Landroid/content/Context;Ljava/lang/Object;)Landroid/view/View;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 35
    iget-object v0, p0, Lcom/jelly/mods/qsrow/Api;->createTileView:Ljava/lang/reflect/Method;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    filled-new-array {p2, p3, v1}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    .line 36
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Api;->init:Ljava/lang/reflect/Method;

    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-object p1
.end method

.method refresh(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 76
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Api;->refreshState:Ljava/lang/reflect/Method;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p0, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method removeCallback(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 68
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Api;->removeCallback:Ljava/lang/reflect/Method;

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method setListening(Ljava/lang/Object;Ljava/lang/Object;Z)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 72
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Api;->setListening:Ljava/lang/reflect/Method;

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    filled-new-array {p2, p3}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method setLocation(Landroid/view/View;F)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 92
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Api;->setLocation:Ljava/lang/reflect/Method;

    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method setNumPages(Landroid/view/View;I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 88
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Api;->setNumPages:Ljava/lang/reflect/Method;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method showState(Landroid/view/View;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 60
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Api;->onStateChanged:Ljava/lang/reflect/Method;

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method spec(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    .line 81
    :try_start_0
    iget-object p0, p0, Lcom/jelly/mods/qsrow/Api;->getTileSpec:Ljava/lang/reflect/Method;

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p0, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_b
    .catchall {:try_start_0 .. :try_end_b} :catchall_c

    return-object p0

    :catchall_c
    const-string p0, ""

    return-object p0
.end method
