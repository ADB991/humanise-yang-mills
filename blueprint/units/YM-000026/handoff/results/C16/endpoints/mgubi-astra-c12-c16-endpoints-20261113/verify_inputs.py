#!/usr/bin/env python3
"""Check frozen identities and report-only scope; not mathematical proof."""
from pathlib import Path
import subprocess,json,hashlib
here=Path(__file__).parent
r=json.loads((here/'inputs.json').read_text())
def git(*a):return subprocess.check_output(['git',*a])
for f in r['files']:
 obj=f['revision']+':'+f['path']
 assert hashlib.sha256(git('show',obj)).hexdigest()==f['sha256'],obj
 assert git('rev-parse',obj).decode().strip()==f['git_blob'],obj
for rev in (r['c16'],r['c12']):
 assert git('rev-parse',rev+':Lean').decode().strip()==r['lean_tree']
 assert r['source_revision'] in git('show',rev+':source/upstream.json').decode()
repo=Path(git('rev-parse','--show-toplevel').decode().strip())
prefix=here.resolve().relative_to(repo.resolve()).as_posix()+'/'
for p in git('diff','--name-only',r['c16']).decode().splitlines():assert p.startswith(prefix),p
assert git('diff',r['c16'],'--','Lean','lean-toolchain','source').strip()==b''
print(f'PASS: {len(r["files"])} frozen versions; source pin and Lean tree; tracked diff confined to report directory.')
print('No mathematical, elaboration, kernel or axiom verification.')
