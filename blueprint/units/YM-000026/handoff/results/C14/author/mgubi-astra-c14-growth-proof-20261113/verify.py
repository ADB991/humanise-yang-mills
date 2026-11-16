import hashlib,json,subprocess
from pathlib import Path
root=Path(subprocess.check_output(['git','rev-parse','--show-toplevel'],text=True).strip())
data=json.loads(Path(__file__).with_name('frozen-inputs.json').read_text())
sha=lambda b:hashlib.sha256(b).hexdigest()
manifest={line.split()[1].removeprefix('./'):line.split()[0] for line in (root/'Lean/SOURCES.sha256').read_text().splitlines() if line.strip()}
ns=0
for f in data['files']:
 p=f['path'];assert sha(subprocess.check_output(['git','show',data['base']+':'+p],cwd=root))==f['base_sha256'],p
 digest=sha((root/p).read_bytes());assert digest==f['current_sha256'],p
 if p.startswith('Lean/'):
  assert digest==manifest[p[5:]],p;ns+=1
old=json.loads((root/'blueprint/units/YM-000026/handoff/results/C14/author/mgubi-astra-c14-local-followup-20261113/file-hashes.json').read_text())
for f in old['files']:assert sha((root/f['path']).read_bytes())==f['final_sha256'],f['path']
assert not subprocess.check_output(['git','diff',data['base'],'--','Lean','source','blueprint/units/YM-000026/handoff/results/C14/review'],cwd=root)
print(f"PASS {len(data['files'])} base/current pairs; {ns} source-manifest entries; seven current prior-author fingerprints; immutable source/reviews")
