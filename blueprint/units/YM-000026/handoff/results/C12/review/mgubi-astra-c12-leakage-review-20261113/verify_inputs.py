#!/usr/bin/env python3
"""Frozen input/scope identity checks, not mathematical proof verification."""
from pathlib import Path
import subprocess,json,hashlib,re,csv
root=Path(__file__).parent
r=json.loads((root/'inputs.json').read_text())
def git(*a):return subprocess.check_output(['git',*a])
t,b=r['target_commit'],r['comparison_base']
for f in r['files']:
 obj=f['revision']+':'+f['path']
 assert hashlib.sha256(git('show',obj)).hexdigest()==f['sha256'],obj
 assert git('rev-parse',obj).decode().strip()==f['git_blob'],obj
changed=git('diff','--name-only',b,t).decode().splitlines()
assert changed==[f['path'] for f in r['files'] if f['role']=='response']
assert len(changed)==8
assert git('rev-parse',t+'^').decode().strip()==b
chapters=[p for p in changed if p.endswith('.tex')]
assert len(chapters)==6
for p in chapters:
 old=git('show',b+':'+p).decode()
 new=git('show',t+':'+p).decode()
 pattern=r'\\label\{([^}]+)\}'
 labels=re.findall(pattern,new)
 assert labels and re.findall(pattern,old)==labels,p
for rev in (b,t): assert git('rev-parse',rev+':Lean').decode().strip()==r['lean_tree']
assert r['source_revision'] in git('show',t+':source/upstream.json').decode()
expected={151,157,158,160,161,*range(163,188)}
rows=list(csv.DictReader((root/'rows.tsv').open(),delimiter='\t'))
assert len(rows)==30 and {int(x['row']) for x in rows}==expected
print(f'PASS: {len(r["files"])} frozen input versions; exact eight-file response; six chapter label inventories unchanged; all 30 rows; source pin/Lean tree unchanged.')
print('No mathematical, elaboration, kernel or axiom proof check.')
