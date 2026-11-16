# Focused source report: final Yang–Mills assembly

## Scope and source pin

- Repository checkout: `/tmp/ym-whole-source`
- Repository revision: `a62f08fbcccdc92797ab910ace65f3e02ee79a06`
- Upstream Lean import pin from `source/README.md`: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
- Inspected only: `source/README.md`, project contribution instructions, and focused files under `Lean/YM/{Nonperturbative,EveryPhase,Phase,Euclid,Fields,OS,Next/BOUNDARY,Distribution,Spectral}` plus the relevant manuscript chapters.
- No Lean build or tests were run. No manuscript or source edits were made.

## Final assembly declarations

`YM.Nonperturbative.existence` in `Lean/YM/Nonperturbative/Headlines.lean` proves the proposition `YM.Nonperturbative.Headline.WilsonExistence.{u,v} G hG b` for every simple gauge group and positive penalty. It obtains one `Independent.fundedRun`, a single penalty witness for all orders, and calls `continuum_with_position_tests` for each order. Its reconstruction fields are assembled from `EveryPhase.Completed`, `core.reconstruction`, and the corresponding trace/OPE/contact inputs.

The public `Reconstruction` structure in `Lean/YM/Nonperturbative/HeadlineSpec.lean` requires, for every `i : F.α.space.X`:

- `isTheory i : (L.actors i).Realizes ...`, whose `unique` field says that every vector fixed by **all spacetime translations** is a multiple of the vacuum;
- a separate zero-energy PVM characterization `mink i`;
- `at_boundary` for every arity, field tuple, and joint test.

This is stronger than only constructing relativistic data for a selected or almost-everywhere phase.

## Every-character reconstruction and the non-circular vacuum-line proof

The pointwise result is `YM.EveryPhase.all_characters` (`EveryPhase/Extension.lean`), which produces `Completed F L` for every character. `Completed` stores `isTheory i`, `euclid i : (L.chambers i).UniqueHeat`, `mink i`, `depends`, and the joint `at_boundary` identity.

The proof does **not** assume every character has a one-dimensional time-ground space. The chain is:

1. `Almanac.almostEvery` (`EveryPhase/Pack.lean`) obtains only an a.e. `UniqueHeat` statement from `YM.OS.Cluster.lifts` (`OS/Cluster.lean`). This uses a common dense word family and a dominated-convergence argument for ground projections.
2. `EveryPhase.inverse_square` (`EveryPhase/Decay.lean`) supplies a uniform-in-character estimate for each fixed finite word `w`. Put `A_i = stands (L.actors i).operators w` and let `ν_i` be its diagonal momentum spectral measure. `word_bound` (`EveryPhase/Light.lean`) gives a common finite mass bound `B`, since `ν_i(E4)=‖A_i‖²` is continuous in `i` and the character space is compact. `late` gives a common spatial radius `R` outside which the averaged commutator of `w` and its reversed word vanishes, using locality and the finite supports of the smearing tests.
3. The source proves the low-energy estimate rather than assuming it. `Average.annulus` uses the one-sided time average
   `pulse(t)=∫₀¹ sin(tx) dx`, with `pulse(t)≥t/π` on `[0,1]`, and
   `averaged(g,x)=∫₀¹ (g(position(x,t))-g(position(x,-t)))/(2I) dt`.
   For forward-cone spectral measures `μ,ν`, `Average.two_average` identifies this with the sum of spatial characteristic functions of the positive measures `(up·μ)∘spatial⁻¹` and `(up·ν)∘(-spatial)⁻¹`, where `up(p)=pulse(p₀)`. Testing against the Fourier transform of a smooth bump equal to one on the spatial momentum ball of radius `u` and supported in radius `2u` gives an upper bound proportional to `R³(B+N)u³`; the time-annulus `u/2<p₀≤u` contributes at least `u/(2π)` per unit measure, because the cone gives `|p⃗|≤p₀≤u`. Thus `ν_i({u/2<p₀≤u})≤A u²`, uniformly in `i`. The dyadic cover in `Average.dyadic` gives `ν_i({0<p₀≤u})≤2A u²` for `u≤1`.
4. `Decay.inverse_square` extends that estimate to every `u>0` using the total-mass bound for `u>1`, then applies `Decay.decay` to get
   `0 ≤ ⟨A_i,(bHeat(J_i,s)-P_{0,i})A_i⟩ ≤ D Γ(3) s⁻²`,
   where `P_{0,i}` is the **full zero-time-energy spectral projection** and `D=max(B,2A)` is independent of `i`. The scalar integral is the Laplace tail `∫_{p₀>0}e^{-sp₀}dν_i`; the source evaluates it by layer-cake/Tonelli from the cumulative `D u²` estimate.
5. `Vacuum.extends_decay` upgrades an a.e. bound to every character. At a.e. `i`, `proj_eq` (`EveryPhase/Vacuum.lean`) identifies `P_{0,i}` as the vacuum rank-one projection using `UniqueHeat`. The function
   `g(i)=⟨A_i,bHeat(J_i,s)A_i⟩-|⟨Ω_i,A_i⟩|²`
   is continuous: `uniform_heat` supplies continuity of the first term and the vacuum is the grade-zero unit word, so `sum_pair` gives continuity of the second. The preimage of the closed interval `[0,DΓ(3)s⁻²]` contains an a.e. set; full support of the character measure and `univ_of_closed` make that preimage the whole character space.
6. `Vacuum.cluster_zero` lets `s→∞`. The boundary heat converges strongly to `P_{0,i}` by `Projection.bHeat_limit`; the residual bound tends to zero. It follows that `⟨A_i,P_{0,i}A_i⟩=|⟨Ω_i,A_i⟩|²`. Self-adjointness and idempotence of `P_{0,i}`, `P_{0,i}Ω_i=Ω_i`, and `‖Ω_i‖=1` imply `P_{0,i}A_i=⟨Ω_i,A_i⟩Ω_i` for finite word vectors.
7. `Vacuum.all_plant` extends that rank-one identity to all of the boundary Hilbert space using `Kernel.Gram.by_bud` and `FieldCore.soil`. `links.smears` represents the requisite vectors by joint Schwartz tests; capped approximations converge through `Joint.jointCont`, and the smearing maps are continuous. This is not an assumption that product tests alone are dense.
8. `Projection.reaches` proves `L.J i` is onto for every character from `cards i).reveals`, `cores i).induced`, and the boundary `onto (links i)` theorem, with the pantry symmetry/smoothness hypotheses. For arbitrary `v` in the OS chamber ground subspace, choose `x` with `J_i x=v`. `Projection.reflection_projection` identifies the OS semigroup reflection projection with its zero-time spectral projection; `Attachment.projections` transports that Borel spectral projection through `J_i`. `all_plant` then gives `J_i x=⟨Ω_i,x⟩Ω_{0,i}`. Thus `v` is a multiple of the OS chamber vacuum. This establishes pointwise chamber `UniqueHeat` without circularly assuming it.
9. `Vacuum.boundary_realizes` calls `Attachment.with_heat (cores i) (every i)`. That theorem upgrades `FieldCore` to full `Wightman.Realizes`, including the relativistic uniqueness axiom. Its uniqueness statement is explicitly `∀ x, action.orbit.translation x v=v`, with `x:E4`; it is not just time-translation invariance.

## Boundary barycenter on joint Schwartz tests

`Distribution.Product` defines `Joint n := Probe (Points n)`, a Schwartz test on the complete `4n`-dimensional joint configuration space. It is not restricted to tensor products. `EveryPhase.barycenter` and the `Completed.at_boundary` field state exactly

`∫ i, (L.contours i).world.W n v g ∂F.α.space.μ = F.B.world.W n v g`

for all `n`, `v : Fin n → S.Union`, and `g : Joint n`.

The proof in `EveryPhase/Barycenter.lean` has two dominated-convergence stages. `eager` proves continuity in the character and barycenter equality at strict heights, using a common power bound from `power`. `word_continuity` passes each character's strict waves to its boundary. Finally `barycenter` uses the common integrable `Waves.toll f A m` majorant to pass the phase integral to the boundary, matching the mixed boundary by its corner limit. `power` is uniform in the character and comes from the common unselected slab norm cap (`Almanac.priced`), which in turn uses `sameBound`.

Manuscript coverage found: `phase-selection.tex` proves a word-level character barycenter, and `phase-ward-inheritance.tex` justifies particular Bochner integrals for Ward identities. Neither currently states or proves this general boundary identity for arbitrary joint Schwartz tests. The formal statement is an additional prose obligation.

## Null spaces and unit

The source means literal equality of all-spectator null subspaces. `YM.OS.Selection.Certificate.retains` (`Phase/Mixture.lean`) states
`(C.ensemble i).null d = S.null d` for every character `i` and grade `d`.

`Euclid.Table.null d` (`Euclid/Null.lean`) is the kernel of the reply map into all exteriors. `Euclid.Null.criterion` spells this out as vanishing for every finite spectator tuple and every distinct-point configuration; `Euclid.Null.vanishes` is equivalent under smoothness and symmetry to vanishing against every joint test with an insertion in any slot. Thus `retains` is equality, not just one-way inheritance. `EveryPhase.Extension.recognizes` also connects character nullity to vanishing of the reconstructed field on every `Test4`.

For the grade unit: `Register.scalar d=((space d:ℂ)^d)•(coord d).e0`, `Register.one d` is the raw token built from that scalar, and `Euclid.Null.unit d=project d (scalar d)` is its quotient class. `Table.Basic.unital` states insertion of `one d` leaves a correlation unchanged after deleting that slot; `Euclid.Lift.at_unit` proves the corresponding quotient-field insertion identity. `Euclid.Null.alive` proves this class is nonzero for a `Basic` table. Since `retains` identifies the null subspaces, the same raw scalar gives the same quotient unit in each character. It is not in general the coefficient-one coordinate vector; its scale includes `space(d)^d`.

## Existing manuscript gap and limits

- `phase-selection.tex` proves one-dimensional time-ground space only for almost every character and chooses one such phase.
- `phase-ward-inheritance.tex` explicitly says relativistic continuations are constructed for the mixed and selected theories, but invokes ground-space uniqueness only for the selected character.
- The manuscript does explain every-character regularity and exact null-space equality (`phase-regularity.tex`, `phase-fields.tex`), but I found no proof of the stronger pointwise route `inverse_square → extends_decay → cluster_zero → all_plant → reaches/every → with_heat`.
- The headline's every-character reconstruction and joint boundary-barycenter clauses therefore need explicit mathematical prose coverage; source declarations alone do not count as exposition.
- No Lean build, axiom audit, or independent formal verification was performed. Findings establish source correspondence and proof structure only.

## Focused follow-up: generic protected local trials and derivative labels

Source pin remains the same (`a62f08fb...`, Lean dependency `3456e5e7...`). The additional review was limited to `RG/Masks.lean`, `Push/RELAY_DIFFERENCE/{RawTop,Birth,Stencils,Placement,Estimate}.lean`, `MergeProof/{Portions,Dollars}.lean`, `Bid/Drops.lean`, `Euclid/Differential.lean`, `EveryPhase/{Light,Average,Decay,Vacuum,Extension}.lean`, and the manuscript local-trial / phase-derivative passages.

### Raw protected trial exact match

- `YM.Push.RelayDifference.RawProtected` in `Push/RELAY_DIFFERENCE/RawTop.lean` takes any trial function `F` whose weighted unpriced form is `weight C e N • F N p o`, with two `Slow` prices `c,b`, one anchored finite stencil, and late uniform `clothed` data. It makes no Taylor-vanishing assumption.
- `clothed` is `BudgetPoint.Regular` + `BudgetPoint.supBounds` on the healthy region, plus global `b ≥ 0` and `∀U, ‖u U‖≤b`. In `RG/Masks.lean`, `Healthy := Disjoint stencil (flags threshold U)`; flags use the strict test `threshold < chord`. Therefore equality at the threshold is healthy. `Regular.smooth` is a `ContDiffAt` germ of order `budget.order` in all left increments at zero for every healthy U; `Regular.hasDerivs` gives the recursive `HasDerivAt` identities for every ordered left-derivative list with length strictly below order. `supBounds` bounds all ordered derivatives with length at most order and admissible weighted directions. These exactly match the local-trial regularity package in `ope-filtration.tex`.
- The line in `actual-insertion-derivative-relay.tex` claiming “vanishing Taylor conditions in the regularity hypothesis” is not source-faithful for the trial itself. In the relay construction the arbitrary trial is read out against a physical section; the *residual after subtraction* has zero readout. The regular masked residual is handled separately. Correct the prose to put the zero-readout/vanishing property on that residual, not on the generic input.
- Exact theorem path: `RawProtected.birth` gives a `Start.Prepared` with exact terminal coefficient-density identity, for arbitrary protected `F`. For a centered comparison, `MergeProof.Portions.onions` needs `RawProtected + Stencilled + eventual continuity`; it invokes the persistence / producer machinery. `MergeProof.served_dollar` then supplies a dollar row and `CenterRents (Bid.upper row - F)`; `CenterRents.closes` converts this to `Bid.close`. Thus `RawProtected.birth` alone is not the vanishing-centered-discrepancy theorem; the rest of the funded history/keeper/Makes assumptions remain material. The source trial scaling is `weight C e N=(C.S.a N:ℂ)^e` (`Push/RELAY_DIFFERENCE/Matching.lean`), so the manuscript’s `a_N^e Z` is literal up to notation.

### Phase derivative comparison

`YM.DiffPlan` and `YM.DiffPlan.Derivatives.kernels` in `Euclid/Differential.lean` are the existing common grade-raising derivative-field data and their all-spectator kernel identity. `YM.DiffPlan.derivative_slot` proves the arbitrary-slot version from that identity, symmetry, and smoothness; `abelian`, `unit_drop`, and `commute_rise` establish the standard consequences. Each character already carries `F.phase.phase.calculus i : P.Derivatives (ensemble i)` and `coordinates i`; the extension transports these using `phase.retains`. If a manuscript proposition independently defines derivative labels by the finite-difference construction, it must identify those labels with `P.deriv d α v`: the tested all-spectator distributional identity plus `P.Derivatives.kernels` and the field null criterion give that equality. Without this identification, the phrase “with the original derivative fields” is a missing bridge.

### Additional every-character source correspondence

The exact source names are `YM.EveryPhase.word_bound`, `late`, `light_bound` (`EveryPhase/Light.lean`), `pulse`, `pulse_lower`, `two_average`, `annulus`, `dyadic` (`EveryPhase/Average.lean`; `annulus` is textually in `Light.lean`), `inverse_square`, `uniform_heat` (`EveryPhase/Decay.lean`), and `every`, `all_plant`, `boundary_realizes` (`EveryPhase/Vacuum.lean`). The completed object is `YM.EveryPhase.Completed`, assembled by `YM.EveryPhase.all_characters` in `EveryPhase/Extension.lean`.

The new manuscript proof for arbitrary compactly spacetime-smeared word sums goes beyond the exact source `light_bound`, whose input is a finite `SumOfWords` (the source already proves a common-in-character mass bound for those vectors and the quadratic light-cone estimate). It is mathematically parallel to `EveryPhase.Light` + `Average` + `Decay`: compact support of the smeared tests gives a uniform spacelike-separation radius; the one-sided sine time average gives a positive spatial Fourier measure; the smooth momentum bump/Fourier inversion gives the annulus (O(u^2)) bound; dyadic shells and layer-cake give the inverse-square heat remainder. The current proof supplies the extension to smeared words itself, rather than citing an existing theorem with that wider input. It should keep the exact characterization of the boundary heat pairing at positive gap and continuity in character explicit; `uniform_heat` in source only treats finite `SumOfWords`.

The source phase proof is non-circular: `EveryPhase.every` obtains chamber `UniqueHeat` from onto `reaches`, the full-space rank-one identity `all_plant`, and the reflection-projection transport. `YM.EveryPhase.Completed.eucl` is exactly `UniqueHeat`; its relativistic uniqueness is then delivered by `boundary_realizes` / `Attachment.with_heat`. Source `Wightman.Realizes.unique` quantifies invariance under all spacetime translations, not only time translations.

## Full-mesh detector, exact kernel sweep, and uniform primary costs

This check uses the actual source checkout and its import pin above; the separately prepared focused detector report was at `/tmp/ym-fullmesh-detector-source.md` and pins the same Lean revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

`FullVolume.mesh` is `comap Prod.fst atTop` (`FullVolume/Sluggish.lean`), and `FullVolume.late` identifies eventuality with one cutoff `N₀`, valid for every period `p`. `YM.FullVolume.trained` (file `FullVolume/Lit.lean`) first chooses one finite detector depth `k` from an atTop tail, then sufficiently small blur `b`, then a nonnegative detector constant `Z` and one full-mesh threshold. For all `N≥N₀`, all `p`, and all labels `x`,
\[
  \|a.step_d(N,p)x\|\le Z\,\|probe(T,k,(N,p),b,l)(a.step_d(N,p)x)\|.
\]
The mechanism is finite dimensional: `true_lower` gives an injective finite target matrix with stability constants `(δ,L)`; `VitalRank.performance` and `probesUp` approximate it uniformly on mesh; `Booths.bounded k` supplies a common lift bound `v`; and `weighed` proves rank of each actual `a.step_d(N,p)` is at most `Y.dim+1`, from the exact projection/equation-kernel sequence. `rank_upper` then gives `Z=A(Y.dim+1)vL`, where `A` is the uniform `Hearthside.uniform d` calibration. Both Z and N₀ are independent of p.

The exact-kernel sweep has a separate and simpler proof. `YM.FullVolume.sweep` (file `FullVolume/Lit.lean`) identifies a projected-kernel-zero row with the exact equation ideal using `Hearthside.foundation.step`, then calls `YM.MergeProof.banked`. `banked` writes the row as a canonical terminal/presentation image of catalogue coordinates `y`. `Coin` and the source `carding`/`stamped` estimates make `y` Sluggish on the full mesh. `YM.MergeProof.ocean` then gives an Owed root-cost receipt for `upper(x)-hallmarks(V,y)` at flight price `-1/32`. `YM.Push.Mark.hole` gives zero root-test cost for `hallmarks(V,y)`: it takes a finite basis of the equation ideal, chooses one stencil radius for that finite basis, and uses `clearance` to select one N-tail so every period’s centered box contains the stencil. The microscopic equation identity makes the moment exactly zero. Therefore this sweep does not use a spectator conversion with a period-dependent threshold; the exact equation-kernel contribution is zero, and the remaining Owed price is full-mesh uniform.

`YM.FullVolume.cap` (file `FullVolume/Moneys.lean`) uses this sweep on the normalized row `z=(1+‖display(x)‖)⁻¹(x-display(x))`, which remains Coin and has exact projected kernel zero. `trained` plus `invites` makes its detector assay tend to zero uniformly on mesh. The primary assay is uniformly bounded by `YM.FullVolume.Funded.primaries` (`FullVolume/Rent.lean`), which follows from `Extraction.Wcmain` and an eventual uniform row norm bound `‖v(N,p)‖≤Y`. The detector inequality yields the explicit cap `‖display(x)‖≤2Zc+1`, again one threshold for all p. `improved` (`FullVolume/Moneys.lean`) funds this bounded projected row and adds its exact-kernel sweep to the original residual.

This matches a manuscript strategy that restricts to **uniform-mesh Coin/subpower rows**. Do not claim that a source theorem upgrades arbitrary period-dependent `Ordered` rows. The manuscript's `equation-column-root` is the approximate-equation route: for a finite common set of columns and coefficients with one N-only subpower price `E_N`, its displayed calibration inequality yields root error `E_N exp(-s_N/8)` uniformly in p; after reserving an exponential margin this is bounded by `exp(-s_N/16)` eventually. That estimate can construct uniform approximate-null rows, but it is not a premise or a hidden step in the exact-kernel sweep above.
