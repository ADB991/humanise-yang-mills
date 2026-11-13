"""Verify immutable review inputs; this is not a mathematical or Lean test."""
import hashlib
import json
from pathlib import Path
import subprocess

record = json.loads(Path(__file__).with_name('inputs.json').read_text())
for item in record['inputs']:
    spec = item['revision'] + ':' + item['path']
    data = subprocess.check_output(['git', 'show', spec])
    blob = subprocess.check_output(['git', 'rev-parse', spec], text=True).strip()
    assert hashlib.sha256(data).hexdigest() == item['sha256'], spec
    assert blob == item['blob'], spec
for rev in (record['base'], record['target']):
    tree = subprocess.check_output(['git', 'rev-parse', rev + ':Lean'], text=True).strip()
    assert tree == record['lean_tree'], rev
assert not subprocess.check_output(['git', 'diff', record['base'], '--', 'Lean/', 'source/'])
print(f"PASS: {len(record['inputs'])} immutable versions; source trees and working source unchanged")
