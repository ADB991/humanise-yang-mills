# Mathematical validity review

Role: independent mathematical review, agent assisted; human acceptance unset.
Targets and immutable source revision are in `hashes.json`. The unit-wide content
fingerprint recorded there identifies the checkout only: this review covers three
chapters, not the entire unit. Outcome: **no required changes identified within
this scope; locally valid conditional on the stated supplier hypotheses**.

## Soft curvature receipts — full chapter

The raw path coefficient construction has the required order-dependent radius,
representation/color scale, factorial normalization, volume factor and absolute
row price. The argument applies at every finite derivative order, rather than
silently restricting the input series to the later four-jet application. The
orientation average preserves the price and implements the stated covariance.
The bare Wilson term is supplied separately by `prop:ex-wilson-stream`; it is not
assumed to have the same row parametrization as an arbitrary path term.

For `lem:ex-ward-partition`, differentiating the infinitesimal gauge identity
produces the displayed partitions and each block's factorial. The one-block
first derivative vanishes at the vacuum. The all-singleton contribution has the
stated top coefficient and sign; the remaining terms use only lower coefficients.
The proof keeps the volume normalization on the same torus until cancellation.
For `lem:ex-ward-rays`, the lower coefficient functions are common to the periods,
continuous in their independent momenta, and the mesh-density passage is therefore
legitimate. Two distinct independent legs are used for the quadratic vanishing;
this is not an illicit substitution of the dependent momentum as an independent
variable. Single-leg contraction vanishes first on the coordinate axis and then
the degree-one Taylor coefficients vanish by the second independent Ward identity.

The finite-difference decomposition in `prop:ex-extra-curves` supplies more width
than its cited Lean counterpart. Its half-width variant is valid independently:
on a fundamental real period cell, divide
`f(z)-f(0)=z integral_0^1 partial_z f(tz) dt` by `exp(iz)-1`. The quotient
`z/(exp(iz)-1)` has a removable singularity at zero and is bounded on the compact
half-width cell. Cauchy's derivative estimate uses the remaining half-width.
Other coordinates stay in the smaller strip. If the numerator vanishes to order
q, division lowers this to q-1; restrictions to zero preserve the required order.
Iteration yields the stated width and a constant depending only on order and
input width. Periodicity gives a global strip estimate. No claim that the source's
quarter-width constant itself proves this stronger statement is needed.

In `lem:ex-soft-quadratic-hessian`, the finite-torus expansion, dominated limit of
path sums, absolute root regrouping and polarization are distinct steps. The path
bound controls the differentiated slot sum uniformly in length on the fixed torus;
absolute summability then justifies the series operations. The direct identity
coefficient in the bed is retained. Mere existence of a formal `tsum` would not
suffice: the text uses the actual path bounds and attachment hypotheses before
identifying the Fourier kernel. Smoothness of the actual germ is also retained.
This identifies the Hessian at the flat field; it does not prove the full forest
and penalty estimates of the global F02/F03 contracts.

The Wilson subtraction, scaling, veneer and greyson steps preserve the distinction
between positivity used to install a selected germ and bounds for its soft
coefficients. The response calculation counts ordered partitions without adding
an extra permutation factor. The mixed derivative budget is at most four, with
coefficient orders 2, 1, 0 yielding vanishing orders 2-n. In the three-level
conversion, the two differences can be distributed at level zero; level one
uses only the single-difference estimate and the sign/phase identity for reversing
a leg. It does not require a nonexistent level-two difference input. Finite basis
expansion extends the Fourier-mode equalities to all test vectors. The last
mockup theorem constructs one family along the retained selected sequence with
constants depending on fixed input bounds; it is not a statement about all
possible independently selected sequences.

## Multileg curvature lift — full chapter

The scalar Laurent division includes negative frequencies. Its weighted l1 cost
and quarter-width loss are uniform in the divided coordinate. The Cartan identity
and the correction of the zero-coordinate slice provide the one-leg primitive.
The four residual pieces each retain the original input width and bound before
division: summing their four costs does not entail four consecutive width losses.
The auxiliary constraint space is fixed while dividing, and closure preserves
membership. Neither constraint preservation nor reality is inferred merely from
the name of a projection.

The dimension-shift proof explicitly constructs and corrects the successive
primitives. The new remainder is divisible in the other leg, while the retained
Ward constraints persist. Under the induction step r -> r+2, t -> t-1, the
required dimension inequality r+1+2t>4 is preserved. The two-leg case has its
separate argument; it is not smuggled into the higher-arity induction. Jet orders
and constants are selected uniformly before the amplitude and the particular
function. The second-order gain in the two-leg case is maintained through the
corrections.

Realification averages with conjugation on real momenta; the finite-dimensional
retraction can have norm greater than one. The explicit entry-sum reserve price
pays for it. The displayed half-width Fourier price is sound: a width-w analytic
bound gives coefficients bounded by B exp(-w|z|); summing after a w/2 weight gives
coth(w/4)^d <= (2+8/w)^d. The source also directly supplies this half-width
conclusion (see clarification N2). Moment cancellation and the final funded
normal form have the stated fixed finite-dimensional and arity dependencies.

## Thermal contact cancellation — full chapter

The Haar chart is the probability-normalized chart, with its constant retained.
The left-trivialized Jacobian and tree/coarea determinant are used at the actual
stationary branch. The completed matrix has a triangular determinant of modulus
one in its tree block. Consequently `det M = det Gamma^2 det C`, and pulling the
tree Hessian back multiplies by the chart Jacobian squared. The logarithms have
the required positivity near the retained base point. The resulting thermal
identity includes both inherited energy and the Haar/chart constant; it is not
only a determinant identity.

The contact derivative is computed with the same branch, bridge, and matching
quadratic forms. Differentiating its inverse is included in DY. The penalty
identity Db=-K_c follows from that matching; it is not an arbitrary choice of a
quadratic form. At zero the contact vector vanishes by adjoint invariance and the
nonabelian simplicity hypothesis. Here simplicity includes the nonabelian clause,
so an abelian counterexample is not being excluded silently. The contact Hessian
formula retains its linear terms and its quadratic trace term with the correct
factor two. The mixed contact Ward identity contracts the background index.

For the leading density, outgoing metric analyticity gives K_c(p)=O(p^2), and
the mixed contact Ward identity gives the mixed matrix O(p). Thus the linear
contact term has order at least three and the quadratic term order at least four.
Both have zero quadratic Taylor coefficient. Symmetrizing p and -p and the extra
one-half in the quadratic picture do not change this conclusion. The source
endpoint selects the transverse scalar coefficient `alphaPay`; the displayed
component argument includes that choice. This is not a claim that the entire
finite-volume contact or inherited Hessian vanishes.

The last passage to the **full** thermal leading coefficient explicitly invokes
the inherited transport result with its stronger same-data hypotheses: installed
tangent/matching bridge, outgoing analytic metric, incoming strip at the scaled
width, all-period positive floor, path/bridge bounds, compatibility and scale
conditions. That result gives order four for the inherited density. Determinant
cancellation alone would not establish the full thermal conclusion.

## Required changes, clarifications and open dependencies

Required changes identified: **none** in these three manuscript files.

- **N1 (optional dependency clarification):** near thermal line 251, the text
  explicitly writes `K_c=d_1(-p)^T H_c d_1(p)` with analytic H_c. Promote this
  outgoing-bed premise to the opening retained-data list or link its supplier
  there. The source endpoint `YM.Stationary.drift_tip` consumes a
  positive width theta and `T.metric.strip theta A`; finite-volume matching
  alone supplies neither width nor the weighted summability. The horizon
  construction retains positive widths for each stage, and the local sentence
  already states the analyticity used here, so this is a clarification rather
  than a missing algebraic argument or an unconditional new supplier claim.
- **N2 (optional author-audit correction):** the part-A correspondence/observations
  describe the realification Fourier width w/2 as stronger than a source w/4.
  the private lemma `insertPaint` in `Lift/Pathways.lean`, and
  `YM.Stationary.strokes` and `YM.Stationary.veins` already conclude w/2;
  the w/4 margin is internal to that proof. The manuscript is correct. The
  author records are outside this review's write scope and have not been edited.

Open suppliers remain open: actual selected germs and gaps, all-period coercivity,
matching and row/path bounds, common analytic response inputs and the stronger
inherited-transport hypotheses must be furnished on the same data. In particular,
this report does not discharge the C10-to-C11 global Hessian-contract obligation.
These are not new blocking findings against the conditional statements reviewed.
No external literature theorem is used to paper over a missing step: the local
finite-dimensional algebra, Cauchy estimates, Fourier summation and retained
supplier proofs are the evidence used here. Supplier chapters were inspected at
relevant interfaces, not independently certified in full.

## Acceptance

No human acceptance is recorded and no reviewed status is assigned. Subsequent
material changes require renewed review against their new hashes.
