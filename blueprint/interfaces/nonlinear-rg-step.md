# Nonlinear RG step interfaces — working audit, issue #13

**Status: author draft for independent Lean-correspondence review.** This is a
bounded interface audit, not an exposition and not an ownership grant. Imported
source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; paths are relative
to `Lean/`. Scott Armstrong's
[III.10](https://github.com/scottnarmstrong/yang-mills-informalization/blob/8f3c7ccaeabb17b0f928bc1a2e75328691de3032/outline/units/III-10.md),
[III.9](https://github.com/scottnarmstrong/yang-mills-informalization/blob/8f3c7ccaeabb17b0f928bc1a2e75328691de3032/outline/units/III-9.md)
and III.2 outlines at `8f3c7ccaeabb17b0f928bc1a2e75328691de3032` were used as
navigation leads, not as proof evidence. Do not commission PU-08–PU-10
explanation tasks from this note before that review and the follow-up audit
requested in [Obstructions](#obstructions-and-requested-follow-up).

Three levels of evidence are distinguished throughout:

- **[E]** elaborated: the statement or definition was printed by Lean
  (`#check`/`#print`) in a built copy of the source and read;
- **[S]** source text of the declaration was read;
- **[G]** graph only: name, location, membership in the closure of the headline
  results and reference edges were taken from a compiled declaration graph; the
  statement itself was **not** read in this session.

## Summary of findings

1. **The cluster has no package-level boundary.** Treating the five III.10
   work packages as one block, 1518 of their theorems are referenced from
   outside it by declarations in the headline closure [G]. Interfaces must
   therefore be chosen as mathematical statements, not as module borders.
2. **There is a narrow theorem spine for the step itself** [E]:

   ```text
   one-step estimates ──► Roof.timberT ──► Roof.Sheltered ─┐
   (III.10.1–10.4)        (parameter order)                ├─► Rain.glazing ──► Use.Offering
                                         Roof.WorksIn ─────┘                        │
   Use.Machine (inside Sheltered) ──► Use.supplier ◄──────────────────────────────┘
                                          │
                                          ▼
                      UVNext.CouplingReset.program ──► Input.Directed.Program
   ```

   `Roost.Factor.worksNow` is the one-line assembly of the last three arrows;
   `Roost.commerce` is the existence statement with the full order of constants.
   The diagram omits three inputs [E]: `Use.supplier` also takes `G.Simple`
   and `Use.Origins` (from `Use.from_menu`); `program` also takes
   `PricedReset` (`machine.prices`); and `Roof.WorksIn` is not produced by
   `timberT` but by `Roof.honey` inside `Roost.commerce`, from further
   one-step theorems (see Contract 1, "Incomplete list").
3. **The proposed PU-08/PU-09/PU-10 split survives, with the dependency order
   of PU-08 and PU-09 reversed** relative to `unit-plan.md`. The offering
   theorem (activity update, candidate PU-08) does not reference the one-step
   estimates (candidate PU-09); it receives them only as the hypotheses
   `Roof.Sheltered` and `Roof.WorksIn`, which the closure theorems (candidate
   PU-10) produce [G]. The conceptual order is PU-09 → PU-10 (bundle) → PU-08 →
   PU-07 (reset) → PU-10 (program).
4. **PU-09 is not one theorem.** It is four separately stated estimates with
   different quantifier orders [S]; a two-unit split is recommended below.
5. **Part of III.10 is not in the step-program closure at all**: the
   integrated molecule estimate of III.10.3, the schedule statements of
   III.10.5 and the marker statements I01, I03, I04 have other consumers [G].
6. **The closure is conditional on a purchased schedule.** The hypothesis
   `ThroughLaunch.PaidView` of `Roof.timberT` and `Roost.commerce` already
   contains the scheduled energy bound `Pressure.Testing.Ringing`, the
   Gaussian run hypothesis `Next.SectorChange.Cosmos`, `Stock.Priced` and the
   start-up prices [E]. PU-10 therefore does not prove them; they are built
   upstream by `ThroughLaunch.sailsV` [G].
7. **The hypothesis bundle is the one-step estimates evaluated along the
   schedule.** Every analytic field of `Roof.Sheltered` and `Roof.WorksIn`
   that was unfolded (seven rows of the field table were not) has the form
   "for each admissible stage pair and every coupling above the entry
   coupling, a one-step statement holds" [E]. **These are not all
   consequences of the four Contract 1 statements**: the fields `pipes`,
   `peak`, `jewels` and most of `WorksIn` are produced from further
   `Cash`-conditional one-step theorems that Contract 1 does not list [S];
   see the producer table in obstruction 1.

## Contract 1 — one-step estimates at fixed constants (candidate PU-09)

**Role.** Large-field and irrelevant-term bounds for a single block step, with
all schedule data fixed. Nothing here refers to a trajectory, a reset, or a
curve of couplings.

**Inputs.** Step data and tree gauge (III.1), free kernels and towers (III.3),
polymer norms (III.5), stationary branch and matching (III.6–III.8), and the
window/jet package of #12 through `YM.AnalyticBridge.SectorAffine.assembly`
and `.estimates` [G]. `YM.PhysicalNext.Repeat.Malachite.treasure`
(`.../Malachite/Grain.lean:42`), flagged by #12 as a consumer of
`SectorAffine.assembly`, lies on this side of the boundary: it is reached from
`Roof.timberT` and not from `Rain.glazing` [G].

| Statement | Anchor | Evidence | Direct consumers in the closure [G] |
| --- | --- | --- | --- |
| Energy per seed (large-field action gap) | `YM.Next.Fluctuations.grants : ∀ P : Pressure.Teller G, P.Grants`, `YM/Next/FLUCTUATIONS/Grants.lean:24`; `YM.Pressure.Teller.Grants`, `.cash`, `.live`, `.Funds`, `YM/Pressure/Seeds.lean:89–131` | type [E], definitions [S] | `YM.Push.AbsoluteSums.Grant.order`, `YM.Push.SectorMeasure.points_grant`, `YM.Next.Fluctuations.pressure_queries` |
| Activity bounds of one step | `YM.ConnectedActivityE6.Target.issue`, `.../CONNECTED_ACTIVITY_JETS_E6/Issue.lean:94`, with `Target.Order`, `GrantBodies`, `Invoices` (same file, 33–88); bundle `YM.ConnectedActivityE6.Cash`, `.../Batch.lean:82` | statement and the three structures [S]; `Cash` [G] | `Target.quotesTogether` (`.../IssuePlan.lean:53`) → `YM.ConnectedActivityE6.Planning.exists_floors` |
| Coarse-field jets of the new letters | `YM.ConnectedActivityE6.Blaze.Silica.Utopia.whittle` and structure `Utopia`, `.../CONNECTED_ACTIVITY_JETS_E6/Das.lean:27–52` | [S] | `YM.ConnectedActivityE6.Blaze.Flux.launch`, `Empire.prom`, `Empire.womb`, `Repeat.Alabaster.discover`, `Repeat.Daisy.timing` |
| Gaussian sector of the step | `YM.PhysicalNext.JointLoad.capital` and structures `Charges`, `Value`, `.../V9_JOINT_ENDPOINT_LOAD/Costs.lean:34–98`; then `.stage` (`.../Supply.lean:72`) → `.Clockwork.offer` (`.../Calendar.lean:75`) | `capital` [S]; `stage`, `offer` [G] | `JointLoad.Clockwork.opened` |

**Statements and order of constants** [S].

- *Energy.* `Grants`: `∃ i, ∀ L ≥ i, ∀ᶠ W, ∃ κ > 0, ∀ᶠ x,` for every step
  `S` with block factor `L` and coarse side `c ≥ 100(1 + B(x))`, every tube
  `T` with `P.Funds S T`, every forest, store `A`, fine field `U` in tree
  gauge (`Stores.SliceSet`), tags `k` and coarse field `V` with
  `Stores.Plot A U k V x W`:
  `κ · t(β_F(x,L))² · ♯A ≤ A.assessed T x U (S.prediction U k) V`.
  Here `B(x) = ⌈(log x)²⌉`, `β_F = x + b_G log L`,
  `t(y) = y^{-1/2} exp((log log y)²)`. The constant `κ` is chosen after `L`
  and `W`; the statement is deterministic.
- *Activities.* `Target.issue`: `∃ n, ∀ L ≥ n, ∀ᶠ W, W > 0 ∧ ∃ μ > 0,` for
  every patch `D` with the branch condition `∃ (o : Order G W) (C ≥ 0),
  ∀ᶠ x,` for every step on `D` and tube with `Works P L x S T`:
  `GrantBodies W x μ L R o C T`, and for every fine representation `K` with
  `Intake P T x K` and `Stamp T` on the same tube: `Invoices W x μ L R o C T K`. Here
  `R : ConnectedActivityE6.Target G P` is an explicit parameter on which `n`
  and all thresholds depend, and `Works P L x S T` is
  `P.Funds S T ∧ S.patch.L = L ∧ 100(1+B(x)) ≤ c`.
  `Invoices` contains the tree-graph test (`Buy`), the rooted sum (`Sales`)
  for forced, logarithmic and warning letters, the packet bound with gain per
  seed, and the catastrophe probability bound `≤ E^{|v|}`. Its proof starts
  from `Grant.order P`, so this estimate depends on the energy bound.
- *Jets.* `Utopia.whittle`: `∃ n, ∀ L ≥ n,` every patch `D` with branches,
  order `i`, cutoff `χ`, `W > 0`, `μ > 0`, window constants `o`, functions
  `v, w` of rate `-1/2` (`v` eventually nonnegative): `∃ C' ≥ 0` and `r` of
  rate `0`, `∀ᶠ x,` for every step on `D` with `Stamp T`, every `R`, `C` and
  **every bundle `H : Cash W x μ L Q o C T R`**, a structure
  `Utopia H i (v x) (w x) (r x) C' χ` exists. It is conditional on a `Cash`
  bundle, i.e. on the output of the previous item.
- *Gaussian sector.* `capital`: for a patch `H` with branches, aperture
  `B > 0`, cutoff `q` and `k, p : ℕ`, `∃ v : Charges, ∀ᶠ x,` for all
  `0 < β ≤ 2β_F`, budget points of power `p` and threshold `t(x)`, funded
  steps on `H` with `c ≥ 100(1 + B(x))`, and stores whose flags are the flags
  of `V`: `Value v x (B·t(β_F)) T A F l V bp k q (coupling β)`.

The orders agree with the external outline's Propositions III.10.1–10.4. In
all four, the threshold in `x` is chosen last and the statement is uniform
in the sides `c, f` of the step. The teller is fixed data: `Teller.Funds`
requires `S.patch.J = P.j` and `T.R.Deep P.η P.C (P.j-2)`, so a stage index
does occur as a parameter on which every threshold depends [S]. Here
"rate `a`" is `ConnectedActivityE6.Rate G L a w`, i.e. for every `v > a`,
eventually `|w x| ≤ β_F(x)^v`; it is not a bound by `β_F^a` itself.

**Consumer.** All four statements are reached from `Roof.timberT` and from
none of `Rain.glazing`, `Use.supplier`, `Roost.Factor.worksNow` [G].

**Incomplete list** (found in the author-side self-check; [S] for the
statements named, [G] for reachability). The four rows above are not all of
the one-step estimates that feed the bundle. `Roof.employeesT`
(`YM/MergeProof/Retreat.lean:31`) and `Roof.honey` (`.../Roof/Honey.lean:27`)
build several fields from other theorems of the same shape, each conditional
on a `Cash` bundle and none of them reaching any of the four anchors above:
`Repeat.Brim.pressings` (`.../Brim/Level.lean:61`, for `pipes`),
`ConnectedActivityE6.Blaze.March.takeover` and `Armada.ensemble` (for
`jewels`), `Repeat.Yearling.sterling` (`.../Yearling/Garter.lean:34`, for
`WorksIn`, through `Yearling.batten`), and the inputs of `Boulevard.emits`, `Roof.ensures` and
`Pane.school` (for the other `WorksIn` fields). Their statements were not
read beyond `pressings` and their number is not established. Contract 1
must either be widened to this family or a further contract opened for it.

**Recommendation: separate, and split in two.**

- *PU-09a, deterministic energy bound.* `Teller.Grants` is a statement about
  fields, with no measure. Its proof (completed-square identity, kernel
  defects, row-by-row lower bounds; `YM/Bid/`, `YM/Next/FLUCTUATIONS/`,
  `YM/Work/E01`–`E09`) is self-contained and a plausible single-agent unit.
- *PU-09b, activity and jet bounds.* `Target.issue` and `Utopia.whittle` share
  the target data, the window constants and the Gaussian tail input, and the
  second is stated for bound bundles produced by the first. The `JointLoad`
  chain should be owned here as an *application* of #12's package 2, cited and
  not reproved. This unit is large: the two statements have separate proofs,
  and a further cut between them (activities; jets) is available if one
  session cannot cover both.

## Contract 2 — pre-reset presentation of the blocked density (candidate PU-08)

**Statement** [E]. `YM.PhysicalNext.Repeat.Rain.glazing`,
`YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Rain/Glazing.lean:97`:

```text
Roof.Sheltered A bt u t r Bn J P L R S (1/16) (1/16) (1/8) E q η
  → Roof.WorksIn R A.post A.delay S
  → RG.Supply.AsDivisors A.B.a.S
  → (∀ j i, StepStages j i → (C j i).table = X.O)
  → Use.Offering A.B S p (radiusW Y)
```

Here `X : Org.Metals G` (sheet, map prices, chart ratio), `D` the block
factors, and `A : Org.Alloy X D` packages post-block costs, protection, delays,
bar, waits, stock prices and the directed input `A.B`.

**Conclusion unfolded** [E] (`Use.Offering`,
`YM/AnalyticBridge/VERIFIED_RESET_STEP/Downstream.lean:77`). For all `N`, `p`,
`m < N`, every `l ≤ u`, and every curve `Q` of level-`(m+1)` representations on
`[l,u]` that is continuous for the level-`(m+1)` budget (`RG.Shoot.Curve`),
alive for the recipe (`RG.Shoot.Lives`) and with couplings in the band
`RG.Shoot.band A.B.a (m+1)`, there exist a listing `X`, sources `v x`, vacuum
terms `τ x`, a forest choice `T`, bookings `d` and a sector cutoff `χ` with:

1. **Exact presentation** (`Return.atlas`, `.../Inputs.lean:70`): for each `x`,
   `Return.gaussian B N T d χ r (Q x) = Collection.earlyValue X (path N m)
   clip (budget m) (v x) (Q x).beta (τ x) (alpha N m)`. The left side is the
   Gaussian-sector formula, **not** the block-spin push itself. The
   identification `push = Return.gaussian` is `Return.earnings`
   (`.../Inputs.lean:56`), obtained from `SectorChange.committed` under
   `Ringing` and `Cosmos` [S]. The proof of this item already uses it:
   `Rain.sprint → Roof.Embrasure.patrons → Opera.symphony`
   (`.../Opera.lean:95`) proves the atlas as Gaussian = push (by `earnings`)
   followed by push = `earlyValue` (by `Song.forward`). `Return.grants`
   (`.../Inputs.lean:74`) applies `earnings` again on the reset side to
   restate the atlas for the push.
2. **Local bounds** (`Collection.Local`, `.../Trays.lean:35`) at the level-`m`
   budget point: regularity, forced-family structure and lattice-symmetry
   moves; regular letters with sup-jet bounds summing to at most
   `forecastE a m = credit G (params m) * allowance m`
   (`Quotes.early`); forced letters with uniform bounds satisfying a rooted
   sum (`Ac.Hit`) at support exponent `+1` and total
   `forecastK a m S β = (S (J (m+1)) (J m)).pair.strong (hatBeta (m+1)) β`.
3. **Continuity along the curve** (`Collection.Compared`,
   `.../Comparison.lean:72`): pointwise convergence and a common summable
   majorant in the budget norm (`Push.BetaTransport.AtEach`, `.Submajorized`).

**Internal structure** [E types, S proof of `glazing`]. The proof is an
assembly of five statements, all under `Sheltered`, preceded by
`Rain.learns` (which produces the `Rain.Zeal` argument of the last four from
`conducts.income.grow` and `conducts.full`) and by the choices `Tree.select`
(forest) and `Opera.forum` (bookings); the cutoff is always `Chi.canonical`:

| Step | Anchor | Content |
| --- | --- | --- |
| Common address structure | `Roof.arches`, `.../Roof/Moment.lean:122` | From `Touring` and the curve hypotheses, a `Roof.Embrasure`: a guide and price at every curve point, matched to a base point with identical molecule units. |
| Uniform truncation | `Rain.topped`, `.../Rain/Innings.lean:95` | On a compact parameter set, eventually in the truncation order `d`, the per-site sup bounds and the budget `(1/16 + 2/16)·forecastE + turnFee·gold + gold` hold for all `x`. |
| Identity | `Rain.sprint`, `.../Rain/Glazing.lean:85` | Item 1 above. |
| Bounds | `Rain.varnish`, `.../Rain/Glazing.lean:56` | Item 2 above. |
| Continuity | `Rain.blinking`, `.../Rain/Mir.lean:59` | Item 3 above. |

**Mathematical dependencies** [G, transitive references of `glazing`]:

- #12 package 1: `YM.Next.SectorChange.authorized_change` and `.committed`
  (`committed` through `sprint` only, via `Return.earnings`;
  `authorized_change` also through `topped`). #12 packages 2 and 3 are
  **not** reached.
- Start-up fusion H01–H03 (`YM.Work.H01.gathered`, `H02.answer`,
  `H03.fused_forcedFamily`): the exponential regrouping of logarithmic letters.
- `Repeat.Alabaster.meritBar` and `.rimfire` (via `Repeat.Yearling.ovulation`):
  difference bounds along the curve. The external outline lists these as
  "additional reset estimates"; in the source they serve this contract.
- `YM.Pressure.Testing.notation_ticket` (`YM/Pressure/Seeds.lean:166`): the
  energy bound at trajectory positions, obtained from the `Ringing` field of
  `Use.Machine`, i.e. from the bundle and not from Contract 1 directly.

**Recommendation: separate unit.** It has one stable statement, a fixed
hypothesis bundle and, on the spine, a single consumer (`Use.supplier`,
whose only referrer is `Roost.Factor.worksNow`; `Use.Offering` also occurs in
`FundedCompanySelection.company` and in about twenty `Repeat.Legato.*`
declarations [G]). The mathematics is
the polymer reorganisation after Gaussian integration: an exact identity,
followed by norm bounds that only *spend* hypotheses. If one session cannot
cover it, the natural cut is identity (`arches`, `sprint`) versus bounds and
continuity (`topped`, `varnish`, `blinking`).

## Contract 3 — order of constants, bundle and closure (candidate PU-10)

**(a) Bundle existence** [E]. `YM.PhysicalNext.Repeat.Roof.timberT`,
`YM/MergeProof/Retreat.lean:44`, for simple `G` and a purchased schedule
`ThroughLaunch.PaidView s O K u g k r X Θ v`, and any `c₁, c₂, c > 0`, yields
`Roof.Sheltered` for every admissible choice. `YM.PhysicalNext.Repeat.Roost.commerce`
(`YM/MergeProof/Trading.lean:20`) calls it at `(1/16, 1/16, 1/8)` and adds
`WorksIn`, `Use.Origins` (via `Use.from_menu`) and the offering (via
`Rain.glazing`) [S, `Trading.lean` lines 33–48]. `WorksIn` comes from
`Roof.honey` (`.../Roof/Honey.lean:27`), fed with the `wanting = -7/16`
clause and with `Yearling.batten : ∃ M, Yearling.Hood s K X M`; `honey`
returns a delay threshold `U` beyond which `WorksIn` holds. `commerce`
therefore raises `timberT`'s floor `j` to `m ⊔ j` and inserts `honey`'s
delay threshold before applying `timberT`.

`PaidView` (`YM/MergeProof/Seaside.lean:62`) is a hypothesis, not an output
[E]. Its field `ship` states that for all block-factor records above `v` and
all block factors there is a stationary budget gap `η`, and for every
admissible post-block cost, protection, tariff, floor `z` and delays there
are boosted delays beyond which hold: start-up prices
(`Further.StrongStartup.Prices`), `Stock.Priced`, the scheduled energy bound
`Pressure.Testing.Ringing`, the Gaussian run hypothesis
`Next.SectorChange.Cosmos`, and for every paid level system a budget, a
prepared multi-source scope and a `ThroughLaunch.Torrent`. It is constructed
by `ThroughLaunch.sailsV` (`YM/MergeProof/Seaside.lean:96`), which reaches
`Fluctuations.pressure_pricing`, `Bid.pricing_order`, `Extra.Multi.pricing`,
`Further.StrongStartup.prices` and `ThroughLaunch.developer`, and does not
reach `Target.issue`, `Rain.glazing` or `Roost.commerce` [G]. So the energy
bound enters the step twice: scheduled, through `PaidView`, and unscheduled,
through `Target.issue` inside `timberT`.

**Order of choice** [E], read off the alternation of quantifiers in `commerce`:

1. `∃` block-factor floors `j ≥ v`, programs `C`, wages `z`, targets `R`
   (chart `Next.Foundations.chart G`, halo `500`), expenses `E` (`earn =
   Roof.rays s i k`, `wanting = -7/16`, degree `0`), baton `bt`;
2. `∀` block-factor records `l ≥ j` and `∀` block factors `D`;
3. `∃` wage floor `y`, `∀` wages `w ≥ y`, `∃` register `R'` and cafés `B`;
4. `∀` postage `K'`, `∃` smaller postage `F` and scouts `S`;
5. `∀` exchange `E₀` and tariff `ξ`, `∃` reset prices `q`, sensor constants
   `η`, post-block costs `P`;
6. `∀` protection ceiling `θ₀ > 0`, `∃` protection `θ ≤ θ₀` and records `p`
   with `ε ≤ 1/4`;
7. `∀` menus `Q` and delays `U`, `∃` booths `b`, `∀` auxiliaries `J`,
   `∃` ordered delays `W ≥ U`;
8. `∀` delays `V ≥ W`, bars `Z`, waits `I` and levels `a` with
   `RG.Supply.Paid I a`: `Doors.Budget a k r`, `Extra.Multi.Prepared`, and
   `∃` stock prices and a directed input `B'` with `B'.a = a` for which the
   bundle, `WorksIn`, `Origins`, — under `AsDivisors a.S` — the offering, and
   a `RankCovariance.ShapePort` hold.

The delays (`betaEntry`, the entry couplings, together with `scaleEntry`,
`shells` and `growth`) are therefore chosen after every constant and may
always be increased; only `Z`, `I`, `a` and the directed input `B'` follow
them. Block factors precede every analytic constant except the target data,
programs, wages, expenses and the baton. The indices `N`, `p`, `m` are
quantified inside `Offering` and `Program`, after all of the above: this is
the uniformity required at the next scale. Their reading is not settled by
this audit: in `Program.begins` the start-up curve lives at level `N` and
steps run from `m+1` to `m < N`, and `p` indexes `a.S.side m p`, which
suggests `N` = cutoff level, `m` = current scale, `p` = volume index.

**(b) Reset side of the bundle** [E]. `Roof.Sheltered.conducts.machine :
Use.Machine` (`.../Downstream.lean:41`) carries the reset's numerical
conditions: the recipe identity, opened shops, coverage inequalities, the
cubic gate for all `x` above the entry coupling, `PricedReset`, the scheduled
energy bound `Pressure.Testing.Ringing`, and `Cosmos`. `Ringing` and `Cosmos`
are carried over from `PaidView.ship` (see (a)); the reset numerics are
established inside `timberT` (through `Repeat.commissioning`, not read),
which reaches `UVNext.CouplingReset.buys_reset`,
`.can_delay_reset`, `.sensor`, `VerifiedReset.Time.beforeWait` and
`Time.cash` [G]. This is where III.9's entry thresholds and III.2's ledger
enter the step.

**(c) Closure** [E, S]. `Roost.Factor.worksNow`
(`.../Roost/Foundry.lean:59`):

```text
worksNow := CouplingReset.program R.machine.prices
              (Use.supplier hG R.machine R.offering R.originsHere)
```

`Use.supplier` (`.../Downstream.lean:85`) turns the offering into the reset's
`Income` and `Remainder` hypotheses through `Machine.packet`
(`Return.grants`, `Return.earns`, `Return.remainders`);
`UVNext.CouplingReset.program` (`YM/UVNext/COUPLING_RESET/Stability.lean:67`)
gives `Input.Directed.Program` (`YM/PCalc/Band.lean:65`): start-up curves at
every `N, p`, and for every `m < N` and every admissible input curve a
continuous output curve with `Directed.Move` at each point — exact push
identity `u.eval = push v.beta v.eval`, recipe step, `Lives`, the forced
bound `exp(-P.g(J(m+1)) · monitor(m+1)²)`, and the coupling increment bound
`|u.beta - v.beta - alpha N m| ≤ 1` (five fields [E]). `worksNow` is
conditional on what `Roost.Factor` assumes beyond `Sheltered` at
`(1/16, 1/16, 1/8)`: `WorksIn`, `AsDivisors A.B.a.S`, and the target-table
condition for all `j, i`.

**Dependency check** [G]. `glazing` reaches neither `Return.reset` nor
`CouplingReset.advance`; `Use.supplier` and `program` do not reach `glazing`
or `timberT`; `timberT` does not reach `glazing`. No cycle was found on the
spine. This is a statement about reference edges among the listed
declarations, not about the whole cluster.

**Recommendation: separate unit**, owning the order of constants, the
assembly of the bundle fields from the one-step theorems (those of Contract 1
and the further family listed there), and the two-line closure. It should *cite* PU-07 for `program`, `supplier` and the reset price
lemmas, and BG-04 for the ledger. `Roost.Factor` and its projections are
packaging and can be suppressed.

## Proposed ownership and order

| Candidate | Owns | Depends on | Consumer |
| --- | --- | --- | --- |
| PU-09a | `Fluctuations.grants`, `Teller.Grants` | III.1, III.3 | PU-10 |
| PU-09b | `Target.issue`, `Cash`, `Utopia.whittle`; applies `JointLoad.capital → stage → offer` | #12 package 2, PU-04, PU-05/06 | PU-10 |
| PU-10 (a,b) | `Roof.timberT`, `Roof.employeesT`, `Roof.honey`, `Roost.commerce`, `Yearling.batten`, bundle definitions | PU-09a/b, the unowned one-step family below, PU-07 price lemmas, BG-04 | PU-08, PU-07 |
| *unowned* | `Brim.pressings`, `March.takeover`, `Armada.ensemble`, `Yearling.sterling` and the inputs of `Boulevard.emits`, `Roof.ensures`, `Pane.school` | `Cash` (PU-09b) | PU-10 (a,b) |
| PU-08 | `Rain.glazing` and its five steps, `Use.Offering` | bundle statement, #12 package 1, H01–H03 | PU-07 via `Use.supplier` |
| PU-10 (c) | `Roost.Factor.worksNow` | PU-08, PU-07 | trajectory and shooting (`Graces.winnow`, `FullVolume.rodB`, `UVExtension.Orchard.ministry`) |

`unit-plan.md` currently lists PU-09 as depending on PU-08. The source order
is the reverse; that file is outside this task and should be corrected by its
owner once this note is reviewed.

**Not owned by PU-08–PU-10** [G]:

- `Repeat.Daisy.timing` (integrated molecule bound, III.10.3): not reached
  from any spine declaration; its only direct consumer is
  `Repeat.Daisy.Charity.rocketsC` (then `Charity.awakening`,
  `Charity.RG12.annex`). An earlier draft named `YM/FullVolume/Florid/` as a
  consumer; no declaration there refers to it. Candidate for PU-13.
- `Fluctuations.pressure_pricing` (III.10.5a): consumed by
  `YM.Extra.Multi.pricing` and reached from `ThroughLaunch.sailsV`, the
  constructor of `PaidView`. It is an *input* to PU-10, to be owned with the
  schedule (BG-04, III.2) or with PU-09a as its scheduled corollary.
- `RG.Supply.Wait.engine` (III.10.5b, divisible periods): consumed by
  `YM.Pert.deeper`, `Repeat.Legato.noel_columns`, `Repeat.Legato.uv_log` and
  further `Repeat.Legato.*` declarations; not reached from `sailsV` or from the spine. Candidate for
  BG-04.
- `YM.Work.I01`, `I03`, `I04` (markers): not reached from the spine.
- `YM.Work.H04.answer` (continuity of fusion): reached from `worksNow` but not
  from `glazing`; it belongs to the start-up side (PU-07).
- `YM.AnalyticBridge.RelativeLogdet.Priced.chains`, `YM.Next.Rank.determinant`
  and `Dyed.cardinal_spin` are not reached from the spine: the determinant
  normalisation is entirely #14's.

## Obstructions and requested follow-up

1. **The bundle is unfolded to two levels only.** The table gives each field
   of `Roof.Sheltered` (`.../Roof/Income.lean:20`) and `Roof.WorksIn`
   (`.../Roof/Honey.lean:22`) as printed [E]. "Scheduled" means: for all
   `j, i` with `StepStages j i` and all `x ≥ W.betaEntry j`, at block factor
   `D.L j`.

   | Field | Content at second level | Kind |
   | --- | --- | --- |
   | `conducts.hearing : Psalm.Stage.Cadence` | `Heir.Suite.Earlier`, `Clockwork.Funded`, `Heir.Suite.Offers`, `Folio.Secured`, `Psalm.Stage.Listens`, and `(t j i).θ ≤ (d j i).ε / 32` for the menu `t = Solo.guardMenu Q p` | Gaussian-sector prices of the `JointLoad` chain; not unfolded |
   | `conducts.sustains : Psalm.Solo.Sustained` | scheduled `Psalm.Solo.Reset` | not unfolded |
   | `conducts.machine : Use.Machine` | recipe identity, shops, coverage, cubic gate, `PricedReset`, `Ringing`, `Cosmos` | reset numerics and scheduled energy bound |
   | `conducts.starts` | `Progress.DirectedRecipe.Origins` | start-up curves |
   | `conducts.full : Bid.Sworn` | the gauge quadratic form of every bed is invariant under the signed lattice moves | symmetry of the free kernels |
   | `conducts.income.grow : Planning.Permits` | on the register `Planning.Purchase` | scheduled activity bundle; not unfolded |
   | `conducts.income.earns` | scheduled `Cash.armK ≤ c · pair.strong(β_F, β)` for `β` in the band | numerical: forced weight within `forecastK` |
   | `agenda` | support exponent `+3 ≤` earn rate and `≤ t`; halo `+5 ≤ r` | numerical |
   | `range : Opera.Treble` | scheduled `(a + 3)/B(x) ≤ width/2` | numerical |
   | `pipes : Roof.Pew` → `Roof.Verandah` | for every step with `Works`, every `Cash` bundle, budget point and `March.Captain` jet bundle: `Brim.Houses` at prices `Height.heap G (s.profile i) c₂ · δE(x)`; guarded by `s.first ≤ i` and further `Verandah` side conditions not listed here | scheduled analytic estimate, conditional on `Cash` |
   | `peak : Height.Rich` | scheduled `1 ≤ X`, `X³ ≤ exp(mark)`, tree degree price `≤ 1/2`, and further clauses | numerical; read in part |
   | `jewels : Height.Tenement` → `Height.Skill` | growth inequality, and for every step with `Works`, `Stamp` and `Cash` bundle: existence of a `Silica.Heavy` conduit and `March.Armada` with `collars · salary · 2 ≤ β_F^{wanting}` | scheduled analytic estimate with rate `-7/16` |
   | `WorksIn.chip : Boulevard.Pollened` | scheduled `Boulevard.Portaged` | not unfolded |
   | `WorksIn.year : Yearling.Acre` | scheduled `Yearling.Stargaze` | not unfolded |
   | `WorksIn.terms : Roof.Autumn` | scheduled `Roof.pan`; shell and growth sizes | not unfolded; sizes numerical |
   | `WorksIn.plaza : Pane.Planks` | scheduled `Pane.Morning` | not unfolded |

   The analytic fields quantify over *all* `Cash` bundles and all steps, so
   they are one-step statements evaluated above the entry coupling, not new
   estimates on a trajectory [E]. An earlier draft concluded that they are
   therefore consequences of Contract 1; that inference was wrong. The last
   line of `Roof.employeesT` (`YM/MergeProof/Retreat.lean:31–41`) shows which
   lemma yields each field of `Sheltered` [S]:

   | Field | Produced by | Reaches a Contract 1 anchor? [G] |
   | --- | --- | --- |
   | `conducts` | `Repeat.commissioning` (`YM/MergeProof/Serenity.lean:29`) | `JointLoad.capital` chain only |
   | `agenda` | hypothesis of `employeesT` (numerical) | — |
   | `range` | `Opera.conducts` | none |
   | `pipes` | `Roof.pews` → `Roof.tapes` → `Brim.pressings` | none |
   | `peak` | `Height.season` | none |
   | `jewels` | `Height.haste` ← `Height.beneath` ← `March.takeover`, `Armada.ensemble` | none |

   `WorksIn` is produced by `Roof.honey` from `Boulevard.emits`,
   `Yearling.brine` (← `Yearling.batten` ← `Yearling.sterling`),
   `Roof.ensures` and `Pane.school`. `Repeat.budgets`
   (`.../Instruments.lean:36`), `Height.beneath`, `Roof.faceting` and
   `Repeat.pockets` (`.../Rent.lean:76`) discharge hypotheses of `employeesT`
   inside `timberT`; `budgets` is the one that reaches `Fluctuations.grants`,
   `Target.issue` and `Utopia.whittle`. (An earlier draft cited
   `Roof.budgets` and `Roof.pockets`, which do not exist.)

   `conducts.full` is a field of the *conclusion* of `timberT`, so it is a
   hypothesis of `Rain.glazing` only; `timberT` delivers it from `G.Simple`
   and `PaidView`, whose `Torrent` already carries a `Bid.Sworn` clause. It
   is stated for the realised horizon of the directed input. The external
   outline (§7, item 2) is reported to record its proof along the selected
   trajectory as unchecked; that document was not re-read for this claim.
   *Remaining follow-up:* unfold the third-level predicates named in the
   table, and read the statements of the further one-step theorems.
2. **`Cash`, `JointLoad.stage` and `Clockwork.offer` remain [G]**; the other
   Contract 1 statements were read in source, not all of their defining
   predicates (`Works`, `Intake`, `Stamp`, `Sales`, `Buy`, `Ticket`).
3. **Three closure variants are in the headline closure:** `Roost.commerce`
   (hypothesis `PaidView`; consumer `Repeat.Legato.expenders`),
   `Roost.companyK` (`ThroughLaunch.Perceived` and a `τ > 0`,
   `YM/FullVolume/Roll/Linger.lean:23`; consumer
   `YM.Integration.NativeSelection.FundedCompanySelection.company`) and
   `Roost.uv_commerce` (`UVExtension.Case.Purchased` and a `Guild.Tool`,
   `YM/UVExtension/Case/Trading.lean:22`; consumer `Repeat.Legato.multitude`).
   Their conclusions differ in at least one clause (`companyK` adds
   `Repeat.Pocket R' S`). Which variant each headline result uses, and whether
   one statement implies the others, is open. `Roost.company` and
   `Roost.commerceUV` are outside the closure.
4. **`Return.gaussian` versus the push.** The step's output identity is for
   the Gaussian-sector expression. The licence and the equality with the
   push are `Return.earnings`, which is used on both sides: by PU-08's
   identity step (through `Opera.symphony`) and by the reset
   (`Return.grants`). It should be stated once, as an application of #12's
   package 1, and cited by both.
5. **Shared notation.** `forecastE`, `forecastK`, budget points, "curve" and
   "lives" need glossary names; referred to #10.

## Literature leads (unverified)

No statement below has been compared with the source's definitions.

- T. Bałaban, *Renormalization group approach to lattice gauge field theories*
  I–II, Comm. Math. Phys. 109 (1987) and 116 (1988); *Large field
  renormalization* I–II, Comm. Math. Phys. 122 (1989): small-field step,
  R-operation and large-field bounds. Threshold `x^{-1/2} e^{(log log x)²}`
  and the hysteresis conventions are to be compared with his `p(g)` regions.
- R. Kotecký, D. Preiss, Comm. Math. Phys. 103 (1986): rooted polymer sums.
- J. Dimock, *The renormalization group according to Balaban* I–III: a
  possible model for the exposition of Contract 2; applicability unchecked.

## Evidence

Inspection used a sibling checkout `../OpenAI-YM` of the upstream project at
commit `1dba6965d734bac06951579601b90e985033ee45`, which adds only a CI
workflow and `.gitignore` to `3456e5e`; `diff -rq ../OpenAI-YM/YM Lean/YM`
printed nothing. It contains a completed build (9470 `.olean` files under
`.lake/build/lib` for 9457 sources; toolchain `leanprover/lean4:v4.32.0`).
The build itself was not run or re-verified in this session.

- `lake env lean t1.lean` with `#check @YM.Next.Fluctuations.grants`:
  `∀ {G : Gauge} (P : Pressure.Teller G), P.Grants`.
- `lake env lean t2.lean`, `t3.lean` (options `pp.proofs false`,
  `pp.deepTerms true`): `#check`/`#print` of `Rain.glazing`, `Rain.sprint`,
  `Rain.varnish`, `Rain.blinking`, `Rain.topped`, `Roof.arches`,
  `Roof.timberT`, `Roost.commerce`, `Roost.companyK`, `Roost.uv_commerce`,
  `Roost.Factor.worksNow`, `Graces.winnow`, `CouplingReset.program`,
  `Roof.Sheltered`, `Touring`, `Roof.WorksIn`, `Roof.Pew`, `Height.Rich`,
  `Height.Tenement`, `Opera.Treble`, `Roof.Embrasure`, `Return.atlas`,
  `Collection.Local`, `Collection.Compared`, `Time.forecastE`,
  `Time.forecastK`, `CouplingReset.Supplier`, `Usable`, `Income`,
  `Remainder`, `Input.Directed.Program`, `Input.Directed.Move`,
  `ThroughLaunch.PaidView`, `Org.Alloy`, `Org.Metals`. Two mistyped names
  (`YM.RG.Shoot.Directed.Program`, `.Move`) gave "unknown constant" and were
  re-queried under `YM.Input.Directed`. `Height.Rich`, `Income`, `Remainder`
  and `PaidView` were printed but only partly read.
- `#print axioms` for `Roost.Factor.worksNow` and `Roost.commerce`:
  `[propext, Classical.choice, Quot.sound]` each.
- Source read: `.../Rain/Glazing.lean` (whole file), `.../Roost/Foundry.lean`
  (whole file), `YM/AnalyticBridge/VERIFIED_RESET_STEP/Downstream.lean`
  lines 14–95, `YM/MergeProof/Trading.lean` lines 15–40,
  `YM/MergeProof/Retreat.lean` lines 40–64, `YM/Pressure/Seeds.lean` lines
  86–183, `.../CONNECTED_ACTIVITY_JETS_E6/Issue.lean` lines 25–110,
  `.../CONNECTED_ACTIVITY_JETS_E6/Das.lean` lines 24–62,
  `.../V9_JOINT_ENDPOINT_LOAD/Costs.lean` lines 30–100.
- `lake env lean t4.lean`: `#print` of `Psalm.Stage.Cadence`,
  `Psalm.Solo.Sustained`, `Receiving`, `Roof.Verandah`, `Height.Skill`,
  `Boulevard.Pollened`, `Yearling.Acre`, `Roof.Autumn`, `Pane.Planks`,
  `Bid.Sworn`, `Service.simpleOrigins`, `Register`, `Targets`, `Expenses`;
  no errors.
- **[G] graph.** `../OpenAI-YM/graph-compiled/{nodes,refs}.tsv` is an
  untracked local artifact of that checkout (170 498 nodes, 15 186 855
  reference rows, a `reached` flag for the headline closure). It is not part
  of this repository and its generation was not audited; every [G] claim
  should be reproduced by the reviewer. Three short Python scripts computed
  (i) theorems of the five packages referenced from outside them by reached
  declarations: 1518 (678 in `RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP`,
  517 in `CONNECTED_ACTIVITY_JETS_E6`, 153 in `Bid`, 128 in
  `V9_JOINT_ENDPOINT_LOAD`, 42 in `Next/FLUCTUATIONS`); (ii) transitive
  reference closures of the spine declarations against the anchors named
  above; (iii) direct referrers of each anchor.
- Overlap search: issues #2–#15, #22, #26, #29 and PR #18 at 2026-11-11
  20:56 UTC; `Bots/notes/` is empty. #12's merged audit was read for its
  consumer edges.

**Not done:** no proof body other than those listed was read; the
third-level bundle predicates, `Cash`, `JointLoad.stage`, `Clockwork.offer`,
the statements of the further one-step theorems, the proof of `ThroughLaunch.sailsV` and the proof of
`CouplingReset.program` were not inspected; no literature source was opened;
the Lean project was not rebuilt.

**Author-side self-check (2026-11-11, after commit `7c69d33`).** Two fresh
agent passes over disjoint halves of this note re-elaborated the cited
declarations (`lake env lean` on their own scratch files: `#check`, `#print`,
`#print axioms`; no errors other than mistyped names), re-ran the reference
closures on the same graph, and read `Retreat.lean`, `Trading.lean` 20–48,
`Opera.lean` 60–100, `Inputs.lean` 28–95, `Roof/Honey.lean`,
`Brim/Level.lean` 61–73 and `PCalc/Band.lean`. The author then confirmed each
reported discrepancy in the source. Corrected as a result: the claim that the
bundle follows from Contract 1; the names `Roof.budgets`/`Roof.pockets`; the
source of `WorksIn`; where the push identity is used; the consumers of
`Daisy.timing` and `Wait.engine`; the field count of `Directed.Move`; and the
smaller items marked "earlier draft" above. All cited names, kinds, paths and
the four Contract 1 quantifier orders were confirmed. This check was run from
the author's account and is **not** the independent correspondence review.

Agent assistance: Claude Code, directed by `mgubi`.
