# Extreme-point analytic continuation for physical Ward propagation

Pinned source: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Author: parent session `hairer-codex-existence-20261111`.
Prose: `manuscript/existence/physical-ward-analytic-continuation.tex`.
Status: draft, independent mathematical/correspondence review pending.

## Exact interface

Input S.Hierarchy (including smoothness, translation/permutation/signed
reflection, positivity), W.Derivatives, SpinRows T, `commutes W T`, and
`Collinear W T` at all grades/arities. Output: moment rows and their angular
finite sum are real analytic along a coordinate motion whenever the moving
point is strictly first or last in some axis. This supplies Ward.channel /
stood, and is disjoint from limits agent's Ward propagation/commutator/
Outer-price producer file. No full rotation representation or global Ward
identity is assumed in proving analyticity.

## Focused source correspondence

All paths below start `Lean/YM/Ward/` at the pin.

- `Plants.lean`: `YM.Ward.spot`, `link`, `responds`, `blooms`, `advancing`.
  Strong derivative via continuous raised-label curve and dense word pairings;
  integrate weak derivative, then identify by density. Normal direction uses
  earlier strictly positive start and OS localHeat, already canonical in
  complex-heat. No claim smoothness implies analyticity.
- `Genuine.lean`: `YM.Ward.pair`, `swing`, `radial`, `fires`. Upper insertion
  first in pair; reflected label involution; stationary Gram kernel with
  difference t-s. Exact reflected-label convention retained.
- `Sum.lean`: `YM.Ward.commutes`, `traverses`; `Motion.lean` jet_line
  (used through Rows/Walk; immediate caller inspected). Derivative of angular
  expression equals angular expression on raised label; plus matrix-column
  term in commutator cancels derivative of spatial coefficient.
- `Rows.lean`: `YM.Ward.F`, `sigma`, `realized`: pair at u e_a+z e_b;
  K=plane b a has vector (-z,u), yielding u d_z-z d_u. All transverse
  angular jets vanish at line from Collinear and commutes, not from a
  presumed global Ward law.
- `PDE.lean`: `YM.PDE.flow_step`, `sure`: exact commutation
  d_z^n(Rf)=R d_z^nf-n d_u d_z^(n-1)f; strong induction over transverse
  jets and all pairs, positive u permits division.
- `Circles.lean`: `YM.Ward.Circle.uniform`, `vector`, `htQ`, `solves`,
  `pure`: analytic finite-dimensional exp(-theta T) comparator; radial
  sqrt(u^2+z^2), arctan(z/u); equal transverse jets only until Hilbert
  factorial argument proves actual analytic trajectory. No Lie representation
  needed for the single-generator exponential.
- `Ket.lean`: `YM.Analysis.represents`, `bud`, `blossoms`; `Rate.lean`:
  `YM.Analysis.center`, `builds`. Stationary Hilbert Gram gives squared
  derivative norm=absolute 2n-th scalar derivative; analytic comparator
  supplies C R^(-2n)(2n)!, binomial coefficient bound gives norm factorial
  estimate uniform on whole line. Prose uses the equivalent Banach integral
  Taylor remainder (elementary FTC iteration), source uses mean remainder
  with an additional harmless exponential reserve.
- `Extreme.lean`: `YM.Ward.higher`, `last_adv`, `first_adv`: separating
  hyperplane, reflected spectator word, permutation, actual signed reflection
  and parameter sign for b=a. Allows spectators tied in normal coordinates.
- `Walk.lean`: `YM.Ward.channel`, `stood`: finite angular sum analytic;
  every segment point has a neighborhood, sufficient for identity theorem.
  Global path geometry remains in the separate physical-ward-propagation draft.

## Canonical reuse and checks

Reuse sec:complex-heat for positive-time holomorphy and the already constructed
reflection-positive chamber. No new external theorem is invoked; finite matrix
exponential, differentiation and Taylor estimates are explained in full. The
shared literature search/catalog for the canonical heat reconstruction was
already consulted; no expensive independent literature search was made.

Focused complete reads of Plants, Genuine, Rows, PDE, Circles, Ket, Rate,
Extreme, Walk and Axis, plus relevant Sum identities. `git diff --check` passed.
No Lean source edits or fresh build/axiom replay. No claim to resolve inherited
source audit limitations. LaTeX/render and independent review pending.

## Integration validation — 2026-11-12 11:35 UTC

Bounded independent source and mathematical review is recorded in
`reviews/draft-review.md`; this remains a conditional draft, not whole-proof
closure. Main LaTeX build succeeds at 821 pages. The phase-grid pages were
rendered and inspected in the 814-page intermediate; local-compiler and analytic
pages were rendered and inspected in the 821-page artifact. See validation.md.
No fresh Lean build or axiom replay was run.
