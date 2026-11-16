# Validation

Session `ADB991-claude-20261113-46a7`. Base `codex/existence-monograph` @ `13f52dd643b0dacd70dff6c01f33b3b3be492bc4`.

## Commands actually run

- Read in full: the three chapters (`cat -n`), plus the relevant parts of `reference-cone.tex` (statement and parameter derivation) and `centered-estimates.tex` (statement of `prop:ex-centered-planted`).
- `git diff a4a73dc9^ a4a73dc9` on the three chapters, to separate ADB991's own wording hunks from the rest.
- Opened the source declarations named in `lean-correspondence.md` with `cat`, `sed` and `grep`.
- `sha256sum` on the inspected chapters and source files. Every source hash was found in `Lean/SOURCES.sha256`. The list is in `inspected-sha256.txt`.
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` (exit 0).
- `python3 -m unittest discover -s tests`: `Ran 22 tests … OK`.
- `git diff --check`: clean.

## Not run

- No LaTeX build and no rendered-page inspection. This report changes no `.tex` file.
- No Lean build, elaboration or `#print axioms`.
- No access to external literature. O4's textbook locator is from memory and was not checked.

## Process

- One agent session did the whole review. No subagents were used.
- Nothing outside this directory was edited: manuscript, author records, other reviews, shared metadata and `Lean/` are untouched.
