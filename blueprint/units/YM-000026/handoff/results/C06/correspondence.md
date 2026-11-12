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
- local-transfer: `Temper.Duty.pre`, `Copse.stroke`.
- local-splitting / local-sections: see `../../../local-projection-evidence.md`.
- polynomial-moment-attenuation: `YM.MultiNext.SignedSource.Mom.wiped`,
  `.formal_null`, `.covers`, `.along`, `Broadcast.channel`,
  `Averaging.locale`, `.sheet0`, `Mediator.attenuation`.
- seed-geometry: `YM.Work.E01.answer`, `YM.Pressure.qdc`, `YM.Pressure.route_sum`.
- seed-guides: `YM.Work.E03.*`, `YM.Work.E04.*`.
- seed-hit-comparison: `YM.Work.E07.*`.
- seed-tree-patch: `YM.Work.E02.*`, `YM.Work.E08.*`.
- predictor-branch: `YM.Branch.*`, `YM.RG.frame_unique`, `YM.RG.predictor_unique`, `YM.Push.derivative`, `YM.Precision.fixRoot`.
- seed-unhit-comparison: `YM.Next.Fluctuations.*` (`roll_l`, `roll_d`, …, `bare`).
- seed-energy: `YM.Work.E05.*`, `YM.Work.E06.answer`, `YM.Work.E09.*`.

The notation repairs R1 and R3–R7 change no statement, so they need no new
source anchor. R5 makes the names agree with `packet-estimates.tex`.
