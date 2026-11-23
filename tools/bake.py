#!/usr/bin/env python3
"""bake.py — static "Xposed-style" hook baking for smali.

For a method  C.name(desc)ret  it:
  * renames the original body to a private  name$bk(desc)ret
  * adds a wrapper with the original name/flags that calls
        Bake.before(this, "<fqcn>#name", args[])  -> may change args / return early
        name$bk(...)
        Bake.after(this, key, args[], boxedResult) -> may replace the result
This is the same contract the old (Android 13) SystemUI used for com.jelly.mods.qsrow.
The $bk copy is private and called with invoke-direct/static, so a baked method in a
subclass can never recurse into a baked method of its parent.
"""
import re

BAKE = 'Lcom/jelly/mods/qsrow/Bake;'
MHP = 'Lcom/jelly/mods/qsrow/xp/XC_MethodHook$MethodHookParam;'
BOX = {
    'I': ('Ljava/lang/Integer;', 'intValue'), 'Z': ('Ljava/lang/Boolean;', 'booleanValue'),
    'F': ('Ljava/lang/Float;', 'floatValue'), 'J': ('Ljava/lang/Long;', 'longValue'),
    'D': ('Ljava/lang/Double;', 'doubleValue'), 'B': ('Ljava/lang/Byte;', 'byteValue'),
    'S': ('Ljava/lang/Short;', 'shortValue'), 'C': ('Ljava/lang/Character;', 'charValue'),
}


def split_desc(desc):
    out, i = [], 0
    while i < len(desc):
        j = i
        while desc[j] == '[':
            j += 1
        if desc[j] == 'L':
            j = desc.index(';', j)
        out.append(desc[i:j + 1]); i = j + 1
    return out


def wide(t):
    return t in ('J', 'D')


def box(t, src):
    """smali lines boxing register(s) src into v1"""
    if t in BOX:
        regs = f'{src}, {src[0]}{int(src[1:]) + 1}' if wide(t) else src
        return [f'invoke-static {{{regs}}}, {BOX[t][0]}->valueOf({t}){BOX[t][0]}', 'move-result-object v1']
    return [f'move-object v1, {src}']


def unbox(t, dst):
    """smali lines unboxing v1 into register dst"""
    if t in BOX:
        mr = 'move-result-wide' if wide(t) else 'move-result'
        return [f'check-cast v1, {BOX[t][0]}', f'invoke-virtual {{v1}}, {BOX[t][0]}->{BOX[t][1]}(){t}', f'{mr} {dst}']
    return [f'check-cast v1, {t}', f'move-object {dst}, v1']


def bake(text, cls_desc, name, desc, key=None):
    """desc like '(II)V'. Returns new smali text."""
    fq = cls_desc[1:-1].replace('/', '.')
    key = key or f'{fq}#{name}'
    pat = re.compile(r'^\.method ([^\n]*?) ' + re.escape(name + desc) + r'\n', re.M)
    m = pat.search(text)
    if not m:
        raise SystemExit(f'bake: {cls_desc}->{name}{desc} not found')
    if re.search(r'^\.method [^\n]*\b' + re.escape(name + '$bk' + desc), text, re.M):
        raise SystemExit(f'bake: {name}{desc} already baked')
    flags = m.group(1).split()
    static = 'static' in flags
    bk_flags = [f for f in flags if f not in ('public', 'protected', 'private', 'bridge', 'synthetic')]
    bk_flags.insert(0, 'private')
    wr_flags = [f for f in flags if f not in ('declared-synchronized', 'bridge', 'synthetic')]
    text = text[:m.start()] + '.method ' + ' '.join(bk_flags) + ' ' + name + '$bk' + desc + '\n' + text[m.end():]

    params, ret = desc[1:desc.index(')')], desc[desc.index(')') + 1:]
    ptypes = split_desc(params)
    # parameter registers (p-numbering)
    preg, n = [], (0 if static else 1)
    for t in ptypes:
        preg.append(f'p{n}'); n += 2 if wide(t) else 1
    nparams = n
    locals_ = 8
    this = 'v7' if static else 'p0'
    L = []
    if static:
        L.append('const/4 v7, 0x0')
    L += [f'const/16 v0, {hex(len(ptypes))}', 'new-array v0, v0, [Ljava/lang/Object;']
    for i, (t, r) in enumerate(zip(ptypes, preg)):
        L += box(t, r) + [f'const/16 v2, {hex(i)}', 'aput-object v1, v0, v2']
    L += [f'const-string v1, "{key}"',
          f'invoke-static {{{this}, v1, v0}}, {BAKE}->before(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;){MHP}',
          'move-result-object v3', 'if-eqz v3, :bk_call']
    for i, (t, r) in enumerate(zip(ptypes, preg)):
        L += [f'const/16 v2, {hex(i)}', 'aget-object v1, v0, v2'] + unbox(t, r)
    L += [f'iget-boolean v1, v3, {MHP}->returnEarly:Z', 'if-eqz v1, :bk_call']
    if ret == 'V':
        L += ['return-void']
    else:
        L += [f'iget-object v1, v3, {MHP}->result:Ljava/lang/Object;'] + unbox(ret, 'v4')
        L += ['return-wide v4' if wide(ret) else ('return v4' if ret in BOX else 'return-object v4')]
    L += [':bk_call']
    kind = 'invoke-static' if static else 'invoke-direct'
    if nparams == 0:
        L.append(f'{kind} {{}}, {cls_desc}->{name}$bk{desc}')
    else:
        L.append(f'{kind}/range {{p0 .. p{nparams - 1}}}, {cls_desc}->{name}$bk{desc}')
    if ret == 'V':
        L.append('const/4 v6, 0x0')
    else:
        L.append('move-result-wide v4' if wide(ret) else ('move-result v4' if ret in BOX else 'move-result-object v4'))
        L += box(ret, 'v4') + ['move-object v6, v1']
    L += [f'const-string v1, "{key}"',
          f'invoke-static {{{this}, v1, v0, v6}}, {BAKE}->after(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Object;Ljava/lang/Object;){MHP}',
          'move-result-object v3', 'if-eqz v3, :bk_ret',
          f'iget-boolean v1, v3, {MHP}->returnEarly:Z', 'if-eqz v1, :bk_ret']
    if ret != 'V':
        L += [f'iget-object v1, v3, {MHP}->result:Ljava/lang/Object;'] + unbox(ret, 'v4')
    L += [':bk_ret']
    L += ['return-void' if ret == 'V' else ('return-wide v4' if wide(ret) else ('return v4' if ret in BOX else 'return-object v4'))]
    wrapper = ('.method ' + ' '.join(wr_flags) + ' ' + name + desc + '\n'
               f'    .locals {locals_}\n\n' + ''.join('    ' + l + '\n' for l in L) + '.end method\n\n')
    # insert wrapper right before the renamed method
    pos = text.index('.method ' + ' '.join(bk_flags) + ' ' + name + '$bk' + desc)
    return text[:pos] + wrapper + text[pos:]
