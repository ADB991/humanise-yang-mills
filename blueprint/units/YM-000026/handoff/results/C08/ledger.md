# C08 author input/output ledger — draft

Session: `TrishenGunaratnam-terra-c08-20261112`. Issue #49 claim:
<https://github.com/hairer/humanise-yang-mills/issues/49#issuecomment-6834547345>,
until 2026-11-13 14:30 UTC. Released starting commit
`9d11cca4644bad07126bfa372cc85fb120dee7ba`, pinned source revision
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`, Lean tree
`328ad19b404d2db2a578319ea3e4eba4b27e34ef`. All thirteen chapter hashes
match the released coverage inventory, saved in `starting-inventory.json`.
This is an author audit in progress, not independent review or global closure.

## First Gaussian sector boundary (provisional)

The source `YM.Next.SectorChange.authorized_change`
(`Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Change.lean`) takes a positive
definite finite active-coordinate covariance, positive actual beta, measurable
frozen-field-dependent shift, the standing/chart conditions including `4d <
chart radius`, lawful representation and funded tube. Its result retains the
actual allocation, likelihood, chart and door cutoffs, normalized frozen Haar
and active Gaussian, and proves section and joint integrability plus the exact
change of measure. It does not assume that this arbitrary allowed covariance is
the inverse of the Hessian of the complete nonlinear effective action, or that
the shift is the exact minimizer.

The source `YM.Next.SectorChange.Rows.gram` and `.guide`
(`Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Remainder.lean`) define the Gram
`moveᵀ move` and the half-square of the retained affine row map. Their positivity
and quantitative gap belong to the selected affine sector, not to an asserted
full nonlinear Hessian. `YM.Next.SectorChange.fog` and `.meanLog`
(`Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Chosen.lean`) use the symmetrized
windowed inverse and minus the transpose of the unsymmetrized windowed inverse
applied to the row source, respectively. `opaqueCost` requires fixed gauge, patch, branching
Teller, eventual large coarse parameter, same funded tube, sufficient coarse
side, and matching output flags. It yields positive selected covariance and
an exponentially small difference from the inverse Gram. Wrong-flag sectors
and quantitative analytic inputs cannot be discharged merely from the general
change-of-measure theorem.

The working #12 interface note found in a separate prior audit is navigation
and bounded evidence only; its author status and version do not certify the
current package. Its precise permitted-covariance versus selected-window
separation agrees with the directly inspected source declarations above. The pinned committed versions and the #13 nonlinear interface were subsequently
read; the precise evidence and limitations are recorded below. C07 owns local covariance and mean estimates. Their exact
same-sector, same frozen Haar variables, selected windows, gap, derivative
orders, cutoff and normalization must be checked at both endpoints; no owner
acceptance is implied. The C02 ordinary/flagged response and C06/C12/C16
interfaces also remain pending.

`YM.AnalyticBridge.GaussianFieldAlignment.Agreements.exact`
(`Lean/YM/AnalyticBridge/GAUSSIAN_FIELD_ALIGNMENT/Agreements.lean`) explicitly
requires positive definite `Q`, radius at least 120, and zero entries of `Q⁻¹`
outside the intersection of the two window prescriptions before concluding
`fog=Q⁻¹` and equality of the alternative covariance and shifts. This is a
sufficient conditional equality, not a general identity. Direct inspection
confirms the caution in the earlier #12 working note. The reassembly manuscript
currently distinguishes completed precision `A` from localized covariance
`C`; its exact algebra in `eq:reassembly-square-cancel` retains `C⁻¹−A`.
That agrees with the distinction at the formula level. The actual E6 coat
completion and its separate window definitions were subsequently inspected
and are recorded below; the complete cross-package match remains open. The full-action
Hessian question remains open; nothing here claims it equals `Q` or `C⁻¹`.

## Pinned #12/#13 notes and nonlinear exact-value interface

The pinned upstream working audits `blueprint/interfaces/gaussian-sector.md`
(Git blob `9378ceea6c7112d3dab5d775fefbf1f5b6795fea`) and
`blueprint/interfaces/nonlinear-rg-step.md` (blob
`50012779d0b6563cf5896456dc43da136fb8d929`) were read from maintainer main
commit `4cf1c97dd820c9996d0242f9956d123a940e2dff`; SHA-256 respectively
`f5ed7e2503e4a2935fc033b34c6fd835359ad904de86622748c014f7fa5d07e7`
and `b65c6c4e3970355ba90ee2e741f4f85b7019aec0c421d97c6073fd9f0fffce82`.
Both explicitly describe draft, bounded audits; graph-only assertions are not
promoted to inspected proof. The first confirms the distinct arbitrary-sector
change and selected window contracts, and records the separate unresolved
full-effective-action Hessian question. The second distinguishes the exact
pre-reset Gaussian presentation, the actual block push, and the local prices.

Direct source check: `YM.AnalyticBridge.VerifiedReset.Return.gaussian`,
`.licensed`, `.earnings`, `.atlas`, and `.grants`
(`Lean/YM/AnalyticBridge/VERIFIED_RESET_STEP/Inputs.lean`) use one directed
schedule, selected forest and bookings, chart, actual `fog` and `meanLog`.
For `m<N`, an alive input in the coupling band and the selected `Ringing`
and `Cosmos` receipts, `earnings` proves licensed sector integrals and
`push Q.beta Q.eval = gaussian`. Its matching-flags clause alone supplies
positive `fog`; it does not assert positive covariance for wrong flags.
`atlas` separately asserts `gaussian = earlyValue`. In
`YM.PhysicalNext.Repeat.Opera.symphony`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Opera.lean`),
the proof composes `earnings` with `Song.forward`, while local prices are
obtained separately from the loaded receipt. Thus C08's exact activity
reassembly is not alone the reset program or its continuity and price
purchases. The actual `Roof.Sheltered`/`Roof.WorksIn` and #13 closure
hypotheses remain external and are not accepted merely from this comparison.

## High-degree cluster price and selection (provisional)

`YM.ConnectedActivityE6.Raw.extraA` and `.inherit_multi`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Census/Typhos.lean`)
give the six extra grades 1,0,1,1,2,2 and the graded inherited site-price
receipt. The theorem chooses the block-size floor before the block `L`; for
fixed `L` and each `r > -1/2` and forced exponent `r'`, it holds eventually
in the coarse parameter, uniformly over steps with `S.patch.L=L` and `Intake`
for the same representation. Its forced weights use a distinct arbitrary real
exponent `r'` (hence any negative rate); the extra occurrence factor appears at the connected stage.
The species ordering is checked against `YM.ConnectedActivityE6.Raw.expo`
(`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Inherited.lean`): regular
occurrence, cubic, quartic, loop, fine tail and coarse tail, in that order.
The signed normalizations and the different fine/coarse inputs are retained
there; the grade assignment does not identify their values or supports.
For the complete optional alphabet, `YM.ConnectedActivityE6.Blaze.Silica.Clutch.teeth`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Census/Rush.lean`)
extends `extraA` by grade zero for the quadratic family and grade two for
the remaining correction family. `Silica.horn`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Census/Horns.lean`)
adds grade zero for forced letters and grade two for warnings. Its `Heavy`
receipt is an additional paid site bound; this classification alone does not
establish the warning or differentiated prices.
`YM.ConnectedActivityE6.Coat.alarm_bills`
(`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/ResponsePrice.lean`)
provides a nonnegative per-warning joint probability price with an arbitrary
prescribed upper exponent, under its `Rotator`, `Intake`, positivity and
eventual-scale hypotheses. This is the source input for choosing a strong
enough warning price before taking its square root and multiplying by
`grow²`; with exponent `-5` the resulting upper exponent is `-7/4`, below
the selected `t>-1/2`. This is not a claim of independence among the warning
events.
`YM.ConnectedActivityE6.Blaze.Silica.Clutch.hearthGrades`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Census/Grades.lean`) adds the differentiated receipt under the
same `Clutch` and its explicit mode, cutoff and width hypotheses.

`YM.PhysicalNext.Repeat.Height.completed` (`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Census/Revenue.lean`)
uses `degree = acme + breadth`, counts occurrence multiplicity, and extracts
`grow⁻³` on the union `degree≥3 ∨ overlap≥1 ∨ till≤depth` only after both
separate degree-price smallness inequalities and the mark/length purchases.
The mark count is not merely the number of packet components: `overlap`
sums `Cash.numP` over cluster occurrences
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Height/Span.lean`),
and `numP` sums `Mixed.shares` over each molecule
(`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Expenses.lean`). A `Stores`
letter has `shares = costs.card + aisles.card + flags.card`
(`Lean/YM/Pressure/Seeds.lean`); optional letters contribute zero
(`Lean/YM/Push/ABSOLUTE_SUMS/Mixed.lean`). Thus the manuscript's mandatory
seed count must retain all three kinds and occurrence multiplicities.
The footprint charge also has an exact definition-level match:
`YM.ConnectedActivityE6.Cash.shapeW`
(`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/SalesRoot.lean`) is
`Mixed.charges`, which uses `Reserves.setPrice` to sum each letter's cover
number plus its extra length charge
(`Lean/YM/Push/ABSOLUTE_SUMS/Reserves.lean`). `Height.depth` then sums that
quantity over cluster occurrences. This supports the manuscript's full
`S(P)` charge and its repeated-occurrence convention, not a replacement by
the cover number of the union alone.
`YM.PhysicalNext.Repeat.Height.cruising` and `.highPay`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Height/Highway.lean`) fix block and derivative orders before the
entrance tail, require the target exponent strictly below `-3/8`, and pay
any fixed positive fraction of `δE`. `YM.PhysicalNext.Repeat.Height.season`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Height/Hip.lean`) collects finitely many stage transitions into a
coordinatewise larger delay; it does not supply a single threshold uniform
over arbitrary derivative orders. The elementary graded `Sales`, common
`Cash` and `Heavy`/`Armada` component fields remain real input obligations;
scalar exponent arithmetic alone does not construct those fields. This is an
author source cross-check, not an independent review.

`C07-to-C08-principal-covariance` is provisional. C07 reports directly
inspecting the actual active-coordinate panels requiring every pair of bond
endpoints within `floor(B/20)`; the anchor ball of radius `floor(B/60)` lies
inside on the large-radius tail. It also distinguishes the generally
nonsymmetric columnwise inverse from its symmetrization and keeps the inverse
residual ordering `Q⁻¹(QN−I)`. Its selected supplier chooses gap/price constants
before the eventual scale and then quantifies over the same funded tube, store,
forest, tag and matching-flag field, uniformly over eligible periods. This is a
reported C07 author finding, not an accepted two-owner match. The C08 actual reassembly instead uses the E6 coat completed matrix and local
window described in the correction below. A third construction,
`YM.AnalyticNext.ConnectedActivity.Aff.gram` and `.eyes`
(`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_BOUNDS/Affine.lean`), also has an
inactive identity completion but is a separate source construction. The #12
note warns against identifying these implementations merely by similarity. We still need the actual matching at the
specific C08 consumer, including its n versus n+1 derivatives and common
sector, and independent review.

The Gaussian reassembly chapter now explicitly calls its completed affine
precision and localized covariance distinct; it retains the inverse mismatch
`C⁻¹−A` and does not identify the affine Gram with the full nonlinear
effective-action Hessian. The E6 reassembly source is `YM.ConnectedActivityE6.Coat.plate`,
`.form`, and `.sleepy`
(`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Gram.lean`), with
`Coat.frames`, `.kernelA`, `.relating`, and `.driftM`
(`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Windows.lean` and
`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Shutter.lean`).
`plate = formᵀ form + sleepy`, where `sleepy` is the identity on non-hot
coordinates; `kernelA` is the columnwise local inverse, `relating` its
symmetrization, and `driftM = -kernelAᵀ linearBill`. The separate `Aff.gram`
construction above is not identified with these definitions. This is an
expository correction following direct inspection; it needs independent review.

In the same `Gram.lean`, `Coat.scale` is the square root of the reciprocal
of the number of signed channels, and `Coat.motion` masks the oriented row
before `form` is constructed. Under the stated path bounds, `Coat.pricing`
identifies the priced row with its value at zero plus `form` applied to the
direction, and `Coat.in_count` identifies the signed averaged extracted
square with half the Euclidean square of that priced row. `Coat.cold` supplies
the zero columns on non-hot coordinates. These observations explain the
normalization and completion in the reassembly algebra; they do not by
themselves supply positivity of the localized covariance or the nonlinear
remainder estimates.

The dummy-coordinate claim has a separate source check. In `Shutter.lean`,
`Coat.cold_pad` proves that the windowed inverse has the identity entry if
either index is non-hot; `Coat.uniform` transfers this to the symmetrized
covariance, and `Coat.μ_sleep` gives zero mean on non-hot bonds. These lemmas
are under the same `Window.Allow` and funded-tube hypotheses, rather than
following just from the definition of symmetrization. Consequently, with
the separately established positivity, the non-hot Gaussian coordinates
have identity covariance and zero cross-covariance with the hot coordinates,
as required for the dummy Gaussian insertion in the manuscript.

The precise completed-square identity is also present as
`YM.ConnectedActivityE6.Coat.correcting`
(`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Funnel.lean`). For positive
`β` and `Rotator`, it combines the extracted row square and dummy energy
with `Coat.hatted = -g⁻¹(plate · driftM + linearBill)` and retains the
quadratic difference `relating⁻¹ - plate`. The proof uses `βg²=1`, the
affine-square expansion, and the zero non-hot mean from the window receipt.
This matches `eq:reassembly-square-cancel` at the stated source level; it
does not by itself prove the separate determinant or gas-reindexing steps.

## Tilted gas and fusion boundary

The finite-family summation index in `leaf-expansion.tex` contained a broken
LaTeX command; it now explicitly reads `q ⊆ ℕ` finite. The proof retains the
joint value/derivative witness with sum `a+b≤p` on an open neighborhood, so
products pay one product of prices rather than a factor for their number of
constituents, and the pointed double series is absolutely summable. This
corresponds to `YM.PhysicalNext.Repeat.Daisy.Charity.Est` and its product/sum
uses in the source recorded in `local-projection-evidence.md`; its exact
source definition and elementary product and sum lemmas were subsequently checked directly as described below; their application still requires independent review.
`YM.PhysicalNext.Repeat.Mallow.Passage` (`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mallow/Passage.lean`)
uses exact flag coverage and separated hard supports in its component
regrouping. `soft-log-fusion.tex` additionally retains the original eligibility
conjunction, nonempty supports and vanishing of a soft logarithm on a healthy
support. A common finite lattice and summable uniform prices justify the
scalar regrouping; the analytic origin and paid bounds of the ordinary and
raised corrections are separate incoming obligations. No conclusion about
those purchases follows from this combinatorial identity alone.

Live status recheck: issue #12 remains open. PR #28 merged its final note,
but its [later independent correspondence review](https://github.com/hairer/humanise-yang-mills/pull/28#issuecomment-6808812067)
requested corrections to three qualified names and clarifications; merging is
not acceptance, and nested hypotheses and the Hessian question remain open.
Issue #13 is open; PR #30 merged its working audit, whose public comments
record an author-side self-check and remaining need for independent review.
For the #13 warning that the four named Contract 1 estimates do not alone
produce the full bundle, see its author response on PR #30; it identifies
additional `Cash`-conditional fields including `Height.season`,
`March.takeover` and `Armada.ensemble`. The graph-level claims remain bounded
by the note's own evidence qualifications. Current C08 author work does not
modify or approve either note.


Direct inspection of `YM.PhysicalNext.Repeat.Daisy.Charity.Est` and its
`mold`, `summit`, `tilted`, `logCharge`, `copies`, and `seqOwnUp` lemmas
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Daisy/Curtail.lean`)
confirms the joint value/derivative budget, multiplication without a degree
factor, affine-tilt price `a+2b`, and differentiation of a summable family
on an open preconnected set. `seqOwnUp` assumes a summable price and the
joint bound at every point of that set. The separate proof in the chapter
for absolute convergence before the marked index is summed is mathematical
reasoning in the prose, not asserted to be the statement of `seqOwnUp`.
`Daisy.Charity.warm`, `.cold` and `.roosts`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Daisy/Berries.lean`
and `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Daisy/Kin.lean`) instantiate the budget for the relevant entries and
cluster terms under their actual incoming hypotheses.

C07 subsequently corrected its author report: the global selected-source
panel uses the all-endpoint-pairs `floor(B/20)` condition, whereas the local
activity window `Coat.frames` uses existence of a close endpoint pair at its
own threshold and lies between anchor radii `B` and `B+2`. These are distinct
windows and cannot be silently identified. C07 also reports that its local
`Blaze.Flux.coterie` integral interchange through order `j` alone does not
require order `j+1`; any higher derivative required by a C08 application needs
its own input. These are provisional reports from the other author, not a
completed correspondence review.

## Marked block identity (local source trace)

`YM.PhysicalNext.Repeat.Lotus.Leaf.bud`, `.sells`, and `.counted`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Lotus/Postcards.lean`)
use `R.Lawful` and the actual regular or forced address. `bud` handles the
regular case with the original summed prices and the forced case by replacing
one price with the mark's weight; `sells` obtains an envelope and gauge
invariance. `counted` retains the sealed-family condition and eligibility.
`Lotus.Leaf.tons` and `.tithes`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Lotus/Troika.lean`)
use the selected layout and actual product-measure budgets, with integrability
and a summable erasure price for the exchange of sum and integral. The local
trace confirms the marked chapter's no-division and exchange descriptions; it
does not by itself reconstruct all local covariance and forest-independence
premises. `YM.PhysicalNext.Repeat.Daisy.Charity.sprained` and `.tint`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Daisy/Berries.lean`)
show the one-mark affine product and the resulting `HasSum` identity for the
actual push. Their bodies use the preceding organization and marked integral
receipts. The subsequent tilted cluster bounds require additional marked
prices and cannot be inferred from this exact affine identity alone. Earlier
local conditional reviews of this unchanged chapter exist in
`blueprint/units/YM-000026/correspondence.md` and
`blueprint/units/YM-000026/reviews/draft-review.md`; neither is a final review
of this C08 package or of its cross-package inputs.

## Projection payment and coefficient profile

`YM.PhysicalNext.Repeat.Mallow.sandboxK`
(`Lean/YM/MergeProof/Coffer.lean`) defines the transition entrywise as the
zero-parameter derivative of `pupil`; `pupil` is the actual twice-fused array
in `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mallow/Brisk.lean`.
`YM.PhysicalNext.Repeat.Graces.cloudDrop` and `.thunder`
(`Lean/YM/MergeProof/Thimble.lean`) retain the profile plus the response hook,
use the same array and two real insertions, and invoke a dominated product-index
family before interchanging sums. The scalar gas identity alone does not give
this coefficient profile. `YM.PhysicalNext.Repeat.Mercury.haze` and `.shelves`
(`Lean/YM/MergeProof/North/Partly.lean` and `Lean/YM/MergeProof/North/Shawl.lean`) separately pay
the principal reserved mass; the flagged case in `shelves` uses the absence
of a principal cluster. These are exact local source traces, not independent
approval of the chapter or identification of every consumer.

`YM.PhysicalNext.Repeat.Blush.efferv` and `.fruition`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Blush/Little.lean`)
prove the forced-decay and tail payments under their stated target/rate inputs,
including the zero-mass case without division by mass.
`YM.PhysicalNext.Repeat.Graces.Comply` and `.compass`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Graces/Aspire.lean`)
collect both payments and the hit-width inequality for `StepStages j i` and
`d≤i`, selecting a coordinatewise larger entry delay after a finite maximum
for each stage. This quantifier order supports stagewise simultaneous bounds;
it does not assert a single threshold uniform over all stages or all degrees.

## Forest average and exclusion

`YM.ConnectedActivityE6.TreeColor.unafraid` and `.overhead_eq`
(`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Silhouette.lean`) prove
forest-independent determinant and overhead for coats at the same `x` and
field `V`, with `P.Funds S T`. In the determinant proof, `.blankrow`
annihilates root-zero gradients in each signed channel, `.strata` identifies
the two blank row maps under the integer change of coordinates, and
`.snuggles` transports the dummy-coordinate completion. `.unafraid` then
uses unimodularity in the determinant congruence. These are flat-reference
statements; they do not assert forest independence of the nonflat precision.
`YM.PhysicalNext.Repeat.Greenbelt.repays` and
`.organizes` (`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Sward/Greenbelt.lean`)
use `Cash`, the same field, disjoint component grounds and the finite product
of sitewise choices; the latter `HasSum` is the actual block push. Uniform
component prices and the full read supports are inputs to this argument.
More specifically, `YM.ConnectedActivityE6.Horticulture.Travels.paths` and
`.sails` (`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Sward/Garden.lean`)
require agreement of the forest's `up` data on parents in the component
ground, together with the same scale, width, field, chart data and `Cash`.
The proof pulls both Haar integrations back to a common product space and
uses equality of the restricted covariance for the Gaussian projection.
This is the locality needed by the product average; forest independence of
the scalar alone would not prove it.
`YM.ConnectedActivityE6.Cash.bouquetPool` and `.convoyPool`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Cadre/Catkin.lean`
and `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Cadre/Aurora.lean`) retain the overhead and regular exponential while
regrouping the actual push into the forced family. The latter proof explicitly
uses an injective encoding and inverse flattening plus zero outside the range.
Exact flag inventory and permitted-family tests are retained. The local source
trace does not independently reprove the full rooted majorant or all local
analytic prices; these remain the C06 cluster/mixed estimates and C07 suppliers.

## Principal comparison and singleton inheritance

`YM.PhysicalNext.Repeat.Mercury.trove`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mercury/Radio.lean`)
chooses an exponent `-1/2` rate before an eventual tail. It quantifies over
`Works`, the same `Cash`, forest and manifested `Coat`, support equality,
`Plays`, `Scrim`, a healthy field, `coverNumber ≤ radiusB`, and an actual
regular insertion at its original key. It controls the sector/reference
integral difference along the permitted directions, through the purchased
order, not an arbitrary pair of Gaussian measures. The two integral
representations on a common Gaussian space are `Mercury.pop6` and `.pop9`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mercury/Glow.lean`), conditional on their respective positive-definiteness
and cutoff/health premises. No derivative of the merely measurable mark is
inferred from this comparison.

`YM.PhysicalNext.Repeat.Peak.creek` and `.tinyBill`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Peak/Drums.lean`
and `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Peak/Tansy.lean`) use a short-support condition, the `lit` cancellation,
the order inequality `i+1≤n` and the actual `glider` bounds to produce the
reference price. The long-support branch `.huge` has a different price and
requires no false extension of the short-support gain. In
`YM.PhysicalNext.Repeat.Brim.Houses` and `.pressings`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Brim/Level.lean`),
the principal and remainder are separate anchored budgets; the remainder's
supremum derivative estimate retains `coverNumber ≤ B.B`, while its regularity
statement is global. The theorem assumes `Works`, `Cash`, `Plays`,
`Release.accepts`, `Release.Quotation`, `Lute.Plented`, and a sufficiently
high-order `Captain` before its conclusions. `Brim.landing` includes the
`1/L` after aggregation, rather than merely a per-occurrence `L⁻⁵` bound.
The pre-`L` constant in the reference price has a source-level quantifier
check: `YM.PhysicalNext.JointLoad.Heir.Release.quoting`
(`Lean/YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir/Choirs.lean`) chooses
`E` from the fixed `Libretto`, orders and exponents; the resulting
`Quotation.prices` field quantifies over `StepData`, hence over the later
block length, with its stated acceptance, geometry, threshold, nonnegative
amplitude and `Lute.Plented` premises. This is a conditional order-of-choice
match, not a construction of `Plented` on the selected history.
The released singleton chapter stated only `n≥2` immediately before invoking
the degree-four case of the preceding attenuation section. That section's
displayed proof requires `n≥d+1` and cancellation through degree `d`, so
`n≥2` alone did not justify the `L⁻⁵` invocation. The chapter now states a
purchased order `n≥6` and degree-four cancellation; any smaller requested
order follows by restriction. This is an explicit hypothesis correction,
not a proof of the previously stated lower-regularity claim. It needs fresh
independent review. At the source pin, `YM.RG.BudgetPoint.order_ge`
(`Lean/YM/RG/Masks.lean`) gives order at least six, and
`YM.PhysicalNext.JointLoad.Heir.Rehearsed.test`
(`Lean/YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir/Sonata.lean`) identifies
that budget order with `n`; the `motif` lemma in
`Lean/YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir/Motif.lean` explicitly
requires `5≤n` in its `L⁻⁵` branch. These are source conditions, not a
claim that every arbitrary `n≥2` family can be upgraded to order six.
The degree-four cancellation is also not simply an unexplained new formal
axiom: `YM.PhysicalNext.JointLoad.Heir.Seed.family`, `.four` and `.ghost`
(`Lean/YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir/Ghost.lean`) derive the
graded derivative vanishing from the regular-family/seed conditions, simple
gauge group, nonwrapping support and side-size hypotheses. In `.ghost` the
positive grades must sum to at most four and the screened directions must
belong to the corresponding `Mom.Maps` spaces. The exact match of these
graded directions to every use of the manuscript cancellation remains a
correspondence question for independent review. At the definition level,
`YM.MultiNext.SignedSource.Mom.Maps` in
`Lean/YM/MultiNext/SIGNED_SOURCE_CONTINUATION/Mom.lean` uses degree at most
`i-1` on links whose two endpoints lie in `X`, and `Mom.screen` in
`Lean/YM/MultiNext/SIGNED_SOURCE_CONTINUATION/PMOM.lean` zeros the other
links. This is the same screened polynomial-space convention stated in
`eq:polynomial-moment-null`; matching its local chart and all supplied tests
is a separate issue.
Its ingredient `YM.PhysicalNext.JointLoad.Heir.Release.spread`
(`Lean/YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir/Choirs.lean`) groups fine
anchors by `q.parent`, sums over the fine residues assembled above a fixed
coarse site, and uses the four-dimensional site count `q.count⁴`. Thus the
coarse site is the parent and the $L^4$ fine sites are its preimages; the
chapter's terminology was corrected accordingly. The result retains each
original occurrence index and assumes the fine-anchor budget and the
per-occurrence `L⁻⁵` estimate.
The complete upstream `Cash` and reference-input constructions and the exact
C07-to-C08 matching remain open; this local trace does not close those inputs.

## Gaussian reassembly: exact push and locality

`YM.ConnectedActivityE6.Matter.trace`, `.render`, and `.real_push`
(`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Density.lean`) pass from
one allocation to the actual push using the intake allocation identity, then
injective component/flattening maps and zero outside their ranges. The last
`HasSum` is relative to the actual probability-Haar push, with one overhead;
it is not merely a formal partition function. `Coat.precip`
(`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Unified.lean`) retains the
normalization by the cardinality of the tag-choice space, the likelihood,
profile and mask, under `manifest` and the positive cutoff parameter.
`YM.PhysicalNext.Repeat.Lotus.Leaf.concur`, `.coni`, and `.summons`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Lotus/Luminesce.lean`
and `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Lotus/Sofa.lean`) illustrate the marked counterpart: locality requires
the same enlarged reads, compatible forest data and Gaussian marginal,
`Cash`, manifested coats and integrability. The equality and average are not
just consequences of the bare support label. These checks corroborate the
stated source boundary; they do not supply the upstream `Cash`, chart access,
or the needed summable integrated prices.

## Marked local jets and prices

`YM.PhysicalNext.Repeat.Daisy.dew` and `.sustains`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Daisy/Solvent.lean`)
define the mark price and debt, prove their product is the actual insertion
weight, including weight zero, and use the full enlarged inspected support
and fine cover charge in the site estimate. The choice `foam` is a condition
on the already selected block length and support reserve. In
`YM.PhysicalNext.Repeat.Daisy.score` and `.Herd`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Daisy/Charm.lean`),
the actual mark, erased remaining alphabet, warning event and common
Gaussian-coordinate factor appear together. `Herd.nil` requires a healthy
same-coat field, manifest coat, `troupe`, `Ac.Spark`, the mark's membership,
`Mode` and the equality of the probe base point to that field; it supplies an
integrable pointwise envelope. `YM.PhysicalNext.Repeat.Daisy.pistes` and `.luminos`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Daisy/Pint.lean`) use that envelope and the gauge-average germ to obtain the
finite-order local jet and its masked extension. The full hypothesis context
in those files remains part of these statements. This trace does not infer
smoothness of the original bounded measurable insertion or a global jet at
an unhealthy configuration.

The principal-comparison endpoint is more specific than the general #12
sector: `YM.PhysicalNext.Repeat.Malachite.lamp6` restricts the actual varied
coat's `relating` covariance to the `Museum` read coordinates, whereas
`.lamp9` is the reference museum's `twilight` covariance
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Malachite/Poles.lean`).
`Malachite.volume6` reads the varied coat's actual mean, whereas `.volume9`
uses `Offset.mean` with `bareStores S`, the same forest and tag, and the
reference `Folio.leaf`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Malachite/Relume.lean`).
The associated `ray6`/`ray9` and `light6`/`light9` compare rotated local
readings under their own `Room`, bulletin, locality and disjoint-seed
conditions; they do not identify the window constructions definitionally.
In the manuscript, `eq:comparison-flat-window-error` compares their errors
against the common flat inverse and keeps the error `t(x)`, rather than
invoking `Agreements.exact` without its inverse-support hypothesis. The
actual `bareStores` choice, projection, gauge and read-set match to C07's
supplier still needs the two-owner audit.

`YM.PhysicalNext.Repeat.Malachite.treasure`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Malachite/Grain.lean`)
provides a concrete source bridge: for fixed order `n≥2` and shrinking radius
of upper exponent `-1/2`, it chooses rate-zero jet bounds and a flat discrepancy
of any prescribed upper exponent before the eventual tail. Its hypotheses
include a branching patch and `Works` for each step. Its body invokes
`SectorAffine.assembly` specifically with `bareStores S`, field `1`,
`noFlags`, the same forest and coat tag; the reference covariance jets come
from that `KernelJets.cJets`. It separately obtains actual-coat jets through
`sieve` and applies the flat comparison `night`. This direct call supports a
more precise producer edge than simply saying that an arbitrary selected-sector
estimate supplies both sides. It still does not identify the actual coat's
window with the bare-store window, or by itself establish every chart/read
hypothesis in the later `Mercury.trove` consumer.

`YM.ConnectedActivityE6.Blaze.Flux.takeoff`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Census/Mettle.lean`)
constructs `Heavy` and `FlareW` on the same `Cash`. In the proof it fixes the
full read set `I` and a single catastrophe event `J`, uses `globes` at twice
the polynomial order, applies `divideC` to the event and that same Gaussian
field, then takes the product with the probability Haar factor. This checks
the source route for the Cauchy–Schwarz bridge in
`sec:high-degree-cluster-prices`; no independence of overlapping reads is
introduced. `YM.PhysicalNext.Repeat.Daisy.debtor` and `.petals`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Daisy/Morning.lean`)
then retain the mark's debt in the forest-averaged local extension and price;
`.debtor` states the finite-order `Ore` estimate on healthy configurations.
Both are conditional on the actual `Herd`/`Captain` receipts.

`YM.PhysicalNext.Repeat.Mallow.Passage.gathered`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mallow/Passage.lean`)
is a `HasSum` identity for the fused gas equal to the old gas times the
exponential of the summable soft logarithms. It requires `Kiln`, including
the original `ForcedFamily`, soft vanishing on healthy supports, measurability,
gauge invariance and domination of both families. Its proof derives the new
gas summability from the old series, rather than assuming it. The companion
`.fused_forcedFamily` preserves the conjunction of the original eligibility
tests. `YM.PhysicalNext.Repeat.Mallow.harvest`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mallow/Kitchen.lean`)
additionally requires the original tilted `Season`, the actual `Vapor` soft
receipt and `Payments.Rates`, and returns a new `Season` with the same tilt
parameter and insertion debt. `Mallow.wallets` exposes the inflated hard and
soft prices used in the proof. Thus the exact gas identity and the tilted-price
purchase remain distinct inputs, as in the chapter.

## Reference attenuation and its derivative exchange

`YM.PhysicalNext.JointLoad.Heir.dissent`
(`Lean/YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir/Dissent.lean`) proves,
for a branching patch and eventually in the scale, uniformly over admissible
finite sides, `Lift.Booth`, forest and tag, that the bare-store `forecast`
minus the restricted tree response vanishes at zero and its derivative has
norm at most `temp x`. The proof uses an actual matching-flags neighborhood,
cut-row tail and windowed mean, rather than declaring the window inverse
exact. `Heir.orchestra` and `.recital`
(`Lean/YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir/Chorus.lean` and
`Lean/YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir/Recite.lean`) buy
fixed-order local-display bounds after the patch/order choice, retaining
`Booth` and the side-size restriction. `YM.PhysicalNext.JointLoad.Heir.Museum.exchange`
(`Lean/YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir/Hymn.lean`) exchanges the
finite list of derivatives with the actual reference Gaussian integral under
`Plays`, the `Seed` regularity and budget, the healthy field, `Walled`, and the
`Silences` cutoff, which has compact support and the required `ContDiff`
order. These exact source hypotheses are additional to the algebraic
polynomial cancellation from C06. The comparison does not use the smooth
reference insertion argument to assert smoothness of an arbitrary measurable
mark.

The preceding flat-error description can be checked directly in
`YM.PhysicalNext.Repeat.Malachite.darkness` and `.night`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Malachite/Aperture.lean`):
`darkness` bounds each unsymmetrized windowed inverse against the same active
flat inverse and subtracts the two estimates; `night` symmetrizes that
comparison. Its `same_probe` and actual-coat inverse-error premises are used
in the proof, alongside the bare-store jet receipt. The supplied statement is
a `Price` bound for the selected read coordinates, not equality of windows.


Source-correspondence correction: an earlier C08 author entry incorrectly
identified `Aff.gram`/`Aff.eyes` as the actual reassembly source. Direct
inspection of `YM.ConnectedActivityE6.Matter.real_push`'s E6 dependency route,
`YM.ConnectedActivityE6.Coat.plate` and `.relating`, shows that the reassembly
uses the E6 coat construction described above. The earlier entry has been
corrected; no equality between the separate constructions is claimed. The
mathematical clarification in the chapter states the affine-square and
inactive identity properties shared by the directly inspected E6 definitions.

`YM.PhysicalNext.Repeat.Malachite.same_probe`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Malachite/Stone.lean`)
identifies the **blank** E6 coat plate restricted to `tube X` with the
bare-store `profileGram` at the identity. This is a flat active-block
identity, not an equality at general fields. `Malachite.ringD`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Malachite/Aperture.lean`)
proves that the corresponding restricted inverse equals the inverse of the
restricted plate using the identity rows on non-hot coordinates and the
necessary invertibility receipts. `Malachite.mute` and `.scores`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Malachite/Mineral.lean`)
handle zero residual and restricted source matching, including omitted zero
rows. These are the specific flat steps behind the manuscript comparison;
they do not justify the nonflat identification of the two couplings.

For the actual E6 coat, `YM.ConnectedActivityE6.Window.Allow.drift` and
`.ground_C` (`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/PressureC.lean`)
show the distinction between approximation and positivity: the first bounds
`frameMean A - A⁻¹` under `Allow`; the second supplies a lower bound only
after the additional smallness `distPay ≤ X⁻¹/2`. `Window.width` supplies
finite range at the window radius plus two. `Allow` itself
(`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Resolvent.lean`) includes
census, Hermitian symmetry, positive decay and gap parameters, a row-price
bound and a positive lower bound on `A`. Thus the opening of the reassembly
chapter retains positivity as a funded hypothesis; the definition of
symmetrization alone is not evidence of positivity.

## Selected-history consumer (bounded follow-up)

The prior `ope-history-service-evidence.md` is a draft navigation lead; its
final common-run match remains a separate obligation. Direct source inspection
of `YM.PhysicalNext.Repeat.Legato.exodusN`
(`Lean/YM/OPE/Replicas/Pass.lean`) shows it consumes `Mallow.AccordV` and
an explicit support-expansion floor for every `StepStages` pair. Its body
uses the actual `paneer`, `sewedN`, and `thaw` route and obtains the order
condition `d+3≤J(i)` after the opening threshold. Its output field
`VelourArity.mother` chooses one `χ`
before all degrees `d`, relative to the supplied family and doors. That
quantifier order is conditional on `Chateau`, the stagewise support floors,
`AccordV` and the explicit expansion-floor inequality; it does not by itself
identify those supplied objects with the C05 terminal sequence. The consumer
`YM.PhysicalNext.Repeat.Legato.Campaign.opePackage17`
(`Lean/YM/RG17/Witness.lean`) calls `exodusN` using the same `R.family`,
`R.doors`, bought receipts and support/fee fields; it also requires
`Pillars`, `AccordV`, `OPE.HaloGate`, and `Sky`. This bounded inspection
confirms a concrete route, not that C08's current local prices have been
instantiated on those exact objects or that the one `Q_n` condition is
proved. No `#print` or axiom command contained in the source file was run.

At the adjacent-transition level, `YM.PhysicalNext.Repeat.Legato.Bandage.chorus`
(`Lean/YM/MergeProof/Escarp.lean`) chooses a door satisfying `Climbs` before
quantifying over all degrees with `d+3 ≤ J m`; its witness is a transported
`sandboxK U x` for the same spring, point and two trail equalities. With a
`Climbs` witness, `Bandage.paneer` (`Lean/YM/MergeProof/Wax.lean`) transports
the finite-menu `Many.ripe` price to that same door, under its separate
`Nest`, `Pungent`, `Tariff` and support-exponent hypotheses. This improves
the local common-door trace but does not discharge those receipts or identify
all cutoffs and grades with the single terminal sequence required by C05.
At a fixed `H` and `x`, the `Many.vastN` statement
(`Lean/YM/OPE/Replicas/Price.lean`) likewise uses the literal
`d0 := sandboxK H x` while quantifying over the occupancy `N'` and
nonnegative price parameter `v'`, subject to each corresponding
`Palette.shipPrice` and the fixed slot and incoming-path hypotheses. This is
a statement about one local transition; it is not a uniform eventual
threshold or an identification of the separately selected global histories.

`YM.PhysicalNext.Repeat.Mallow.Many.warm`
(`Lean/YM/MergeProof/North/Afire.lean`) supplies the degree-zero compression
on the same sandbox door under `Menu.Arsenal`, `Release.accepts`, the explicit
support floor and `Graces.Comply`. In its proof `κ` is `Blush.glyph`, positive
and at most one; `Comply` gives the two local bills and the output is
`Float.Runs` with cost `6L`. `YM.MergeProof.Float.slosh`
(`Lean/YM/MergeProof/North/Tan.lean`) transports a finite elementary list,
retaining the forced profile and exact push, under the actual `Runs`, lawful
representation, target validity, kernel and background-push equality. This
checks the degree-zero local bridge used by the prose; the exact full selected
run and all higher-degree/finite-menu receipts remain independent inputs.

A further direct source match is `YM.PhysicalNext.Repeat.Mallow.Many.vastN`
(`Lean/YM/OPE/Replicas/Price.lean`). Its local notation `d0` is definitionally
`sandboxK H x`, the same door defined from the actual fused derivative in
`MergeProof/Coffer.lean`; `vastN` uses `sounds` for that very door. For an
incoming exponent at least 100 it supplies the arbitrary finite-slot
`ManyCopies.Unites` estimate with input exponent `(Q x).p.supportExponent-4`,
ordinary output `(B).supportExponent+1/2`, and forced output
`(B).supportExponent+1`, under `HasSlots`, `Palette.shipPrice`, `Arrives`,
`Pungent` and the surrounding fixed run/transition assumptions. Specializing
both stage profiles to 100 gives 96, 100+1/2, and 101 as in the prose. This
is a direct local door and numerical-exponent match; it is not yet a proof
that the later selected family is the same `H`, `x` and `Q` at every cutoff,
or an independent review of the `ManyCopies.Unites` record's every field.

Independent author source trace of the global selected-sector gap:
`YM.Next.SectorChange.Gap.energy_canonical`, `.not_flat` and `.stood`
(`Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Gap.lean`). `energy_canonical`
lower-bounds the actual `Rows.gram` by one signed channel's actual plaquette
and block derivative squares with the `slip²` normalization. `not_flat`
then chooses a positive gap before an eventual scale and applies
`Work.E02.answer`, local sponsorship and scalar absorption on the same
funded step, forest, tag, and field with matching flags. `stood` is a
separate flat-field statement with its own side-size hypotheses and no
such temperature delay. This direct source route does not deduce the
nonflat lower bound by identifying the actual matrix with its flat value.
It is a bounded author check; the detailed geometric coercivity argument and
C07's corrected prose still require independent review and endpoint matching.

The coupling normalization in the principal comparison is also an explicit
input: `YM.RG.Shoot.band` (`Lean/YM/Shoot/Criteria.lean`) is the closed interval
`[hatBeta m/2, 2*hatBeta m]`. `Opera.symphony` and `Return.earnings` retain
membership in the appropriate incoming-level band. Thus the manuscript's
use of the actual `g = beta⁻¹/²` and its comparison with the scheduled fine
coupling needs this same-level band and positive-coupling receipt; the coarse
scale `x` is not itself substituted for the incoming beta.

The first-mean comparison is not inferred from covariance values alone.
`YM.PhysicalNext.Repeat.Malachite.matchesP` and `.angle`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Malachite/Taps.lean`)
use differentiability of the row/source maps, their zero values at the flat
point, `scores`, and the vanishing of the actual source derivative outside
`X.blank.Hot`. `angle` gives the derivative of `forecast - study` as the
transpose of the difference between the restricted actual window inverse
and reference window inverse applied to the same reference source derivative.
This corroborates `eq:comparison-mean-first` at the exact flat point; the
small-ball transfer and bounds on the remaining derivatives are additional
steps, not consequences of that one identity.

A further direct C02/C08 source bridge is now identified. The local notation
in `YM.PhysicalNext.Repeat.Mallow.Many.ripe`
(`Lean/YM/MergeProof/Tanger.lean`) also sets `d0 := sandboxK H x`, and its
`Volant` uses the same three exponents as `vastN`, conditional on slots,
shipment, `Arrives` and `Pungent`. `YM.PhysicalNext.Repeat.Legato.Bandage.Climbs`
(`Lean/YM/MergeProof/Escarp.lean`) explicitly witnesses a spring and point,
the equalities from its fine/coarse representations to the selected trail,
and `D = duet ... (sandboxK U x)`. `Bandage.paneer`
(`Lean/YM/MergeProof/Wax.lean`) uses this witness to transport `Many.ripe` to
the same selected door, under `Nest`, `Pungent`, `Tariff` and both support
exponents at least 100. This is stronger than a name-level match, but it is
still conditional on the actual `Climbs` witness and the upstream purchases;
the final selected run and complete C05 label match have not been checked.
The C02 author records at merged PR #82 head `93fd8657d90942fb17ba3298c755a73b0a642592`
record the corresponding fine/coarse margins and the separate raised and
ordinary receipts; the author records and independent review must be read at
their own exact hashes, not treated as acceptance of this C08 edge.

`YM.PhysicalNext.Repeat.Mallow.Many.v0`, `.v1`, and `.live`
(`Lean/YM/MergeProof/Mirrored.lean`) trace the quiet and singleton entries of
the finite-switch family to the same one-leaf `pupil`: the empty entry is the
unperturbed array, a singleton is its scaled one-leaf tilt, and under the
`Switch.Models` hypothesis the singleton jet is the coefficient times the
zero-parameter derivative. This confirms the coefficientwise local link
between the C02 menu and C08 door, including zero tuning. It does not replace
`Switch.Models`, convergence/price receipts, or the selected `Climbs` witness.

`YM.ConnectedActivityE6.Coat.ticket`
(`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Buoy.lean`) gives the
actual active-coordinate integral as the selected Gaussian integral with the
single tag-cardinality factor and the retained levy/determinant scalar. It
requires the same `Cash`, manifested coat, matching width, `Layout` and
`Contract.sealed` old forced family; it obtains positive Gaussian covariance
from the local `Cash` receipt. `Coat.consolidated`
(`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/UnifiedValue.lean`) handles
zero masks separately; on the nonzero branch its exponent recombination uses
the nonzero profile, likelihood and common mask. These direct calls sharpen the C08 reassembly input: arbitrary
positive covariance or the flat determinant alone is insufficient to invoke
this actual integral identity.

For the C02-to-C08 scalar/fusion edge, the source definitions
`YM.PhysicalNext.Repeat.Mallow.stems`, `.straw`, and `.Arrives`
(`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mallow/Eco.lean`),
with `.lauge` in
`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mallow/Stove.lean`, give respectively
`2 exp(-μ P_f²/8)` and `2 exp(-μ P_f²/16)`. `Arrives` contains two sequential
`Payments.Rates` receipts: the second consumes the first price and the actual
soft need, with matching budget point, threshold, profile and bounded tuning.
The larger second allowance is not derived from the ordinary logarithmic
price alone. This checks the scalar definitions and receipt order, not the
selected-history proof that all premises are purchased.
