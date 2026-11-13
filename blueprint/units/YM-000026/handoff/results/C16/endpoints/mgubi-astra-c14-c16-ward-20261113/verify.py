"""Verify frozen text versions; this does not validate mathematics."""
from pathlib import Path
import hashlib, json, subprocess
root = Path(subprocess.check_output(["git", "rev-parse", "--show-toplevel"], text=True).strip())
inputs = json.loads(Path(__file__).with_name("frozen-inputs.json").read_text())["inputs"]
manifest = {}
for line in (root / "Lean/SOURCES.sha256").read_text().splitlines():
    if line.strip():
        digest, path = line.split(maxsplit=1)
        manifest[path.lstrip("*").removeprefix("./")] = digest
sources = 0
for item in inputs:
    blob = subprocess.check_output(["git", "show", item["commit"] + ":" + item["path"]], cwd=root)
    assert hashlib.sha256(blob).hexdigest() == item["sha256"], item
    if item["worktree_identity"]:
        assert (root / item["path"]).read_bytes() == blob, item["path"]
    if item["path"].startswith("Lean/"):
        assert manifest[item["path"][5:]] == item["sha256"], item["path"]
        sources += 1
print(f"PASS {len(inputs)} frozen versions; canonical identities; {sources} source-manifest entries")
