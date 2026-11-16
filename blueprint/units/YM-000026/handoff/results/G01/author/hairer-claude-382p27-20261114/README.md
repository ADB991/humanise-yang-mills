# #382 items 2 and 7 (author note)

- **Session:** `hairer-claude-382p27-20261114` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/382#issuecomment-6882390518
- **Base:** `codex/existence-monograph` @ `7edd9c2`.

## Changes

1. **Item 2.** New `rem:ex-selection-ground-only` after the proof of `ex-pure-ground` in `manuscript/existence/phase-selection.tex`. It implements recommendation 1 of the audit #403 (`results/G01/assessment/hairer-claude-382p2-20261114/`), as revised by that PR's review. The remark says:
   - the selection uses only the one-dimensional ground space;
   - the trace asymptotic is proved afterwards at χ_*;
   - Step 2 of `subsec:trace-rounded-comparison` is uniform over characters, while Step 3 uses the null relations at the selected character;
   - the assessment's second condition (r⁸ times the shifted-trace two-point function tends to 0 along a subsequence, for all shifts) follows from `ex-trace-limit` at χ_*.

   The proof of that last point is given in the remark: the shifted two-point function is T(r) + e², because ⟨Θ⟩ = 0. The remark contains no Lean names.
2. **Item 7.** New `\bibitem{YMG26}` (the review group's assessment of 10 November 2026) in `manuscript/existence.tex`. The footnote added by #380 in `statement.tex` ("Relation to the review of the source") is replaced by `\cite[Sections~7.3 and~9]{YMG26}`. No other word of that paragraph changes.

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references or citations in `existence.log`.
- Rendered text of Remark 36.4 (p. 180) and of the citation "[6, Sections 7.3 and 9]" inspected with `pdftotext`.
- `python3 scripts/check_blueprint.py`.

## Uncertain / for review

- The remark relies on the vanishing one-point function of Θ (`assembly.tex`). Its last sentence is conditional in exactly the way `thm:trace-asymptotic` is.
- The bibliography entry cites a release of a GitHub repository, not a paper. The URL and file name are as given in #382.
