import hashlib,json,subprocess
from pathlib import Path
root=Path(subprocess.check_output(['git','rev-parse','--show-toplevel'],text=True).strip())
d=json.loads(Path(__file__).with_name('frozen-inputs.json').read_text())
sha=lambda b:hashlib.sha256(b).hexdigest()
manifest={s.split()[1].removeprefix('./'):s.split()[0] for s in (root/'Lean/SOURCES.sha256').read_text().splitlines() if s.strip()}
ns=nc=0
for f in d['files']:
 p=f['path'];assert sha(subprocess.check_output(['git','show',f['revision']+':'+p],cwd=root))==f['sha256'],p
 if 'current_sha256' in f:
  v=sha((root/p).read_bytes());assert v==f['current_sha256'],p;nc+=1
  if p.startswith('Lean/'):assert v==manifest[p[5:]],p;ns+=1
assert not subprocess.check_output(['git','diff',d['base'],'--','Lean','source','manuscript/existence/phase-quantitative-producer.tex','blueprint/units/YM-000026/handoff/results/C03'],cwd=root)
print(f"PASS {len(d['files'])} frozen versions, {nc} current hashes, {ns} source-manifest entries; source and C03 unchanged")
