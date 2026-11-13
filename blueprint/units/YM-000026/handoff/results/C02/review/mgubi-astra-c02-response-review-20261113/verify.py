#!/usr/bin/env python3
"""Verify frozen review inputs; this does not verify mathematics or Lean proofs."""
import hashlib
import json
import pathlib
import subprocess

HERE = pathlib.Path(__file__).resolve().parent
ROOT = pathlib.Path(subprocess.check_output(
    ["git", "rev-parse", "--show-toplevel"], text=True).strip())
record = json.loads((HERE / "hashes.json").read_text())
target = record["review_target"]


def frozen(path):
    return subprocess.check_output(["git", "show", f"{target}:{path}"], cwd=ROOT)


count = 0
for group in ("reviewed_payload_sha256", "immediate_support_sha256",
              "inspected_source_file_sha256"):
    for path, expected in record[group].items():
        assert hashlib.sha256(frozen(path)).hexdigest() == expected, path
        count += 1

manifest_path = ("blueprint/units/YM-000026/handoff/results/C02/"
                 "response-manifest-20261113.json")
author = json.loads(frozen(manifest_path))
for path, expected in author["sha256"].items():
    assert record["reviewed_payload_sha256"][path] == expected, path
assert author["source_revision"] == record["source_revision"]
assert json.loads(frozen("source/upstream.json"))["revision"] == record["source_revision"]
tree = subprocess.check_output(
    ["git", "rev-parse", f"{target}:Lean"], cwd=ROOT, text=True).strip()
assert tree == record["lean_tree"]
subprocess.run(["git", "diff", "--exit-code", target, "--", "Lean",
                "source/upstream.json"], cwd=ROOT, check=True)
print(f"PASS: {count} frozen file hashes; all {len(author['sha256'])} author payload hashes; "
      "source pin/tree; current tracked Lean and source manifest unchanged.")
print("Frozen target:", target)
