#!/usr/bin/env python3
"""Replay frozen input identity checks; this is not a proof checker."""
import hashlib
import json
from pathlib import Path
import re
import subprocess
root = Path(subprocess.check_output(['git', 'rev-parse', '--show-toplevel'], text=True).strip())
record = json.loads(Path(__file__).with_name('inputs.json').read_text())
def git(*args):
    return subprocess.check_output(['git', *args], cwd=root)
target = record['target_commit']
for item in record['files']:
    data = git('show', target + ':' + item['path'])
    assert hashlib.sha256(data).hexdigest() == item['sha256'], item['path']
    assert git('rev-parse', target + ':' + item['path']).decode().strip() == item['git_blob'], item['path']
for rev in (target, record['comparison_base']):
    assert git('rev-parse', rev + ':Lean').decode().strip() == record['lean_tree']
changed = git('diff', '--name-only', record['comparison_base'], target).decode().splitlines()
expected = [x['path'] for x in record['files'] if x['role'] == 'changed-author-input']
assert changed == expected and len(changed) == 15
assert sum(p.startswith('manuscript/') for p in changed) == 13
validation = git('show', target + ':blueprint/units/YM-000026/handoff/results/C13/completion-validation-20261113.md').decode()
author_hashes = re.findall(r'(manuscript/\S+\.tex) ([0-9a-f]{64})', validation)
assert len(author_hashes) == 13
for path, digest in author_hashes:
    assert hashlib.sha256(git('show', target + ':' + path)).hexdigest() == digest, path
manifest = json.loads(git('show', target + ':source/upstream.json'))
assert record['source_revision'] in json.dumps(manifest)
print(f"PASS: {len(record['files'])} frozen hashes/blob IDs; full PR 13 chapters + 2 records; 13 author hashes; source pin; unchanged full-PR Lean tree.")
print('Textual evidence only: no mathematical, elaboration, kernel, or axiom verification.')
