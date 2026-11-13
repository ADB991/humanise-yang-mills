#!/usr/bin/env python3
"""Check exact before/after identities; no theorem or acceptance check."""
import hashlib, json, subprocess
from pathlib import Path
root = Path(subprocess.check_output(['git', 'rev-parse', '--show-toplevel'], text=True).strip())
m = json.loads(Path(__file__).with_name('fingerprints.json').read_text())
manifest = {}
for line in (root/'Lean/SOURCES.sha256').read_text().splitlines():
    parts = line.split(maxsplit=1)
    if len(parts) == 2:
        manifest[parts[1].lstrip('*').removeprefix('./')] = parts[0]
checked = 0
for row in m['inputs']:
    p = row['path']
    blob = (root/p).read_bytes() if row['commit'] == 'WORKTREE' else subprocess.check_output(['git', 'show', row['commit']+':'+p], cwd=root)
    assert hashlib.sha256(blob).hexdigest() == row['sha256'], p
    if p.startswith('Lean/'):
        assert (root/p).read_bytes() == blob, p
        assert manifest[p[5:]] == row['sha256'], p
        checked += 1
assert subprocess.check_output(['git','diff',m['base'],'--','Lean','source'],cwd=root) == b''
print(f"PASS {len(m['inputs'])} frozen/current versions; {checked} imported-source hashes; unchanged Lean/source diff")
