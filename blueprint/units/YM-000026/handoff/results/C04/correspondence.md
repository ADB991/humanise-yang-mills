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
| Hypothesis C08 = Schwartz continuity of the pullback | first conjunct of `YM.Bid.C08` (continuity of g↦P_gf in the joint Schwartz space), consumed as `H.1` in `C28.lean` l.43; the second conjunct (strong Schwartz derivative along coordinate boosts) is the boost derivative of `lem:schwartz-motion` and is not used by C28 | `Lean/YM/Bid/Corners.lean` l.99–101 (corrected; `Grow.lean` l.50 only takes `C08` as the first premise of `C28`) | statement read (review L1) |
| Consumers | `YM.Integrated.reconstructionArcs` field `cν := Work.C28.answer`; `YM.Next.BOUNDARY.Stage.establishing`; `YM.Boundary.harvest` (`hu : W.Strong J K`, `hTm : W.Transforms J K`) → `YM.Boundary.Soil.mobilize` | `Lean/YM/Integrated.lean` l.182–211; `Lean/YM/Next/BOUNDARY/Stage.lean` l.164–184; `Lean/YM/Fields/Lo.lean` l.85–98; `Lean/YM/Fields/Motion.lean` l.72–87 | full for the cited lines |

Differences from the source, all routine: the manuscript works with the
abstract letter action g(v,f)=(ρ(Λ)v,P_gf) rather than `Letter.read`;
`continuous_reads` allows a different motion per letter, while the manuscript
uses the special case (identity on b, g on c) that `strong` instantiates; the
manuscript proves the translation part from `thm:lorentz-covariance`, which
already contains translation invariance, where the source uses
`Urs.translation`.
Correction (review L2): `YM.Boundary.Urs W K` (`Lean/YM/Shift/Closing.lean`
l.83–85) is the pair of **conclusions** of `thm:lorentz-covariance`
(translation invariance; Lorentz covariance W_n(ρ(Λ)v)(P_Λf)=W_n(v)(f)),
not its hypotheses. It is produced by `YM.Bid.C09` (`Corners.lean`
l.103–106) and consumed by `YM.Bid.C28`. The manuscript corollary assumes
the hypotheses of the theorem and uses its conclusions, so it is a composite
of C09 and C28. `YM.Boundary.Spins.Descends` (`Lean/YM/Fields/Star.lean`
l.26–35; fields `ties`, `identity`, `representation`, `spin`, `boosts`,
`spatial`, `commutes`) is the list of conclusions of
`prop:lorentz-label-descent`, with J the time-axis adjoint.

A further difference of route (review L9): the source proves continuity of
g↦K(b,gc) letter by letter (`YM.Work.C28.continuous_push` at arity one,
then `continuous_reads`, composing `Joint.jointCont n` with the single-slot
pushes, `C28.lean` l.77–78). The manuscript pulls back the joint test by the
affine map g̃ (identity on the first n positions, g on the last m) and uses
the general form of `lem:schwartz-motion`. That lemma's statement now
includes continuity of A↦f∘A^{-1} on the whole affine group (revision
below), so this is a reorganisation of a proved statement, not a reuse of a
proof.

## Notation repairs

N1–N3 in findings.md change symbols only; no declaration correspondence changes.

## Revision answering review PR #76 (session ADB991-claude-20261112-74c4)

Chapter edits, with the review item each answers:

| Item | Chapter, label | Change | Source anchor |
| --- | --- | --- | --- |
| M1 | `locality.tex`, before `thm:spacelike-exchange` | Cutoff sentence replaced by f_R=χ(X/R)f with supp f_R ⊆ supp f ⊂ O_ij and f_R→f in Schwartz space | `YM.Boundary.Probe.cap_support`, `finite_cap`, `persistent` (`Lean/YM/Shift/Cut.lean` l.44–45, 83) |
| M4 | `complex-heat.tex`, new paragraph before T_E | Time-first convention in Sections complex-heat–locality declared and identified with the time-last convention of `statement.tex` | `YM.timeAxis` (`Lean/YM/Space/Index.lean` l.20: `Fin.last 3`) |
| M5 | `reconstruction.tex`, `prop:word-motion` | Translation hypothesis quantified: ∀a ∀b ∃ε(a,b)>0, identity for 0<t<ε | `YM.Boundary.Cups.time` (`Lean/YM/Fields/Lo.lean` l.37–41, `till = 𝓝[>] 0`) |
| M6 | `heat-vectors.tex`, `prop:heat-cups` | Translation identity h_t(τ_ab)=T_E(a)h_t(b) for all a∈R^4, words b, t>0 now in the statement, with τ_a and T_E defined | `YM.Bid.Roof.time` (`Lean/YM/Bid/Grow.lean` l.27) |
| M10 | `boundary-detection.tex`, `lem:tensor-tests` | Frequency cutoff η_R=η(·/R) made explicit, convergence by the cutoff argument of `prop:boost-ward` | — |
| M10 | `full-tube.tex`, `prop:tube-identification` | Middle expression only for compactly supported h; equality of the two outer continuous functionals extended by density | — |
| M10 | `analytic-boundary.tex`, `thm:joint-boundary` | "continuously in y" made precise: weak-* continuity of y↦ψ̃_y | — |
| M10 | `spectral-measure.tex`, before `eq:euclidean-positive-energy` | Riesz uniqueness replaced by a self-contained π–λ argument for finite Borel measures agreeing on C_c | — |
| M10/L6 | `fourier-support.tex`, `cor:cone-support` | "continuous finite-dimensional label representation" replaced by the action ρ of `sec:lorentz-covariance`, noting only covariance is used | `YM.Boundary.tents` (`Lean/YM/Shift/Closing.lean` l.106–107) needs only `Urs W K` |
| M10/L9 | `lorentz-covariance.tex`, `lem:schwartz-motion`; `boundary-detection.tex`, continuity in `cor:word-motion-inputs` | Lemma stated for A↦f∘A^{-1} on the invertible affine group (the proof already proved this); the corollary cites the general form | `YM.Work.C28.continuous_push`, `continuous_reads` (different route, recorded above) |

Review L4 (two strengthenings in `complex-heat.tex`, to be recorded against
`reconstruction-evidence.md`, which C04 does not own):
- `prop:complex-heat`, commutant clause: the manuscript proves commutation
  of E(z) and V(t) with **every** bounded operator commuting with all E_t
  (polynomial approximation in the functional calculus). The source
  `YM.OS.Semigroup.stays` (`Lean/YM/Heat/Rows.lean` l.133) states only
  commutation with the supplied spatial translations `S.U s`. The manuscript
  statement generalises the source.
- `lem:time-fixed-heat`: the source `YM.Boundary.offiero`
  (`Lean/YM/Fields/Spectrum.lean` l.64) is the implication "fixed by every
  V(t) ⇒ heat-fixed". The converse is proved in the manuscript directly from
  the functional calculus (A ξ=ξ ⇒ f(A)ξ=f(1)ξ).

Review L3 (anchors in `reconstruction-evidence.md` l.154–159, not owned by
C04): `local_paths` (`Lean/YM/Work/C17.lean` l.173), `height_path` (l.247),
`paneAlong` (`C19.lean` l.161) and `exchange` (`C27.lean` l.28) are
`private` and should be cited by path and line only; the public anchors are
`YM.Work.C17.answer` (l.277), `YM.Work.C19.answer` (l.213),
`YM.Work.C27.answer` (l.87). The pane lemmas are
`YM.Boundary.NearPair.Panes.reaches`, `YM.Boundary.NearPair.Panes.forgets`
and `YM.Boundary.NearPair.actor` (`Lean/YM/Shift/Exchange.lean` l.43, 68,
92). These line numbers are the reviewer's; the declarations were re-located
in this revision by `grep` on the pinned files (see validation.md).
