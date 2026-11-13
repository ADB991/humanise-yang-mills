# Mathematical validity review

Unit YM-000026; bounded C11 review for issue52 and author PR92.
Reviewer: Codex session `mgubi-codex-c11-background-20261113` for @mgubi.
Exact reviewed content and labels: `hashes.json`. Source pin:
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

**Outcome: no required local correction identified, conditional on the stated
inputs. Human acceptance remains unset.** This conclusion covers the three
chapters below, not the sixteen-chapter package or transitive supplier proofs.

## Background path convergence

1. The corrected selected space is A intersected with the orthogonal complement
   of K, where K is the admissible common kernel of the prescribed-period
   readouts. A difference of two selected arrays with equal readouts lies in
   both K and its orthogonal complement, hence vanishes. This preserves the
   admissibility constraints that the whole-space complement would not impose.
   The encoding is degree q=t+1; loop, cubic and quartic arrays have separate
   allowances and strictly larger encoding widths.
2. The stationary-jet calculation is triangular in cubic, quartic, then loop
   order. The quadratic jet fixes the first derivative of the stationary graph.
   In the reduced third or fourth derivative, the terms with the highest graph
   derivative vanish by stationarity and differentiated stationarity; all other
   lower-jet terms cancel in the affine combination. Quartic comparison requires
   equal input cubics. Loop comparison requires equal cubics and quartics, so
   the classical stationary germ, its Hessian determinant and chart Jacobian
   agree; only the input loop contribution varies linearly. The selected
   all-period readouts then identify arrays, rather than one torus's action.
3. The added detection argument is valid for the prescribed cofinal periods.
   Expressing two complex basis waves through real waves gives at most four
   terms. The error is divided by site count before taking the limit. For each
   real momentum one chooses a grid point from every sufficiently fine period;
   the common continuous symbol vanishes there in the limit. Its grid values
   recover all finite forms, since those waves span. This uses a symbol
   independent of the period, not a different symbol fitted to each torus.
4. The scalar extraction uses twice the real quadratic Taylor coefficient of
   the designated symbol entry. The row symbol's coefficient is 1/2 and the
   loop symbol has zero coefficient, so the functional is one on the row and
   zero on the loop. Taylor coefficient and Hessian conventions must be kept
   distinct: the source records normalized coefficients, while its `tick`
   denotes the second derivative. The factor-four detection bound is generous
   enough in either intermediate estimate; it is not an extra factor in alpha.
5. For a nonzero weighted input difference z, extrapolation by 32s'/z has
   budget at most 33s', within 64s'. Its output difference is at most 2s,
   giving the sharper factor 1/16 before weakening to 1/4. The extrapolation
   remains in the linear invariant/loop-normalized constraints. Zero z is
   treated by readout injectivity, not division. Existence on the full enlarged
   domain is essential and is expressly a hypothesis.
6. Coordinate extraction uses Hilbert bounds, not compactness of balls in
   the weighted norm. Finite sums retain the Hilbert bound; approximation of
   an orthogonal test vector retains the closed linear constraints. The
   canonical atom dictionary has polynomial lattice growth. The strict-width
   exponential majorant in `fixed-rung-convergence.tex` is summable, and also
   absorbs any fixed derivative order's polynomial length loss after a further
   width shrink. This justifies the weighted-norm limits used in comparison.
7. The common positive finite-dimensional Hessian bound permits passage of the
   stationary derivative recursion and the log-determinant derivatives to the
   limit. The proof does not infer a common germ radius solely from bounded
   derivatives; it uses the analytic limiting action and its invertible Hessian.
   Input/output arrays are selected once, with their equality retained for
   N>m+2. Periods and forests are handled by the limiting germ, without separate
   choices of subsequences.
8. In comparing cluster histories, replacing a single array in a finite input
   keeps that finite step's row and its preceding arrays. In the limit these
   preceding arrays agree with the second history when required. The affine
   identity at zero identifies the modified limiting output. Thus the finite
   contraction really passes to the two cluster histories. Iterating
   g_m <= g_(m+1)/4 with g_m <= 2 gives zero, first for cubics, then quartics,
   then loops; the scalar and germ follow. Subsequential uniqueness gives
   convergence of the original sequence.

The immediate supplier statement `prop:path-retained-plan` was opened. Its
items 2–4 explicitly provide the Hilbert bounds, fixed reels, enlarged domain
and root-row width that the C11 part-A ledger had not confirmed were stated.
This resolves that narrow statement-location uncertainty, **not** independent
review of the proposition's proof or its own inputs (A), (B), (C).

## Real coupling interpolation

1. The weighted absolutely summable coefficient algebra controls products,
   exponentials and all finite tests. Retaining the real constant coefficient's
   sign gives exp(f0) rather than exp(abs(f0)); this is necessary for the
   unbounded-energy application.
2. Write d*=R|b|. The band gives a>=1+6d*. At the signed nodes with 3<=u<=6,
   2ad*+d*^2 <= 3ad* <= ad*u <= 2ad*u-d*^2*u^2.
   Choosing the sign opposite qb and using q<=|q| proves the displayed
   domination for positive, negative and zero q, including b=0. No energy
   bound or differentiation of the node-sign choice is used.
3. The order-i spatial jet factors into an exponential, the untouched power
   of the affine function, and a polynomial of degree at most 2i. Lagrange
   interpolation at 2j+1 scaled nodes therefore suffices. The coefficient
   norms of the two possible bases depend only on j; the radius scaling
   cancels exactly. The value at each node pays the exponential because the
   affine factor there is at least one. The resulting constant is independent
   of energy, n and R apart from the displayed factors.
4. For the Gaussian ratio q>=0, the node exponent is nonpositive. Its
   coefficient cost is at most (1+delta)^D, uniformly in the Gaussian variable.
   The chapter correctly restricts D and n to the actual local marginal and
   support, before integration; it does not charge the entire torus dimension.
5. The small-activity argument applies log(1+h) where |h(x)|<=v<=1/2.
   Each positive-order chain-rule term contains at least one derivative of h,
   giving a factor v; its total derivative scale is d^i. Interpolation costs
   R^k, and the paid smallness makes the exponential's higher products bounded
   by the first power of that cost. The i=0, v=0 and d=0 cases are included.
   Agreement only on [-1,1] is handled by the unique polynomial extension;
   the statement no longer claims the original f agrees outside that interval.

These are elementary, locally supplied coefficient-algebra and finite
interpolation arguments. The shared background index and focused search did
not supply a replacement result. No new external literature theorem is used
or claimed verified by this review. General local Gaussian, cluster and
projection estimates are separately stated inputs, not consequences of this
interpolation argument.

## Coupled histories

1. The normalization gives B=hatBeta^(31/32) and
   |b(lambda)-b(lambda')|=B|lambda-lambda'| |w lambda+w lambda'|.
   The last factor is at least 17/10 on the prescribed band. The scalar
   recursion's sign agrees with the source's definition of the owed correction.
2. The terminal activity bound is explicitly additional. The ordinary startup
   allowances alone give norm at most one. The stronger costs 4a deltaE and
   a deltaK with 8a<=1/128 give the required smaller norm. Descending
   induction then uses the output bound. The manuscript does not silently
   obtain the base case from a recursive estimate.
3. With prescribed coupling scripts, zero-terminal truncated activity histories
   are allowed on the actual domains and remain in the 1/8 ball. Finite-depth
   comparison is Cauchy by the local continuity hypothesis applied to arbitrary
   subsequences. Completion supplies a limit; no compact activity ball or
   extension of the maps to arbitrary completion elements is assumed. The
   error c^(h-m) uniformly removes the truncation.
4. To compare distinct coupling limits, the proof constructs a new finite
   history with the second limiting script at the first history's cutoff.
   This permits the one-step inequalities to be used at a common cutoff before
   passage to the limit. Closedness of the band suffices for those scripted
   couplings. This is the same mechanism as source `Window.guild`/`siege`.
5. The common bottom limit and common path corrections yield a finite telescope
   with no terminal term. Crude cost bounds and the cumulative purchase first
   give a globally bounded d_m; then the sharp bounds give d_m<=D/16 for
   D=sup d_m. This proves uniqueness without assuming bounded normalized
   coupling bands uniformly over m (their individual widths may grow).
6. The cumulative purchase is correct: the increase of x^(31/32) dominates
   a*(31/32)*2^(-1/32)*x^(-1/32), whereas s(x) is at most a constant times
   x^(-1/10). The strict exponent margin pays each increment after thresholds
   are enlarged over finitely many next-stage choices. Telescoping bounds a
   finite prefix; it does not assert summability of all scale costs.
7. The fixed-scale value-tail implication from Cauchy activity norms is valid:
   compare to one late array with a finite small tail and use the norm to
   control the remaining difference. This does not give full derivative-norm
   truncation of arbitrary arrays. Scalar output continuity is separately
   retained, as required by the recursion.

## Remaining obligations and acceptance

- No new local repair is requested for the reviewed hashes.
- Path construction, the horizon and its analytic floors, the full one-step
  quantitative purchases, and actual-output local continuity remain inputs.
- The stronger terminal startup purchase remains an open manuscript supplier
  obligation (`C11-internal-startup-bound`). Reading its Lean producer interface
  does not fill the missing manuscript producer.
- C13's `selected-history-limits.tex` asserts the small norm and same-family
  application; its author/reviewer must match the strengthened startup input,
  all path hypotheses and actual-output continuity explicitly. The C12/C13
  application chapters were opened at the interfaces only, not reviewed in full.
- The other thirteen C11 chapters, transitive Lean axioms, and the selected
  public construction's total closure were not reviewed. C10's independent
  annulus dependency finding in PR99 is not discharged by this C11 review.
- A responsible human must record acceptance. Material changes to these files
  or their interfaces require renewed review; no review fingerprint or approval
  belonging to another contributor has been updated.
