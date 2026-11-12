# Positive spectral packet prices — draft, not yet integrated

Pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
Parent author hairer-codex-existence-20261111. Output
`manuscript/existence/physical-ward-packet-prices.tex`.

## Scope and remaining boundary

Proves the positive moment/subtraction, mixed-axis sign walk, gap-preserving
line estimate, all-rate exterior tail, and zeroth900 price. Proves the finite
real-response pin and the dyadic positive kernel lower bound needed for
Mass.mass. **Does not yet prove the seven conservation/fixed-band response
error bounds** that produce the -395 cone price. Those are explicitly
retained, not silently discharged by the displayed bound. Do not count the
whole exterior packet producer as closed.

No fresh Lean build/axiom replay; Lean preserved. Prose is a draft with no
independent pass yet. Focused source reads and rg commands below were run.
No optional literature shortcut found in shared background catalog; reused
canonical heat and spectral-measure chapters (their verified SNAG citation).
The proof follows the actual positive-measure/moment subtraction/sign-walk
route, not an assumed transfer of spectra by unknown rotations.

## Source correspondence (paths under Lean/YM)

- `Axis/Word.lean`: namespace YM.Row, `Lowered`, `Pressed`, `weighted`, `ν`,
  `enough`, `by_right`, `issued`, `band`, `before`, `within`. Actual measure
  = exponential undamping of the translated cluster vector, independent of
  admissible placement. Pressed means every supporting word point has axis
  coordinate0, not merely that the barycenter does.
- `Axis/Matrix.lean`: `YM.Row.combo`, `fits`, `cross`, `identity`, `reply`:
  four positive polarization measures; only integrable responses evaluated.
- `Next/ROTATIONS/Moments.lean`: `YM.Outer.moments`, `placed_moment`,
  `point_moment`, `pay_moment`. Prose supplies finite-difference/Fatou
  moment argument and t^D integration lower bound. Exact open-configuration
  separation comes from finite internal gaps plus positive reflected margin.
- `Next/ROTATIONS/Nodes.lean`: `YM.Outer.Nodes.coeff`, `sums`, `remainder`,
  `kernel`, `scaled_interp`; node multipliers j+2, squared nodes.
- `.../Subtract.lean`: `YM.Outer.menu`, `credits`, `board`, `bake`.
  `.../Band.lean`: even nonnegative sun with support1<=|x|<=2, mass1;
  `.../Response.lean`: Resid, sunny, Mlamp, lamp_lit, kernel bounds.
  Prose gives correction formula and rational identity before using positivity.
- `.../Energy.lean`: upper, off, raw_bottom, lower, shelf, surface.
  D is chosen from polynomial moment first; m later, D independent of m.
  Energy0 is retained by continuity, not discarded as null.
- `.../Charge.lean`: paid_bill, far_gain, runs_order, far_pay, done_pay,
  accounts. Constant profile majorants via finite ledger; high transverse
  moment exponent -2ka plus remaining amplitude loss.
- `.../Switch.lean`: opp, alternate and unroll. Same tested autocorrelation
  with opposite reflection parity; omitted axes via bounded cutoff and DCT.
- `.../Walk.lean`: tracking, Can, forwards, affordable, walk. Reverse-order
  selection a',k,D,a; U shrinking coordinate set, Q mixed signs.
- `.../Tunnel.lean`: point_cost, gap_cost, line_cost. Point exact low kernel
  1_{E<=1}/(E+exp(qn)), q<0. Line missing-axis exponent delta-w_l;
  gap case delta, all transverse w<=0. Prose explicitly proves the gap case.
- `.../GapTest.lean`: civic/remote, remote_sign/top/base/cost. Nonnegative
  squared Fourier bump; fixed temporal gap, uniformly bounded correction,
  lower bound from interval(R,R+gamma/(E+w)).
- `.../Frost.lean`: frozen/tracks/frozen_size/scatter. Temporal amplitude
  differs from three transverse normalized profiles. Not a compact spectral
  frequency cutoff. `.../Thaw.lean`: worn/rag/sale/farther/ice, arbitrary
  exterior exponent y, integrability by true cluster placement.
- `.../Vanishing.lean`: private normal, exponent3K=900. Chart values
  -100/-150/-300 make line exponent at most150 when using widths1+w.
- `.../Dyad.lean`: gap/fee, fee_pos, relief, grant, hiS=8.
  Actual lower constant can be 2*2^(-3m)/400; no m->infinity limit.
- `.../Pivot.lean`: budget_lock. Prose gives an explicit elementary linear
  inequality with seven error sequences; exponent delta+2a preserved.
- `.../Mass.lean`: intersects and mass inspected. The separate conservation chapter supplies
  `Constraints.accounts_cost/accounts_sink/accounts_fixed` plus
  `Pier.fixed`, `Nodal`, `Symbol`/`Source` distribution interfaces. Exact
  seven errors correspond to Pivot.heights/rift and the three signed holes.
  The actual distribution/stress construction and fixed-band proof are in
  physical-ward-stress-cone.tex; its bounded independent pass is recorded in
  reviews/draft-review.md.

## Checks

Initial text created by shell heredoc; scoped rg and sed source reads as above.
Bounded independent mathematical and source-correspondence pass recorded in
reviews/draft-review.md, including the final cone cross-reference carry.
The 838-page working build succeeds; rendered QA and artifact publication pending.
The previously pushed821-page artifact does not contain this draft.
