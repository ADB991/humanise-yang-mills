#!/usr/bin/env python3
import hashlib,json,subprocess
from pathlib import Path
root=Path(subprocess.check_output(['git','rev-parse','--show-toplevel'],text=True).strip())
m=json.loads(Path(__file__).with_name('frozen-inputs.json').read_text())
def git(*a):return subprocess.check_output(['git',*a],cwd=root)
assert git('diff','--name-only',m['before'],m['after']).decode().splitlines()==m['changed_files']
manifest={}
for line in (root/'Lean/SOURCES.sha256').read_text().splitlines():
    s=line.split(maxsplit=1)
    if len(s)==2:manifest[s[1].lstrip('*').removeprefix('./')]=s[0]
sources=set()
for row in m['inputs']:
    p=row['path'];b=git('show',row['commit']+':'+p)
    assert hashlib.sha256(b).hexdigest()==row['sha256'],p
    if p.startswith('Lean/'):
        assert (root/p).read_bytes()==b,p
        assert manifest[p[5:]]==row['sha256'],p
        sources.add(p)
assert git('diff',m['before'],m['after'],'--','manuscript','Lean','source')==b''
old_dir='blueprint/units/YM-000026/handoff/results/C04/review/mgubi-astra-c04-nonzero-review-20261113'
assert git('diff',m['prior_review'],'--',old_dir,'manuscript','Lean','source')==b''
print(f"PASS {len(m['inputs'])} frozen versions; {len(sources)} source-manifest entries; three-record delta; unchanged manuscript/source/original review")
