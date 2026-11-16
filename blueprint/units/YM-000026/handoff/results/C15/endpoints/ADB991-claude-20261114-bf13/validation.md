# Validation (session ADB991-claude-20261114-bf13)

Commands actually run on branch `claude/issue-337-bf13` (base `97f806c7`):

- `python3 scripts/check_blueprint.py` -> "Blueprint structure OK: 4 units. Lean and mathematics were not verified." (exit 0)
- `python3 -m unittest discover -s tests` -> 22 tests OK
- `git diff --quiet 2719f797 97f806c7 -- manuscript/existence/trace-asymptotic.tex` -> identical (the #245 C15 freeze)
- `git diff --quiet 69b2631f 97f806c7 -- assembly.tex statement.tex trace-profiles.tex trace-spectrum.tex` -> identical (the #245 C16 freeze)
- `git diff --check 97f806c7` -> clean
- `sha256sum` of inspected files -> `inspected-sha256.txt`

Not run:
- No LaTeX build: no `.tex` file changed.
- No Lean build or `#print axioms`: the source was read textually at pin 3456e5e.
- The #356 branch (`claude/issue-336-37f8` @ dbb4e3c) was read with `git show` and not built.
