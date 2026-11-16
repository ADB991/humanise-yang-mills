#!/usr/bin/env python3
"""Check immutable input versions and the authored manuscript fingerprint."""
import hashlib
import json
from pathlib import Path
import subprocess

root = Path(subprocess.check_output(["git", "rev-parse", "--show-toplevel"], text=True).strip())
data = json.loads(Path(__file__).with_name("fingerprints.json").read_text())
for entry in data["inputs"]:
    if entry["revision"] == "WORKTREE":
        blob = (root / entry["path"]).read_bytes()
    else:
        blob = subprocess.check_output(["git", "show", entry["revision"] + ":" + entry["path"]], cwd=root)
    assert hashlib.sha256(blob).hexdigest() == entry["sha256"], entry["path"]
assert subprocess.check_output(["git", "rev-parse", data["base"] + ":Lean"], cwd=root, text=True).strip() == data["source_tree"]
subprocess.run(["git", "diff", "--exit-code", data["base"], "--", "Lean", "source"], cwd=root, check=True)
print("PASS: " + str(len(data["inputs"])) + " frozen/current fingerprints; source tree and source immutability")
