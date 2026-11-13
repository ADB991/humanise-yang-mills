#!/usr/bin/env python3
"""Frozen identity checks; not mathematical or formal proof verification."""
import hashlib
import json
from pathlib import Path
import re
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
assert len(changed) == 6 and sum(p.startswith('manuscript/') for p in changed) == 4
for rev in (t, b):
    assert git('rev-parse', rev + ':Lean').decode().strip() == r['lean_tree']
    handoff = git('show', rev + ':blueprint/units/YM-000026/handoff/results/C01/HANDOFF.md').decode()
    for path in changed:
        if path.startswith('manuscript/'):
            digest = hashlib.sha256(git('show', rev + ':' + path)).hexdigest()
            assert '| `' + path + '` | `' + digest + '` |' in handoff
assert r['source_revision'] in git('show', t + ':source/upstream.json').decode()
for path in changed:
    if path.startswith('manuscript/'):
        labels = [re.findall(r'\\label\{([^}]+)\}', git('show', rev + ':' + path).decode()) for rev in (b, t)]
        assert labels[0] == labels[1]
print('PASS: 16 frozen files; full four-chapter/two-record PR; eight handoff chapter hashes; unchanged labels and source pin/Lean tree.')
print('No mathematical, elaboration, kernel or axiom verification performed.')
