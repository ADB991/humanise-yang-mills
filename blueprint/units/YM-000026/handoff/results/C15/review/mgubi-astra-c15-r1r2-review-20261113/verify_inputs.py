#!/usr/bin/env python3
"""Replay identity and scope checks, not proof checking."""
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
    obj = f['revision'] + ':' + f['path']
    assert hashlib.sha256(git('show', obj)).hexdigest() == f['sha256'], obj
    assert git('rev-parse', obj).decode().strip() == f['git_blob'], obj
changed = git('diff', '--name-only', b, t).decode().splitlines()
assert changed == [f['path'] for f in r['files'] if f['role'] == 'response']
assert len(changed) == 5 and sum(p.startswith('manuscript/') for p in changed) == 2
for rev in (t, b, r['publication_base']):
    assert git('rev-parse', rev + ':Lean').decode().strip() == r['lean_tree']
assert r['source_revision'] in git('show', t + ':source/upstream.json').decode()
record = git('show', t + ':blueprint/units/YM-000026/handoff/results/C15/source-leakage-response.md').decode()
rows = re.findall(r'\| `(trace-(?:eve|scribe)-producer.tex)` \| `[0-9a-f]{64}` \| `([0-9a-f]{64})` → after R[12]: `([0-9a-f]{64})` \|', record)
assert len(rows) == 2
for name, before, after in rows:
    for rev, digest in ((b, before), (t, after)):
        assert hashlib.sha256(git('show', rev + ':manuscript/existence/' + name)).hexdigest() == digest
for path in changed:
    if path.startswith('manuscript/'):
        old = git('show', b + ':' + path).decode()
        new = git('show', t + ':' + path).decode()
        assert re.findall(r'\\label\{([^}]+)\}', old) == re.findall(r'\\label\{([^}]+)\}', new)
print('PASS: 15 frozen input versions; exact two-chapter/three-record delta; four response chapter hashes; unchanged labels, source pin and Lean tree.')
print('No mathematical, elaboration, kernel or axiom verification performed.')
