# C13 completion: bounded mathematical review

Reviewer/session: mgubi, delegated GPT-6 Astra, `mgubi-astra-c13-completion-review-20261113`.
Target: [PR #202](https://github.com/hairer/humanise-yang-mills/pull/202), exact `8489c5a23eaf21dd65f20145dfda904b1b700b69`.
Full-change comparison: `2017d6f3ee648beb054322e9b994eb3c757cbcf6` (parent of first PR commit), **not** target's parent, which would cover only the last validation record.
Claim: [issue #54](https://github.com/hairer/humanise-yang-mills/issues/54#issuecomment-6861121549).

Verdict: **one required interface clarification (M1); otherwise the inspected changed steps are supported, conditional on their stated suppliers.** This is not acceptance of C13, closure of #54, or approval of all earlier #109 findings. Human acceptance is unset. Exact input fingerprints are in `inputs.json`.

## M1 — distinguish the embedded components from the aggregated output activities

Locations: `manuscript/existence/allarity-planted-compiler.tex`, paragraph after `eq:planted-holes` (around lines 235–249), and `actual-corrected-body-compiler.tex`, `prop:corrected-forced-output` (around lines 414–483).

The interface literally asks the “unmarked coarse forced family” to embed with identical values, supports and inventories into the marked forced components and exhaust the zero-marker components. The new proposition says it proves that interface for its constructed Q. Its proof correctly begins with an unaggregated component family F, attaches holes and boundaries to obtain K, then assigns to Q one activity equal to the sum of K at each full support/inventory address. It subsequently embeds the elementary alphabet and its components. Those are different families.

An address with two components of values u and v is sufficient to expose the distinction: Q stores u+v in one slot, whereas the component list has u and v. In general the summed slot is neither component, so an identical-value embedding of Q's assigned activity list does not follow. This does **not** dispute the equality of the addresswise sums, the constructed density, or the validity of the component embedding.

Requested correction: explicitly name the unaggregated unmarked corrected forced-component family F as the domain of the embedding, require its attached family K to have the same addresswise sums as Q, and reserve “forced activities of Q” for the aggregated assigned slots. Make the proposition's promise refer to this precise interface. The source already separates these objects as `Flux.Vac.f`, `Flux.Embedded`, and `Value.Background`; no new normalization argument is needed. Until that distinction is explicit, the literal interface is stronger than the proof supplies.

## Changed-hunk coverage

All thirteen changed chapters were read against the full PR comparison and the relevant #109 reports. The table records the scope actually assessed; it is not a whole-chapter approval.

| Chapter under `manuscript/existence/` | Assessment of the changed step |
| --- | --- |
| `actual-corrected-body-compiler.tex` | Construction by full support/inventory address, real values, zero padding, triangle-inequality prices, component bijections through both attachments, and actual-input density reconstruction are coherent under the previously purchased majorants and body/deletion inputs. M1 concerns the promised interface, not this construction. |
| `allarity-planted-compiler.tex` | New Gaussian/Haar domination invokes a full integration envelope rather than just an integrated coefficient bound. Identification with the newly constructed output is subject to M1. The prior regular-deletion proof is immediate context, not a renewed blanket review of #179. |
| `restarted-rank-history.tex` | Explicitly chooses the forced output constructed above rather than an arbitrary representation with matching parameters. The displayed coupling band follows from the stated drift and plateau ranges. This use inherits M1's terminology repair. |
| `actual-local-compiler-handoff.tex` | Names the actual matrix-price proposition and specifies the substitutions s = sigma/2 and M0 = L0 squared, together with eta. This fixes the citation/application omission; it does not independently establish C07's analytic suppliers. |
| `actual-mixed-marked-compiler.tex` | An inventory covering a flag belongs to a support intersecting every support containing that flag, hence to the same support component. This justifies restricting coverage component by component. |
| `actual-reader-dawn-selection.tex` | The floor/ceiling lower bound on h_x and logarithmic estimate show C exp(-c h_x) = o(x^(-1/8)) for fixed positive c. Uniformity is correctly conditional on constants purchased uniformly over the bed class and periods. |
| `actual-reader-small-window-bridge.tex` | The all-active-row formulation includes the padded zero rows. The removed shifted-center premise was not used by the stated proof. The separate small-field delta and the decomposition (K-H)v' + K(v0-v') restore the extra factor t. Since widen is at least t, the quadratic bond remainder is also bounded by C t widen. |
| `actual-reader-guarded-curvature.tex` | The inverse coupling bounds follow from beta in [x/2,3x]. Stride and C0 are fixed before the eventual threshold; beta-prime hypotheses and health threshold are explicit. This review does not re-prove the purchased chart/curvature suppliers. |
| `allarity-coordinate-calibration.tex` | Closedness of the actual mean and of both kernel arguments is now explicit, as required for the residual-coordinate argument. Symmetry alone would not supply closedness. |
| `allarity-marked-propagation.tex` | Strict separation greater than 2 rho prevents cross-cell overlap. The actual rho = 3B and purchase 6n+3 <= a/(3+2n) give the claimed final support bound; the purchase is no longer mistaken for the construction of the slices. The small-marker-weight limitation remains explicit. |
| `marked-healthy-cumulant-launch.tex` | Field error and row/covariance transport discrepancies are now separately purchased at the same allowance. One is not inferred from the other. Existence of those purchases remains a supplier obligation. |
| `selected-history-limits.tex` | Newly distinguishes value-order renewal from the derivative comparison input and leaves the continuity bridge conditional. |
| `three-panel-weak-comparison.tex` | Choosing each comparison depth strictly beyond the previous depth gives the required increasing diagonal while retaining the finitely many eventual conditions. |

Both new author records were read. The completion record corrects the #179 symmetry/normalization attribution and does not claim to resolve all minor #109 findings. The validation record is a report of the author's local build, explicitly not a current-remote integration build; this review does not relabel it as an independent build.

## Obligations deliberately left open

1. The actual auxiliary-input Station contains renewal at derivative order zero. Matching the stronger derivative comparison supplier on the same auxiliary data, or proving sufficient value-order continuity, remains necessary. The added caveat correctly prevents using existence of a one-step map or admissibility alone as that bridge.
2. A propagation estimate at 0 < r <= 1 yields a coefficient factor r^(-q|I|); it does not yield the replica-root price at a = exp(2 I_k) > 1. A matching launch/large-weight estimate on the same polynomial, or a proved rescaling with its full price, remains necessary.

These are openly unresolved joins, not alleged counterexamples to Lean. C07 suppliers, prior #172/#179 repairs outside the changed hunks, selected-history dependencies, and C14 extraction have not received blanket renewed approval. No missing proof was authored in this review. Shared literature notes were searched; no new external theorem or literature-match claim is introduced by these elementary/local review checks.
