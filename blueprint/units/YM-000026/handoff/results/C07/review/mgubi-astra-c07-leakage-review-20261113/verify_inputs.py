#!/usr/bin/env python3
"""Frozen identity and review-status checks, not proof checking."""
import hashlib
import json
from pathlib import Path
import subprocess
r = json.loads(Path(__file__).with_name('inputs.json').read_text())
def git(*args):
    return subprocess.check_output(['git', *args])
t, b = r['target_commit'], r['comparison_base']
for f in r['files']:
    assert hashlib.sha256(git('show', t + ':' + f['path'])).hexdigest() == f['sha256']
    assert git('rev-parse', t + ':' + f['path']).decode().strip() == f['git_blob']
changed = git('diff', '--name-only', b, t).decode().splitlines()
assert changed == [f['path'] for f in r['files'] if f['role'] == 'changed-author-input']
assert len(changed) == 5 and sum(p.startswith('manuscript/') for p in changed) == 2
for rev in (t, b):
    assert git('rev-parse', rev + ':Lean').decode().strip() == r['lean_tree']
assert r['source_revision'] in git('show', t + ':source/upstream.json').decode()
prefix = 'blueprint/units/YM-000026/handoff/results/C07/'
for rev in (t, b):
    hashes = json.loads(git('show', rev + ':' + prefix + 'chapter-hashes.json'))
    assert hashes['independent_approval'] is None
    index = git('show', rev + ':' + prefix + 'review-index.md').decode()
    for f in hashes['chapters']:
        if f['path'] in changed:
            digest = hashlib.sha256(git('show', rev + ':' + f['path'])).hexdigest()
            assert digest == f['current_sha256']
            assert f['author_review_status'] == 'draft; independent review required for changed content'
            assert '| `' + Path(f['path']).name + '` | `' + digest + '` | none |' in index
print('PASS: 15 frozen files; full five-file PR scope; four before/after chapter fingerprints; draft status and no approval preserved; unchanged source pin/Lean tree.')
print('No mathematical, elaboration, kernel or axiom verification performed.')
