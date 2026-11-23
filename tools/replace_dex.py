#!/usr/bin/env python3
"""replace_dex.py base.apk out.apk classes.dex [classes2.dex ...]
Writes base.apk with the given dex files swapped in (same entry order, same compression)."""
import sys, zipfile, os

base, out, *dexes = sys.argv[1:]
repl = {os.path.basename(d): open(d, 'rb').read() for d in dexes}
zi_in = zipfile.ZipFile(base)
with zipfile.ZipFile(out, 'w') as zo:
    for zi in zi_in.infolist():
        data = repl.pop(zi.filename, None)
        if data is None:
            data = zi_in.read(zi.filename)
        ni = zipfile.ZipInfo(zi.filename, zi.date_time)
        ni.compress_type, ni.external_attr, ni.create_system = zi.compress_type, zi.external_attr, zi.create_system
        zo.writestr(ni, data)
if repl:
    raise SystemExit(f'not in base apk: {list(repl)}')
print('replace_dex: ok')
