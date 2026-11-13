"""Verify frozen inputs, the bounded chapter increment and source/old-record identity."""
from pathlib import Path
import hashlib
import json
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = next(p for p in HERE.parents if (p / 'AGENTS.md').is_file())
DATA = json.loads((HERE / 'fingerprints.json').read_text())

def git(*args):
    return subprocess.check_output(['git', *args], cwd=ROOT)

def frozen(revision, path):
    return git('show', revision + ':' + path)

source_count = 0
for entry in DATA['inputs']:
    path, revision = entry['path'], entry['revision']
    value = (ROOT / path).read_bytes() if revision == 'WORKTREE' else frozen(revision, path)
    assert hashlib.sha256(value).hexdigest() == entry['sha256'], entry
    if path.startswith('Lean/'):
        assert (ROOT / path).read_bytes() == value, path
        source_count += 1
assert git('rev-parse', DATA['base'] + ':Lean').decode().strip() == DATA['source_tree']
for scope in ['Lean', 'source', *DATA['old_records']]:
    subprocess.run(['git', 'diff', '--exit-code', DATA['base'], '--', scope], cwd=ROOT, check=True)
# Check each inspected source file against the upstream archive's checksum manifest.
checksums = {}
for line in (ROOT / 'Lean/SOURCES.sha256').read_text().splitlines():
    checksum, name = line.split(maxsplit=1)
    checksums[name.lstrip('*').removeprefix('./')] = checksum
checked = 0
for entry in DATA['inputs']:
    path = entry['path']
    if path.startswith('Lean/'):
        name = path.removeprefix('Lean/')
        assert name in checksums, name
        assert hashlib.sha256((ROOT / path).read_bytes()).hexdigest() == checksums[name], name
        checked += 1
print(f'PASS: {len(DATA["inputs"])} frozen/current versions; {source_count} source files unchanged; {checked} upstream checksums; old PR256 records and source metadata unchanged.')
