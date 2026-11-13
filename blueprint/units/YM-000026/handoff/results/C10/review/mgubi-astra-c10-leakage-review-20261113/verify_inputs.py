#!/usr/bin/env python3
"""Frozen identity checks only; optional --external-dir verifies downloaded Mathlib blobs."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
p = argparse.ArgumentParser()
p.add_argument('--external-dir', type=Path)
a = p.parse_args()
r = json.loads(Path(__file__).with_name('inputs.json').read_text())
def git(*args):
    return subprocess.check_output(['git', *args])
t, b = r['target_commit'], r['comparison_base']
for f in r['files']:
    data = git('show', t + ':' + f['path'])
    assert hashlib.sha256(data).hexdigest() == f['sha256'], f['path']
    assert git('rev-parse', t + ':' + f['path']).decode().strip() == f['git_blob']
assert git('diff', '--name-only', b, t).decode().splitlines() == [f['path'] for f in r['files'] if f['role'] == 'changed-author-input']
assert len([f for f in r['files'] if f['role'] == 'changed-author-input']) == 7
for rev in (t, b):
    assert git('rev-parse', rev + ':Lean').decode().strip() == r['lean_tree']
assert r['source_revision'] in git('show', t + ':source/upstream.json').decode()
manifest = json.loads(git('show', t + ':Lean/lake-manifest.json'))
assert next(x['rev'] for x in manifest['packages'] if x['name'] == 'mathlib') == r['mathlib_revision']
record = git('show', t + ':blueprint/units/YM-000026/handoff/results/C10/source-leakage-189.md').decode()
rows = re.findall(r'\| `([^`]+\.tex)` \| `([0-9a-f]{64})` \| `([0-9a-f]{64})` \|', record)
assert len(rows) == 6
for name, before, after in rows:
    for rev, expected in ((b, before), (t, after)):
        assert hashlib.sha256(git('show', rev + ':manuscript/existence/' + name)).hexdigest() == expected
print('PASS: 17 frozen repository inputs; full PR six chapters + one record; 12 author hashes; source and Mathlib pins; unchanged Lean tree.')
if a.external_dir:
    for f in r['external_files']:
        data = (a.external_dir / f['local_name']).read_bytes()
        assert hashlib.sha256(data).hexdigest() == f['sha256']
        assert hashlib.sha1(b'blob ' + str(len(data)).encode() + b'\0' + data).hexdigest() == f['git_blob']
    print('PASS: both downloaded pinned Mathlib files (SHA-256 and Git blob IDs).')
else:
    print('External Mathlib file identity check not run; supply --external-dir containing the recorded local names.')
print('No mathematical, elaboration, kernel, or axiom verification is performed by this script.')
