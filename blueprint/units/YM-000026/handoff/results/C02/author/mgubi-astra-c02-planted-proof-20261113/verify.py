#!/usr/bin/env python3
"""Verify immutable versions, unchanged inherited evidence, and new prose."""
import hashlib
import json
from pathlib import Path
import re
import subprocess

root = Path(subprocess.check_output(["git", "rev-parse", "--show-toplevel"], text=True).strip())
data = json.loads(Path(__file__).with_name("fingerprints.json").read_text())
for e in data["inputs"]:
    blob = ((root / e["path"]).read_bytes() if e["revision"] == "WORKTREE" else
            subprocess.check_output(["git", "show", e["revision"] + ":" + e["path"]], cwd=root))
    assert hashlib.sha256(blob).hexdigest() == e["sha256"], e["path"]
    if e["unchanged"]:
        assert (root / e["path"]).read_bytes() == blob, e["path"]
chapter = "manuscript/existence/centered-estimates.tex"
before = subprocess.check_output(["git", "show", data["base"] + ":" + chapter], cwd=root, text=True)
after = (root / chapter).read_text()
pattern = r"\\begin\{lemma\}\[Seminorm from the planted inequality\].*?\\end\{proof\}"
assert re.search(pattern, before, re.S).group() == re.search(pattern, after, re.S).group()
assert subprocess.check_output(["git", "rev-parse", data["base"] + ":Lean"], cwd=root, text=True).strip() == data["source_tree"]
subprocess.run(["git", "diff", "--exit-code", data["base"], "--", "Lean", "source"], cwd=root, check=True)
print("PASS: " + str(len(data["inputs"])) + " frozen/current versions; inherited evidence and root lemma unchanged; source immutable")
