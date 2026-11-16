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
| 119 | `wilson-vacuum-price.tex`, `rem:ex-wilson-stream-use` | J, resolved by manuscript reference (math) | The remark invoked the source's all-orders summation lemma for countable families of interaction atoms. The bare action involves only the finite family of plaquette types, so the pictures used are those of `prop:ex-wilson-stream` itself, at `t=2,3` (Taylor degrees three and four), and the proposition's proof already sums the finite family. The remark now says this. The countable-family statement and its summability condition are moved below. They are not needed for the bare Wilson proposition or its application, and this chapter does not prove them. C09 has a separate countable use, in the row action: `prop:ex-row-quadratic-price` (`row-quadratic-price.tex`) sums over a finite plaquette set and `i,j∈ℕ`, with its own weighted double-sum estimate and M-test. `cor:ex-row-controlled-action` combines that picture with the bare Wilson one. |

No new named outstanding input.

**For the reviewer.** The original remark said "orders three and four". I read these as Taylor degrees `n=t+1`, i.e. the pictures `𝒲_2`, `𝒲_3`. This matches the consumer `lem:ex-soft-wilson-pictures`, which uses the pictures of orders `t=2,3`. Please confirm that no consumer needs a picture of another order, or a countable family.

## Correspondence moved from the chapter

- Row 118: `YM.Stationary.brush_bounds` chooses the neighbourhood by continuity of the matrix exponential, with `radius(1)` measured in the Frobenius norm. `YM.Work.F02.stringMat_bound` (`Lean/YM/Work/F02/Path.lean`, line 63) gives the length-four product bound `(1+radius(1))^4 ||1||_F`; it is called from `YM.Stationary.price_vault`. `brush_bounds` and `price_vault` are in `Lean/YM/Next/STATIONARY/Shape/ClassicalMatch.lean`. See `../../../wilson-vacuum-price-evidence.md`.
- Row 119: the general countable-atom summation result behind `YM.Stationary.gathered` (`Lean/YM/Next/STATIONARY/Shape/LocalOracle.lean`) applies the local-extension argument to a countable family of interaction atoms under the summability condition `Σ_j b_j exp((t+1)² σ·4 d_j) < ∞`. Here `d_j` is the support length and `b_j` the absolute coefficient times its exponential length weight. For the bare action the family is finite with support length four, and summability is immediate. As already recorded in the evidence file, the countable result is not re-proved in the manuscript.

## Checks

- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex` in `manuscript/`: success, no undefined references. The single pre-existing overfull box (1.8pt, `public-run-binding.tex`) is outside C09.
- Changed passages inspected in the rendered PDF (Remark 121.2 and the proof of Proposition 121.1).
- `python3 scripts/check_blueprint.py`: "Blueprint structure OK".
- `chapter-hashes.json` entry for `wilson-vacuum-price.tex` updated.

## Response to the independent review (PR #221)

Session `hairer-claude-20261113-c09fix`.

- **S1 (required).** The table entry for row 119 no longer says the
  countable statement is unused by C09. It now says the statement is not
  needed for the bare Wilson proposition or application, and it records the
  separate countable row-action use (`prop:ex-row-quadratic-price`,
  `cor:ex-row-controlled-action`), which is proved in its own chapter.
- **S2 (required).** `stringMat_bound` is now given as
  `YM.Work.F02.stringMat_bound` in `Lean/YM/Work/F02/Path.lean` (line 63),
  called from `price_vault` in `ClassicalMatch.lean`. I checked this at the pin.
- The review's scope note is accepted: `vintageWilson` uses `t=1,2,3`, which
  the all-`t` proposition covers.

This is a record-only change, and no manuscript text changed.
