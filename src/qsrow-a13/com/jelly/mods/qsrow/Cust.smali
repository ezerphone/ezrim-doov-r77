.class public final Lcom/jelly/mods/qsrow/Cust;
.super Ljava/lang/Object;


# direct methods
.method public static bind(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 14

    :try_start_0
    invoke-static {}, Lcom/jelly/mods/qsrow/Bake;->full()Z

    move-result v0

    if-eqz v0, :cond_5e

    check-cast p0, Lcom/android/systemui/qs/customize/TileAdapter$Holder;

    check-cast p1, Lcom/android/systemui/qs/customize/TileAdapter;

    iget-object v0, p0, Lcom/android/systemui/qs/customize/TileAdapter$Holder;->mTileView:Lcom/android/systemui/qs/tileimpl/QSTileViewImpl;

    if-eqz v0, :cond_5e

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v3, p1, Lcom/android/systemui/qs/customize/TileAdapter;->mRecyclerView:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v3, :cond_23

    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    move-result v4

    if-lez v4, :cond_23

    move v2, v4

    :cond_23
    iget v4, p1, Lcom/android/systemui/qs/customize/TileAdapter;->mNumColumns:I

    if-gtz v4, :cond_28

    const/4 v4, 0x1

    :cond_28
    div-int v5, v2, v4

    mul-int/lit8 v6, v5, 0x48

    div-int/lit8 v6, v6, 0x64

    mul-int/lit8 v7, v6, 0x2c

    div-int/lit8 v7, v7, 0x64

    const-class v8, Lcom/jelly/mods/qsrow/Bake;

    invoke-virtual {v8}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v8

    invoke-static {v8}, Lcom/jelly/mods/qsrow/Tiles;->get(Ljava/lang/ClassLoader;)Lcom/jelly/mods/qsrow/Tiles;

    move-result-object v8

    const/high16 v9, 0x41300000    # 11.0f

    invoke-virtual {v8, v0, v6, v7, v9}, Lcom/jelly/mods/qsrow/Tiles;->circleLabel(Landroid/view/View;IIF)V

    invoke-virtual {v8, v0}, Lcom/jelly/mods/qsrow/Tiles;->insetBackground(Landroid/view/View;)V

    sget-object v9, Lcom/jelly/mods/qsrow/Cust$L;->I:Lcom/jelly/mods/qsrow/Cust$L;

    invoke-virtual {v0, v9}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    invoke-virtual {v0, v9}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object v9, p0, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v10

    if-eqz v10, :cond_5e

    iget v11, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    const/4 v1, -0x2

    if-eq v11, v1, :cond_5e

    iput v1, v10, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v9, v10}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_5e
    return-void
    :try_end_5f
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_5f} :catch_5f

    :catch_5f
    move-exception v0

    invoke-static {v0}, Lcom/jelly/mods/qsrow/xp/XposedBridge;->log(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static cols(I)I
    .registers 2

    invoke-static {}, Lcom/jelly/mods/qsrow/Bake;->full()Z

    move-result v0

    if-nez v0, :cond_7

    return p0

    :cond_7
    const/4 v0, 0x5

    return v0
.end method
