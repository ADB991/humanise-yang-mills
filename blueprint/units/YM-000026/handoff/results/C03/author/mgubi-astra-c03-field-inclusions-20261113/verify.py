"""Verify this author's frozen inputs and append-only manuscript boundary."""
from pathlib import Path
import hashlib
import json
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = Path(subprocess.check_output(['git', 'rev-parse', '--show-toplevel'], text=True).strip())
data = json.loads((HERE / 'fingerprints.json').read_text())

def frozen(revision, path):
    return subprocess.check_output(['git', 'show', revision + ':' + path], cwd=ROOT)

for entry in data['inputs']:
    value = ((ROOT / entry['path']).read_bytes() if entry['revision'] == 'WORKTREE'
             else frozen(entry['revision'], entry['path']))
    assert hashlib.sha256(value).hexdigest() == entry['sha256'], entry
    if entry['path'].startswith('Lean/'):
        assert (ROOT / entry['path']).read_bytes() == value, entry['path']
chapter = 'manuscript/existence/phase-fields.tex'
assert (ROOT / chapter).read_bytes().startswith(frozen(data['base'], chapter))
tree = subprocess.check_output(['git', 'rev-parse', data['base'] + ':Lean'], cwd=ROOT, text=True).strip()
assert tree == data['source_tree']
subprocess.run(['git', 'diff', '--exit-code', data['base'], '--', 'Lean'], cwd=ROOT, check=True)
count = 0
missing = []
for line in (ROOT / 'Lean/SOURCES.sha256').read_text().splitlines():
    expected, name = line.split(maxsplit=1)
    path = ROOT / 'Lean' / name.lstrip('*')
    if not path.exists():
        missing.append(name)
        continue
    assert hashlib.sha256(path.read_bytes()).hexdigest() == expected, name
    count += 1
print(f'PASS: {len(data["inputs"])} frozen/current fingerprints; append-only chapter; unchanged Lean tree; {count} upstream source checksums.')
print(f'Archive manifest entries absent from this imported tree (not checked): {missing}')
