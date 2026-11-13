# Mathematical review of C07 revision 1

Reviewer: mgubi with delegated GPT-6 Astra assistance, session `mgubi-astra-c07-revision1-review-20261113`. This account did not author C07 or PR271. Claim [48#6864994627](https://github.com/hairer/humanise-yang-mills/issues/48#issuecomment-6864994627). Frozen target `c68df769f649ccd6f81597ddbc56832061678729`, full comparison against `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`: ten manuscript chapters and six author records. Agent review, not human acceptance.

**Verdict: the substantive changed arguments check conditionally on their retained inputs. One minor proof-edge correction M1 is requested; N1–N2 are editorial cleanups.** No failure of the positive-order Gaussian estimate or selected-row clearance was found. This is a review of the full revision delta and immediate interfaces, not a renewal of all C07 proofs or its analytic suppliers.

## M1: state the zero-order case before taking an empty maximum

In `gaussian-differentiation.tex`, Lemma `lem:gaussian-base-density` allows j=0, but the proof at lines181–182 defines K as the maximum over 1<=r<=j. This maximum is undefined for j=0. Add the trivial branch: for j=0, the ratio at the base point equals 1, so choose K_0=1; then conduct the displayed argument for j>=1. Alternatively include1 in the set being maximized. This is a minor omission in the written proof, not a counterexample to the lemma. The N=0 branch is already stated separately.

N1: the Haar-measure rename is incomplete in `haar-chart.tex`: lines59 and66 still say “with respect to h” and “preserve h” after h was explicitly reserved for the coupling. Replace those two occurrences by m_G. The displayed integral identities are already correct.

N2: `compensated-variation.tex` lines20–21 call O a neighborhood of (0,0) on which the local inverse is defined. O is the source neighborhood of the forward chart; its image is the inverse's domain near 1. The later use of (X,0) in O makes the intention clear. Say the forward map is a diffeomorphism from O onto a neighborhood of1, and define Log_* using its inverse there. This does not alter the argument or its hypotheses.

## Gaussian proof and its actual application

For j>=1 the proof prices precisely the norms stated in the lemma. The r-th inverse derivative is a finite sum of alternating products with m positive-order C derivatives and m+1 inverse factors, m<=r. Their norm is at most P^(m+1)Q^m v^r <= kappa^(r+1)v^r. Differentiating the trace formula for log det gives at most a fixed-order constant times N kappa^(r+1)v^r. The quadratic form uses the l1/l-infinity pairing, so each trilinear term costs at most N W^2 times the inverse derivative price; no unproved Euclidean operator estimate or extra support count is inserted.

For positive r, N(1+W)^2>=1 and kappa>=1 allow the stated absorption into S^r, since r+1<=3r. The exponential partition formula gives the amplitude-one base-point bound, with Bell(r)<=r! and the printed K_j choice. Constants depend only on the derivative order. This proof does not pretend to control an open neighborhood uniformly in the Gaussian sample; the separate dominated-differentiation subsection remains necessary.

The application is supported by the actual immediate manuscript inputs, rather than by identifying unrelated inverse matrices:

- `eq:local-covariance` and `eq:local-covariance-floor` give the symmetrized padded covariance C a fixed positive spectral floor and a fixed positive-weight row/column bound. Restricting to the activity's principal coordinates preserves both. Applying that section's generic inverse-decay argument to this restricted C supplies a support- and period-independent inverse row bound P. This is an inverse of the principal covariance, not a principal block of the full inverse.
- `eq:pad-jet-price` in normalization-jets and its symmetric-part operation give a common derivative envelope for C; principal restriction only removes nonnegative majorant entries. Thus Q can be taken as the padded-inverse amplitude and v as its fixed-order derivative scale, both of upper exponent zero or better. The fixed post-patch covariance floor/width make P of upper exponent zero as well. The background precision here is the transported-flat sector used for the activity covariance, not the separate curved-derivative global Gram.
- The compensated displacement and gaussian-moment-prices give W <= sqrt(beta)(u+2m)+F_I(z), including order zero because T at the base point is the identity. Here u,m have upper exponent -1/2 and beta<=2h. With N<=F_I and F_I>=1, the printed D' F_I^3 bound follows. The bondwise Jacobian has amplitude1 and adds only n times an upper-exponent-zero scale; since n<=F_I, it fits the consumer's polynomial form. No changed normalization or independently chosen Gaussian law is used.

The radial truncation edit is correct: it acts on the initial u_0, independent of y, at radius 3d_*. It fixes the radius 2d_* support of the compensation and leaves larger inputs beyond the protected cutoff. No differentiability of the truncation in its argument is invoked for parameter differentiation.

## Selected-row clearance and the positive-rate Gram bound

The active-bond definition freezes either endpoint near the 10B seed dome. A selected stencil supplies an active witness with parent l at distance at most floor(B/50) from the output anchor o. Triangle inequalities give precisely the exclusions printed in the new paragraph: o outside the 9B+floor(9B/10) dome and both endpoints of every stencil bond outside the 9B+floor(8B/10) dome. The stated arithmetic for B>=7 is valid; span=R+5+r_pred<=floor(B/50) follows at the stated eventual threshold. Flags are contained in the seed place and the manifest flag equality is retained.

The neighborhoods are sufficient for the actual uses, an uncertainty left by the author. The predictor read is a finite patch fixed before x. The source local chart radius is `allot(P)=2 macroR(P)+L+predReach(P)+5`, and its surrounding extra layer fits inside B once allot(P)+1<=B. Retained path targets lie within B/50 of the row anchor; the source `Background.spun` applies the same fixed-radius gauge at such targets. The manuscript base-stroke argument in warning-safety uses a clean B-ball, radius 4 plaquette charts, and the retained-path margin R+5<=B. Thus all required small neighborhoods fit on a common eventual tail, well inside the stronger 9B clearance. No uniform bound over varying patches is claimed; the period hypothesis keeps these local boxes nonwrapping.

The added conclusion ||Q||_(sigma/2)<=L_0^2 follows from Q=M* M, triangle inequality through the common row anchors and invariance of the weighted maximum of row/column sums under adjoint. This supplies the positive-rate Gram premise used by the C13 handoff without identifying the transported-flat and curved matrices.

## Remaining changed passages and coverage

| Changed chapter | Review result |
| --- | --- |
| packet-estimates | The differentiated object is now the stock extension. Room, manifestness and 500B health are explicitly required for its base value bound as well as identification with the physical packet. Re-basing is restricted to fields satisfying these conditions. No physical flag-test derivative is claimed. Frame branches and scale disambiguations agree with the definitions. |
| inherited-activity-prices | The coarse tail is the unmasked fixed-long-selector extension. Room and the full healthy footprint identify its base value with the kept-tail occurrence. |
| activity-jet-assembly | Both corrected extension clauses are carried to the product consumer, including the 500B packet condition and the inherited-tail footprint. The healthy-family premise remains separate from manifestness. |
| compensated-variation | The ambient logarithm is colour-valued, but its exponential inverse identity is correctly restricted to group elements. Hall's local logarithm theorem supplies the missing group-chart step; the cutoff radius and fluctuation scale remain distinct. N2 is editorial. |
| haar-chart | All changed integral displays and fluctuation-scale formulas agree after renaming. N1 records the two remaining prose names. |
| packet-annulus | The period condition is now a standing hypothesis, with uniformity only over eligible periods. The frame likelihood and decay-rate changes are correct. |
| sector-gram | Changed terminology correctly identifies the transported-flat rows and completed matrix, leaving the curved derivative Gram to its own chapter. |
| itinerary-prices | The dictionary a=f+2, h_0=Delta_B T_k(f+2,S), t_0=exp(-gamma B/2)((f+2)h_0+1) matches normalization-jets. The cited mean identity and P-A^-1 error give the claimed small linear-score coefficient. |
| gaussian-differentiation | Full new lemma and changed truncation/radius passages checked above, subject to M1. |
| actual-global-row-prices | Full new clearance proof and positive-rate product estimate checked above. |

All six changed author records were inspected; their declared open boundaries are retained. The hash inventory is checked separately. The excluded palette and local-covariance findings associated with PR201/review220, C13 cross-reference F7, canonical evidence/findings records, and untouched notation findings remain outside this renewal. Existing C07-to-C08 same-history, support, active-coordinate and derivative matches are not discharged by this review. No global supplier or whole-package completion is claimed.
