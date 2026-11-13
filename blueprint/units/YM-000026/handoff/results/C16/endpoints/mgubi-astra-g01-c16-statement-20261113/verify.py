"""Run from any directory in this checkout; verifies frozen inputs, not proofs."""
from pathlib import Path
import hashlib, json, subprocess
root = Path(subprocess.check_output(["git", "rev-parse", "--show-toplevel"], text=True).strip())
manifest = json.loads(Path(__file__).with_name("frozen-inputs.json").read_text())
for item in manifest["inputs"]:
    blob = subprocess.check_output(["git", "show", item["commit"] + ":" + item["path"]], cwd=root)
    assert hashlib.sha256(blob).hexdigest() == item["sha256"], item
    if item["same_as_worktree"]:
        assert (root / item["path"]).read_bytes() == blob, item["path"]
print(f"PASS {len(manifest['inputs'])} frozen input versions and worktree identities; no proof validation")
