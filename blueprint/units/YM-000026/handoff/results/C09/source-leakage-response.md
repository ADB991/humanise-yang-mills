# C09 — response to the source-leakage audit rows (#188)

Issue #188 (follow-up to audit #159, report PR #164); package issue #50;
parent #26. Session `hairer-claude-20261113-c09leak`. Base
`codex/existence-monograph` at `2017d6f`; Lean pin
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Author response; the edits
need independent review by a different account. No approval is recorded.

Rows are numbered as in the audit inventory at `97128ab` and were located
by their text.

| n | Location | Class | Response |
| --- | --- | --- | --- |
| 118 | `wilson-vacuum-price.tex`, proof of `prop:ex-wilson-stream`, choice of `R_*` | B | "In the source's Frobenius norm" replaced by the mathematical statement that the distance to the unitary matrices is measured in the Frobenius norm. The caveat it carried (the radius `rad(1)` is a Frobenius-norm radius, so the operator-norm step is needed) stays in the text, which already proves that step. Source anchor below. |
| 119 | `wilson-vacuum-price.tex`, `rem:ex-wilson-stream-use` | J, resolved by manuscript reference (math) | The remark invoked the source's all-orders summation lemma for countable families of interaction atoms. The bare action involves only the finite family of plaquette types, so the pictures used are those of `prop:ex-wilson-stream` itself, at `t=2,3` (Taylor degrees three and four), and the proposition's proof already sums the finite family. The remark now says this. The countable-family statement and its summability condition are moved below. They are not used by C09, and the manuscript does not prove them. |

No new named outstanding input.

**For the reviewer.** The original remark said "orders three and four". I read these as Taylor degrees `n=t+1`, i.e. the pictures `𝒲_2`, `𝒲_3`. This matches the consumer `lem:ex-soft-wilson-pictures`, which uses the pictures of orders `t=2,3`. Please confirm that no consumer needs a picture of another order, or a countable family.

## Correspondence moved from the chapter

- Row 118: `YM.Stationary.brush_bounds` chooses the neighbourhood by continuity of the matrix exponential, with `radius(1)` measured in the Frobenius norm. `stringMat_bound` gives the length-four product bound `(1+radius(1))^4 ||1||_F`. Both are in `Lean/YM/Next/STATIONARY/Shape/ClassicalMatch.lean`; see `../../../wilson-vacuum-price-evidence.md`.
- Row 119: the general countable-atom summation result behind `YM.Stationary.gathered` (`Lean/YM/Next/STATIONARY/Shape/LocalOracle.lean`) applies the local-extension argument to a countable family of interaction atoms under the summability condition `Σ_j b_j exp((t+1)² σ·4 d_j) < ∞`. Here `d_j` is the support length and `b_j` the absolute coefficient times its exponential length weight. For the bare action the family is finite with support length four, and summability is immediate. As already recorded in the evidence file, the countable result is not re-proved in the manuscript.

## Checks

- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex` in `manuscript/`: success, no undefined references. The single pre-existing overfull box (1.8pt, `public-run-binding.tex`) is outside C09.
- Changed passages inspected in the rendered PDF (Remark 121.2 and the proof of Proposition 121.1).
- `python3 scripts/check_blueprint.py`: "Blueprint structure OK".
- `chapter-hashes.json` entry for `wilson-vacuum-price.tex` updated.
