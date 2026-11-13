# Validation record

All commands were run from the repository root on branch
`claude/c15-local-review`, based on `codex/existence-monograph` at
`dcbdcc8d`.

| Command | Result |
| --- | --- |
| `python3 blueprint/units/YM-000026/handoff/results/C15/review/hairer-claude-c15-local-20261114/check_integrity.py` | `ok {'target': 5, 'evidence': 5, 'interface': 5, 'source': 40}`: target hashes equal the reviewed commit, and every inspected Lean file matches `Lean/SOURCES.sha256` at pin `3456e5e` |
| `python3 scripts/check_blueprint.py` | exit 0, "Blueprint structure OK: 4 units" |
| `git diff --cached --check` | exit 0, no whitespace errors |

Source inspection used `grep -n` and `sed -n` on the files listed in
`hashes.json`.

**Not run:**
- Lean elaboration or build.
- LaTeX build. No manuscript file was changed, so there is no rendering to inspect.
- An audit of the producers of the incoming receipts.

No manuscript, author record, evidence file, other review or `Lean/` file
was edited.
