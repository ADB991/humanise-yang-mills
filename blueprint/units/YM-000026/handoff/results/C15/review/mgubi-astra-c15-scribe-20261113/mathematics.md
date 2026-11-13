# Mathematical validity

- Unit: YM-000026; bounded issue56 review of the two full chapters in README.
- Reviewer assistance: GPT-6 Astra, session `mgubi-astra-c15-scribe-20261113`;
  responsible human acceptance: unset (mgubi is the contributing account).
- Target PR/head and exact content SHA-256: README and hashes.json.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Outcome: no local blocking mathematical defect found; conditional local
  verdict only. No global closure or acceptance is recorded.

## Weighted estimates: complete local pass

The rank-one receiver lemma is valid. The right inverse gives
`y=Uf(y)+A(y)x`; replacing `U,x` by `u_i,w_i` produces an operator tending
to the identity. Its eventual inverse is bounded and tends to the identity.
The displayed exact cancellation on that operator's image reduces the
weighted functional error to the two assumed weighted null limits. Convergence
on a fixed finite basis suffices for operator-norm convergence. The choice
`mu_i=rho u_i` is bounded for the entire sequence: convergence bounds a tail
and the remaining finitely many operator norms have a finite maximum.
Thus the manuscript's all-index bound is consistent with the source's eventual
bound. No positivity or divergence of `e_i` is needed in this abstract lemma.
The hypothesis `v_i -> f` is harmless even though this particular proof does
not need it after imposing the other data.

The medium lemma keeps norm decay, scalar-price decay, and field-image decay
separate. Its identities use `rho(x)=0` and the assumed bounded response price;
`e_i/b_i -> 0` transfers the stronger field weight. The rate calculation is
correct on the eventual tail where logarithms are ordinary real logarithms:
`A_a A_c=A_(a+c)`, `A_a<=p^delta` eventually for every fixed `delta>0`, and
negative ages tend to zero. Using `delta=a` for `a=1/6,1/5` gives exactly the
powers `p^(-5/6)` and `p^(-4/5)` displayed in the chapter. Reference-price
transport has the strictly negative combined age `1/5-1/4=-1/20`.

The finite-volume passage is taken at fixed level before the level tends to
infinity. Continuous linear maps pass the inequalities through that fixed
ultrafilter limit. The local charge proposition and its payment accuracy
bound give the two inverse-power terms divided by 12; the separate transport
error supplies the `A_(-1/4)` term. The manuscript explicitly retains that
transport estimate as an input. Its final application of
`lem:ex-trace-small-means` uses exponent one, the same medium and summit level,
and a uniform separating detector bound. It correctly declines to infer that
bound from finite dimensionality alone.

The paragraphs invoking external sensor33 are noncircular. The medium's three
limits enter that proposition; the sensor first obtains its operator convergence
using a converging right inverse and the approximate kernel, and only then
uses the receiver lemma. The scalar calculation in this chapter is not offered
as a proof of the chart or detector inputs.

## Scribe: complete local pass

1. **Spaces, rank and two columns.** The centered real symmetric covariant
   tensor space is taken before conservation; the interacting divergence's
   codomain is distinguished from the free response space. Rank one is an
   incoming conclusion. Under the stated onto/kernel and coordinate inputs,
   the two directions `(0,0,1)` and `(0,1/4,0)` are independent modulo
   `(1,-1/4,1)`. The displayed subtraction of `w_0` times that kernel vector
   is exact and proves surjectivity as well. Column convergence gives norm
   convergence, the inverse bound is correct, and the optical identity
   transports exact cancellation to conservation on one common tail.

2. **Moving inputs and coefficient extraction.** The sensor tail is uniform
   over all `y`, not merely each fixed `y`. Consequently a growing principal
   forecast of norm `O(rho_i)`, with `rho_i<=t_i`, is allowed. The uniformly
   bounded sensor controls the principal comparison error. For each correction,
   bounded forecasts, `t_i<=z_i`, the `z_i` comparison error and the `t_i`
   reference-price error yield the two weighted limits. Dividing the correction
   coefficients by `t_i` gives bounded factors. The sign in the exact equation
   is `mu_i(X_i)-4c_i^1+o(1)=0`, hence `c_i^1 -> -kappa/4`.

3. **Finite arrays and two distinct normalizations.** The fourth-order map
   acts linearly on a label, and there are sixteen ordered tensor entries.
   Operator convergence and branch-label convergence justify the entrywise
   symmetrized limit. The false tensor is not assumed to vanish: its
   coefficient divided by `q_i` does. With `P_i=q_i Y_i`, linearity gives
   `Y_i(T_i)->M_0`. The weighted trace instead uses `q_i<=2z_i` and
   `|c_i^0|<=C rho_i<=Cz_i` with the separate exponent-one principal/false
   washout. The true branch contributes `(-kappa/4)(4 O)=-kappa O`.
   The ordered curvature sum and its factor one quarter agree with external34.

4. **Shell calibration.** Inputs (4a)-(4c) imply convergence of the moving
   derivative maps: integration by parts gives convergence after finitely
   many tests; their injective limiting map has a positive lower norm bound,
   inherited by the approximating maps. The two-term inequality at the end
   of this argument is correct. The chain rule produces precisely one
   factor `r_i` in `r_i U_(i,5)^(-1) D_a^S U_(i,4)`.
   Input (4d) is then used twice as convergence of linear functionals on
   fixed finite-dimensional spaces. It may therefore be applied to the
   convergent derivative vector and to `Y_i(g_i)`. The second shell limit
   uses the reference Ward law, not an unstated Ward law for `g_i`.
   Both limits use the same observer and nonzero value. They first exclude
   `R=0`, then rank one gives `g_i=lambda_i R`, and applying a real coordinate
   functional nonzero on the complex value proves `lambda_i->1`. Division
   transfers both field and weighted trace limits. Rank one alone is never
   used to fix the normalization.

5. **Centering, clock and scalar range.** For each fixed comparison table,
   the two centerings differ by a fixed complex multiple of the selected
   unit. Eventual unit preservation and `q_i r_i^4->0` remove it. This is
   pointwise in the table; the wording about a uniform algebraic identity
   does not assert a uniform bound over all tables. The logarithmic clock
   calculation distinguishes frame rate from summit coupling and radius
   from zoom factor. Its displayed three extra inputs imply the clock,
   band-cost decay and `q_i->infinity` with the stated constants.
   For the eventual two real coordinates the additional hierarchy,
   compatibility, local Ward and coherent-chart assumptions supply reality
   and signed invariance. The diagonal tensor argument uses the full free
   symmetric stress space, not its conserved subspace. Its trace lies in
   `R 1 + R O`; dividing by four is valid. Continuity of the fixed inverse
   coordinates gives the **weighted** limits `q_i e_i->0`,
   `q_i d_i->-kappa/4`. The limit is a curvature-square field, not a unit.

6. **Choice order.** The last paragraph preserves the fixed ultrafilter,
   arch and reference hierarchy before the arbitrary positive null sequence.
   Selection returns a subsequence of that very sequence with exact radii;
   the same selected chart is used for all subsequent inputs. It does not
   replace this universal clause by one convenient sequence.

## Interface status and required next work

The incoming shell package is an explicit open premise. Its statements are
consistent with the inspected source, including derivative-test convergence
and uniform-on-window shell comparison, but this review does not produce
those analytic statements in the manuscript. The same restriction applies
to the rank/optical input, sensor33's selected-lift/marked-vector inputs,
branch34's recording/transport inputs, local charge/transport, clock and
one-step chart producer. Matching their existence on the literal same
history remains required; conditional local algebra cannot discharge it.

The selected output agrees with the immediate asymptotic consumer's
`lem:trace-normalized-stress` and centered-label limit. The rounded pointwise
comparison used later in that consumer is outside these two chapters and
remains open as already recorded in PR107. The C14
`trace-firesky-gallery.tex` handoff still says unit and omits coefficient
weights at this frozen interface; that is the existing external discrepancy,
not a new target defect. An independently reviewed repair must preserve
`O`, `q_i d_i`, `q_i e_i` and the same physical stress.

No new local repair is requested. Closure and human acceptance remain unset.
Shared literature notes were searched; no applicable cited literature result
is used in these local algebraic deductions. No new literature theorem or
novelty claim is introduced. The analytic producers were not replaced by a
literature guess or a newly invented premise.
