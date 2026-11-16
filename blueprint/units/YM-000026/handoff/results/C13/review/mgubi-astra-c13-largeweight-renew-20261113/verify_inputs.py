"""Check immutable target versions and preserve the original review."""
from pathlib import Path
import hashlib
import json
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = Path(subprocess.check_output(['git', 'rev-parse', '--show-toplevel'], text=True).strip())
data = json.loads((HERE / 'inputs.json').read_text())
def git(*args):
    return subprocess.check_output(['git', *args], cwd=ROOT)
for e in data['inputs']:
    value = git('show', e['revision'] + ':' + e['path'])
    assert hashlib.sha256(value).hexdigest() == e['sha256'], e
    assert git('rev-parse', e['revision'] + ':' + e['path']).decode().strip() == e['blob'], e
    if e['revision'] == data['report_base'] or e['path'].startswith('Lean/'):
        assert (ROOT / e['path']).read_bytes() == value, e['path']
for rev in [data['before'], data['after'], data['report_base']]:
    assert git('rev-parse', rev + ':Lean').decode().strip() == data['source_tree']
assert not git('diff', data['report_base'], '--', 'Lean')
paths = git('diff', '--name-only', data['before'], data['after']).decode().splitlines()
assert paths == [
 'blueprint/units/YM-000026/handoff/results/C13/large-weight-ADB991-claude-20261113-a9b8.md',
 'manuscript/existence/allarity-marked-propagation.tex']
p = 'manuscript/existence/rank-root-normalization.tex'
assert git('show', data['before']+':'+p) == git('show', data['after']+':'+p)
print(f'PASS: {len(data["inputs"])} frozen versions; exact two-file target delta; unchanged rank-root chapter, Lean tree and six prior review records.')
