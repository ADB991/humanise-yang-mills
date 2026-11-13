# C07 — response to the source-leakage audit rows (#187)

Issue #187 (follow-up to audit #159, report PR #164); package issue #48;
parent #26. Session `hairer-claude-20261113-c07leak`. Base
`codex/existence-monograph` at `2017d6f`; Lean pin
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Author response; every edit
below needs independent review by a different account. No approval is
recorded.

Rows are numbered as in the audit inventory at `97128ab` and were located
by their text.

| n | Location | Audit class → final | Response |
| --- | --- | --- | --- |
| 65 | `local-covariance.tex`, panel paragraph after `eq:local-covariance-floor` | ? → N (clarified) | "Source" refers to the mathematical source row `s` of `sec:actual-global-row-prices`, not to the formalisation. "global selected-source estimates" changed to "global source-row estimates" to remove the ambiguity. |
| 78 | `actual-palette-warning.tex`, opening | ? → T (notation) | The sentence used the Lean name `radiusB` as an unexplained "source radius". Both `radius(x)` and `radiusB(x)` are used in C07 and in other chapters (`trace-local-rate-selection.tex`). The sentence now defines `radius(x)=radiusB(x)=⌈(log x)²⌉`; the equality is `YM.Pressure.radiusB` (`Lean/YM/Pressure/Seeds.lean`), as recorded in `../../../centered-geyser-scale-estimates-evidence.md`. Unifying the two names across chapters is left to the notation/glossary task. |
| 85 | `actual-palette-warning.tex`, CAB face estimate | ? → J, resolved by an explicit argument and a manuscript reference (math) | "the source curvature lower bound therefore gives face toll below t/4" is replaced by the argument. The face read is `a_*` times the face curvature norm, so that norm is at most `t/32`. On the chart the face chord is at most `δ_G`, where the local estimate `¾ chord² ≤ ‖κ_G‖²` (stated in `sec:actual-reader-guarded-curvature`) gives `chord ≤ 2‖κ_G‖`. Since the toll is the face chord, `toll ≤ t/16 < t/4`. Checked against the source (C1 below). |
| 86 | `actual-palette-warning.tex`, paragraph after the sewing identity | J → resolved by manuscript reference | "The source's assembly uses these inputs in a fixed order" is replaced by a reference to `prop:actual-palette-condition`, whose hypotheses already list the local chart, port, distant-door and response receipts. No step was deferred: the inputs are explicit hypotheses of that proposition. |
| 87 | same paragraph | J → wording | "it is not the source of the port constant" (ordinary English "source") becomes "it does not supply the port constant `C_0`". The caveat is kept. |

No new named outstanding input.

**Observation for the reviewer and G06.** The local curvature estimate
`¾ chord(U)² ≤ ‖κ_G(U)‖²` for `chord(U) ≤ δ_G` is stated, not proved, in
`actual-reader-guarded-curvature.tex` (it is called "elementary";
source `YM.Work.E05.curvature_lower`, `Lean/YM/Work/E05.lean`). Row 85 now
relies on that statement. Its proof belongs to the owner of that chapter.

## Correspondence moved from the chapter

- **C1 (row 85).** `YM.AnalyticNext.ConnectedActivity.Jewels.night`
  (`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_BOUNDS/Hour.lean`, lines 55ff.)
  proves the face clause as follows:
  - `‖u‖ = a‖curvature(faceValue U j)‖` with `a = √direct`, and
    `‖u‖ ≤ ‖u−y‖+‖y‖ ≤ 2·slew·t`, `slew = a/64`;
  - hence `‖curvature‖ ≤ t/32`;
  - `hz` derives `chord ≤ 2‖curvature‖` from the second clause of
    `YM.Work.E05.curvature_lower` whenever `chord ≤ δ`, and the chart bound
    (`cordF`, `vanishes`) supplies `chord ≤ δ`;
  - finally, `YM.Pressure.toll U x = G.chord (faceValue U x)`
    (`Lean/YM/Pressure/Rows.lean`, line 55).
- **C2 (rows 86–87).** The assembly is `YM.PhysicalNext.InteractingRank.Pump.ballot`
  together with `excels`, `putAway` and `distant_links`, as listed in
  `../../../actual-palette-warning-evidence.md`.

## Checks

- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex`
  in `manuscript/`: success, no undefined references. The single
  pre-existing overfull box (1.8pt, `public-run-binding.tex`) is outside C07.
- Changed passages inspected in the rendered PDF.
- Lean statements in C1 were read at the pin; no Lean build was run.
- `python3 scripts/check_blueprint.py`: "Blueprint structure OK".
- `chapter-hashes.json` (`current_sha256`) and `review-index.md` updated
  for the two edited chapters; `manifest.json` keeps its historical hashes.
