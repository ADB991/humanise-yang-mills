"""Verify the exact response, author hashes, and immutable prior review."""
from pathlib import Path
import hashlib
import json
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = next(p for p in HERE.parents if (p / 'AGENTS.md').is_file())
D = json.loads((HERE / 'inputs.json').read_text())

def git(*args):
    return subprocess.check_output(['git', *args], cwd=ROOT)

def show(rev, path):
    return git('show', rev + ':' + path)

def sha(value):
    return hashlib.sha256(value).hexdigest()

for e in D['inputs']:
    assert sha(show(e['revision'], e['path'])) == e['sha256'], e
    assert git('rev-parse', e['revision'] + ':' + e['path']).decode().strip() == e['blob'], e
assert git('diff', '--name-only', D['base'], D['target']).decode().splitlines() == D['changed_paths']
assert len(D['changed_paths']) == 6
p = 'blueprint/units/YM-000026/handoff/results/C07/chapter-hashes.json'
old = json.loads(show(D['base'], p))
new = json.loads(show(D['target'], p))
assert len(new['chapters']) == 18
changed = {p for p in D['changed_paths'] if p.startswith('manuscript/')}
assert len(changed) == 3
unchanged = 0
for c in new['chapters']:
    assert sha(show(D['target'], c['path'])) == c['current_sha256'], c['path']
    if c['path'] not in changed:
        assert show(D['base'], c['path']) == show(D['target'], c['path'])
        unchanged += 1
assert unchanged == 15
prior = new['revision_1_response_277']['pre_response_sha256']
assert set(prior) == changed
index = 'blueprint/units/YM-000026/handoff/results/C07/review-index.md'
for p, expected in prior.items():
    assert sha(show(D['base'], p)) == expected
    assert expected in show(D['target'], index).decode(), p
for scope in ['Lean', 'source', 'blueprint/units/YM-000026/handoff/results/C07/ledger.md', index]:
    assert not git('diff', D['base'], D['target'], '--', scope), scope
for rev in [D['base'], D['target'], D['report_base']]:
    assert git('rev-parse', rev + ':Lean').decode().strip() == D['source_tree']
assert not git('diff', D['report_base'], '--', 'manuscript', 'Lean', 'source', D['old_reports'])
# Establish that no positive-order calculation or application was altered.
p = 'manuscript/existence/gaussian-differentiation.tex'
a, b = show(D['base'], p), show(D['target'], p)
marker = b'\\emph{Inverse.}'
assert a[a.index(marker):] == b[b.index(marker):]
marker = b'\\begin{proof}\nBy \\eqref{eq:gaussian-local-density}'
assert a[:a.index(marker)] == b[:b.index(marker)]
# The two Haar names are literally the only alterations in that chapter.
p = 'manuscript/existence/haar-chart.tex'
a = show(D['base'], p).replace(b'with respect to $h$', b'with respect to $m_G$').replace(b'preserve $h$', b'preserve $m_G$')
assert a == show(D['target'], p)
print(f'PASS: {len(D["inputs"])} frozen SHA256/blob versions; exact6-file delta; all18 current/3 prior hashes; other15 chapters and ledger/index/source unchanged; positive-order proof unchanged; old6 reports unchanged.')
