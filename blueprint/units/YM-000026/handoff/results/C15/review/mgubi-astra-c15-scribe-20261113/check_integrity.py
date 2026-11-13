"""Validate this bounded review's frozen inputs; run from repository root."""
import hashlib
import json
from pathlib import Path
import subprocess

record = json.loads(Path(__file__).with_name('hashes.json').read_text())
manifest = dict((line.split('  ', 1)[1], line.split('  ', 1)[0])
                for line in Path('Lean/SOURCES.sha256').read_text().splitlines())
upstream = json.loads(Path('source/upstream.json').read_text())
assert upstream['revision'] == record['source_revision']
assert Path('Lean/lean-toolchain').read_text().strip() == upstream['lean_toolchain']
author_record = Path('blueprint/units/YM-000026/handoff/results/C15/README.md').read_text()
counts = {'target': 0, 'source': 0, 'interface': 0}
for item in record['files']:
    path = item['path']
    content = Path(path).read_bytes()
    digest = hashlib.sha256(content).hexdigest()
    assert digest == item['sha256'], path
    category = item['category']
    if category == 'target':
        assert content == subprocess.check_output(['git', 'show', record['author_head'] + ':' + path]), path
        assert digest in author_record, path
    elif category == 'source':
        assert digest == manifest[path.removeprefix('Lean/')], path
    counts[category] += 1
print('Integrity PASS:', counts)
print('Pinned revision/toolchain, target PR105 bytes, author hashes and source manifest match.')
