#!/usr/bin/env python3
"""Verify before/after chapter and imported-source identities only."""
import hashlib,json,subprocess
from pathlib import Path
root=Path(subprocess.check_output(['git','rev-parse','--show-toplevel'],text=True).strip())
m=json.loads(Path(__file__).with_name('fingerprints.json').read_text())
manifest={}
for line in (root/'Lean/SOURCES.sha256').read_text().splitlines():
    p=line.split(maxsplit=1)
    if len(p)==2: manifest[p[1].lstrip('*').removeprefix('./')]=p[0]
count=0
for row in m['inputs']:
    p=row['path']; blob=(root/p).read_bytes() if row['commit']=='WORKTREE' else subprocess.check_output(['git','show',row['commit']+':'+p],cwd=root)
    assert hashlib.sha256(blob).hexdigest()==row['sha256'],p
    if p.startswith('Lean/'):
        assert (root/p).read_bytes()==blob,p
        assert manifest[p[5:]]==row['sha256'],p
        count+=1
assert subprocess.check_output(['git','diff',m['base'],'--','Lean','source'],cwd=root)==b''
print(f"PASS {len(m['inputs'])} before/after/frozen versions; {count} source-manifest hashes; unchanged Lean/source diff")
