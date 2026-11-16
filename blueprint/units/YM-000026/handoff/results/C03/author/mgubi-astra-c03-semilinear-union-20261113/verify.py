"""Verify frozen evidence, source/old-record identity, and protected proof text."""
from pathlib import Path
import hashlib
import json
import subprocess

HERE = Path(__file__).resolve().parent
ROOT = next(p for p in HERE.parents if (p / 'AGENTS.md').is_file())
D = json.loads((HERE / 'fingerprints.json').read_text())

def git(*args):
    return subprocess.check_output(['git', *args], cwd=ROOT)

def frozen(rev, path):
    return git('show', rev + ':' + path)

source_count = 0
checksums = {}
for line in (ROOT / 'Lean/SOURCES.sha256').read_text().splitlines():
    h, p = line.split(maxsplit=1)
    checksums[p.lstrip('*').removeprefix('./')] = h
for e in D['inputs']:
    p, r = e['path'], e['revision']
    value = (ROOT / p).read_bytes() if r == 'WORKTREE' else frozen(r, p)
    assert hashlib.sha256(value).hexdigest() == e['sha256'], e
    if p.startswith('Lean/'):
        assert (ROOT / p).read_bytes() == value, p
        assert hashlib.sha256(value).hexdigest() == checksums[p.removeprefix('Lean/')], p
        source_count += 1
for scope in ['Lean', 'source', *D['old_records']]:
    subprocess.run(['git', 'diff', '--exit-code', D['base'], '--', scope], cwd=ROOT, check=True)
assert git('rev-parse', D['base'] + ':Lean').decode().strip() == D['source_tree']
p = 'manuscript/existence/phase-fields.tex'
current = (ROOT / p).read_bytes()
assert current.startswith(frozen(D['canonical'], p)), 'pre-PR270 prefix changed'
prior = frozen(D['base'], p)
start = b'Proposition~\\ref{prop:phase-field-inclusions} has already converted'
end = b'Multilinearity and permutation symmetry of the slab operators'
assert current[current.index(start):current.index(end)] == prior[prior.index(start):prior.index(end)], 'whole-word operator proof changed'
allowed = {p}
changed = git('diff', '--name-only', D['base'], '--', 'manuscript').decode().splitlines()
assert set(changed) <= allowed, changed
print(f'PASS: {len(D["inputs"])} frozen/current versions; {source_count} upstream source hashes; old10 author records and source metadata unchanged; canonical chapter prefix and whole-word operator proof preserved.')
