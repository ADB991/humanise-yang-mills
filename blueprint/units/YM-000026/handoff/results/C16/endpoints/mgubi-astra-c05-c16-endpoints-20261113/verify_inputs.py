#!/usr/bin/env python3
"""Verify frozen identity and bounded report scope, not mathematical truth."""
from pathlib import Path
import subprocess,json,hashlib
here=Path(__file__).parent
r=json.loads((here/'inputs.json').read_text())
def git(*a):return subprocess.check_output(['git',*a])
for f in r['files']:
 obj=f['revision']+':'+f['path']
 assert hashlib.sha256(git('show',obj)).hexdigest()==f['sha256'],obj
 assert git('rev-parse',obj).decode().strip()==f['git_blob'],obj
for rev in (r['c16'],r['c05_response'],r['c05_leakage']):
 assert git('rev-parse',rev+':Lean').decode().strip()==r['lean_tree']
 assert r['source_revision'] in git('show',rev+':source/upstream.json').decode()
assert git('merge-base',r['c05_response'],r['c05_leakage']).decode().strip()==r['c05_response']
for n in ['ope-cutoff','reference-match','ope-filtration']:
 p='manuscript/existence/'+n+'.tex'
 assert git('show',r['c05_response']+':'+p)==git('show',r['c05_leakage']+':'+p),p
repo=Path(git('rev-parse','--show-toplevel').decode().strip()).resolve()
prefix=here.resolve().relative_to(repo).as_posix()+'/'
for p in git('diff','--name-only',r['c16']).decode().splitlines():assert p.startswith(prefix),p
assert not git('diff',r['c16'],'--','Lean','source','lean-toolchain').strip()
print(f'PASS: {len(r["files"])} frozen versions; response ancestry/three unchanged chapters; source pin/Lean tree; tracked report-only scope.')
print('No mathematical, elaboration, kernel or axiom proof verification.')
