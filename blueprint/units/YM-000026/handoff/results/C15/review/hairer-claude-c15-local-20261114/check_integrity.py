"""Validate this bounded review's frozen inputs; run from the repository root.

Checks that every recorded file still has its frozen SHA-256, that the target
chapters equal their content at the reviewed commit, and that every inspected
Lean file matches the pinned source manifest.
"""
import hashlib
import json
import subprocess
from pathlib import Path

record = json.loads(Path(__file__).with_name('hashes.json').read_text())
upstream = json.loads(Path('source/upstream.json').read_text())
assert upstream['revision'] == record['source_revision']
manifest = dict(
    (line.split('  ', 1)[1], line.split('  ', 1)[0])
    for line in Path('Lean/SOURCES.sha256').read_text().splitlines()
)
counts = {}
for item in record['files']:
    path, category = item['path'], item['category']
    content = Path(path).read_bytes()
    digest = hashlib.sha256(content).hexdigest()
    assert digest == item['sha256'], f'changed since review: {path}'
    if category == 'target':
        reviewed = subprocess.check_output(
            ['git', 'show', record['review_commit'] + ':' + path])
        assert content == reviewed, f'differs from reviewed commit: {path}'
    if category == 'source':
        assert digest == manifest[path.removeprefix('Lean/')], path
    counts[category] = counts.get(category, 0) + 1
print('ok', counts)
