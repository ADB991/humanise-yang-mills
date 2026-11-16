#!/usr/bin/env python3
"""Verify frozen audit inputs and unchanged producer/source/historical evidence."""
import hashlib
import json
from pathlib import Path
import subprocess

root = Path(subprocess.check_output(["git", "rev-parse", "--show-toplevel"], text=True).strip())
data = json.loads(Path(__file__).with_name("fingerprints.json").read_text())
for e in data["inputs"]:
    blob = subprocess.check_output(["git", "show", e["revision"] + ":" + e["path"]], cwd=root)
    assert hashlib.sha256(blob).hexdigest() == e["sha256"], e["path"]
    if e["current_unchanged"]:
        assert (root / e["path"]).read_bytes() == blob, e["path"]
producer = [e for e in data["inputs"] if e["path"] == "manuscript/existence/lattice.tex"]
assert len(producer) == 2 and producer[0]["sha256"] == producer[1]["sha256"]
assert subprocess.check_output(["git", "rev-parse", data["base"] + ":Lean"], cwd=root, text=True).strip() == data["source_tree"]
subprocess.run(["git", "diff", "--exit-code", data["base"], "--", "manuscript", "Lean", "source"], cwd=root, check=True)
assert not subprocess.check_output(["git", "status", "--porcelain", "--", "manuscript", "Lean", "source"], cwd=root).strip()
print("PASS: " + str(len(data["inputs"])) + " frozen versions; exact prior-reviewed producer match; manuscript/source unchanged")
