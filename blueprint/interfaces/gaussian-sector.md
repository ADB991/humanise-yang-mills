# Gaussian-sector boundary — working audit, issue #12

**Status: author draft for independent correspondence review.** This is a bounded
interface audit, not an exposition or an ownership grant. Imported source revision:
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Scott Armstrong's
[III.4 outline](https://github.com/scottnarmstrong/yang-mills-informalization/blob/8f3c7ccaeabb17b0f928bc1a2e75328691de3032/outline/units/III-4.md)
and selected-statement map at `8f3c7ccaeabb17b0f928bc1a2e75328691de3032`
provided navigation leads, not proof evidence. The source anchors below refer to
paths under `Lean/`. Unresolved consumer edges and interpretation questions are explicitly identified
below; do not commission explanation tasks until independent correspondence review.

## Proposed boundary

Recommend **three disjoint candidate proof units**, subject to independent
correspondence review, following mathematical handoffs rather than file size:

1. **Sector change:** the exact Haar-to-Gaussian identity for arbitrary permitted
   positive covariance and measurable shift; this owns the change of variables,
   all masks and normalisation in `YM.Next.SectorChange.authorized_change`.
2. **Window and jet input:** selected Gram, windowed covariance and shift; uniform
   invertibility, approximation and finite-order field-jet estimates. It supplies
   a permitted pair and quantitative bounds to the first and third packages. It
   does not own the exact change-of-measure proof.
3. **Local relative determinant:** `Priced.chains` and the finite-sector
   normalization handoff through `Dyed.cardinal_spin` and `Port.book_price`,
   conditional on their stated certificates. This owns the logdet series and
   sector identity, but not part 1’s Gaussian integral or part 2’s window bounds.
   The subsequent per-site budget and rank comparison belong to #14; the polymer
   activity construction belongs to #13 and PU-04. The precise border at
   `book_price` is a proposed handoff requiring agreement with #14.

This ordering describes proposed mathematical use, not an assertion that Lean
imports or all implementation dependencies are acyclic. The integrated committed
step combines 1 and 2 and should be owned as an application, rather than copied
as a second proof. The jet theorem is bundled with the window estimates because both are contracts
for the same selected matrices and its proof invokes the window positivity result.
The local determinant and later determinant budget are separated at the identity
for the actual sector; #14 must confirm that this handoff is sufficient. No
proof-unit paths or declarations are reserved here.

## Exact sector identity

In `YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Shell.lean`, `YM.Next.SectorChange.chill`
freezes a free forest link if a parent endpoint lies in the store's `10*radiusB x`
dome; `Frozen` and `Active` partition free links. `Standing` requires, on nonzero
allocation bill and eligible likelihood support, that each active link is in the
specified exponential chart with norm at most `d`. Frozen variables are in
`LinkArray G (Frozen A x F)`, integrated against product Haar measure; active
coordinates are `Prices G (Active A x F)`, indexed by active links and the gauge
colour index. The source fixes the sector, forest, field and tag.

In `Change.lean`, `YM.Next.SectorChange.Permitted` requires `C.PosDef`, `β>0`, a
measurable frozen-field-dependent shift `m`, `Standing`, `LocalRatio J`, `d>0`
and `4*d < J.radius`. `YM.Precision.LocalRatio` (`YM/PCalc/Loop.lean`) further specifies
positive scale and radius, injectivity of the Lie exponential on the radius ball,
positive analytic Jacobian on that ball with value one at zero, global
measurability, openness of the chart image, and the exact push-forward of
`(J.scale * J.J) da` restricted to the ball to probability Haar restricted to
its image. `YM.RG.Rep.Lawful` (`YM/RG/History.lean`) consists of path bounds and
activity validity; `YM.Pressure.Teller.Funds` (`YM/Pressure/Seeds.lean`)
requires matching kernel and stage, the branch condition, the deep metric bound,
matching clips, two path bounds, and attached compatible towers. Their nested
mathematical hypotheses are source-defined inputs to this conditional theorem;
this audit does not purport to prove or fully unfold them. In addition `YM.Next.SectorChange.authorized_change`
requires `R.Lawful σ n Λ δ l` and `P.Funds S T`. For every such permitted pair,
`Licenses` asserts integrability of the original sector integrand on the forest
slice, every transformed section, and the joint transformed integrand, as well as

\[
 \int_{F.\mathrm{Slice}}\Phi\,d(F.\mathrm{order}\,G)
 =\mathrm{prefactor}\,J.\mathrm{scale}^{|\mathrm{Active}|}
   \mathrm{chartCost}(C,g)
   \int d\mathrm{Haar}^{\mathrm{Frozen}}(Y)\int \mathrm{dyed}(Y,z)\,d\mathrm{cloud}(C)(z),
 \quad g=(\sqrt{R.\beta})^{-1}.
\]

Here `chartCost` in `Counting.lean` is
`(sqrt (2*pi*g^2))^card(Active × G.ColorIndex) * sqrt(det C)`;
`cloud C` is the push-forward of the library's `multivariateGaussian 0 C`
from Euclidean coordinates to the finite coordinate-function space. For positive
`C`, `YM.Next.SectorChange.Gaussian.cloud_center`, `.cloud_cov`, and
`.cloud_formula` (`YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Gaussian.lean`) give
zero mean, covariance `C`, and Lebesgue density
`(2π)^(-N/2) (det C)^(-1/2) exp(-zᵀC⁻¹z/2)`, with `N` the number of active
colour coordinates. `dyed` retains chart
Jacobians, cutoff doors, allocation bill, likelihood, exposed density, and the
exponential of the actual residual and correction, evaluated at `a=m(Y)+g z`.
It is not an identity after discarding those factors. `recolored` identifies the
whole transformed multiplier with the regularized original integrand times the
inverse Gaussian density factor. The general theorem does **not** require `C` to
be the inverse Gram or the shift to be a minimizer.

`YM.Next.SectorChange.committed` (`Handoff.lean`) applies this to a directed run:
under `Ringing`, `Cosmos`, `m<N`, `Lives`, and the representation's beta-band
hypothesis it supplies positive chart parameters, the sector licences and the sum
of sector integrals for the pushed density. For matching flags it additionally
asserts positivity of the selected covariance and Gram; wrong flags are handled
separately by `displaced_wrong`, not by asserting positivity for them. Exact
expansion of the run and funding structures is still required for an independent
review of this applied interface.

## Window and field-jet contract

`YM.Next.SectorChange.Rows.gram` (`Remainder.lean`) is `moveᵀ * move` on
`Active × G.ColorIndex`; `Rows.guide` is half the square of `move*a + source`,
and `Rows.blame = moveᵀ * source`. In `Chosen.lean`, `fog` is
`Schur.clouded panels gram`, while `meanLog = -(per panels gram)ᵀ * blame`.
The columnwise `per` uses the inverse of each principal window and zero extension;
`clouded` is half of `per + perᵀ`. The panels use both endpoints with radius
`radiusB x / 20`. The source explicitly warns that a different midpoint window
prescription is not automatically equal to this one.

`YM.Next.SectorChange.Schur.windows` (`Windows.lean`) states: for `σ,η>0`,
`K≥0` and nonnegative `B`, there are positive `v,C,g` such that for all
sufficiently large natural radii `r`, all finite coordinate sets mapped to a
finite torus, all symmetric matrices `Q` with gap `η`, weighted row-and-column
Schur bound `K` at rate `σ`, the `Revenue` uniform local counting bound `B`,
and windows `Bars` containing the radius-`r` balls, the symmetrized windowed
inverse `Cw` has

\[
 \|C_w-Q^{-1}\|_{\mathrm{Schur}}\le C e^{-vr},\qquad
 C_w\ge g I,\qquad C_w\text{ positive definite}.
\]

The statement is uniform in the torus and finite coordinate set, not valid at
arbitrary window sizes. `YM.Next.SectorChange.opaqueCost` (`Chosen.lean`) applies
this to the selected Gram: fix gauge, patch and teller with branch condition;
for sufficiently large coarse parameter `x`, a step with the same patch,
`100*(1+radiusB x) ≤ c.val`, a funded tube, arbitrary store, forest, tag and
coarse configuration **with matching flags**, has uniformly decaying and gapped
Gram and a positive `fog`, with unweighted Schur error bounded by
`E * exp(-b * (radiusB x / 60))`. Constants precede the choice of volume and sector.

`YM.AnalyticBridge.SectorAffine.assembly` (`YM/AnalyticBridge/SECTOR_AFFINE_JETS/Covariance.lean`)
fixes gauge, patch, branching teller and arbitrary finite jet order `n`, then
chooses positive constants and a sufficiently large `x`. Under the same size,
funding and matching-flag conditions, for each fixed store, forest, coarse field,
tag and perturbation `B` with `‖B‖≤r`, it supplies `KernelJets`. This record
includes analytic move, weighted row/column `Polar` bounds for move, Gram and
covariance, positive gaps, and principal, global and windowed resolvent jets for
all `u≥0`. Its deficit and window-minus-full-resolvent jet bounds have factors
`M exp(-v radiusB x)/(1+u)` and `M exp(-v radiusB x)/(1+u)^2`, respectively.
For every list of coordinate directions of length at most `n`, `Polar`
requires the corresponding iterated derivative to satisfy both weighted row and
column `Bill` bounds; the row bound multiplies the weighted absolute row sum by
the product of derivative-position marks, and the column bound applies the same
construction to the transpose. `ResolventJets` uses the same bills with cap
`M/(1+u)` at derivative order zero and `M/(1+u)^2` at positive orders. The
position metric is coarse-torus `separation`; exact coordinate conventions are
the definitions `Polar`, `Bundle`, `Mark.Bill`, `marks`, and `bolt` in the source.
For a coordinate direction `t`, `coordRoot t` is its coarse site, `bolt t`
is its coordinate basis direction, and its mark at site `a` is
`exp(d * separation(a, coordRoot t))`. Thus for a list `l`, the row weight is
`exp(d * sum_{t in l} separation(a(i),coordRoot t))` times the weighted row
sum with kernel factor `exp(d * separation(a(i),a(j)))`; the column bound is
the corresponding bound for the transpose. These are iterated Fréchet
coordinate derivatives in the left chart, not Lie derivatives. Store, flags, forest, tags,
scale and tube are held fixed while the unmasked field-dependent functions vary;
this does not assert differentiability of masks or sector decisions.

**Hessian caution.** The selected `fog` is generally a symmetrized *windowed*
inverse of the Gram, not definitionally the full inverse. `YM.AnalyticBridge.
GaussianFieldAlignment.Agreements.exact` (`YM/AnalyticBridge/GAUSSIAN_FIELD_ALIGNMENT/Agreements.lean`)
proves equality with the full Gram inverse under an additional support-vanishing
condition on that inverse. The inspected `Rows.guide` identifies the Gram as the
quadratic coefficient of the selected affine-square guide. It does not establish
that this is the Hessian of the full effective action at its background. The latter
identification remains open; the external summary also flags it as such.

## Determinants and consumer handoffs

`YM.AnalyticBridge.RelativeLogdet.Priced` (`YM/AnalyticBridge/RELATIVE_LOGDET_TRACE/Walls.lean`)
requires a positive definite matrix, self-containing windows, nonnegative weighted
rate and error parameter, and uniform resolvent, window-column, defect and excess
Schur bounds. `YM.AnalyticBridge.RelativeLogdet.Priced.chains` (`Series.lean`)
adds `q<1` and positive definiteness of the symmetrized window covariance and
expresses `log det Q`, `log det Cw`, and `log det(1+Q*Cw-1)` as convergent
local series. This is a relative/localisation result, distinct from `chartCost`.
The exact handoff from these hypotheses to the selected sector, including all
normalisation signs and PU-11 overlap, is not yet checked.

### Inspected consumers and downstream questions

| Handoff | Source evidence | Boundary and unresolved mapping |
| --- | --- | --- |
| Marked transition | `YM.Next.SectorChange.Marked.honored` and `.paid`, `YM/AnalyticBridge/SECTOR_MARKED_IDENTITY/Committed.lean` | Reuses the same run hypotheses and selected sector prices to obtain marked licenses and a mixed derivative transition. It recovers the permitting data rather than directly invoking `committed`; its place in PU-04/PU-08 remains to be settled. |
| Nonlinear jets | `YM.PhysicalNext.Repeat.Malachite.treasure`, `YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Malachite/Grain.lean` | Directly invokes `SectorAffine.assembly` and spends `KernelJets.cJets` for the selected bare-store sector. This is a source consumer in the III.10 neighborhood; issue #13 must identify its exact PU-08/09/10 contractual role. |
| Relative determinant | `YM.PhysicalNext.InteractingRank.Pump.Dyed.cardinal_spin`, `.../Opacity/Prism.lean` | With funding, certification, matching paths/clips, local chart, positive beta, threshold and matched sector, proves positive `loading` and `freight = loading * exp(spoolLift)`. `keptEarly` contains `-#Frozen log(spare) - ½(log det W - log det K) + ½ log det(W*C)`; `K` is the flat kinetic reference. `freight` contains the original chart cost. This is the exact sector-to-relative-normalisation handoff, not a finished per-site budget. |
| Local pieces | `YM.PhysicalNext.InteractingRank.Pump.Port.book_price`, `.../Opacity/Shards.lean` | Under `Chips`, `Certified`, `Matched`, nonnegative exponent and the two stated `Physical.parcel` certificates, rewrites `keptEarly` as the frozen-link term plus the sum of local `sect` and `introTax + showTax`. `Port.rate_pass` (`.../Opacity/Enigma.lean`) groups these into rents and nightly terms. These are candidate inputs to #14, not an asserted final PU-12 theorem. |
| Polymer construction | `YM.PhysicalNext.InteractingRank.Pump.land`, `.../Opacity/Gardener.lean`; `.foreshadows`, `.../Opacity/Gush.lean` | `land` directly calls `cardinal_spin` to obtain a `BodyGrant`; `foreshadows` produces local factors under `Helps`, `Stock`, certification and parcel hypotheses. Their exact relation to the canonical PU-04 expansion is unresolved; avoid double ownership with #13. |

`Priced.labeled` (`YM/AnalyticBridge/RELATIVE_LOGDET_TRACE/Alphabet.lean`) directly
calls `Priced.chains`, expanding terms as indexed paths. `book_price` invokes a
receipt from the endpoint determinant package, so this inspection does **not**
establish that every application of the abstract `chains` theorem travels by that
specific call path. Possible reverse dependencies are the pre-existing `Teller.Funds`,
run `Cosmos`/`Ringing` and `R.Lawful` assumptions (from geometric, schedule and
activity inputs), and the `Physical.Certified`, `parcel` and `Stock` certificates
required by the determinant application. #13 and #14 should check whether those
certificates use outputs being assigned downstream; no acyclic formal graph is
claimed. PU-09, PU-10, PU-11 and PU-12 exact consumer declarations remain
unverified; they must not be inferred merely from the map's edges.

### Cross-check against the adjacent packages

The following anchors distinguish direct source dependence from candidate reuse;
package labels remain provisional until #13 and #14 decide their boundaries.

- **PU-04, parallel window construction:**
  `YM.AnalyticNext.ConnectedActivity.Win.Windows.window_price` and
  `.covariance_floor` (`YM/AnalyticNext/CONNECTED_ACTIVITY_BOUNDS/Windows.lean`)
  prove weighted bounds and positivity for their own `within`/`cov`. The
  `YM.AnalyticNext.ConnectedActivity.Aff.bedrock` theorem (`.../Bedrock.lean`)
  supplies a uniform `Win.Promise` for a completed Gram, and `Aff.Mint`
  (`.../Mint.lean`) uses this completed Gram and its own `eyes` windows and mean.
  The completed Gram contains an identity on inactive coordinates; the window
  convention uses different radii. The definitions are mathematically similar to
  the active-coordinate construction here, but no identification or direct use of
  `Schur.windows` was established. A shared abstract window lemma may be reusable
  only after matching index spaces, completion and windows; do not assign these
  two constructions identical ownership on this evidence.
- **PU-08/PU-09, selected Gaussian prices:**
  `YM.AnalyticBridge.SectorAffine.estimates` (`.../SECTOR_AFFINE_JETS/Residual.lean`)
  directly calls `assembly` and adds covariance-inverse, `Q*C-I`, and
  `C⁻¹-Q` jet estimates. `YM.AnalyticBridge.SectorAffine.Offset.prices`
  (`.../Center.lean`) calls `estimates`; `YM.PhysicalNext.JointLoad.capital`
  (`YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Costs.lean`) calls `Offset.prices`
  and provides `Value`: positive Gram and `fog`, equality of the shift and linear
  source to the actual sector data, and tickets for Gram, defect, mean and source.
  The tickets have explicit decay and smallness charges and apply for matching
  flags and funded steps. `JointLoad.stage` (`.../Supply.lean`) calls `capital`
  and packages those estimates and Gaussian trigger/tail prices in `Day`.
  These give #13 concrete source handoffs for the update and large-field bounds;
  deciding which of PU-08 and PU-09 owns the resulting *consumer* is #13's task.
- **PU-10, parameter closure:** `YM.PhysicalNext.JointLoad.offer`
  (`.../V9_JOINT_ENDPOINT_LOAD/Calendar.lean`) calls `stage` after its
  `Outlet`, chart and branch assumptions, producing a `Booth` whose `Enough`
  record includes `Day` for every qualifying desk eventually in `x`. This is an
  inspected stage-pricing consumer and a candidate closure input, not by itself
  the full RG induction or an assertion that the closure theorem has been audited.
- **PU-11/PU-12, separate normalization interfaces:**
  `YM.Next.Rank.determinant` (`YM/Next/RANK/Determinant.lean`) is a Haar-integral
  ratio bound. Under its lawful representation and Haar-budget assumptions, a
  nonnegative density, positive `g` with `βg²=1` and `g≤threshold`, an integrable
  numerator and its stated pointwise bound, it gives an exponential bound with
  volume-dependent `protection` and the residual `-4*lieDim*log g` term.
  `YM.Next.Rank.Meets` and `ticket` (`.../StationMeter.lean`) are the adjoining
  stage and per-site cost interfaces. This is a candidate PU-12 input and is not
  the `Priced.chains` relative matrix determinant identity. The inspected
  `cardinal_spin` and `book_price` are actual-sector inputs in the rank-comparison
  neighborhood; a direct proof edge from them to `YM.Next.Rank.determinant` or
  to a final PU-11 comparison has **not** been established. #14 must resolve that
  boundary and avoid describing the two determinant statements as identical.

The direct chain `assembly → estimates → Offset.prices → capital → stage → offer`
is evidenced by the cited theorem bodies, in that order. It supplies an example
of an expository handoff through closure pricing, not a proof that there are no
reverse dependencies elsewhere. In particular the `Fund`/`Stock`, path bounds,
activity validity, and run funding structures are separately supplied hypotheses;
reusing their conclusions in their own construction would be circular. The
available bounded inspection did not establish their complete construction graph.

### Classification of inspected helpers

- `per`, `clouded`, `Rows.gram`, `Rows.guide`, `Rows.blame`, `fog`, `meanLog`,
  `chartCost`, `dyed`, `keptEarly`, and `spoolLift` encode mathematical
  constructions and belong in the relevant interface, even where their names are
  implementation-specific. The `Standing` support condition and all masks are
  substantive assumptions/data, not bookkeeping to suppress.
- `per_read`, `per_zero`, `picked_sym`, `chartCost_eq` and `recolored` implement
  column restriction, symmetrisation, coordinate normalization and rewriting.
  Group them under those mathematical purposes; they are not separate prose units.
  Their mathematical identities must be explained or cited wherever needed.
- Algebraic coercions, product-index and finite-sum rearrangements encountered in
  these neighborhoods are candidates for suppression only after the corresponding
  identities and normalization are assigned above. No blanket classification of
  uninspected helpers is made; any further substantive content remains open.

## Literature and remaining obligations

No literature theorem has been verified as a replacement for any complete output.
A bounded search inspected Demko, Moss and Smith, “Decay Rates for Inverses of
Band Matrices,” *Mathematics of Computation* 43 (1984), 491–499,
[Theorem 2.4](https://www.ams.org/mcom/1984-43-168/S0025-5718-1984-0758197-9/S0025-5718-1984-0758197-9.pdf).
It gives inverse-entry decay for positive definite band matrices; its one-dimensional
band hypotheses do not directly supply the torus-metric, exponentially decaying
matrix, uniform counting, window error, positivity and jet contract above. A
precise applicable variant, its uniform constants, and the project-specific window
and derivative arguments remain unmatched. The finite-dimensional Gaussian density
is a natural literature lead for part 1, but a precise source and its coordinate,
Haar chart and integrability hypotheses have not been verified. Local logdet
series and the sector-specific determinant normalisation also remain unmatched.
Do not present these leads as accepted references.

For #10: distinguish precision `Q=moveᵀ move`, full inverse `Q⁻¹`, selected
covariance `fog`, and unsymmetrized `per`; distinguish coarse `x`, actual `R.beta`,
`g=(sqrt beta)⁻¹`, and `radiusB x`; specify normalized Gaussian versus product
Haar and chart Jacobian scale; keep determinant square root and colour-coordinate
count explicit; specify fixed sector data and the weighted jet norm before adopting
notation. These are proposed handoff questions, not edits to the glossary.

## Evidence and open work

Inspected the declarations and immediate source neighborhoods named above, plus
`Handoff.lean`, `Shell.lean`, `Counting.lean`, and the direct consumer
`Malachite/Grain.lean`, using bounded `sed -n` and `rg -n` searches. Inspected
Scott Armstrong's pinned III.4 outline and summary as navigation aids, and the
original Demko–Moss–Smith paper as a limited literature lead. `opaqueCost`,
`windows`, `assembly`, `authorized_change`, and `committed` were read at their
source statements; no elaborated Lean types or axioms were replayed.

Outstanding: reconcile the candidate PU-04 and PU-08–PU-12 ownership and
remaining reverse-dependency questions with #13 and #14; expand nested certificate hypotheses as needed; verify literature matches; resolve the full
effective-action Hessian question; and obtain independent correspondence review. The proposed split is conditional
on this work. No fresh Lean build, kernel replay, axiom audit, or independent
mathematical review was performed. The checker and staged whitespace check passed as recorded below.

Commands run in the isolated checkout (all source-reading commands exited 0):

- `sed -n '1,220p' Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Change.lean`;
  `sed -n '1,175p' Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Chosen.lean`;
  `sed -n '1,100p' Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Remainder.lean`.
- `sed -n '100,250p' Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Windows.lean`;
  `sed -n '1,105p'` on the same file; `sed -n '1,90p'` on
  `Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Shell.lean`.
- `sed -n '130,215p' Lean/YM/AnalyticBridge/SECTOR_AFFINE_JETS/Covariance.lean`;
  `sed -n '1,125p'` on that file; `sed -n '45,90p'` on
  `Lean/YM/AnalyticBridge/SECTOR_COVARIANCE_JETS/Sky.lean`.
- `sed -n '190,235p' Lean/YM/AnalyticBridge/RELATIVE_LOGDET_TRACE/Series.lean`;
  `sed -n '65,105p'` on the corresponding `Walls.lean`; `sed -n '100,145p'`
  on `Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Counting.lean`.
- `sed -n '125,185p'` and `sed -n '45,82p'` on
  `Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Handoff.lean`; `sed -n '1,85p'`
  on `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Malachite/Grain.lean`;
  `sed -n '1,95p'` on `Lean/YM/AnalyticBridge/GAUSSIAN_FIELD_ALIGNMENT/Agreements.lean`;
  `sed -n '80,170p'` on `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Opacity/Prism.lean`.
- `rg -n 'authorized_change|opaqueCost|Schur.windows|meanLog|\\.fog\\b'`
  in the sector-change and Gaussian-field-alignment directories, and
  `rg -n 'SectorChange\\.(committed|authorized_change|opaqueCost)|\\b(committed|assembly|fromTeller|chains)\\b'`
  in the rank-comparison, nonlinear-step and affine-jet directories, each piped
  through `head`. These searches are not exhaustive dependency evidence.
- `python3 scripts/check_blueprint.py` passed: `Blueprint structure OK: 0 units.
  Lean and mathematics were not verified.` The first `git diff --check` passed
  but did not include this then-untracked file; the staged check below includes it.

Additional source inspections in this pass used `rg -n` for `LocalRatio`,
`Lawful`, `Funds`, `Polar`, `ResolventJets`, and named consumers; bounded `sed -n`
reads covered `PCalc/Loop.lean` 20–65, `Pressure/Seeds.lean` 90–140,
`RG/History.lean` 165–220, `SECTOR_AFFINE_JETS/Panels.lean` 50–100 and
`MarkedGram.lean` 20–90, `FREE_RESOLVENT/Polar.lean` 20–115,
`Differentiated.lean` 70–105, `Torus.lean` 20–50,
`SECTOR_MARKED_IDENTITY/Committed.lean` 1–140,
`RELATIVE_LOGDET_TRACE/Alphabet.lean` 175–220, and the rank-comparison
`Opacity` files `Prism.lean`, `Gush.lean`, `Gardener.lean`, `Offers.lean`,
`Shards.lean`, and `Enigma.lean`. All these reading commands exited 0. The live
issue/PR overlap search identified #13 and #14 as the adjacent owned audits.

Further commands: `sed -n '130,215p'` on
`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_BOUNDS/Windows.lean`, `sed -n
'120,175p'` on its `Bedrock.lean`, and `sed -n '1,100p'` on its `Mint.lean`;
`sed -n '1,115p'` on `Lean/YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Supply.lean`,
`sed -n '20,70p'` and `sed -n '65,125p'` on its `Costs.lean`, and `sed -n
'45,95p'` on its `Calendar.lean`; `sed -n '225,280p'` on
`Lean/YM/Next/RANK/Determinant.lean` and `sed -n '25,70p'` on
`Lean/YM/Next/RANK/StationMeter.lean`; `sed -n '125,190p'` on
`Lean/YM/AnalyticBridge/SECTOR_AFFINE_JETS/Residual.lean`. Bounded `rg -n`
searches traced `assembly`, `estimates`, `prices`, `capital`, `stage`, and
consumer names in those source neighborhoods. The source-reading commands exited
0; one `rg` search for direct names in the connected-activity, joint-load, and
rank directories returned no matches (exit 1), which is not proof of independence.
Scott Armstrong's pinned III.5, III.10 and III.11 outlines were consulted as
navigation aids; the conclusions above are limited to the inspected Lean source.
`sed -n '100,145p' Lean/YM/AnalyticBridge/SECTOR_AFFINE_JETS/Center.lean`
confirmed the direct `estimates` call in `Offset.prices`. The current author pass
ran `python3 scripts/check_blueprint.py` and `git diff --check`; both passed.

Additional exact source reads: `sed -n '1,155p'` on
`Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Gaussian.lean`, `sed -n '1,105p'`
on its `Counting.lean`, `sed -n '20,60p'` on
`Lean/YM/AnalyticBridge/SECTOR_AFFINE_JETS/EntryBounds.lean`, `sed -n
'15,45p'` on its `RowStencil.lean`, and `sed -n '20,55p'` on
`Lean/YM/Push/FREE_RESOLVENT/Weights.lean`, together with `rg -n` for `marks`,
`positions`, `weight`, `coordRoot` and `jet`; all exited 0.
