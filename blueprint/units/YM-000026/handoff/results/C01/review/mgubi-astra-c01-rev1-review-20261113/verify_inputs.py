#!/usr/bin/env python3
"""Check frozen identities and author hashes; not mathematical proof checking."""
import hashlib,json,re,subprocess
from pathlib import Path
r=json.loads(Path(__file__).with_name('inputs.json').read_text())
def git(*a): return subprocess.check_output(['git',*a])
t,b=r['target_commit'],r['comparison_base']
for f in r['files']:
    obj=f['revision']+':'+f['path']
    assert hashlib.sha256(git('show',obj)).hexdigest()==f['sha256'],obj
    assert git('rev-parse',obj).decode().strip()==f['git_blob'],obj
assert git('diff','--name-only',b,t).decode().splitlines()==[f['path'] for f in r['files'] if f['role']=='response']
assert sum(f['role']=='response' for f in r['files'])==11
assert git('rev-parse',t+'^').decode().strip()==b
for rev in (t,b): assert git('rev-parse',rev+':Lean').decode().strip()==r['lean_tree']
assert r['source_revision'] in git('show',t+':source/upstream.json').decode()
h=git('show',t+':blueprint/units/YM-000026/handoff/results/C01/HANDOFF.md').decode()
entries=re.findall(r'`(manuscript/[^`]+)` \| `([0-9a-f]{64})`',h)
assert len(entries)==11
for path,digest in entries: assert hashlib.sha256(git('show',t+':'+path)).hexdigest()==digest,path
print(f'PASS: {len(r["files"])} frozen input versions; exact 11-file single-commit response; 11 author chapter hashes; source pin and Lean tree unchanged.')
print('Identity checks only: no elaboration, kernel, axiom or mathematical proof check.')
