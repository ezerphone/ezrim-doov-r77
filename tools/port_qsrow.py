#!/usr/bin/env python3
"""port_qsrow.py SRC_DIR DST_DIR
Copies com/jelly/mods/qsrow smali (from the Android 13 SystemUI) and applies the Android 14 fixes."""
import os, shutil, sys

src, dst = sys.argv[1:3]
if os.path.exists(dst):
    shutil.rmtree(dst)
shutil.copytree(src, dst)


def edit(name, old, new, count=1):
    p = os.path.join(dst, name)
    s = open(p, encoding='utf-8').read()
    if s.count(old) != count:
        raise SystemExit(f'{name}: expected {count}x {old!r}, found {s.count(old)}')
    open(p, 'w', encoding='utf-8').write(s.replace(old, new))


# A14 TileLayout: mMaxCellHeight -> cell height = max(mResourceCellHeight, mEstimatedCellHeight)
edit('QsRow.smali', 'const-string v5, "mMaxCellHeight"', 'const-string v5, "mResourceCellHeight"')
edit('QsRow.smali',
     '    iget-object p2, p0, Lcom/jelly/mods/qsrow/QsRow;->fMaxCellHeight:Ljava/lang/reflect/Field;\n\n'
     '    invoke-virtual {p2, p1, p3}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V\n',
     '    iget-object p2, p0, Lcom/jelly/mods/qsrow/QsRow;->fMaxCellHeight:Ljava/lang/reflect/Field;\n\n'
     '    invoke-virtual {p2, p1, p3}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V\n\n'
     '    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;\n\n'
     '    move-result-object p2\n\n'
     '    const-string v0, "mEstimatedCellHeight"\n\n'
     '    invoke-static {p2, v0}, Lcom/jelly/mods/qsrow/Refl;->field(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;\n\n'
     '    move-result-object p2\n\n'
     '    invoke-virtual {p2, p1, p3}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V\n')
# A14 QSAnimator: createSecondaryPageAnimators(I) was inlined into addNonFirstPageAnimators(I)
edit('Morph.smali', 'const-string v6, "createSecondaryPageAnimators"', 'const-string v6, "addNonFirstPageAnimators"')
# A14: QSPanelControllerBase.mHost is a QSHost (QSTileHost or QSHostAdapter); createTileView is on the interface
edit('Api.smali', 'const-string v4, "QSTileHost"', 'const-string v4, "QSHost"')
print('port_qsrow: ok')
