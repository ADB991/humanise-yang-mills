import hashlib,json,subprocess
from pathlib import Path
root=Path(subprocess.check_output(['git','rev-parse','--show-toplevel'],text=True).strip())
d=json.loads(Path(__file__).with_name('frozen-inputs.json').read_text());sha=lambda b:hashlib.sha256(b).hexdigest()
manifest={s.split()[1].removeprefix('./'):s.split()[0] for s in (root/'Lean/SOURCES.sha256').read_text().splitlines() if s.strip()};ns=0
for f in d['files']:
 p=f['path'];assert sha(subprocess.check_output(['git','show',f['revision']+':'+p],cwd=root))==f['sha256'],p
 if f['check_working']:assert sha((root/p).read_bytes())==f['sha256'],p
 if p.startswith('Lean/'):assert manifest[p[5:]]==f['sha256'],p;ns+=1
assert not subprocess.check_output(['git','diff',d['base'],'--','manuscript','Lean','source'],cwd=root)
print(f"PASS {len(d['files'])} frozen versions; {ns} source-manifest entries; manuscript/source unchanged")
