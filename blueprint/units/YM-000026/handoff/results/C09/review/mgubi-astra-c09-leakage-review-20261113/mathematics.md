# C09 leakage response: bounded mathematics review

Session `mgubi-astra-c09-leakage-review-20261113`, Astra agent under mgubi. This account did not author these chapters or PR #200; its earlier C09 review concerned other chapters. Claim: https://github.com/hairer/humanise-yang-mills/issues/188#issuecomment-6861868757. Frozen target: PR #200, `43f847d80dd9373f40f929bf479fc4df3fdde51b`. Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

**Mathematical verdict: favorable, conditional and limited to rows 118–119 and their immediate interfaces.** No manuscript repair is requested. Two corrections to the new author record are requested in the separate source report. This is agent review evidence, not formal approval, human acceptance or whole-C09 renewal.

## Row 118: Frobenius radius

The changed sentence retains the actual norm convention. If a complex edge matrix M lies within Frobenius distance r of a unitary V, then left multiplication by V preserves the Frobenius norm, while the operator norm of M−V is at most its Frobenius norm. Hence ||MX||_F≤(1+r)||X||_F. Applying this four times starting from the identity gives (1+r)^4||I||_F, for both oriented loop products. The proof retains the identity-matrix factor and then bounds the trace pulse on the resulting finite-dimensional compact balls. It does not replace Frobenius control by an unjustified claim that the unitary has Frobenius norm one.

Continuity is used on the fixed finite-dimensional color-coordinate space; the link arrays use their supremum norm, giving one coordinate radius independent of the number of links or the torus side. The new wording changes neither this radius nor the quantifiers of `prop:ex-wilson-stream`.

## Row 119: which finite assembly is sufficient?

The proposition defines a picture of order t using n=t+1 variations. Its finite local plaquette proof works for each t and already gives exact recording, the momentum-strip bound, the torus-cardinality normalization and uniformity for every torus side. Thus the edited remark correctly identifies W_2 and W_3 with Taylor degrees three and four. It can cite this proof directly; the more general countable-atom theorem is unnecessary for the bare plaquette family.

The actual consumer `lem:ex-soft-wilson-pictures` in `soft-curvature-receipts.tex` uses the unit leader for order 1, the proposition's order-2 picture with the Ward/ray argument, and its order-3 picture with ray order zero. Its price is bedCharge(1,1)+X_2+X_3. The selected response then combines these Wilson pictures with the separately priced Wilson-subtracted action. The finite baseline construction requires no volume limit; later soft-response arguments do assume a divergent sequence, and that distinction remains intact.

The author asks whether any consumer needs another order or a countable family. The answer must be scoped:

- The inspected selected soft-Wilson branch obtains only orders 2 and 3 from this proposition; order 1 comes from the unit leader.
- The separate Wilson-response route in `annulus-same-data-binding.tex` refers to Taylor degrees two, three and four; the source `vintageWilson` explicitly uses t=1,2,3. This is covered by the unchanged all-t proposition and is not a contradiction of the edited soft-path remark.
- No inspected **bare Wilson** consumer needs a countable plaquette family. But the general path action also has a quadratic row part indexed by a plaquette type and two natural-number row indices. `prop:ex-row-quadratic-price` explicitly sums that countable family using its weighted majorant and termwise coefficient extraction. The finite Wilson argument does not replace that separate argument. This is why the author's package-wide “not used by C09” statement needs narrowing.

The countable summability condition survives in the relocated record. No new proof of the generic countable theorem is supplied or required by the edited bare-Wilson remark. No claim is made here that all general path, annulus, Ward or supplier inputs are closed. The earlier C09 parameter review, its same-action/auxiliary-history continuity caveats, and all other package findings remain outside this review.
