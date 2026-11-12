# C04 source correspondence (this pass)

Source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Text reads of the
pinned files only; nothing was elaborated (Mathlib is not reachable from this
sandbox, see validation.md). The existing table in
`../../../reconstruction-evidence.md` remains the correspondence for the
unchanged chapters; it was not re-verified line by line in this pass.

## New: Corollary `cor:word-motion-inputs` (boundary-detection.tex)

| Manuscript step | Declaration | Path | What was read |
| --- | --- | --- | --- |
| Statement: K(gb,gc)=K(b,c), g↦K(b,gc) continuous | `YM.Bid.C28` (statement), `YM.Work.C28.answer` (proof) | `Lean/YM/Bid/Grow.lean` l.50–52; `Lean/YM/Work/C28.lean` l.134–143 | full |
| Definitions of the two properties | `YM.Boundary.Surface.Transforms`, `YM.Boundary.Surface.Strong`, word motion `YM.Boundary.Spins.po` | `Lean/YM/Fields/Motion.lean` l.15–28 | full |
| (gb)^*=g(b^*) | `YM.Work.C28.rev_po`, `YM.Boundary.Letter.rewrites`, `YM.Boundary.starRead` | `C28.lean` l.127–132; `Lean/YM/Fields/Star.lean` l.42–43, 68–75 | full |
| Invariance via g=(a,I)(0,Λ) | `YM.Work.C28.gpush_split`, `expect_po` (uses `Urs.translation`, `Urs.rotation`) | `C28.lean` l.110–125 | full (`Urs` fields not opened) |
| Continuity by pinning labels in one level and basis expansion | `YM.Work.C28.strong`, `continuous_reads`, `continuous_pinned`, `continuous_push`, `expect_ofFn` | `C28.lean` l.20–108 | full |
| Hypothesis C08 = Schwartz continuity of the pullback | `YM.Bid.C08` (consumed as `H.1`) | `Lean/YM/Bid/Grow.lean` | statement name only; the manuscript uses `lem:schwartz-motion`, already mapped to C08 in reconstruction-evidence.md |
| Consumers | `YM.Integrated.reconstructionArcs` field `cν := Work.C28.answer`; `YM.Next.BOUNDARY.Stage.establishing`; `YM.Boundary.harvest` (`hu : W.Strong J K`, `hTm : W.Transforms J K`) → `YM.Boundary.Soil.mobilize` | `Lean/YM/Integrated.lean` l.182–211; `Lean/YM/Next/BOUNDARY/Stage.lean` l.164–184; `Lean/YM/Fields/Lo.lean` l.85–98; `Lean/YM/Fields/Motion.lean` l.72–87 | full for the cited lines |

Differences from the source, all routine: the manuscript works with the
abstract letter action g(v,f)=(ρ(Λ)v,P_gf) rather than `Letter.read`;
`continuous_reads` allows a different motion per letter, while the manuscript
uses the special case (identity on b, g on c) that `strong` instantiates; the
manuscript proves the translation part from `thm:lorentz-covariance`, which
already contains translation invariance, where the source uses
`Urs.translation`. Hidden instances/coercions in `Urs` and `Descends` were not
opened; the reviewer should check that `Urs W K` corresponds to the
hypotheses of `thm:lorentz-covariance` and `Descends`/`ties`/`commutes` to
`prop:lorentz-label-descent`.

## Notation repairs

N1–N3 in findings.md change symbols only; no declaration correspondence changes.
