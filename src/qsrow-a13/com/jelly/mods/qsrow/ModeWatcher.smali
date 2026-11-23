.class public final Lcom/jelly/mods/qsrow/ModeWatcher;
.super Landroid/database/ContentObserver;


# instance fields
.field private final ctx:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    iput-object p1, p0, Lcom/jelly/mods/qsrow/ModeWatcher;->ctx:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .registers 5

    iget-object v0, p0, Lcom/jelly/mods/qsrow/ModeWatcher;->ctx:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "qsrow_mode"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x2

    :cond_10
    sget v1, Lcom/jelly/mods/qsrow/Bake;->mode:I

    if-eq v0, v1, :cond_1b

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    :cond_1b
    return-void
.end method
