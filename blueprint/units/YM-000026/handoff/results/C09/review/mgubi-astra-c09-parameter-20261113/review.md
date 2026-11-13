# C09 bounded independent parameter review

Unit YM-000026; issue [50](https://github.com/hairer/humanise-yang-mills/issues/50),
parent issue [26](https://github.com/hairer/humanise-yang-mills/issues/26).
Contributor: @mgubi. Agent assistance: independent GPT-6 Astra review delegated
by the parent Codex session, session `mgubi-astra-c09-parameter-20261113`.
[Claim](https://github.com/hairer/humanise-yang-mills/issues/50#issuecomment-6846874988)
expires 2026-11-14 06:30 UTC. Human acceptance is **not recorded**.

Reviewed author PR104 head `10d5d565ec2c4c1ea85fa0abb3b78cc726733f20` as
present at `be0e87db8c520491d25145d3c61f61b97f0ff42d`. Exact chapter and
source hashes are in `hashes.json`. Source pin:
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

**Mathematical verdict:** no error identified in the three local conditional
arguments. Their proofs support fixed-volume regular jet and forced value
continuity, given the stated common-data analytic premises. No local correction
is requested. This is an agent recommendation for conditional acceptance only.

**Textual Lean-correspondence verdict:** no discrepancy identified in the
inspected definitions, statement quantifiers and principal proof steps. See
`correspondence.md`. This is source-text review, not a fresh elaboration, kernel
replay or transitive axiom audit.

The full review scope is exactly `local-parameter-comparison.tex`,
`finite-volume-parameter-continuity.tex`, and
`parameter-comparison-suppliers.tex`. The stationary chart and C11 chapters
were read only at the immediate interfaces specified below. This report does
not review all eighteen C09 chapters, close C09/C11/C13, or change review
metadata. The author did not participate in this independent review.

## Local compensated comparison

At `sec:local-parameter-comparison`, the norm includes order zero and all
orders through j. The product factor 3^j dominates the 2^r Leibniz terms,
including j=0. Log recovery needs the separately stated bound on the real
base logarithm: bounding exp(f)-1 alone would not control negative f. On the
interval between zero and exp(f(y0))-1 the derivative of log(1+v) is bounded;
positive-order chain-rule terms contain a factor with price u, and remaining
powers cost only a constant depending on the total base price. The subsequent
exponential difference estimate has the same linear dependence on its small
increment. No uniform neighborhood inside the compact interval is assumed.

Lines 88–156 distinguish packets, forced entries, logarithmic entries and
warnings. The packet ratio retains its normalizer count. A zero cutoff germ
annuls both packets; otherwise the conditional action jet bound applies.
The finite torus permits a common maximum packet size and a finite packet
catalogue. Inherited regular and forced values are held at the same physical
fine field; only cutoffs are differentiated. The regular address embedding is
injective. The other logarithms are unchanged or scale by lambda squared,
and warnings cancel. These facts give a summable difference catalogue, not
merely componentwise continuity.

Lines 158–206 correctly turn this into products: with a_i=u_i+v_i/t, the
primed bound is 2a_i, and telescoping costs at most three factors of a_i per
new label after the jet product constant. Exhaustion justifies the finite-set
sum for a countable catalogue. The actual-component identification explicitly
requires room/activity bounds for **both** representations, intersects their
protected neighborhoods and uses support containment for health. It is not
an equality of formal products asserted without the underlying germs.

At lines 208–248 the density exponent is anchored by q(y0,z). Therefore its
value vanishes at y0; every nonconstant partition term contains a factor t,
and has polynomial growth at most F0^(2j). This is valid also at j=0, where
the difference is zero. It avoids requiring integrability of an exponential
of a higher-degree polynomial. Multiplying the component and compensation
differences gives the three displayed terms with the correct Gaussian ratio.

Lines 250 onward handle unrestricted packet values separately. On negative
energies the finite lower bound bounds both exponents; on positive energies
beta' >= beta/2 provides exp(-beta*u/2). The bound on u exp(-cu) is valid.
Summability of unrestricted forced values uses nonempty inventory support and
finite rooted-to-unrooted summation. This proves only value control outside
health, as required; it does not claim forced derivatives there.

## Fixed-volume integration and output

At `sec:finite-volume-parameter-continuity`, lines 10–40 fix dictionaries,
thresholds, clip, paths, forests and tags. The regular differences are masked
occurrences. For g(beta)=beta^(-1/2), lambda=sqrt(beta'/beta), so both
beta*lambda^2=beta' and g(beta')*lambda=g(beta) have the displayed directions.

The density in lines 42–126 uses precision Q=C^(-1), while the source's
matrix parameter of `Poll.sweep` is covariance. The Jacobian lambda^d scales
the **full** finite coordinate space. For |lambda^2-1|<=1/4,
|log(lambda)|<=t and lambda>=1/2, which yield the stated moment bound. The
pointwise envelope exp(z^TQz/8), after multiplication by the Gaussian density,
leaves exp(-3z^TQz/8); every fixed polynomial is integrable. Differentiation
still invokes the separate open-neighborhood derivative identities from the
Gaussian differentiation chapter. The displayed base-point bound alone is
not used as a replacement for that theorem.

At lines 128–176, the finite support sum K0 and positive root price give a
positive perturbation radius kappa. The added rooted contribution is at most
gamma/2. Linearity of the degree quantity changes ratio 1/2 to 3/4 when root
price becomes 3gamma/2. The expansion over nonempty sets of difference
positions pays theta=t/kappa once; repeated labels are distinct positions.
The factor (1+q)^j is paid by 2^j per vertex. Summing rooted bounds over all
sites is legitimate because nonzero cluster supports are nonempty. Constants
may depend on this torus; no period-uniform Lipschitz constant follows.

Lines 178 onward correctly preserve factorials in the forced exponential
expansion; its nonnegative majorant sums to exp(sum(h+d)). Fixed path terms
are affine in beta and use prices at beta=0 and 1. Finite symmetry and anchor
changes preserve summability. For subsequential domination, the geometrically
summable difference budgets give H_i=h_i+sum_k d_(k,i); Tonelli supplies a
summable common bound. Regular jets and forced values remain separate.

## Supplier and interface findings

1. **Conditional supplier is locally supported.** In
   `sec:parameter-comparison-suppliers`, lines 19–73, spending a positive
   support/extra-cost reserve pays the polynomial derivative scale before
   finite-volume summation. The packet seed count correctly includes fine
   plaquettes, coarse bonds and flagged coarse sites (`Stores.shares`), not
   only coarse blocks. The nonzero-germ argument applies bond by bond and
   the held fine field is arbitrary, as in `Alabaster.apical`.
2. **Every principal read subset is required.** Lines 75–144 use the same
   projected positive covariance and inverse-row estimates, not just
   positivity of the full matrix. The three-factor derivative expansion
   produces a dimension factor bounded by the full finite dimension; the
   empty subset gives zero. The source's `facescale` additionally counts
   bonds, whereas the manuscript F0 counts colours/dimension; on the fixed
   finite torus these positive polynomial weights dominate each other up
   to a finite constant, absorbed in C0. No literal identity is required.
3. **Same-action identification remains conditional.** Lines 176–186 require
   the protected representative to be critical for the same tested action
   and to lie in the closed fine zone, with the coarse point in the horizon.
   `uniform-stationary-chart.tex` lines 75–122 prove the needed local
   uniqueness from their own explicit gap and derivative inputs. Source
   `Before.Service` makes the same all-tag, horizon/closed-zone restriction.
   This repairs the possible inference from shrinking charts alone, but does
   not produce equality of unrelated actions or identify the sector Gaussian
   covariance with the stationary Hessian. Actual chart/Hessian matching is
   still an upstream same-data obligation, not a newly found local error.
4. **Quantifier order is retained.** Lines 167–225 choose the scale-factor
   floor before derivative order/cutoff/width, and the eventual coupling
   threshold before tori and incoming representations. The later constants
   and comparison neighborhood may depend on actual Cash data and volume.
   The positive support reserve is needed by `Yearling.sterling`. Finite
   stagewise maxima and increasing entry thresholds preserve these results.
   Lines 227–237 correctly retain renewal, downward geometry, admissible
   initial action, exponent/width inequality, and equality to the actual
   constructed output. Numerical scheduling does not construct those inputs.
5. **C09-to-C11-local-continuity stays open at the actual-history join.**
   `coupled-background-convergence.tex` lines 81–135 requires two possibly
   different terminal-index sequences, arbitrary allowed inputs (including
   truncated histories), converging backgrounds/paths, actual-array norm
   convergence and scalar-correction convergence. The three reviewed C09
   chapters compare one fixed dictionary/path/background datum and a running
   curve with explicit certificates. Their local result alone is not the
   entire varying-background theorem. C11 explicitly calls this an input;
   its value-tail argument does not assert derivative-norm tail truncation.
   The marked/unmarked background comparison, weighted component tail
   certificates and projected scalar coefficient must still be supplied on
   the very same actual and auxiliary histories. The source `Pith.shall`
   retains Cadre, Amplify, Jams.Wild, Chord/Flight and exact activity identities.
   This finding agrees with, but does not inherit certification from, PR101.

## Remaining work and acceptance

No repair to the three local proofs is requested by this review. Before a
whole-history use can be accepted, the relevant owners must exhibit the
same-data covariance/chart certificates and the varying-background/actual-
output continuity supplier above. Other C09 chapters, transitive analytic
producers, global selection, human acceptance and independent build assurance
remain outside this bounded result. Material changes to these hashes require
renewed review. No approval record has been set.

The shared literature index, local background inventory, upstream-evidence
index and parameter/stationary evidence were searched. These chapters prove
their elementary exponential, Gaussian-change-of-variable and summation
steps directly and consume canonical Gaussian/cluster inputs; no new external
literature theorem was substituted or asserted verified. Broader Balaban,
reconstruction and rank/stress literature does not discharge the identified
same-data continuity join. This review did not perform a new literature audit
of those separate producer chapters.
