# C02 review, part 1: Lean correspondence

- Unit: work package C02 of YM-000026; this part covers `rg-construction.tex`, `rg-multisource.tex`, `rg-menu-jets.tex`, `rg-price-receipts.tex`, `finite-menu-history-handoff.tex` and the C02 records as they concern these chapters (`SOURCE-LEDGER.md`, `RESULTS.md`, the four `rg-*-evidence.md` files).
- Role: Lean correspondence (independent reviewer).
- Human reviewer: `schmittj` (agent review; no human acceptance recorded).
- Agent assistance: Claude (Opus 5.5) agent, session `schmittj-claude-c02-review-20261112`, part 1. No subagents.
- Worktree: `/home/jo314/ym-wt/c02-review` at `1749b55c29f19bb5ab0d17b488169c087cb22c15`; source `Lean/` at pinned revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Declarations were read in source text only (`grep`, `sed`); no Lean elaboration, build or `#print axioms` was run, so hidden instances and coercions were inspected only as far as visible in the source text.
- Outcome: the chapters follow the public route and the cited declarations say what the English says, with the discrepancies below (none is a false correspondence of a main statement). Changes requested for L1–L3; L4–L6 are record NITs.

## Public route

I verified the following links in source text: `YM.Independent.constructionRun` (`Lean/YM/Independent/ConstructionRun.lean` 14–28) selects the run with `R2I.RG05Joint.selectRunWithTreasuryPeriod_preselected_quote_orders_postnumeric` and choice `NativeComponentRecipe.Choice`; `YM.Integration.NativeComponentRecipe.available` (`NativeComponentRecipe.lean` 54–59) obtains its flat supplier from `YM.RG08.Flat.entrance_gate`; `entrance_gate` (`Lean/YM/RG08/Flat/Entrance.lean` 28–51) calls `spacing_choice` and `supplies`, and `supplies`/`meshed` (`Mesh.lean`) call `YM.RG08.Flat.World.overlap`. For the nonlinear step, `YM.PhysicalNext.Repeat.Legato.Bandage.paneer` (`Lean/YM/MergeProof/Wax.lean` 44–69) calls `YM.PhysicalNext.Repeat.Mallow.Many.ripe` (`Tanger.lean` 73–90), which calls `Photo.bidding`, `Many.usable`, `crowd2`, `Photo.shade` and `live`. I did not re-trace the links from `constructionRun` to `paneer` (the `Run.again`/`ahead`/`escape` chain); for that I rely on `rg-construction-evidence.md`. No Overlay/Table construction appears in these chapters; Hearth/Accent suppliers are not used by them (the C02 package's Hearth/Accent check belongs to the centered chapters).

## Findings

### L1. Flat theorem applied to the auxiliary (shadow) horizon (manuscript; paragraph rewritten by PR #82)

`rg-construction.tex` 146–165 and Remark 502–516. In `entrance_gate`, `World.overlap` is applied (through `spacing_choice`, `supplies`, `meshed`) to the levels `shadow a γ HC.fit` (`Lean/YM/RG08/Flat/Shadow.lean` 25–40: same schedule, stage profile replaced by `rearrange`) and to the horizon `Y` from `retained_support`; the selected run's horizon `T` receives only `output (Y.H t i) = output (T.H t i)` via `YM.RG08.Flat.same_shadow` (Shadow.lean 52). The chapter's "auxiliary factorization … preserves the quadratic output" is accurate, but "Realization applies that supplier to the very same selected schedule and horizon" (Remark) should add that the theorem's packets concern the auxiliary horizon. Requested: one sentence (see mathematics I2).

### L2. Theorem `thm:ex-lattice-volant-supplier`: conclusion and hypotheses versus the source (manuscript, pre-existing)

The English splits what the source does in two places: the conversion (proof, first half) is `YM.Merge.Palette.deck` (`Lean/YM/MergeProof/Permit.lean` 37–) via `YM.Merge.Photo.bidding` (`Tinder.lean` 36–48), whose output is `Palette.Plot` (`Garden.lean` 22–24), consumed by `Palette.accrued`/`shrink`/`field` (Garden.lean) and hence by `Palette.lucent`; the grouping (second half) is `YM.MergeProof.Accent.towing` (`Endow.lean` 19) used by `Magma.exquisite`/`excavation`, with the identities of `Canopy` (`Copse.lean` 15–18). The theorem's stated conclusion matches `Canopy.buyer` (exponents $b+1/2$ with budget 1, $b+1$ with budget straw, quiet profile, singleton `owl` sum, push `play` with `Poly.pass`), but the conversion conclusion (Plot) is missing, and the hypotheses of `deck` (`he : 4 ≤ Q.relative`, `hy : 100 ≤ R.p.supportExponent`, `ht : foam Q L`, `hv : R.p.B ≤ 2*radiusB x`, `hh` occupancy, `hQ`/`hh'` rooted offer and `shipPrice`) are said to be "stated in the proof". Also the English attributes $4\varepsilon_Q<e_1$ to foam/radius/relative; in `deck` it is `Q.grants.1` via `Y.laws.intake.exponent` (Permit.lean, line defining `hu`). Requested: see mathematics G2/N1.

### L3. Name "pass" (manuscript, pre-existing)

`play` (`Lean/YM/MergeProof/Hens.lean` 16) is $e^{E(U)}\cdot(\mathrm{Poly.pass}(F\,U)*\mathrm{field}(K,\mathrm{flags}))$ with `YM.Marker.Poly.pass` the truncated exponential (`Lean/YM/Marker/Truncated.lean` 29). `rg-construction.tex` (`eq:ex-lattice-volant-play`) writes "pass" without definition; `rg-multisource.tex` uses $\mathsf{Pass}$ for the score-limit map (source `Switch.sound`/jet) and writes the exponential separately. The two displays correspond to the same `play` only after identifying pass with exp on nilpotent elements. Requested: see mathematics I3.

### L4. Exponent constant $c_1$ (manuscript; not an error)

`thm:ex-lattice-rg-construction` proof says $c_1=\theta/2$, $d_1=d$. In the source, `World.overlap` obtains `Fade` of the terminal-only source from `Fade.of_top` with exponent 1 (`Rate/Shadows.lean` 83–87), then `fade_solve` (`Rate/Ascent.lean` 118–132) uses $\mu=\min(c,\theta/2)=\min(1,\theta/2)$; $d$ is unchanged. The English applies `prop:ex-lattice-flat-rate` with $c_0=\theta$ (valid since the source is zero away from the top), giving $\theta/2$. Both are valid; for the funded producer $\theta=1/2$ they coincide ($1/4$). No change required; the evidence record could note the difference.

### L5. Evidence-file paths (records, pre-existing, not PR #82)

`rg-multisource-evidence.md` line 35: `YM.MergeProof.Accent.towing` is in `Lean/YM/MergeProof/Endow.lean`, not `Accent.lean`. `rg-menu-jets-evidence.md` line 20: `YM.Merge.Switch.Paid.works` is in `Lean/YM/MergeProof/SwitchCost.lean` (61), not `Switch.lean` (`Models.exact` is in `Switch.lean` 59). `rg-construction-evidence.md` inspection list: `Many.usable` is in `Stage.lean` (79), not `Paprika.lean`. `rg-multisource-evidence.md` gives the `cools` allowance as $\beta_F^{-1/4}$ in its table and $\beta_F^{-1/8}$ in note 3; the $\beta_F^{-1/8}$ bound is `Many.fanning` (`Mallow/Seminal.lean` 82). These files are canonical read-only inputs; the corrections belong in the author's ledger.

### L6. `SOURCE-LEDGER.md` entries for these chapters (records)

Checked and correct: finite flat interval (`World.overlap`, `Provides`, `Funding`; the remark that `same_shadow` equates quadratic outputs only); single menu and finite-list response (`Many.ripe` exponents $\nu_f-4$, $\nu_c+1/2$ at price one, $\nu_c+1$ at straw; `Menu.Offer` fine sites in fine crests; `Volant.reserves` parent occupancy; `Extra.Multi.Occupancy` and the fibre inclusion); `paneer` (station and probe at fine `hatBeta`, both support exponents ≥ 100); price rows (`Tariff`, `thaws`; `straw`/`stems` with `lauge`, exponents $-\mu M^2/16$ and $-\mu M^2/8$); score algebra (`Models.mul`, `Paid.mul`, `issue` in `SwitchProd.lean`; `Paid.exponential`, `soundExp` in `SwitchCost.lean`); single jet (`v0`, `v1`, `live`, `sandboxK`). Not checked: `Menu.inventory`, `Menu.stroke` beyond their signatures (they exist at `Plaza.lean` 17 and `Copse.lean` 51), and all service/census/centered entries (other parts of this review).

## Correspondence checked, chapter by chapter

- `rg-construction.tex`. Data items 1–3 ↔ `World.Provides` (`plan`: `Horizon.Suffices`, `PREC/Stacks.lean` 132–139; `data`: equality of the `T` field, a `Cross L (TypeFace 2) (TypeFace 2)`, with `(destination …).duo penalty`) and `World.Funding` (`lit`, `narrow`, `shared` = $w(J_i)\le$ `bridgeWidth` $=\min(1,\alpha(J_{i+1}),\alpha(J_i))$, `gains`, `folds`, `earned` with `drop` $=e^{-\theta(t_{i+1}-t_i)}$, `top_cap` = `Stair.Poly` of the terminal-only array). $\mathcal A_i$ = `header` = `allotment` = $m\cdot m\cdot\Omega_{j}\cdot e^4\Omega_j\cdot\Omega_i$; $\nu_i$ = `quote` = `neutralCoin` $=m\,q\,(m(2/\tau)t)/L$. Age = `Stair.age` $=2+Z+|t_i-t_k|$. Funded producer ↔ `spacing_choice` (`Length.lean` 64–93: `curve`, `before`, `entrance`, `tickets`, `Delay`, `Lambda'` $=3+\log\widehat\beta$, `universeClock`), `Spacing.funded` (`Mesh.lean` 56–66, top constant `card Faces*(A+A)`). Terminal lemma ↔ private `at_end` and `turn_class` (`Packets/Present.lean` 52). One-step lemma ↔ private `to_here` (hypotheses `hu`, `hσ`, `hg`, `hv` = the width conditions omitted from the English statement, see mathematics I1; travel from `travels_route`). Theorem ↔ `World.overlap` + private `existsRows` (cost `topTab·weight⁻¹`, exact recurrence). Volant ↔ `deck`, `bidding`, `root_hit` (`Extra/MULTISOURCE_BOUNDS/Root.lean` 161: `Rooted` at $a+1$ ⇒ `Ac.Hit` at $a$ with budget $\mu\cdot$`siteFactor`$\cdot c$), `towing`, `Canopy`, `Volant`; definitions `shipPrice`, `ribbon` (`Daisy/Solvent.lean` 24), `Target.goal`/`rate` bounds $-1/2<\mathrm{rate}<0$ (`OptionCost.lean` 74–75), `Footprint.preCost` = `ballCost(h+6)` = $(2(h+6)+1)^4$, `siteFactor` (Root.lean 134), `Poly.price` (`Marker/Weight.lean` 76) on a `Census` (`Marker/Console.lean` 22–26). Matched, with L1, L2, L3.
- `rg-multisource.tex`. `Many.usable` (`Stage.lean` 79–): costs `r4`, `2*d4`, straw; `Palette.fair`/`lace` (`Dreams.lean` 34–37), `lucent` (66, from `log_hit_tail` depth 0 on `Palette.field`), `sizes` (`Steps.lean` 43), `Switch.Paid.sub` for the subtraction at cost $2\ell_i$. `Palette.field` (`Garden.lean` 62) gives exactly $4e^{E_0}P_1+4P_0/(1-\rho)\le V_Q=10(P_0+E')$. Second row: `straw`, `stems` (`Mallow/Eco.lean` 52–53), `lauge` $=\exp(-v\,C\,M^2)$ (`Mallow/Stove.lean` 20), `Payments.Rates` (`Progress/DIRECTED_RECIPE/Tender.lean` 33–39, `inflation` $=e^\kappa a+2b$), `Bid.quote` $=e^{-\kappa}(e^\gamma-1)$ (`Bid/Kitchen.lean` 18), `softNeed`/`softReset`/`hitNeed`/`lowHard` (`AnalyticBridge/VERIFIED_RESET_STEP/Investor.lean` 25–27, `Quotes.lean` 26, 107), `Spicy.fruit`/`summer`/`opens`/`june` (`Ginger.lean` 16–18, 42), `Footprint.payment` (`Push/ABSOLUTE_SUMS/Footprint.lean` 37–42), `raiser` (`Marlin/Pylon.lean` 19: only the support exponent changes). Canopy: `Menu.virtue`/`paid`/`purchase` (`Buys.lean` 24–37), `Photo.shade` (`Shaded.lean` 31), `Many.ripe` passes `crowd2` (raised path) to `shade`. Matched, with L3 and the omission noted in mathematics I5.
- `rg-menu-jets.tex`. `Many.v0`, `v1` (`Mirrored.lean` 65–66), `live` (72–78: jet $=r_A(i)\cdot$`tonic`, derivative via `loner` and chain rule), `sandboxK` (`Coffer.lean` 51: hinge = `deriv` at 0 of the same one-leaf final response), `Switch.Models.exact`. Matched.
- `rg-price-receipts.tex`. `Tariff` fields (`Revenue.lean` 35–43) equal the manuscript's $f,y,k,z$, shipment and lodging/credit inequalities exactly; `station` $=x^{-1}$, `probe` $=x^{-2}$, `radiusTab`; `fineMonitor` $=P(\beta_F)$ with $P(s)=\exp((\log\log s)^2)$ (`Push/ABSOLUTE_SUMS/Delay.lean` 24, `Vac/Treasury.lean` 72); `betaF` $=x+s_G\log L$ (`Pressure/Seeds.lean` 23). The English proof is a reorganized proof of `thaws`, not a translation; I did not read the body of `thaws`. Matched.
- `finite-menu-history-handoff.tex`. `paneer` conclusion: `Volant` with input exponent `K1.supportExponent-4`, allowance `station(hatBeta(m+1))`, outputs `K0.supportExponent+1/2` (budget 1) and `+1` (straw at `hatBeta m`), and `Accent.Duty` with probe; the three displayed inequalities are `hp.buy` (fine radius `K1.B`), `hp.lodging`, `hp.credits` (coarse radius `K0.B`); `hatBeta(m+1)=betaF(x0,L)` (`hv`); `hatBeta` affine (`RG/History.lean` 79). Matched.

## Lean declarations opened

| Fully qualified name | Path | Matched |
| --- | --- | --- |
| `YM.RG08.Flat.World.overlap` | `Lean/YM/RG08/Flat/World.lean` 165 | yes (constants: L4) |
| `YM.RG08.Flat.World.Provides`, `.Funding`, `.existsRows` (private), `YM.RG08.Flat.at_end`, `.to_here` (private), `.FlatRep` | `Lean/YM/RG08/Flat/World.lean` | yes (one-step statement: mathematics I1) |
| `YM.RG08.Flat.bridgeWidth`, `.header`, `.quote`, `.topTab` | `Lean/YM/RG08/Flat/World.lean` 21–24 | yes |
| `YM.RG08.Packets.neutralCoin` | `Lean/YM/RG08/Packets/Lines.lean` 84 | yes |
| `YM.Pert.Bulk.allotment`, `.fine_share`, `.values` (statement) | `Lean/YM/Pert/Bulk/Keys.lean` 14–20 | yes |
| `YM.Pert.Bulk.pre` | `Lean/YM/Pert/Bulk/Coin.lean` 16 | yes |
| `YM.RG08.Flat.saddle`, `.turn_class` (statement) | `Lean/YM/RG08/Packets/Present.lean` 15, 52 | yes |
| `YM.Precision.Horizon`, `.Horizon.Suffices`, `.Towers`, `.Towers.Deep` | `Lean/YM/PREC/Stacks.lean` 70–139 | yes |
| `YM.Next.Free.Flight.duo` | `Lean/YM/Next/FREE_KERNELS/Primal.lean` 24 | yes |
| `YM.RG08.Rate.Stair` (`age`, `drop`, `weight`, `Poly`, `Fade`) | `Lean/YM/RG08/Rate/Stair.lean` | yes |
| `YM.RG08.Rate.Stair.poly_solve`, `.fade_solve` | `Lean/YM/RG08/Rate/Ascent.lean` 66, 118 | yes |
| `YM.RG08.Rate.Stair.Fade.of_top`, `.Fade.cap` | `Lean/YM/RG08/Rate/Shadows.lean` 83, 90 | yes |
| `YM.RG08.Flat.Spacing`, `.Spacing.funded`, `.meshed`, `.supplies`, `.clock`, `.berth` | `Lean/YM/RG08/Flat/Mesh.lean` | yes |
| `YM.RG08.Flat.entrance_gate` | `Lean/YM/RG08/Flat/Entrance.lean` 28 | yes (shadow: L1) |
| `YM.RG08.Flat.curve`, `.before`, `.entrance`, `.tickets`, `.Delay`, `.Lambda'`, `.universeClock`, `.spacing_choice` | `Lean/YM/RG08/Flat/Length.lean` | yes |
| `YM.RG08.Flat.adjust`, `.shadow`, `.same_shadow` | `Lean/YM/RG08/Flat/Shadow.lean` 25–52 | yes |
| `YM.RG.Calendar.hatBeta` | `Lean/YM/RG/History.lean` 79 | yes |
| `YM.Merge.Palette.shipPrice`, `.deck` | `Lean/YM/MergeProof/Permit.lean` 35, 37 | yes (L2) |
| `YM.Merge.Photo.bidding` | `Lean/YM/MergeProof/Tinder.lean` 36 | yes |
| `YM.MergeProof.Menu.Offer` | `Lean/YM/MergeProof/Fruit.lean` 19 | yes |
| `YM.MergeProof.Menu.Canopy`, `.Volant`, `.stroke` (signature) | `Lean/YM/MergeProof/Copse.lean` 15, 20, 51 | yes |
| `YM.Extra.Multi.Rooted`, `.Occupancy`, `.siteFactor`, `.root_hit` | `Lean/YM/Extra/MULTISOURCE_BOUNDS/Root.lean` 67, 95, 134, 161 | yes |
| `YM.MergeProof.Accent.towing` (signature) | `Lean/YM/MergeProof/Endow.lean` 19 | yes (evidence path wrong: L5) |
| `YM.PhysicalNext.Repeat.Mallow.Many.ripe`, `.tunes`, `.sharp` | `Lean/YM/MergeProof/Tanger.lean` 60–90 | yes |
| `YM.PhysicalNext.Repeat.Legato.Bandage.paneer` | `Lean/YM/MergeProof/Wax.lean` 44 | yes |
| `YM.Merge.Palette.Plot`, `.accrued`, `.shrink`, `.field` | `Lean/YM/MergeProof/Garden.lean` 22–100 | yes |
| `YM.Merge.Palette.lace`, `.fair` (statement), `.lucent` | `Lean/YM/MergeProof/Dreams.lean` 34–69 | yes |
| `YM.Merge.Palette.sizes` (statement) | `Lean/YM/MergeProof/Steps.lean` 43 | yes |
| `YM.PhysicalNext.Repeat.Mallow.Many.usable`, `.listens` (statements) | `Lean/YM/MergeProof/Stage.lean` 64, 79 | yes |
| `YM.PhysicalNext.Repeat.Mallow.Many.crowd2`, `.corps2` (statements) | `Lean/YM/MergeProof/Paprika.lean` 63, 74 | yes |
| `YM.PhysicalNext.Repeat.Mallow.Many.crowd`, `.money` (statements) | `Lean/YM/MergeProof/Signed.lean` 65, 97 | yes |
| `YM.PhysicalNext.Repeat.Mallow.Many.fanning` (statement) | `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mallow/Seminal.lean` 82 | yes |
| `YM.PhysicalNext.Repeat.Mallow.cools` (statement) | `…/Mallow/Reseve.lean` 32 | yes |
| `YM.PhysicalNext.Repeat.Mallow.straw`, `.stems`, `.Arrives` (head) | `…/Mallow/Eco.lean` 52–56 | yes |
| `YM.PhysicalNext.Repeat.Mallow.lauge` | `…/Mallow/Stove.lean` 20 | yes |
| `YM.Merge.Spicy.fruit`, `.summer`, `.opens`, `.june` (statement) | `Lean/YM/MergeProof/Ginger.lean` 16–43 | yes |
| `YM.PhysicalNext.Repeat.Marlin.raiser` | `…/Marlin/Pylon.lean` 19 | yes |
| `YM.AnalyticBridge.VerifiedReset.Collection.softNeed`, `.hitNeed`; `YM.AnalyticBridge.VerifiedReset.Quotes.softReset`, `.lowHard` | `Lean/YM/AnalyticBridge/VERIFIED_RESET_STEP/Investor.lean` 25–27; `Quotes.lean` 26, 107 | yes |
| `YM.Push.AbsoluteSums.Footprint.payment`, `.degreeIncome`, `.preCost` | `Lean/YM/Push/ABSOLUTE_SUMS/Footprint.lean` 37–42, 139 | yes |
| `YM.Push.AbsoluteSums.Animals.ballCost` | `Lean/YM/Push/ABSOLUTE_SUMS/Animals.lean` 148 | yes |
| `YM.Progress.DirectedRecipe.Payments.Rates`, `.inflation` | `Lean/YM/Progress/DIRECTED_RECIPE/Tender.lean` 32–39 | yes |
| `YM.Bid.quote` | `Lean/YM/Bid/Kitchen.lean` 18 | yes |
| `YM.MergeProof.Menu.virtue`, `.paid`, `.purchase` | `Lean/YM/MergeProof/Buys.lean` 24–37 | yes |
| `YM.Merge.Photo.shade` (statement) | `Lean/YM/MergeProof/Shaded.lean` 31 | yes |
| `YM.MergeProof.Accent.play` and `YM.Marker.Poly.pass` | `Lean/YM/MergeProof/Hens.lean` 16; `Lean/YM/Marker/Truncated.lean` 29 | yes (naming: L3) |
| `YM.Marker.Census`, `YM.Marker.Poly.price`, `.toll` | `Lean/YM/Marker/Console.lean` 22; `Lean/YM/Marker/Weight.lean` 74–76 | yes |
| `YM.PhysicalNext.Repeat.Mallow.Many.v0`, `.v1`, `.live` | `Lean/YM/MergeProof/Mirrored.lean` 65–78 | yes |
| `YM.PhysicalNext.Repeat.Mallow.sandboxK` | `Lean/YM/MergeProof/Coffer.lean` 51 | yes |
| `YM.Merge.Switch.Models.exact`; `.Paid.works`; `.Models.mul`, `.Paid.mul`, `.issue`; `.Paid.exponential`, `.soundExp` | `Switch.lean` 59; `SwitchCost.lean` 61, 23, 88; `SwitchProd.lean` 28, 46, 75 | exist (statements only) |
| `YM.PhysicalNext.Repeat.Mallow.station`, `.probe`, `.radiusTab`, `.Tariff`, `.thaws` (statement) | `Lean/YM/MergeProof/Revenue.lean` 30–49 | yes |
| `YM.PhysicalNext.Repeat.Daisy.ribbon`, `.sailUp` | `…/Daisy/Solvent.lean` 24–25 | yes |
| `YM.ConnectedActivityE6.Target` (`rate`, `halo`, `start`, `stop`, `grants`, `relative`, `goal`) | `Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/OptionCost.lean` 63–81 | yes |
| `YM.Push.AbsoluteSums.Delay.fineMonitor`; `YM.Vac.Numbers.P`; `YM.Pressure.betaF` | `Push/ABSOLUTE_SUMS/Delay.lean` 24; `Vac/Treasury.lean` 72; `Pressure/Seeds.lean` 23 | yes |
| `YM.UVNext.CouplingReset.within_alpha` (statement) | `Lean/YM/UVNext/COUPLING_RESET/Precision.lean` 89 | yes |
| `YM.MergeProof.Menu.inventory` (signature) | `Lean/YM/MergeProof/Plaza.lean` 17 | exists |
| `YM.Independent.constructionRun`, `YM.Integration.NativeComponentRecipe.available` | `ConstructionRun.lean` 14; `NativeComponentRecipe.lean` 54 | yes |

## Not checked

- Proof bodies of `thaws`, `usable`, `crowd`, `crowd2`, `corps2`, `money`, `valueP`, `listens`, `lucent`'s `log_hit_tail`, `Mixed.mixed_hit`, `shade`, `towing`, `atlas_here`, `travels_route`, `toward`, `poised`, `turn_class`, `retained_support`; the route from `constructionRun` to `paneer`; `Arrives`, `Pungent`, `stables`.
- The YM.RG patch/block declarations named in the coordinator's note (not used by these chapters).
- Any Lean elaboration, instance resolution or axiom output.
