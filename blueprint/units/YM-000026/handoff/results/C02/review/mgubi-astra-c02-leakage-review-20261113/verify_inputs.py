#!/usr/bin/env python3
"""Verify frozen reviewed Git objects, not the current integration checkout."""
import hashlib
import json
from pathlib import Path
import subprocess

root = Path(subprocess.check_output(['git', 'rev-parse', '--show-toplevel'], text=True).strip())
record = json.loads(Path(__file__).with_name('inputs.json').read_text())
target = record['target_commit']
for item in record['files']:
    blob = subprocess.check_output(['git', 'show', f"{target}:{item['path']}"], cwd=root)
    assert hashlib.sha256(blob).hexdigest() == item['sha256'], item['path']
    actual = subprocess.check_output(['git', 'rev-parse', f"{target}:{item['path']}"], cwd=root, text=True).strip()
    assert actual == item['git_blob'], item['path']
assert subprocess.check_output(['git', 'rev-parse', f'{target}:Lean'], cwd=root, text=True).strip() == record['lean_tree']
assert subprocess.check_output(['git', 'rev-parse', f'{target}^:Lean'], cwd=root, text=True).strip() == record['lean_tree']
print(f"PASS: {len(record['files'])} frozen file hashes/blob IDs; unchanged target/parent Lean tree.")
print('Textual-review evidence only; no mathematical or Lean verification is implied.')
