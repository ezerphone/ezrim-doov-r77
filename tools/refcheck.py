#!/usr/bin/env python3
"""refcheck.py TREE_DIR [TREE_DIR...] -- SRC_SUBDIR...
Checks that every reference into com/android/systemui or com/jelly made from SRC files
resolves to a class/field/method defined in the trees (walking superclasses inside the trees)."""
import re, glob, os, sys

i = sys.argv.index('--')
trees, srcs = sys.argv[1:i], sys.argv[i + 1:]
classes = {}
for t in trees:
    for f in glob.glob(f'{t}/**/*.smali', recursive=True):
        s = open(f, encoding='utf-8').read()
        name = re.search(r'^\.class [^\n]*?(L[^;]+;)', s, re.M).group(1)
        sup = re.search(r'^\.super (L[^;]+;)', s, re.M)
        ifs = re.findall(r'^\.implements (L[^;]+;)', s, re.M)
        fields = set(re.findall(r'^\.field [^\n]*? ([\w$]+:[^\s=]+)', s, re.M))
        meths = set(re.findall(r'^\.method [^\n]*? ([\w$<>]+\([^\n]*)$', s, re.M))
        classes[name] = (sup.group(1) if sup else None, ifs, fields, meths)


def has(c, kind, mem, seen=None):
    seen = seen or set()
    if c in seen:
        return False
    seen.add(c)
    if c not in classes:
        return None  # framework / outside: cannot check
    sup, ifs, fs, ms = classes[c]
    if mem in (fs if kind == 'f' else ms):
        return True
    for p in [sup] + ifs:
        if p:
            r = has(p, kind, mem, seen)
            if r is not False:
                return r
    return False


refs = set()
pat = re.compile(r'(L(?:com/android/systemui|com/jelly)/[^;\s]+;)->([\w$<>]+)(\([^)]*\)\S+|:\S+)')
cpat = re.compile(r'(?:check-cast|instance-of|new-instance|const-class)[^\n]*?(L(?:com/android/systemui|com/jelly)/[^;\s]+;)')
for sdir in srcs:
    for f in glob.glob(f'{sdir}/**/*.smali', recursive=True):
        s = open(f, encoding='utf-8').read()
        refs |= {g + (f,) for g in pat.findall(s)}
        refs |= {(c, '', '', f) for c in cpat.findall(s)}
bad = 0
for c, n, t, f in sorted(refs):
    if not n:
        if c not in classes:
            print('MISSING CLASS', c, 'from', f); bad += 1
        continue
    r = has(c, 'f' if t.startswith(':') else 'm', n + t)
    if r is False or (r is None and c not in classes):
        print('MISSING', c + '->' + n + t, 'from', os.path.basename(f)); bad += 1
print('refs', len(refs), 'bad', bad)
sys.exit(1 if bad else 0)
