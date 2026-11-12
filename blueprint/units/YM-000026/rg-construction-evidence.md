# Finite-history flat-sector construction evidence

- Unit: YM-000026, lattice existence construction.
- Status: draft; independent mathematical and Lean-correspondence review pending.
- Imported Lean revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, recorded in `source/upstream.json`.
- Prose: `manuscript/existence/rg-construction.tex`.
- Mathematical inputs: `manuscript/existence/flat-step.tex` (local packet propagation) and `manuscript/existence/flat-estimate.tex` (finite scalar recurrence).

## Exact World producer

The source theorem is `YM.RG08.Flat.World.overlap` in
`Lean/YM/RG08/Flat/World.lean`. Its hypotheses are:

1. `World.Provides H P`: for every world point `x`, its horizon satisfies
   `Suffices P`; for every `low x ≤ i < fine x`, the actual order-two tower
   at cutoff `fine x`, level `i`, has the same coefficient kernel as the
   Wilson flight-duo tower for that schedule and penalty.
2. `World.Funding W P w θ`: a common positive width `w`, bounded by the map
   width `α`; adjacent widths fit both prices; `θ>0`; each adjacent fold
   satisfies `2*w_i ≤ L_i*w_{i+1}`; the exact `neutralCoin` charge at width
   `w_{i+1}` is at most the staircase drop; and the top allowance is a
   polynomial in the prescribed age.

Its conclusion constructs one packet for each `(x,i)` in the world interval,
with folded cost bounded by
`A * age(x,i)^d * (a(fine x)/a(i))^c`, for uniform `A≥0`, `d∈ℕ`, and
`c>0`. The packet is neutral, unit-lattice covariant, and represents the
quadratic-precision difference on every torus side tested by the world.
The article expands the private helpers `at_end`, `to_here`, and `existsRows`
instead of identifying the result with record unpacking.

| Mathematical item | Exact source declaration(s) | Path | Correspondence |
| --- | --- | --- | --- |
| Adjacent analytic width | `YM.RG08.Flat.bridgeWidth` | `Lean/YM/RG08/Flat/World.lean` | `min 1 (min α(J(i+1)) α(J(i)))` |
| Neutral packet charge | `YM.RG08.Flat.header`, `.quote`; `YM.RG08.Packets.neutralCoin`; `YM.Pert.Bulk.allotment` | `World.lean`; `Packets/Lines.lean`; `Pert/Bulk/Keys.lean`; `Pert/Bulk/Coin.lean` | Header is `m² exp(4) Ω(i+1)^2 Ω(i)`; neutral coin is `2m² header²/(u L_i)`. |
| Terminal packet | private `YM.RG08.Flat.at_end`; `YM.RG08.Flat.turn_class`; `YM.RG08.Flat.saddle`; `YM.RG08.Flat.Sigil` | `World.lean`; `Packets/Present.lean`; `Packets/FlatStep.lean` | Difference of the two terminal saddle kernels; strip bounds give folded cost `m(Ω+Ω)`; floor zero-mode and root identities give neutrality and the tested curvature representation. |
| One-step predecessor | private `YM.RG08.Flat.to_here`; `YM.RG08.Flat.toward`; `YM.RG08.Flat.poised` | `World.lean`; `Packets/FlatStep.lean` | Push the finer neutral packet through the two actual response kernels; Schur identity gives the precision difference and `push_null` gives exactly `neutralCoin * previous cost`. |
| Actual response atlas bounds | `YM.Pert.Bulk.atlas_here`; `YM.Pert.Bulk.values`; `YM.Pert.Bulk.birth` | `Pert/Bulk/Keys.lean` | `priced_atlas` from deep tower cost and adjacent row bounds; enlarging `exp(4ω)` to `exp(4)` gives the displayed header; diagonal/crossing identities match the carrier maps. |
| Response translation and travel | `YM.RG08.Packets.pass_response`; `YM.RG08.Flat.travels_route`; `.travels_duo`; `.alias_origin` | `Packets/Torus.lean`; `Packets/Harmonic.lean` | The response is a convolution of inverse bed, installed tower, and metric. Row bounds justify the convolutions; the installed tower travels because its zero-alias read is a constant identity column. |
| Backward row construction | private `YM.RG08.Flat.World.existsRows`; `YM.RG08.Rate.Stair.weight_step` | `World.lean`; `Rate/Stair.lean` | Cost `topTab(fine)/weight_θ(i)`; exact recurrence is previous cost times drop, with only the terminal stipend. |
| Polynomial-age to power-rate export | `YM.RG08.Rate.Ascent.fade_solve`; `.Fade.cap` | `Rate/Ascent.lean`; `Rate/Stair.lean` | Finite backward recurrence solver and conversion to age power times `(a(fine)/a(i))^c`. The article gives the scalar proof in the adjacent unit and matches its age to the world age including `Z` and the measuring level. |
| Actual world call site | `YM.RG08.Flat.Spacing.funded`; `.meshed`; `.supplies` | `Lean/YM/RG08/Flat/Mesh.lean` | `meshed` packages the world points as `(measure k, cutoff N, later history n)` and calls `World.overlap`; it then resolves the resulting curvature packet using the two metric row strips. |

## Selected public route

The world producer is reached through the actual selected construction, not a
neighboring proof interface:

1. `YM.Independent.constructionRun` in
   `Lean/YM/Independent/ConstructionRun.lean` calls
   `YM.PhysicalNext.Repeat.Legato.R2I.RG05Joint.selectRunWithTreasuryPeriod_preselected_quote_orders_postnumeric`.
2. Its `Choice` is `YM.Integration.NativeComponentRecipe.Choice`; the
   nonempty choice comes from `NativeComponentRecipe.available`, whose flat
   supplier is the result of `YM.RG08.Flat.entrance_gate`.
3. `NativeComponentRecipe.realize` applies that supplier to the selected
   schedule and a horizon with the required `Suffices` bounds. The binding to
   the original run is `YM.Integration.ActualRunNativeComponentRecipe.on_run`
   and `.of_preselection`; it uses the original
   `R.family.path.levels` and `R.alloy.B.M`.
4. The public same-witness extraction route also uses
   `YM.PhysicalNext.Repeat.Legato.Run.again`, whose proof calls the actual
   full-volume `ahead` supplier and retains its same-run data. This is the
   route containing the `Ahead`/garden/Mauve chain; no nearby Cook/Multi
   interface is substituted here.
5. The `Volant` step used by the retained step story is supplied by
   `YM.PhysicalNext.Repeat.Legato.Bandage.paneer` in
   `Lean/YM/MergeProof/Wax.lean`. Its local constructor is
   `YM.PhysicalNext.Repeat.Mallow.Many.ripe` in
   `Lean/YM/MergeProof/Tanger.lean`; that proof calls `Photo.bidding`,
   `Many.usable`, `Many.crowd2`, and `Photo.shade`. In the selected tower
   story, `Bandage.escape` in `Lean/YM/MergeProof/Stove.lean` turns the
   step suppliers into the `Moonlit` data consumed by
   `YM.PhysicalNext.Repeat.Legato.ahead` in `Lean/YM/FullVolume/Forge.lean`.

## Volant source correspondence

| Article step | Exact declaration/path | Source content inspected |
| --- | --- | --- |
| shipment tariff | `YM.MergeProof.Palette.shipPrice`, `Lean/YM/MergeProof/Permit.lean` | $N\,\mathrm{siteFactor}(\mathrm{radiusB}(x))\exp((Q.relative+1)\mathrm{preCost}(Q.halo+5))a\leq\mathrm{ribbon}(Q,L,x)$. |
| offer and support to menu plot | `YM.Merge.Photo.bidding`, `Lean/YM/MergeProof/Tinder.lean` | Uses the offer's site/budget fields, occupied parent sites, threshold `4≤relative`, exponent `100≤supportExponent`, and the ship-price inequality to apply the rooted budget theorem. |
| rooted tariff conversion | `YM.Extra.Multi.root_hit`, `Lean/YM/Extra/MULTISOURCE_BOUNDS/Root.lean` | Given per-site occupancy `N`, a rooted budget at exponent `relative+1`, and one named origin in each positive mode whose image lies in its birth support, returns the hit ledger at exponent `relative` with budget `N*siteFactor(B0)*c`; the lost cover exponent is exact. |
| finite menu payments | `YM.PhysicalNext.Repeat.Mallow.Many.usable`, `Lean/YM/MergeProof/Stage.lean` | `Palette.fair` supplies paid trained terms at the product fee `lace`; `Palette.sizes` applies `Charity.everyoneN` to prove summability; `Palette.lucent` gives the rooted fee bound, then scaling by two yields `2*pledgeA/(1-sailUp)`; the source identifies exponent `earn+w`; `crowd`, `listens`, and `valueP` give the gas response, locality, and exact closed push identity. |
| second response-cost payment | `YM.PhysicalNext.Repeat.Mallow.Many.crowd2`, `Lean/YM/MergeProof/Paprika.lean` | Uses the second `Arrives` clause for the exact `softNeed` request and `within_alpha`; `plants` obtains `Vapor` from `Mallow.cools`; `corps2` uses the first rate clause to pay the precursor at `stems`; `Motion.widening` and `Motion.harvest` transport the selected rates through finalization to a `Pays` bound at `straw`. |
| polynomial assembly to a canopy | `YM.Merge.Photo.shade`, `Lean/YM/MergeProof/Shaded.lean` | Chooses signed single-menu polynomials, assembles the field-mode polynomial, and proves its ledgers using the paid menu and response bounds, support localization, and the supplied exact jet equality. Its helpers are `exquisite`, `serenade`, `excavation`, `heavily`, `selfie`, and `scored` in `Lean/YM/MergeProof/Magma.lean`; the latter expands the push as the exponential factor times `pass(sum spine)` times the field polynomial of the field-mode tally. |
| full one-step witness | `YM.MergeProof.Menu.Volant`, `Lean/YM/MergeProof/Copse.lean` | Reserves are precisely the canopy statement; the other fields are propagation, tuning, and the slot-separation arsenal. `Many.ripe` supplies them from `sounds`, `tunes`, and `sharp` after constructing the canopy. |

The revised `rg-construction.tex` records the shipment arithmetic and a
conditional fiberwise assembly from ungrouped paid terms. The new
`rg-multisource.tex` expands `Many.usable` and `Many.crowd2`, including the
exact rate inflation and the finite-product mechanism. `Photo.shade` still
consumes the selected jet identity, while the source-level support, towing,
and push helpers require independent mathematical review. The ungrouped
response receipts in `rg-construction.tex` are producer obligations, not
assumptions discharged by the fiberwise regrouping lemma itself.

This is a dependency crosswalk, not a claim that the row-level theorem alone
proves the full continuum statement. The funding curve, top polynomial cap,
actual tower identity, and public numerical purchases still must be supplied
by their respective callers. The theorem is conditional on exactly these
data; it does not produce them by naming a record.

## Proof organization and limits

The terminal packet proof is reorganized from the constant-column comparison:
the two metric zero modes agree, the strip bounds control both saddle
packets, and the floor identities give the finite curvature representation.
For the predecessor step, the local Schur identity and neutral-packet push
estimate are proved in `flat-step.tex`; this unit verifies how the actual
history supplies its order-two atlas bounds, carrier matching, city law, and
travel condition. The cost recurrence is exact, not an asymptotic
convergence argument. Its scalar consequence is proved in
`flat-estimate.tex`.

No outside result is used to replace a construction estimate: all numerical
steps here are finite sums, a Schur identity, and the stated scalar
recurrence. The upstream FlatStep and atlas proofs remain conditional on the
separate Wilson wire and train estimates audited in the free-kernel units.
Those source producer chains must still be completed and independently
reviewed before the full public existence proof is complete.

## Inspection record

Read-only source inspection included:

- `sed -n '1,230p' Lean/YM/RG08/Flat/World.lean` — exact `Provides`,
  `Funding`, terminal packet, predecessor, row recurrence, and `overlap`.
- `sed -n '1,145p' Lean/YM/RG08/Flat/Mesh.lean` — funded spacing,
  `meshed`, and the actual call to the world theorem.
- `sed -n '1,120p' Lean/YM/RG08/Flat/Entrance.lean` — preselected flat
  entrance route through retained support, spacing, and `supplies`.
- `sed -n '1,145p' Lean/YM/RG08/Packets/FlatStep.lean` and
  `sed -n '1,100p' Lean/YM/RG08/Packets/Present.lean` — mixed Schur identity,
  packet push, terminal saddle comparison, and constant-column argument.
- `sed -n '1,120p' Lean/YM/RG08/Packets/Harmonic.lean`,
  `sed -n '1,130p' Lean/YM/RG08/Packets/Torus.lean`,
  `sed -n '1,130p' Lean/YM/Pert/Bulk/Keys.lean`, and
  `sed -n '1,110p' Lean/YM/Pert/Bulk/Coin.lean` — actual response travel,
  periodization, matching, atlas costs, allotment and neutral coin.
- `sed -n '1,180p' Lean/YM/RG08/Rate/Ascent.lean` and
  `sed -n '1,120p' Lean/YM/RG08/Rate/Stair.lean` — exact staircase
  recurrence solver, age, drops, and scale-ratio export.
- `sed -n '1,130p' Lean/YM/Independent/ConstructionRun.lean`,
  `sed -n '1,210p' Lean/YM/Integration/NativeComponentRecipe.lean`,
  `sed -n '1,100p' Lean/YM/Integration/ActualRunNativeComponentRecipe.lean`,
  and `sed -n '1,145p' Lean/YM/Integration/NativePreselectedPostnumericPeriodRun.lean`
  — actual selected-run and recipe binding.
- `sed -n '1,100p' Lean/YM/FullVolume/Cross.lean` — same-run `again` route
  and its call to the full-volume `ahead` supplier.
- `sed -n '55,110p' Lean/YM/MergeProof/Tanger.lean` — actual `Many.ripe` Volant constructor and its numeric slack, plot, payment, canopy, and remaining fields.
- `sed -n '1,120p' Lean/YM/MergeProof/Shaded.lean` and `sed -n '1,100p' Lean/YM/MergeProof/Magma.lean` — general paid canopy assembly and its polynomial ledger/push identities.
- `sed -n '1,120p' Lean/YM/MergeProof/Paprika.lean` — `Many.usable` and the response-cost supplier `crowd2`.
- `sed -n '1,100p' Lean/YM/MergeProof/Tinder.lean` and `sed -n '1,100p' Lean/YM/MergeProof/Permit.lean` — paid menu plot and the exact shipment tariff.
- `sed -n '1,100p' Lean/YM/MergeProof/Wax.lean`, `sed -n '1,100p' Lean/YM/MergeProof/Stove.lean`, and `sed -n '1,90p' Lean/YM/MergeProof/Copse.lean` — selected step-to-Volant, horizon `Moonlit`, and canopy output types.
- `rg -n` searches for `World.overlap`, `World.Provides`, `Funding`, the
  public run selector, and the named declarations above — actual callers and
  source locations.

The source pin was read from `source/upstream.json`. No Lean command or
LaTeX build has been run. The blueprint checker has not been run because this
isolated unit directory has no `unit.json`; adding shared proof-unit metadata
is outside this task's outputs. No new external literature citation is
needed for the elementary finite recurrence or matrix Schur identity.
