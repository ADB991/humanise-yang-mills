# C07 source-leakage response: correspondence

**Verdict: one minor required correspondence correction, S1; the new mathematical inference otherwise matches the inspected source.** Target `6e91e365f6527b805f58e5ecbb9d6eedbc57c456`; source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Textual inspection only, with no Lean elaboration, axiom audit or whole-C07 renewal.

## S1 — face supplier confused with bond supplier

In `blueprint/units/YM-000026/handoff/results/C07/source-leakage-response.md`, C1, lines 38–40, the sentence attributes the face chord chart bound to `cordF` and `vanishes`. Replace `cordF` there with `face_pays` (and retain the local chart/Lit receipt and `vanishes`). This is a minor source locator correction, not a wrong estimate.

In `YM.AnalyticNext.ConnectedActivity.Jewels.night`, `Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_BOUNDS/Hour.lean` lines 55–99, the eventual inputs are bound as `hc'` for `face_pays`, `hg` for `vanishes`, and `hQ` for `cordF`. The face branch obtains its Lit witness from `hy`, then uses `((hc' S j ... hg').trans hg.le)` to place the face chord inside the local curvature radius. Only the following bond branch uses `hQ`.

The distinction is explicit in `Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_BOUNDS/Palace.lean`: `YM.AnalyticNext.ConnectedActivity.Aff.face_pays` (62ff) bounds a fine-face toll by the next allowance from a Lit receipt; `YM.AnalyticNext.ConnectedActivity.Aff.cordF` (96ff) controls a coarse-bond wire and the two likelihood factors. The face clause then uses `YM.AnalyticNext.ConnectedActivity.Rates.vanishes` (`Rate.lean`, 60ff) to make that allowance smaller than the curvature radius. No change to the manuscript inequality is needed.

## Other inspected correspondence

- `YM.Pressure.radiusB`, `Lean/YM/Pressure/Seeds.lean` line 22, is `Nat.ceil ((Real.log x)^2)`. The new definition agrees on x>1.
- `YM.Pressure.toll`, `Lean/YM/Pressure/Rows.lean` line 55, is the chord of `faceValue U x`.
- `YM.Work.E05.curvature_lower`, `Lean/YM/Work/E05.lean` line 88ff, supplies positive constants and the physical-normalization lower bound on the chord neighborhood. Its second conjunct is exactly (3/4)chord²<=norm(curvature)². The manuscript producer states this but does not prove it; the author record correctly preserves that limitation.
- `night` has positive t on the eventual selected tail, positive a=sqrt(direct), a target bound and the unshifted face bound each at a*t/64. Its proof obtains curvature<=t/32 and the conservative chord<=2 norm(curvature) bound, matching the revision.
- Rows 86–87 were checked against the explicit manuscript proposition and the preserved port/annular separation. The full `Pump.ballot` and downstream opacity assembly were not re-audited in this bounded pass.

Both changed current hashes agree with the chapter bytes and review-index entries. Independent approval stays null; the author status remains draft; both matching-review entries remain “none”. The historical manifest and old review files are untouched. This finding concerns only the frozen delta and does not certify the remaining C07 sources or prior reviews.
