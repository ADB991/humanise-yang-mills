# Validation

Session `ADB991-claude-20261113-6afa`. Base `codex/existence-monograph` @ `7475e65d78b55053cc4328ad4aef5957e934ae9f`. The three chapters and their evidence files are byte-identical to the claimed `dcbdcc82` (`git diff --quiet dcbdcc82 7475e65d -- …`, exit 0).

## Commands actually run

- Read in full with `cat -n`: `trace-bill-prices.tex`, `trace-probe-assembly.tex`, `trace-mission-price.tex` and their three `*-evidence.md` files. Also the relevant lines of `trace-crown-buffer.tex` (`grep` for `l_4`/`150000`) and `trace-small-means.tex` l.36–50 and l.89–100.
- `git show a4a73dc9` and `git show --numstat a4a73dc9` on the three chapters, to separate ADB991's own wording hunks (+10/−11, +4/−3, +3/−3).
- Read the source declarations named in `lean-correspondence.md` with `cat -n`, `sed -n` and `grep -rn`.
- `sha256sum` on the inspected chapters, records and source files. Every source hash was found in `Lean/SOURCES.sha256`. The list is in `inspected-sha256.txt`.
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` (exit 0).
- `python3 -m unittest discover -s tests`: `Ran 22 tests … OK`.
- `git diff --check`: clean.

## Not run

- No LaTeX build. This report changes no `.tex` file.
- No Lean build, elaboration or `#print axioms` (Mathlib hosts are blocked in this environment).
- `Terrace/Turf.lean` definitions were not reopened (see `lean-correspondence.md`).

## Process

- One agent session did the whole review. No subagents were used.
- Nothing outside this directory was edited: manuscript, author records, other reviews, shared metadata and `Lean/` are untouched.
