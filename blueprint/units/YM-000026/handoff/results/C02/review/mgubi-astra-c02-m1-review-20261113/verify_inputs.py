#!/usr/bin/env python3
"""Frozen identity checks only; not proof checking."""
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
    assert hashlib.sha256(git('show', obj)).hexdigest() == f['sha256']
    assert git('rev-parse', obj).decode().strip() == f['git_blob']
changed = git('diff', '--name-only', b, t).decode().splitlines()
assert changed == [f['path'] for f in r['files'] if f['role'] == 'response']
assert len(changed) == 2
for rev in (t, b):
    assert git('rev-parse', rev + ':Lean').decode().strip() == r['lean_tree']
assert r['source_revision'] in git('show', t + ':source/upstream.json').decode()
p = 'manuscript/existence/centered-public-service.tex'
texts = [git('show', rev + ':' + p).decode() for rev in (b, t)]
assert re.findall(r'\\\[(.*?)\\\]', texts[0], re.S) == re.findall(r'\\\[(.*?)\\\]', texts[1], re.S)
assert re.findall(r'\\label\{([^}]+)\}', texts[0]) == re.findall(r'\\label\{([^}]+)\}', texts[1])
assert 'with $s=|\\Lambda_k|$ sites' not in texts[1]
assert 'site-count parameter in that formula equal to $|\\Lambda_k|$' in texts[1]
assert 'support assigned to each address does not depend on the coefficient' in texts[1]
print('PASS: ten frozen input versions; exact two-file response; all display blocks and labels unchanged; source pin/Lean tree unchanged.')
print('No mathematical, elaboration, kernel or axiom verification performed.')
