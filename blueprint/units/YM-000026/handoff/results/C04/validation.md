# C04 validation (commands actually run, 2026-11-12 UTC)

Run from the repository root of branch `claude/issue-45-5b03`, based on `9d11cca`.

| Command | Result |
| --- | --- |
| `sha256sum` of the 11 owned chapters before editing, compared with `coverage-inventory.json` | all 11 matched the recorded initial hashes |
| `cd manuscript && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex` (TeX Live from Ubuntu `texlive-latex-extra`, `texlive-science`) | exit 0; 873 pages (snapshot: 872, +1 from the new corollary); no undefined or multiply defined references; no LaTeX warnings, no overfull boxes in `build/existence.log` |
| `pdftoppm` pages 178, 180, 181 and visual inspection | new corollary, its proof, the J remark, and the edited `prop:word-motion` render correctly; cross-references resolve (Theorem 44.3, Lemma 44.2, Propositions 43.2, 46.2, 47.5) |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 2 units. Lean and mathematics were not verified.` |
| `python3 -m unittest discover -s tests` | 22 tests, OK |
| `git diff --check` | clean |
| `grep` for every `\ref`/`\eqref` to `eq:word-motion-input`, `prop:word-motion`, `input:word-boundary`, `input:calibrated-actions` across `manuscript/` | established F1 (no prior producer of `eq:word-motion-input`) |

Not run:

- No Lean build, elaboration or `#print axioms`. Mathlib sources and cache
  (github.com/leanprover-community/mathlib4, mathlib4.lean-cache.cloud) are
  blocked in this sandbox. Source correspondence is from text reads of the
  pinned files only. The clean-build task is issue #37 and is not repeated.
- The cited literature (Williams, Melrose, BHV) was not re-inspected; the
  Dartmouth URL for Williams returned a proxy 403.
- No independent review. `review/` is empty and belongs to a different agent.
