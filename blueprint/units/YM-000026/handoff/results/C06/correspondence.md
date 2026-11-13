# C06 source correspondence (this pass)

Pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. The full crosswalk for these
chapters is in `../../../correspondence.md` (sections listed in
`findings.md`). It was written by the parent author and has bounded
reviews recorded there. This pass did not replace it. It rechecked the
anchors below by reading the Lean source as text. Nothing was elaborated
(see `validation.md`).

| Manuscript item | Declaration(s) read | What was checked |
| --- | --- | --- |
| seed-energy final allocation; repair R2 (`c_F=C_1/L^2`) | `YM.Work.E09.assemble` (`Lean/YM/Work/E09.lean`, statement lines 69–87, and the call `fine_budget A T U V x m d cF Q t …` at line 89); `fine_budget` in `Lean/YM/Work/E09/Budget.lean` lines 21–49 | `cF` is one parameter: it is bounded by `hF : cF ≤ T.high.linear/4` and is the fine-linear coefficient in the hit hypothesis `g`. `fine_budget` uses `2*m + cF ≤ T.high.linear/2`. This matches the manuscript after R2, and the earlier text left the identification implicit. The other hypotheses of `assemble` (`hm`, `hf`, `hd`, `hi`, `hc`, `hC`, `hw`, `hst`, `hx`, `hspend`, `herr`) correspond one-to-one to the stated choices of `m`, `W`, `C_1`, `t ≤ 2s`, `s ≤ δ` and `eq:seed-final-smallness`. |
| seed-energy constants `m ≤ λ_f/8, d_f, p/32, a_c/64` | same statement | Matched literally (`T.high.linear/8`, `d`, `S.kernel.penalty/32`, `T.low.direct/64`). |

Unchanged mappings, quoted from the parent correspondence, which the
reviewer should use:
- local-transfer: `YM.MergeProof.Accent.Duty.pre` (`Lean/YM/MergeProof/Temper.lean` line 43), `YM.MergeProof.Menu.stroke` (`Copse.lean` line 51). Corrected in revision 2: the parent wrote `Temper.Duty.pre`, `Copse.stroke`, which are file names, not namespaces. `eq:transfer-nonlinear-input` is the hypothesis `YM.MergeProof.Menu.Volant` (`Copse.lean`, `Canopy.buyer`); see ledger X1.
- local-splitting / local-sections: see `../../../local-projection-evidence.md`.
- polynomial-moment-attenuation: `YM.MultiNext.SignedSource.Mom.wiped`,
  `.formal_null`, `.covers`, `.along`, `Broadcast.channel`,
  `Averaging.locale`, `.sheet0`, `Mediator.attenuation`.
- seed-geometry: `YM.Work.E01.answer`, `YM.Pressure.qdc`, `YM.Pressure.route_sum`.
- seed-guides: `YM.Work.E03.*`, `YM.Work.E04.*`.
- seed-hit-comparison: `YM.Work.E07.*`.
- seed-tree-patch: `YM.Work.E02.*`, `YM.Work.E08.*`.
- predictor-branch: `YM.Branch.*`, `YM.RG.frame_unique`, `YM.RG.predictor_unique`, `YM.Push.derivative`, `YM.Precision.fixRoot`, and (added in revision 2) `YM.Precision.tau`, `.adjusted`, `.mean`, `.probe`, `.centered`, `.root_gradient` (`Lean/YM/PREC/FrameResponse.lean`), the branch test `YM.RG.Patch.usesMin` (universal over the axial order `l`).
- seed-unhit-comparison: `YM.Next.Fluctuations.*` (`roll_l`, `roll_d`, …, `bare`).
- seed-energy: `YM.Work.E05.*`, `YM.Work.E06.answer`, `YM.Work.E09.*`.

The notation repairs R1 and R3–R7 change no statement, so they need no new
source anchor. R5 makes the names agree with `packet-estimates.tex`.

## Revision 2 (session `ADB991-claude-20261112-6574`, answering review PR #80)

Read as text at the pin; nothing elaborated.

| Manuscript item | Declaration(s) | What was checked |
| --- | --- | --- |
| `lem:branch-nearest-projection` (predictor-branch), used for `eq:branch-projection`, `eq:geometry-cluster`, `eq:seed-curvature-bound` | `YM.Gauge.Nearest`, `nearest_exists`, `nearest_left`, `nearest_normal_one`, `nearest_normal`, `tubular`, `focus_diff`, `nearest_is_focus`, `nearest_tube`, `focus_deriv` (`Lean/YM/Gauge/Nearest.lean` lines 26–155); `YM.Gauge` structure (`Lean/YM/Gauge/MatrixGroup.lean` lines 23–26: a closed subgroup of `GaugeU n`) | The norm is the Frobenius norm (`open scoped Matrix.Norms.Frobenius`). The English proof follows the source route: normal condition `u^*X − 1 ∈ 𝔤^⊥` for a nearest point (`nearest_normal`), the chart `exp(X)(1+N)` (`tubular`), left translation (`nearest_left`), the uniform tube (`nearest_tube`), `Dπ(1)=Π` (`focus_deriv`). The projection is a theorem about every closed subgroup, not a field of the group data; seed-energy now says so. The manuscript cites Hall (2015) Thm 3.42 for the local structure of `G` near 1 instead of reproducing the source's `Chart.lean`. |
| `def:geometry-sector-conditions` (seed-geometry), used in seed-energy and seed-hit-comparison | `YM.Pressure.Stores.Plot` fields `consumes`, `drive`, `precise`, `list`; `YM.Pressure.startPos`, `pinPos` (`Lean/YM/Pressure/Seeds.lean` lines 31–32, 51–58) | (S1)–(S4) are the four fields with constants t/4, t/2, Wt, 2Wt; "meets 𝒩" is `¬ Disjoint (A.dome (5*radiusB x)) (startPos p)` (parents of the touched corners) and `pinPos b` (both endpoints). |
| `lem:warning-vanishes` (gaussian-warnings) | `YM.ConnectedActivityE6.Coat.blowing` (`Guards.lean` line 35, contraction branch lines 66–73), `YM.ConnectedActivityE6.Contract.charges` (`Eligibility.lean` lines 27–28), threshold identification `temp` (`Lean/YM/Push/SECTOR_MEASURE/Presented.lean` line 61) | Statement of `blowing` read: radius-2B watch at the focus site, plateau hypothesis `ht` at sites not inside 30B of the seeds on the radius-B watch, conclusion `X.mayor … = 0`. The proof bodies of the non-contraction branches were not read. The numbers 300B (compulsory region) were not traced; the manuscript states only `R_c ≥ R_p + B`. |
| polynomial-moment-attenuation, order restriction | `YM.Pressure.Teller.Funds.crosses : T.R.Deep P.η P.C (P.j-2)` (`Seeds.lean` line 105); `YM.Precision.Towers.Deep` (`Lean/YM/PREC/Stacks.lean` lines 111–114) | The funded tower supplies `A_0` differences through order `j−2`; the manuscript now requires `d ≤ j−2`. |
| leaf-transfer hypotheses (A), (B); ingredient vs density | `YM.Push.Local.Slots` (`LOCAL_SPLITTING/Merge.lean` lines 59–63), `YM.RG.Activities.KBound` (`Lean/YM/RG/Activities.lean` lines 102–104), `YM.PhysicalNext.Repeat.Lotus.Leaf`, `.cicada` (`Lotus/Postcards.lean`) | (A) is `Slots`, (B) is `KBound` with budget κ²; the ingredient/density split follows `Leaf.ingredient`/`cicada` as quoted in review `lean.md` L7 (not re-read beyond those lines). |
| unhit alignment (ledger X5) | `YM.Precision.Attached` (`Stacks.lean` line 44), `YM.Next.Fluctuations.roll_l` | Existence and statement only. |

Reference corrections to the canonical evidence (`../../local-projection-evidence.md`), recorded here rather than edited there:

- line 167: `Daisy.Charity.{dew,sustains,coco,premium_hit}` are `YM.PhysicalNext.Repeat.Daisy.dew`, `.sustains`, `.coco` (`Daisy/Solvent.lean`) and `.premium_hit` (`Daisy/Gnomon.lean`).
- lines 88–91: the directories `Blush`, `Mercury`, `Graces` are under `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/`, not `Lean/YM/MergeProof/`; `Partly.haze` is `YM.PhysicalNext.Repeat.Mercury.haze` (`Lean/YM/MergeProof/North/Partly.lean`); `Blush.bookbag` is `YM.PhysicalNext.Repeat.Blush.bookbag`.
- lines 218–221: the deterministic warning implication is proved by `YM.ConnectedActivityE6.Coat.blowing`, which should be listed with `alarm_bills`, `charge_area`, `ready`, `fires_at`.
- parent `../../correspondence.md` lines 174–175: `YM.Pressure.Road.strips`, `.revenue` are in `Road`; `risks`, `fallback`, `synchronized` are `YM.Pressure.risks`, `.fallback`, `.synchronized`.
- local-splitting `eq:local-read-price`: the source theorem `YM.Next.Foundations.price_of_readout` is the special case `q ≥ max(d,6)`, `p ≥ max(d,2)` (through `BudgetPoint`); the English proof is valid for the wider range `q, p ≥ d` (review L15).

These corrections were taken from review PR #80 (`lean.md` L5, L8, L14, L15). The `Daisy` namespace and the `Gauge`, `Precision`, `Pressure`, `Coat` declarations above were re-checked here by `grep`; the remaining ones are carried over from the review.
