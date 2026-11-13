# Validation: commands actually run

Reviewer session `ADB991-claude-20261113-59b4`, branch `claude/issue-143-59b4` on `codex/existence-monograph` `ddc3c90`, 2026-11-13.

| Command | Result |
| --- | --- |
| `sha256sum manuscript/existence/{weighted-frame-penalty,weighted-stationary-inverses,selected-stationary-linear-data,selected-kinetic-response,stationary-determinant-prices}.tex` | equal to the author handoff hashes in `results/C10/README.md`; recorded in `hashes.json` |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` (run before and after adding these report files) |
| `python3 -m unittest discover -s tests` | `Ran 22 tests … OK` |
| `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` (from `manuscript/`) | exit 0; 968 pages; 0 `LaTeX Warning` lines in the log, so no undefined or multiply defined references |
| `pdftoppm -f 472 -l 486` and viewing the images | Sections 125–129 (the five reviewed chapters) render correctly. Pages 473 and 484 were inspected in detail; the others were checked for layout. No overfull displays or broken references seen. |
| Lean source reading (`grep`, `sed`) of the declarations in `lean.md` | text-level only |

Not run: Lean elaboration, `lake build`, `#print axioms`. Mathlib sources are blocked by the network allowlist here. No chapter was edited, so the build verifies only that the reviewed text renders.
