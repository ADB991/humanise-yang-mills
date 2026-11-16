#!/usr/bin/env python3
"""Verify reviewed blobs and source identity, not theorem correctness."""
import hashlib, json, subprocess
from pathlib import Path
root = Path(subprocess.check_output(['git','rev-parse','--show-toplevel'],text=True).strip())
m = json.loads(Path(__file__).with_name('frozen-inputs.json').read_text())
def git(*args): return subprocess.check_output(['git',*args],cwd=root)
assert git('diff','--name-only',m['base'],m['target']).decode().splitlines() == m['changed_files']
manifest = {}
for line in (root/'Lean/SOURCES.sha256').read_text().splitlines():
    parts=line.split(maxsplit=1)
    if len(parts)==2: manifest[parts[1].lstrip('*').removeprefix('./')]=parts[0]
count=0
for row in m['inputs']:
    p=row['path']; blob=git('show',row['commit']+':'+p)
    assert hashlib.sha256(blob).hexdigest()==row['sha256'],p
    if p.startswith('Lean/'):
        assert (root/p).read_bytes()==blob,p
        assert manifest[p[5:]]==row['sha256'],p
        count+=1
assert git('diff',m['base'],'--','Lean','source')==b''
assert git('rev-parse',m['base']+':Lean')==git('rev-parse',m['target']+':Lean')
print(f"PASS {len(m['inputs'])} frozen versions; {len(m['changed_files'])} target files; {count} source-manifest hashes; source identity")
