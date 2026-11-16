"""Verify the frozen C07 revision and its reported author fingerprints."""
from pathlib import Path
import hashlib
import json
import subprocess
HERE = Path(__file__).resolve().parent
ROOT = Path(subprocess.check_output(['git', 'rev-parse', '--show-toplevel'], text=True).strip())
data = json.loads((HERE / 'inputs.json').read_text())
def git(*args):
    return subprocess.check_output(['git', *args], cwd=ROOT)
def show(rev, path):
    return git('show', rev + ':' + path)
for e in data['inputs']:
    value = show(e['revision'], e['path'])
    assert hashlib.sha256(value).hexdigest() == e['sha256'], e
    assert git('rev-parse', e['revision']+':'+e['path']).decode().strip() == e['blob'], e
    if e['revision'] == data['base']:
        assert (ROOT / e['path']).read_bytes() == value, e['path']
for rev in [data['base'], data['target']]:
    assert git('rev-parse', rev+':Lean').decode().strip() == data['source_tree']
assert not git('diff', data['base'], '--', 'Lean')
assert git('diff', '--name-only', data['base'], data['target']).decode().splitlines() == data['changed_paths']
p='blueprint/units/YM-000026/handoff/results/C07/chapter-hashes.json'
author=json.loads(show(data['target'],p))
for c in author['chapters']:
    assert hashlib.sha256(show(data['target'],c['path'])).hexdigest() == c['current_sha256'], c['path']
for p,h in author['revision_1']['pre_revision_sha256'].items():
    assert hashlib.sha256(show(data['base'],p)).hexdigest() == h, p
print(f'PASS: {len(data["inputs"])} frozen SHA-256/blob versions; exact16-file target delta; all18 current and10 prior author hashes; unchanged base inputs and Lean tree.')
