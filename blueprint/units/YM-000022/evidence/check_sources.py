"""Check the inspected source files against the pinned distribution manifest."""
import hashlib
from pathlib import Path
import sys

root = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else Path(__file__).resolve().parents[4]
source = root / 'Lean'
manifest = dict((name, digest) for digest, name in
                (line.split(maxsplit=1) for line in (source / 'SOURCES.sha256').read_text().splitlines()))
paths = [
    'YM/Pert/Asymptotics/RawAxis.lean',
    'YM/Source/Construction.lean',
    'YM/RG/History.lean',
    'YM/Lattice/Scale.lean',
    'YM/Gauge/Colors.lean',
    'YM/Gauge/Lie.lean',
    'YM/Gauge/Casimir.lean',
]
for name in paths:
    actual = hashlib.sha256((source / name).read_bytes()).hexdigest()
    if actual != manifest[name]:
        raise SystemExit(f'MISMATCH: {name}')
    print(f'OK {actual}  {name}')
