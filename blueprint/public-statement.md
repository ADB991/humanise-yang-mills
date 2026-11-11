# Release-statement ledger

This ledger audits the 17 advertised theorem declarations of the imported
OpenAI-YM source at revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
It is a statement and interpretation audit, not a proof of their mathematical
content. The corresponding source-level signatures and check evidence are in
[`source/audit.md`](../source/audit.md). All source paths below are relative to
the repository root. The public theorem is `YangMills.jointExistence`; the other
release headlines have distinct scopes and must not be read as extra conjuncts of
that theorem.

## Conventions and evidence

`YangMills.GaugeGroup` is a closed matrix subgroup in a specified finite unitary
representation. Its `IsSimple` predicate refers to the associated real Lie
algebra: it is nonabelian and has no proper Lie ideals. The internal
`YM.Gauge`/`Family` notation is related by a bridge, but a theorem formulated in
that notation does not thereby become a public Wilson-family theorem. All
spacetime coordinates in the public challenge are four-dimensional; the time
coordinate is distinguished. These are definitions of this formal source, not
additional assumptions about every gauge theory.

The [accepted issue #2 axiom evidence](../source/evidence/axioms-3456e5e.md)
reports `propext`, `Classical.choice`, and `Quot.sound` for every root, with no
nonstandard endpoint axiom. It used a checksum-verified compiled artifact and the
pinned Lean 4.32.0 kernel; it was not a clean build from source on this host.
Those facts concern proof terms, not the physical interpretation of a statement.

**Assumption layers.** The theorem hypotheses are the displayed simplicity,
positivity, geometry, filter, construction, and lower-grade conditions in the
entries below. Existential witnesses such as a family, hierarchy, refinement,
table, reader, or scaling are constructed data, not hypotheses silently imposed
on all gauge theories. The formal proof environment uses the three reported
Lean axioms and pinned Mathlib; neither the public theorem nor this ledger adds
an external physical axiom such as a mass gap. No literature result is used to
replace inspection of these formal definitions.

## Public and assembly roots

### `YangMills.jointExistence`

**Source:** `Lean/Solution.lean:4`, with the statement `JointExistence` in
`Lean/ChallengeSpec.lean:186–188`. **Input:** every `g : GaugeGroup` with
`g.IsSimple`. **Conclusion:** there is one `C : WilsonFamily g` satisfying
`WilsonRegularity C`. For *every* strictly increasing sequence
`p : ℕ → ℕ` of volumes, there is a strictly increasing `q : ℕ → ℕ` and a
`T : Hierarchy C` such that `T.Properties (p ∘ q)` holds. The order of these
quantifiers permits the hierarchy and subsequence to depend on `p`, while the
Wilson family is chosen before `p`.

The meanings of `WilsonRegularity` and `Hierarchy.Properties` are fixed by
`Lean/ChallengeSpec.lean` and the public Wilson and theory definitions. The
property record comprises Wilson convergence, a selected reconstructed theory,
an all-orders separated operator-product expansion, and a short-distance
nonfreeness test for a centered grade-four field. The reconstruction's spectral
condition is positive energy and uniqueness of the invariant vacuum. Neither a
positive mass gap nor uniqueness of the continuum limit appears as a conclusion.
This is the principal public statement; the detailed construction below supplies
its witnesses.

More precisely, regularity supplies one positive running slope such that the
ratio of the bare action coefficient to `log(mesh⁻¹)` approaches it uniformly
over the volume index; continuity and gauge invariance of every insertion;
and, for each insertion token, one finite lattice-offset stencil that controls
its values at every spacing, volume and placement (`ChallengeSpec.lean:11–22`).
`C.Converges` first takes mesh limits of smeared finite Wilson moments on
suitable volume rows, then a volume limit to the unselected hierarchy
correlation (`PublicWilson.lean:75–90`). The four fields of
`Hierarchy.Properties` are exactly `wilson`, `reconstruction`, `ope`, and
`nonfree` (`ChallengeSpec.lean:177–182`); contacts are not a fifth field.

The reconstruction field includes faithful tempered fields on a common dense
cyclic domain, nontriviality and label representation, a probability measure
with full support on characters, permutation symmetry and smoothness of
separated correlations, continuity in the character, and a phase-mixture
identity. Its selected Wightman theory satisfies normalized vacuum,
positive-energy spectrum in the *closed* forward cone, uniqueness of the
translation-invariant vacuum up to scalar, Poincaré covariance, and spacelike
locality. Analytic continuation on ordered complex times has the stated
Euclidean root and Wightman boundary values on product Schwartz tests
(`ChallengeSpec.lean:117–143`; `PublicTheory.lean:252–312`). These conditions
do not require a spectral interval above the vacuum to be empty.

The OPE has one phase-independent coefficient system. For fixed labels,
geometry constants, truncation degree `D`, and spectator separation, the
remainder is bounded by `r^(D+1-weight(a)-ε)` at all sufficiently small positive
`r`, uniformly over admissible positions and characters. Coefficient bounds
are stated separately for each degree and channel. `Within` requires cluster
points within `Mr` of the center and separated by at least `ηr`; `Clear`
requires spectators separated from the center and from each other by at least
`c` (`ChallengeSpec.lean:53–80`). Coefficient-bound thresholds may depend on
degree and channel; a fixed-truncation remainder threshold is uniform over
the channels in its finite sum but may depend on that truncation and the
labels. No threshold uniform over all degrees, truncations, or label choices
is asserted.

The trace test centers a grade-four field and gives the selected two-point
function along the time axis the positive limit
`r⁸ log²(r⁻¹) traceTwo(r) → 3 dimℝ(g.lieAlgebra)/π⁴` as `r ↓ 0`. It excludes
eventual equality near zero with every *finite* sum of the specified mass-shell
Wick profiles (`ChallengeSpec.lean:145–175`). The README's physical trace
identification and Maxwell Fock countertests refer to the detailed construction
statement, beyond this four-field public property record.

### `YangMills.constructed`

**Source:** `Lean/Construction.lean:15–31`. **Inputs:** `g : GaugeGroup`,
`g.IsSimple`, and a real blocking-kernel penalty `b > 0`. **Conclusion:** a
`YM.Family g.core` with penalty exactly `b`, the internal construction property
`Makes`, and public `WilsonRegularity` for its Wilson projection. For every
internal extraction order `p`, a refinement `q` gives a table `S`, final object
`F`, all-phase reconstruction `L`, OPE reader `Q`, contact devices `M`, and
scaling `X`, simultaneously satisfying the projected public hierarchy properties,
ordered extraction, full-volume position conditions, calibration, the internal
independent core, reconstruction, separated and nested OPE, trace exclusions,
contact/basis conditions, and the first extension and four position-meter tests.

`Lean/WilsonBridge.lean:10–17` turns the public matrix group into the internal
gauge structure. `Lean/YM/Nonperturbative/HeadlineSpec.lean:143–155` defines the
internal existence package used in the proof. The extra contact and position
conditions belong to this detailed result and its selected witnesses. They are
not additional conjuncts in `YangMills.jointExistence`. The statement gives
an extension under the constructed contact prescription; it does not claim
uniqueness across prescriptions or raw cutoff convergence at collisions.

### `YM.Nonperturbative.existence`

**Source:** `Lean/YM/Nonperturbative/Headlines.lean:19–20`, expanded by
`Headline.WilsonExistence` in
`Lean/YM/Nonperturbative/HeadlineSpec.lean:143–155`. **Inputs:** an internal
closed matrix gauge group `G`, proof `G.Simple`, and a positive penalty `b`.
**Conclusion:** an internal family `C` with that penalty and `C.Makes`;
for each extraction order, refined table/final data, every-phase almanac, OPE
reader, contact devices, and scaling satisfying ordered extraction, full-volume
position tests, independent core, reconstruction, separated and nested OPE,
trace exclusions, basis identity, contact transport/basis/threshold conditions,
and first-extension/four-meter conditions. The proof of `constructed` invokes
this existence result and projects it through the public bridges. A field or
condition named in this internal package must be checked through its definition
before assigning a physical interpretation.

### `YM.Nonperturbative.continuum_with_position_tests`

**Source:** `Lean/YM/Nonperturbative/Continuum.lean:28–39`. **Inputs:** internal
`G.Simple` and `b > 0`; the construction run `R := fundedRun hG hb` is fixed.
**Conclusion:** `R` has penalty `b`, and for every extraction order `p` there
exist a refinement, table, final object, almanac, reader, devices, and scaling
with ordered full extraction, full-volume positions, `Independent.Core`, uniform
nested OPE, equality of device and reader field bases, multiple contact
properties, nonempty transport basis and thresholds, `FirstExtension`, and
`FourMeters`. This theorem feeds `YM.Nonperturbative.existence`; it is phrased
in the internal run and table framework, before the public Wilson projection.

### `YM.Nonperturbative.continuum`

**Source:** `Lean/YM/Nonperturbative/Continuum.lean:52–62`. **Inputs:** the same
internal `G.Simple`, positive `b`, and funded run. **Conclusion:** the same
penalty and refined table/final/almanac/reader/devices package as the preceding
theorem, omitting the scaling, first-extension, and four-meter conjuncts. Its
proof projects `continuum_with_position_tests`; it is a weaker companion
statement, not an additional premise of `jointExistence`.

## Concrete SU(2) roots

### `YangMills.su2Simple`

**Source:** `Lean/ConcreteSU2.lean:12`. **Conclusion:** the explicitly packaged
two-dimensional unitary matrix group `YangMills.su2` satisfies the source's
`GaugeGroup.IsSimple` predicate. `Lean/ConcreteSU2.lean:8–10` defines this
group using `YM.Next.Foundations.SUtwo` and the public gauge-group structure;
`Lean/PublicTheory.lean` supplies the simplicity meaning. This result supplies
the hypothesis of `su2Theory`; it asserts no Wilson construction on its own.

### `YangMills.su2Theory`

**Source:** `Lean/ConcreteSU2.lean:15–18`. **Conclusion:** for the concrete
`su2`, there exists a regular Wilson family such that every strictly increasing
volume sequence has a strictly increasing subsequence and a hierarchy satisfying
the public `Properties` record. This is `jointExistence su2 su2Simple`, with no
new physical conclusion. It does not assert a mass gap.

## Focused companion roots

### `YM.Independent.Core.point`

**Source:** `Lean/YM/Independent/Core.lean:49–63`. **Inputs:** an internal
`Core` for a final object, almanac, and OPE reader; finite sets of clustered
and spectator labels, nonnegative cluster-size constant `M`, positive room,
separation, and loss constants `η,c,ε`, and degree `D`. **Conclusion:** for all
sufficiently small positive radii `r`, uniformly over clustered positions
`x` in `WithinRoom r M η` about a center `o`, spectator positions `y` in
`ClearOf o y c`, and viewers `s`, the norm of the whole correlation minus the
finite OPE sum over degrees `j ≤ D` and reader channels is at most
`r^(D+1-weight(d)-ε)`. The sum uses the same table's spectator correlation
with one field inserted at `o`. `Lean/YM/OPE/Orbits/Profile.lean` defines the
geometry and exponent; `Lean/YM/OPE/Orbits/Words.lean` defines the label words.
The theorem extracts a consequence of an assumed `Core`, rather than
constructing a public hierarchy. A pinned constant-closure query finds this
declaration reachable from `jointExistence`'s type or proof; its pointwise
estimate is still not a separate conjunct of the public `Properties` record.

### `YM.Contacts.Solstice.celestial`

**Source:** `Lean/YM/Contacts/Solstice/Result.lean:78–79`. **Input:** an internal
`Gauge G` with `G.Simple`. **Conclusion:** there exist an internal family,
extraction order, table, final object, and contact devices satisfying
`MultipleLight`, with a nonempty transport system basis and nonempty threshold
package. `MultipleLight` is a record of services, a rotation identity, and
conditional slope, moment, and distributional estimates under its own
finite-dimensional Euclidean and contact-geometry hypotheses
(`Result.lean:52–63`). These conditions are not a claim of uniqueness of
contact extensions, reflection positivity on overlapping supports, arbitrary
contact Ward identities, or real-time time-ordered products. This is a
separately advertised existence statement; the issue #3 dependency audit does
not identify it as a premise of `jointExistence`.

The conditional clauses quantify over finite-dimensional real inner-product
test spaces equipped with the specified Haar/Lebesgue measure structure. The
`slope` field requires a rooted normal-group route, a nonempty group,
`Run`, `Given`, route authority, and an eligible backdrop, and concludes the
named `Sunshine` estimate. The `moment` field concludes `Resolution` for a
route and eligible backdrop under `Given` and authority. The `distribution`
field concludes a `Charge` bound for the major kernel when the contact plane
lies in the test-space range, the configuration is collapsed, and
`0 < B ≤ 1`, `B` is below the device clearance, and `0 < s` with `2s ≤ B`.
These are the immediate formal conditions of `MultipleLight`; they should
not be replaced with an unrestricted contact-distribution claim.

`Sunshine` supplies power-law `Claim` estimates for the backdrop, each root
coefficient, and a remainder; for configurations with more than one point it
also supplies conditional annulus estimates (`Result.lean:33–40`).
`Resolution` packages an `Achieves` bound, a finite-part/series formula for
the route integral, and integrability, absolute summability and `HasSum`
statements for the selected and centered contact expansions
(`Result.lean:23–31`). `Charge` is a compact-local test-order bound for the
major-kernel distribution: on each compact test support, a constant controls
the distribution by the prescribed jet order
(`Solstice/Venue.lean:30–31`). Thus the existential root has contact estimates
for this constructed prescription under the displayed geometry and eligibility
conditions, not an arbitrary contact theory.

### `YM.Pert.Asymptotics.comparison`

**Source:** `Lean/YM/Pert/Asymptotics/RawAxis.lean:36`. **Inputs:** an internal
family `C` satisfying `C.Makes`, a simple internal gauge group, arbitrary
integer sequences `N,k`, and the eventual condition `i ≤ N(i)`. **Conclusion:**
as `i → ∞`, the running inverse square root of the bare action coefficient at
`(N(i),k(i),i)`, multiplied by the square root of the logarithm of the inverse
spacing, converges to `(√(2 b₀(G)))⁻¹`, where
`b₀(G)=11 casimir(G)/(48π²)` (`RawAxis.lean:13–19`). The statement concerns
the defined `regulatorRun` proxy. It does not identify this quantity with an
X-scheme physical coupling or establish an all-orders matching formula. Its
relation to the public theorem is a focused companion assertion, not an
extra public property.

### `YM.Pert.Position.finite_leading`

**Source:** `Lean/YM/Pert/Position/Crest.lean:13`. **Inputs:** a position
condition `Q` on a finite frame, its `CleanProfiles` witness, and a lattice
side `L` with `L.val > 1`. **Conclusion:** the order-zero finite-regulator
position ledger `finite Q L m 0` tends, as `m → ∞`, to `white Q` in its
function/product topology. `Conditions` in `Position/Board.lean:54–59`
specifies slots, arities, field-valued columns, compact-test profiles and a
linear chart; `CleanProfiles` identifies the profiles with compactly
supported smooth tests. The theorem fixes the side and concerns the leading
coefficient only. It does not identify higher coefficients with continuum
correlations or diagrams. A pinned constant-closure query finds this declaration
reachable in the proof/type closure of `jointExistence`, without changing the
public theorem's conclusion.

### `YM.Pert.Position.normalized_four`

**Source:** `Lean/YM/Pert/Position/Four.lean:56`. **Inputs:** internal
`G.Simple` and a positive penalty `p`. **Conclusion:** an internal family
with penalty `p`, the named construction/material/plenty conditions, and, for
each extraction order `f`, a refinement, table, final object `b` and scaling
`X` with `FirstExtension b X` and `FourMeters b X`. The latter requires a
position `Crest` and one degree-four, square, clean-profile condition whose
board ledger is attained and resident along the same scaling
(`Four.lean:45–47`). `Scaling` contains spin changes and a positive scale
decreasing to zero. The source describes ordinary unmarked correlations of the
constructed mean theory along a weak sequence; the theorem does not assert
all-order actual-versus-diagram matching.

The named existence conditions are substantive. `Wcmain` is a centered-budget
bound at every grade, positive radius and loss, uniform over bounded reference
vectors and auxiliary volume indices after a sufficiently large cutoff
(`Extraction/Center.lean:38–40`). `Materials` includes `G.Simple`, `C.Makes`,
created/open-stock data and a paid room package
(`Pert/Spatial/Prices.lean:16–22`). `Plenty` requires at every schedule index
that square-root `hatBeta` dominate the support-exponent and fourth-power
spacing-factor cost (`Pert/Spatial/CrowdPay.lean:26–30`). None of these names
may be read as an all-orders perturbative matching assertion.

### `YM.Pert.Parity.parityEndpoint`

**Source:** `Lean/YM/Pert/Parity/End.lean:21`. **Inputs:** internal
`G.Simple` and a positive penalty `c`. **Conclusion:** an internal family
with that penalty and the named construction/material/plenty conditions;
for every extraction order a refinement, table, final object and scaling with
`FirstExtension`, `Crest`, and a clean-profile position condition whose
ledger is attained and resident, together with `Fair Q J` and
`ParityFields φ`. `Fair` is an exact algebraic mirror identity and center
fixed-point equation (`Parity/Branch.lean:17`). `ParityFields` says that,
for every target condition `R`, side greater than one, and jet indices `p,j`,
an identity between the `R` read jet and the coat-transformed condition's
read jet holds eventually in the finite regulator, with factor `(-1)^j`
(`Parity/End.lean:15–17`). This is an eventual finite-regulator relation,
not an unrestricted continuum parity theorem.

### `YM.Pert.Parity.low_read`

**Source:** `Lean/YM/Pert/Parity/EvenLow.lean:44`. **Inputs:** a simple
internal gauge group, a position condition `X` on a frame, arity/grade
`d ≤ 5`, any lattice side and regulator, and an odd coefficient index `j`.
**Conclusion:** the finite coefficient `finite X L m j` is exactly zero in
its ledger. No clean-profile or determinant hypothesis appears. The result
is restricted to these low grades and finite coefficients; it does not itself
state a continuum response or all-orders comparison.

### `YM.SharpGram.habitat`

**Source:** `Lean/YM/SharpGram/Measured.lean:11`. **Inputs:** internal
`G.Simple`, a positive penalty `b`, and an extraction order `f`.
**Conclusion:** there exist an internal family, refinement, table, final
object, every-phase almanac, and prescription with the stipulated construction,
calibration, penalty, UV, order, margin, facility, logarithmic, completion,
all-shapes, and dense-coverage conditions. Its final quantified clause runs
over every ultrafilter below the fused extraction filter and every horizon
`D`: a weak portfolio exists, and each such portfolio has priced spin-change
data whose basis readings converge grade by grade to the model. The full
conjunction is transcribed in the source audit. This is a fixed-field and weak
portfolio habitat; the statement does not assert a Gram matrix is positive
definite in every physical regime or establish a mass gap.

Here `Floral` is a structured ultraviolet extension/cellar package with
analytic arc, spring, geometric and eventual realization clauses
(`UVExtension/Oasis/Flora.lean:55–72`); its many nested predicates are not
collapsed to a standard continuum-limit theorem. `Facilities` combines a
same-table OPE service package with a logarithmic package
(`OPE/ElementaryLog.lean:12–13`); `AllShapes` adds coherent one-family,
nested-tree, and discounted two-family subpower estimates
(`OPE/Subpower.lean:37–45`). `Dense.Coverage` chooses a common predecessor
schedule and panels with eventual `Poised` data at every horizon
(`SharpGram/Dense/Passes.lean:16–24`). A weak `Portfolio` carries binding,
budget, chart and panel data, a late predecessor, matrix/field sequences and
subfilter limits (`SharpGram/Weak/Reading.lean:35–49`); its nonemptiness is not
the existence of a standalone probability measure.

### `YM.SharpGram.inletFirst`

**Source:** `Lean/YM/SharpGram/Clauses.lean:126`. **Inputs:** an internal
simple gauge group, a family and final object, a filter `φ` on `ℕ × ℕ` below
the extraction order's fused filter, and a label `x` of grade
`d ≤ 3`, and the remaining section data. **Conclusion:** the projected
field `S.project d x` satisfies `Supplies C φ d`. Precisely, an exponent
`p` can be chosen so that, for every sufficiently large `k`, there are a
label `y` projecting to that field and a label net `q` tending to `y` along
`φ`, whose quota is eventually bounded by `hatBeta(k)^p`
(`Clauses.lean:18–21`). The statement concerns supply for grades through
three under these hypotheses; it makes no higher-grade or public-hierarchy
claim.

### `YM.SharpGram.outletFirst`

**Source:** `Lean/YM/SharpGram/Clauses.lean:120`. **Inputs:** the same
internal simple-group, family, final/table/ticket and filter context;
a complex-linear functional `L` on grade `d`; a lower grade `w ≤ d` with
`w ≤ 3`; and `Kills` on all grades below `w`. **Conclusion:**
`Releases C φ d w L`. An exponent `p` exists such that, for every
sufficiently large `k`, every nonbottom subfilter `u ≤ φ`, convergent label
net `q → x` along `u`, and eventual quota bound `z`, the value of `L` on
the projected field is bounded by
`hatBeta(k)^p z / a(k)^(d-w)` (`Clauses.lean:23–29`). The order of the
eventual and universal quantifiers matters. It is an estimate conditional
on annihilation of lower grades, not a general regularity theorem.

## Interpretation limits and public prose

The upstream `Lean/README.md` describes Wilson origin, reconstructed
Wightman properties, separated OPE, and a nonfreeness test for the public
challenge. Those descriptions must be read with the actual predicates in
`ChallengeSpec.lean`, `PublicWilson.lean`, and `PublicTheory.lean`; they do not
add hypotheses or conclusions to `JointExistence`. The README explicitly
excludes a positive mass gap, general exclusion of continuous-mass
generalized free fields, and all-orders MS-bar matching. It also says the
constructed contact prescription is an extension, without uniqueness over
other prescriptions or raw cutoff convergence on collision diagonals.

The release-headline list alone does not say which focused results occur in
the proof term of `YangMills.jointExistence`. The direct source chain inspected
here is `continuum_with_position_tests → existence → constructed →
jointExistence`; `continuum` is a projection of the first, and `su2Theory`
specializes the last. A pinned type/proof constant-closure query additionally
finds `YM.Independent.Core.point` and `YM.Pert.Position.finite_leading`
reachable from `jointExistence`; the other focused headline names are not in
that closure. Reachability records a formal dependency, not a public conjunct
or a physical interpretation. The contact, parity, asymptotics and Sharp-Gram
headlines remain separately advertised statements.
