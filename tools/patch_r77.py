#!/usr/bin/env python3
"""patch_r77.py CLASSES_SMALI CLASSES2_SMALI QSROW_SRC HDATE_SMALI

Applies the qsrow ("שורת עיגולים") bake + Hebrew lock date to baksmali output of the
Doov R77 (Android 14) MtkSystemUI.  Fails loudly if any anchor is not found.
"""
import os, re, shutil, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from bake import bake

C1, C2, QSROW, HDATE = sys.argv[1:5]
QS = 'com/android/systemui/qs/'


def path(rel):
    return os.path.join(C1, rel + '.smali')


def rd(rel):
    return open(path(rel), encoding='utf-8').read()


def wr(rel, s):
    open(path(rel), 'w', encoding='utf-8').write(s)


def method_span(s, sig):
    m = re.search(r'^\.method [^\n]* ' + re.escape(sig) + r'\n', s, re.M)
    if not m:
        raise SystemExit(f'method {sig} not found')
    e = s.index('.end method', m.end())
    return m.start(), e


def sub_in_method(s, sig, old, new, count=1):
    a, b = method_span(s, sig)
    body = s[a:b]
    n = body.count(old)
    if n != count:
        raise SystemExit(f'{sig}: expected {count}x {old!r}, found {n}')
    return s[:a] + body.replace(old, new) + s[b:]


def L(rel):
    return 'L' + rel + ';'


# ---------------------------------------------------------------- 1. new methods that R8 inlined away
# QuickQSPanel.setMaxTiles(I)V (inlined into the ctor and QuickQSPanelController.onConfigurationChanged)
s = rd(QS + 'QuickQSPanel')
s = s.rstrip('\n') + f'''

.method public setMaxTiles(I)V
    .locals 0

    iput p1, p0, {L(QS + 'QuickQSPanel')}->mMaxTiles:I

    return-void
.end method
'''
# constructor hook (XposedBridge.hookAllConstructors -> "QuickQSPanel#<init>")
s = sub_in_method(s, '<init>(Landroid/content/Context;Landroid/util/AttributeSet;)V',
                  f'    iput p1, p0, {L(QS + "QuickQSPanel")}->mMaxTiles:I\n',
                  f'    iput p1, p0, {L(QS + "QuickQSPanel")}->mMaxTiles:I\n\n'
                  '    invoke-static {p0}, Lcom/jelly/mods/qsrow/Bake;->afterInit(Ljava/lang/Object;)V\n')
wr(QS + 'QuickQSPanel', s)

s = rd(QS + 'QuickQSPanelController')
s = sub_in_method(s, 'onConfigurationChanged()V',
                  f'iput v0, v1, {L(QS + "QuickQSPanel")}->mMaxTiles:I',
                  f'invoke-virtual {{v1, v0}}, {L(QS + "QuickQSPanel")}->setMaxTiles(I)V')
wr(QS + 'QuickQSPanelController', s)

# QSTileViewImpl.setLabelColor(I)V (inlined into ctor, handleStateChanged, singleAnimator$1$1)
TV = QS + 'tileimpl/QSTileViewImpl'
LABEL = f'{L(TV)}->label:Landroid/widget/TextView;'


def reroute_label_color(s, tv_reg_ok=True):
    """iget-object R, X, label ... invoke-virtual {R, C}, TextView->setTextColor(I)V
       -> invoke-virtual {X, C}, QSTileViewImpl->setLabelColor(I)V"""
    n = 0
    out = []
    lines = s.split('\n')
    i = 0
    while i < len(lines):
        out.append(lines[i])
        m = re.match(r'\s*iget-object (\w+), (\w+), ' + re.escape(LABEL) + r'\s*$', lines[i])
        if m:
            r, x = m.groups()
            for j in range(i + 1, min(i + 16, len(lines))):
                mm = re.match(r'(\s*)invoke-virtual \{' + r + r', (\w+)\}, Landroid/widget/TextView;->setTextColor\(I\)V\s*$', lines[j])
                if mm:
                    out.extend(lines[i + 1:j])
                    out.append(f'{mm.group(1)}invoke-virtual {{{x}, {mm.group(2)}}}, {L(TV)}->setLabelColor(I)V')
                    i = j; n += 1
                    break
                if re.match(r'\s*(invoke|iput|return|goto)', lines[j]) and 'setTextColor' not in lines[j]:
                    break
        i += 1
    return '\n'.join(out), n


s = rd(TV)
s, n1 = reroute_label_color(s)
s = s.rstrip('\n') + f'''

.method public final setLabelColor(I)V
    .locals 1

    iget-object v0, p0, {LABEL}

    invoke-virtual {{v0, p1}}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method
'''
wr(TV, s)
s = rd(TV + '$singleAnimator$1$1')
s, n2 = reroute_label_color(s)
wr(TV + '$singleAnimator$1$1', s)
if (n1, n2) != (2, 1):
    raise SystemExit(f'label colour sites: QSTileViewImpl={n1} (want 2), singleAnimator={n2} (want 1)')

# ---------------------------------------------------------------- 2. bake hooks
BAKES = [
    ('PageIndicator', 'setNumPages', '(I)V'),
    ('PagedTileLayout', 'getTilesHeight', '()I'),
    # A13 createSecondaryPageAnimators(I) was inlined into addNonFirstPageAnimators(I) in A14
    ('QSAnimator', 'addNonFirstPageAnimators', '(I)V'),
    ('QSAnimator', 'setPosition', '(F)V'),
    ('QSAnimator', 'updateAnimators', '()V'),
    ('QSPanel', 'switchToParent', '(Landroid/view/View;Landroid/view/ViewGroup;ILjava/lang/String;)V'),
    ('QSPanel', 'onMeasure', '(II)V'),
    ('QSPanelControllerBase', 'setListening', '(Z)V'),
    ('QSPanelControllerBase', 'setTiles', '(Ljava/util/Collection;Z)V'),
    ('QuickQSPanel$QQSSideLabelTileLayout', 'onMeasure', '(II)V'),
    ('QuickQSPanel$QQSSideLabelTileLayout', 'updateResources', '()Z'),
    ('QuickQSPanel', 'setMaxTiles', '(I)V'),
    ('QuickQSPanelController', 'setTiles', '()V'),
    ('TileLayout', 'getNumVisibleTiles', '()I'),
    ('TileLayout', 'onLayout', '(ZIIII)V'),
    ('TileLayout', 'setMaxColumns', '(I)Z'),
    ('TileLayout', 'setSquishinessFraction', '(F)V'),
    ('tileimpl/QSTileViewImpl', 'setClickable', '(Z)V'),
    ('tileimpl/QSTileViewImpl', 'setLabelColor', '(I)V'),
]
for cls, name, desc in BAKES:
    rel = QS + cls
    wr(rel, bake(rd(rel), L(rel), name, desc))

# ---------------------------------------------------------------- 3. QS edit screen (TileAdapter) -> Cust
TA = QS + 'customize/TileAdapter'
CUST = 'Lcom/jelly/mods/qsrow/Cust;'
s = rd(TA)
s = sub_in_method(s, '<init>(Landroid/content/Context;Lcom/android/systemui/qs/QSHost;Lcom/android/internal/logging/UiEventLogger;)V',
                  f'    iput p2, p0, {L(TA)}->mNumColumns:I\n',
                  f'    invoke-static {{p2}}, {CUST}->cols(I)I\n\n    move-result p2\n\n    iput p2, p0, {L(TA)}->mNumColumns:I\n')
sig = 'onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V'
m = re.search(r'^\.method ([^\n]*?) ' + re.escape(sig) + r'\n', s, re.M)
s = (s[:m.start()] + f'''.method public final {sig}
    .locals 0

    invoke-direct {{p0, p1, p2}}, {L(TA)}->onBindViewHolder$bk(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V

    invoke-static {{p1, p0}}, {CUST}->bind(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method private final onBindViewHolder$bk(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
''' + s[m.end():])
wr(TA, s)

QC = QS + 'customize/QSCustomizerController$3'
s = rd(QC)
s = sub_in_method(s, 'onConfigChanged(Landroid/content/res/Configuration;)V',
                  f'    iget v2, p1, {L(TA)}->mNumColumns:I\n',
                  f'    invoke-static {{v1}}, {CUST}->cols(I)I\n\n    move-result v1\n\n    iget v2, p1, {L(TA)}->mNumColumns:I\n')
wr(QC, s)

# ---------------------------------------------------------------- 4. Hebrew date on the lock screen
KS = 'com/android/systemui/keyguard/KeyguardSliceProvider'
s = rd(KS)
s = sub_in_method(s, 'updateClockLocked()V',
                  '    invoke-virtual {v0, v1}, Landroid/icu/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;\n\n'
                  '    .line 38\n    move-result-object v0\n',
                  '    invoke-virtual {v0, v1}, Landroid/icu/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;\n\n'
                  '    .line 38\n    move-result-object v0\n\n'
                  '    invoke-virtual {p0}, Landroid/content/ContentProvider;->getContext()Landroid/content/Context;\n\n'
                  '    move-result-object v1\n\n'
                  '    invoke-static {v1, v0}, Lcom/android/systemui/HDate;->combine(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;\n\n'
                  '    move-result-object v0\n')
wr(KS, s)

# ---------------------------------------------------------------- 5. new classes go to classes2 (classes.dex is at 65.4k methods)
dst = os.path.join(C2, 'com/jelly/mods/qsrow')
if os.path.exists(dst):
    raise SystemExit('qsrow already present in classes2')
shutil.copytree(QSROW, dst)
os.makedirs(os.path.join(C2, 'com/android/systemui'), exist_ok=True)
shutil.copy(HDATE, os.path.join(C2, 'com/android/systemui/HDate.smali'))
print('patch_r77: ok')
