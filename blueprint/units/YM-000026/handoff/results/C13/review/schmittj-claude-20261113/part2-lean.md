# C13 independent review, part 2 (reader chapters): Lean correspondence

Reviewer: Claude (Opus 5.5), session `schmittj-claude-c13-review-20261113`, reviewer 2 of 3. Source revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. I inspected statements and definitions only; I ran no Lean elaboration. Not an approval.

Summary: Every declaration I opened exists at the cited path and namespace. Its type supports the English statements of the seven chapters, with the qualifications below. Where the English differs from the source, the English is weaker, except for one consumer edge: the small-window producer states less than its consumer uses (finding L2). The PR #103 change (small-window radius quantifier) matches the source. `Venue.aperture` takes `‖Q‖ ≤ R*clearanceFare x` and `paid … (R*clearanceFare x)`; its proof sets `t := R*clearanceFare x` (Chips.lean line 52). `Lift.focused` and `Lift.base_summary` take an arbitrary `t` with `‖v‖ ≤ t ≤ δ`. The manuscript's "fix one admissible `t` and assume `‖v‖ ≤ t`, the price bound at that ball, agreement and clearance" implies these hypotheses because `paid` is monotone in its price (`Remote.paid` is `∀ e, separation … ≤ D → chord (U e) ≤ t`). The conclusions do not involve `t`. The author's ledger account of this repair ("Small-window radius quantifier") is accurate.

## Findings (by severity)

### L1. Statement weaker than the source in uniformity; consumers need the source strength (small-window, lines 68–69, 103–104; pre-existing, adjacent to the PR edit)

`YM.PhysicalNext.WeightedGaussianMarginal45C.Venue.aperture` (`Lean/YM/PhysicalNext/WEIGHTED_GAUSSIAN_MARGINAL_LIMIT_45C/Venue/Chips.lean`, line 31) has the form `∀ (G P Pt hp r R hR), ∀ᶠ x in atTop, ∀ {c f} (S : StepData c f) (T : Tube G S), S.patch = P → Booth Pt S T → Larger S → 100*(1+vista r x) ≤ c.val → ∀ A o, Clears A x o (vista r x) → ∀ V, A.flags = RG.flags (temp x) V → ∀ Q, AgreeNear … → ‖Q‖ ≤ R*clearanceFare x → paid … → ∀ F k q d g Y, … ∀ i, separation o (front A F i) ≤ vista r x/4 → mean ∧ ∀ j, column`. The threshold is chosen before the period, step data, tube, store, centre, configuration, direction, forest, tag, frozen inputs, geometry and coordinates. The manuscript fixes these data first and claims uniformity only "over these admissible $t$, the period and this same history". The proof's constants are source constants and do give the source uniformity, so this is a precision fix to the statement, not a correspondence failure. The same issue appears as F1 in part2-mathematics.md, with the requested wording.

### L2. Producer/consumer edge: index range of the column bound (small-window 82–84 vs. local-gaussian-prices 49–53; pre-existing)

Source: `∀ j : In x A F, |M j i - K (s j) (s i)| ≤ x^(-1/4)` with `M := Local.panoramic T A F k x V g = pane (sectorW G S x A F g) (Rows.gram …) 0`. `YM.AnalyticBridge.LocalGaussianLaws.pane_read` shows `pane W Q 0 j i = (principal Q (W i))⁻¹ ⟨j⟩ ⟨i⟩` when `i, j ∈ W i`. `pane_absent` shows it is `0` otherwise, and `Remote.staff_W` preserves membership under `official`. So the source covers all active `j`. The manuscript states the bound only "for every $j$ in that same selected panel". The consumer uses it "for every actual active row $i$" (names swapped). The source supports the consumer's reading. The producer's English should be strengthened to match it.

### L3. Tier: the manuscript is the tier-0 case of `aperture`, and the pose-margin sentence does not correspond to the proof (small-window 78–80; pre-existing)

`aperture` is stated at radius `vista r x = (r+1)·radiusB x` (`Venue/Space.lean`, `vista_eq`), with target within `vista r x/4`. It reduces to radius `radiusB x` by `Venue.relocate` (`Venue/Width.lean` line 38), which returns a centre `y` with `Clears A x y (radiusB x)`, `AgreeNear` and `paid` at `radiusB x`. The manuscript proposition is the case `r = 0`, where `y = o` (`vista_zero`). Its sentence about "every shifted center … pose margin … width $W$" refers to `InteractingRank.Pose.center`. That mechanism is used by `StrongScope.sight`/`laminate`, not by `aperture` or by the proof in this chapter. The English is a correct, weaker special case, but this sentence should be removed or moved to the consumer.

### L4. Constant bookkeeping (small-window 206–213; NIT)

`YM.AnalyticBridge.LocalGaussianLaws.Lift.focused` (`Subtotal.lean` line 124) bounds `|offCenter ν b i - a i| ≤ N*(D*M*(A*t*widen (till x) t τ)) + M*(E*exp(-s*R))*(X*t)`. The manuscript's `E_0` must absorb `M`. `Lift.pay_mean` (`Cues.lean` line 58) proves that this expression is at most `x^(-7/8)` eventually, at `t = k*clearanceFare x`. The manuscript's monotone use with `t ≤ Rχ(x)` is consistent with this.

### L5. Short-covariance: hypotheses of the exact identity (lines 186–187, 287–295; NIT)

`YM.AnalyticBridge.LocalGaussianLaws.Current.onePlateau` (`Covers.lean` line 114) fixes `t, A` from `s M a`, the odd side, branches and the patch. Its quantifier over beds is `∀ {H p v}, H.metric.strip s M → (∀ f, Floor H p f a v) → ∃ Z, Z.strip t A ∧ …`, so the upper bound `v` does not enter `t, A`. This matches the manuscript's line 135–138 claim exactly. The exact identity then requires `S.kernel = K`, `Larger S`, `3 ≤ c.val`, and a coarse bed `B` with `Floor B C c m W` and `Towers.Diagonal S H B T`. The manuscript's "every admissible coarse period $n\ge3$" should name `Larger` and the coarse-bed floor/diagonal hypotheses. The source forest is the one chosen by `Tree.select` on the three-side block and repeated by `spread`. `Current.earned` (`Covers.lean` line 67) holds for an arbitrary forest `F`, so the manuscript's "fix one forest" is supported. The cut tail in the source is `strip (t/2) (exp(-t/2*d)*A)` for `minusRows Z (shorten d Z)`. The manuscript instead proves its own entrywise tail `A e^{-t h_x}` from the strip bound, which is valid.

### L6. Dawn: source of the `x^{-1/8}` prices (dawn 45–46; minor)

`YM.PhysicalNext.InteractingRank.herald` (`Morning.lean` line 35) has the type `∃ U, 1 ≤ U ∧ ∀ᶠ t in atTop, ∀ x ∈ Icc (t/2) t, ∃ p, ∀ β β', x/2 ≤ β → β ≤ 3*x → x/2 ≤ β' → |β'-β| ≤ γ → Dawn P T s n z w U p (bill (-fo) t) x β β'`. This matches the manuscript's order of choices exactly, including the absence of an upper bound on `β'`. Its proof obtains `Paying … (x^(-(1/8)))` from `YM.PhysicalNext.WeightedGaussianMarginal45C.Issue.Cut.currency` (`Scissors.lean` line 137: `∀ᶠ x, cheque β s M x ≤ x^(-ε)`). The manuscript attributes this price to the short-covariance chapter, which explicitly does not derive it. See F2 in part2-mathematics.md.

## Correspondence checks of other claims (matched)

- Guarded curvature. `YM.PhysicalNext.InteractingRank.laminate` (`Rail.lean` line 197) has the conclusion `Healthy (phase y) Q U ∧ ∀ f t, gauge t f = U → ∀ j, separation r j.1 + 2 ≤ L → |rigid (coloring (t r) (kiosk g r f)) j - (purseMean … (coupling β') j).re + (dKeys … *ᵥ Z) (toPAC j))| ≤ x^(-1/32)`. This matches `prop:readerB-curvature-read` (healthy patch, two-step neighbourhood, the same `purseMean` with `β'` plus the transported Gaussian, error `x^{-1/32}`). The hypothesis `Guards (parasol r (w*walls y)) Y.2 (haze G x β L)` is the guarded event, with `haze = coolFraction*(phase (betaF G x L)/coupling β)` (`Awning.lean` line 63) and `coolFraction = 1/4096`. This equals the manuscript's `‖g z_j‖ ≤ κ_0 t` with `κ_0 = 1/4096` and `t = phase(y)`, `y = betaF = x + slopeConstant·log L`. The pose margin `separation o (parent e) + walls x + 2 ≤ W` matches the dawn chapter's `+w_x+2`. `Sizing` (`CoreBudget.lean`) is `card ColorIndex * ticketPsi z L * 2 ≤ 1/4096`, with `ticketPsi = ticket (TypeFace 2) (psiBudget z / L^2)` and `retractPsi = cheque(TypeFace 2) s (psiBudget z/L^2) x * (priceCore*linkRoom x) + ticketPsi*(priceCore*linkRoom x^2)`. These match the manuscript's `P_0` and `retract` exactly. `linkRoom x = x^(-3/8)` and `stride l x = (1+radiusB x)^l` are in `PhysicalGuard7f546.Curved`, and `coupling β = (√β)⁻¹` is `YM.Next.SectorChange.coupling`.
- Tree covariance. `YM.AnalyticBridge.LocalGaussianLaws.Current.cutHead` (`TellerFold.lean` line 118) states `plane S F * treeInverse G S F H.metric 0 * (plane S F)ᵀ = tensor G (fConditional S H B T)` under `Floor B l c m u`, `0 < m` and `Towers.Diagonal S H B T`. Its proof uses the curl-through identity `through`, the stationarity `fires` and `holder_value`, in the same order as the manuscript. `YM.FreeResolvent.tree_gap` (`Push/FREE_RESOLVENT/Flat.lean` line 198) requires `Larger S` and `Gap (H.acts f) a` and gives the gap `treeFare = min a K.penalty/(1+β+γ)`, with `β = Work.F01.curlFactor` and `γ = probeFactor = 2|Site L|` (`Work/F01.lean` lines 168–172). This matches the manuscript's `min(a,κ)/(1+b_1+b_2)` and the formulas for `β_ℓ, γ_ℓ` in the short-covariance chapter. `YM.Bid.Larger` is `Branches ∧ 100*macroR ≤ f ∧ 1 < c`, which matches "fine side at least one hundred times the macro radius and the coarse side exceeds one".
- Small-window geometry. `Remote.boxCharge x = (radiusB x+80)/20` is natural division, and `Remote.Clears x o r = o ∉ dome (10*radiusB x + r + 1)` (radius `11B+1` at `r = B`). `Remote.Translate` is an `Equiv` of panels built from `staff_inj`, `stockBound` and `clearance`, under `separation o (front i) + boxCharge x ≤ D`. `Remote.chip_repair` needs `separation o (front j) + boxCharge x + 2·span P x ≤ D`, which the lemma's `B/4 + 2p + B/25 ≤ B` (with `span ≤ B/50`) covers. Its bound `clockChip = slotCount(boxCharge)^2 (η+u)⁻¹ matter (E+u)⁻¹` matches `C_x`. `Remote.clearanceFare x = 16(2(radiusB x+1)+1)^5 |PlaqAxes| temp x` matches `χ`, and `Pressure.temp x = x^{-1/2} exp((log log x)^2)`. `Remote.fares` uses `T x = 16·3^5|PlaqAxes| b^5`, which matches `B_R(x)` with `R` absorbed. `Venue.alter` proves `matter A (R t) ≤ matter (R A) t`. `Pressure.radiusB x = ⌈(log x)^2⌉` and `Pressure.Stores.till = radiusB x/100000`.
- Fourier window. `YM.Further.FreeCovariance.KP.Firm` (`KP/Floor.lean` line 17) is a structure with fields `row`, `basic : row.strip α Ω`, `heats n : Numeric (row.acts n) η Ω` for every period, and `initial : row.read 0 = 1`. This matches "strip cost Ω at width α, quadratic lower bound η on every finite period, H(0) = I". I opened `YM.PhysicalNext.RankCovariance.chart_reads` (`RANK_COVARIANCE_ATLAS/Fourier.lean` line 57) and inspected only its statement and the first lines of its alias-sum proof. They are consistent with eq. `actual-chart-sum`, but I did not follow the full proof.

## Declarations opened

| Fully qualified name | Path (under `Lean/`) | Matched |
| --- | --- | --- |
| `YM.PhysicalNext.WeightedGaussianMarginal45C.Venue.aperture` | `YM/PhysicalNext/WEIGHTED_GAUSSIAN_MARGINAL_LIMIT_45C/Venue/Chips.lean` | yes; English is the weaker tier-0 case; uniformity under-stated (L1), column range (L2) |
| `…Venue.alter` | same | yes |
| `…Venue.relocate` | `…/Venue/Width.lean` | yes (not used by the manuscript proof; L3) |
| `…Venue.vista`, `vista_zero`, `vista_eq`, `vista_large` | `…/Venue/Space.lean` | yes |
| `YM.AnalyticBridge.LocalGaussianLaws.Remote.boxCharge`, `stockBound`, `centered`, `Clears`, `live_test`, `clearance`, `Translate`, `translate_card`, `slotCount`, `clockChip`, `chip_repair` | `YM/AnalyticBridge/LOCAL_GAUSSIAN_LAWS/ChipHeal.lean` | yes |
| `…Remote.clearanceFare`, `axial`, `census`, `census_clock`, `fares` (statement and first lines) | `…/NearDelay.lean` | yes |
| `…Remote.paid` | `…/Rounds.lean` | yes (monotone in price) |
| `…LocalGaussianLaws.Lift.focused` | `…/Subtotal.lean` | yes (L4) |
| `…Lift.pay_mean` (statement) | `…/Cues.lean` | yes |
| `…Lift.base_summary` (statement) | `…/Staged.lean` | yes; prose derivation incomplete (F3) |
| `…LocalGaussianLaws.Local.panoramic`, `portrait`, `portrait_head`, `head_entry` | `…/Hop.lean` | yes |
| `…LocalGaussianLaws.pane`, `pane_zero`, `pane_read`, `pane_absent` | `…/Window.lean` | yes |
| `…LocalGaussianLaws.Assembly.sectorW`, `Geometry` | `…/CutGerm.lean` | yes |
| `YM.Pressure.radiusB`, `YM.Pressure.temp`, `YM.Pressure.betaF`, `YM.Pressure.Stores.till` | `YM/Pressure/Seeds.lean` | yes |
| `…LocalGaussianLaws.Current.cutHead` | `…/TellerFold.lean` | yes |
| `…Current.onePlateau`, `…Current.earned` (statements) | `…/Covers.lean` | yes (L5) |
| `YM.FreeResolvent.tree_gap`, `YM.FreeResolvent.treeFare` | `YM/Push/FREE_RESOLVENT/Flat.lean` | yes |
| `YM.Bid.Larger` | `YM/Bid/Station.lean` | yes |
| `YM.Work.F01.curlFactor`, `probeFactor` | `YM/Work/F01.lean` | yes |
| `YM.PhysicalNext.InteractingRank.laminate` (statement and first lines of proof) | `YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Rail.lean` | yes |
| `…InteractingRank.haze` | `…/Awning.lean` | yes |
| `…InteractingRank.priceCore`, `ticketPsi`, `retractPsi`, `Sizing` | `…/CoreBudget.lean` | yes |
| `…InteractingRank.herald` | `…/Morning.lean` | yes (L6) |
| `YM.PhysicalNext.PhysicalGuard7f546.Curved.linkRoom`, `stride` | `YM/PhysicalNext/PHYSICAL_GUARD_7F546/Continuation/Scales.lean` | yes |
| `YM.PhysicalNext.PhysicalGuard7f546.Curved.coolFraction` | `…/Continuation/Fine.lean` | yes |
| `YM.Next.SectorChange.coupling` | `YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Change.lean` | yes |
| `YM.Next.Rank.Paint.phase` | `YM/Next/RANK/NoSpill.lean` | partially (`Hat s * hot s`; `hot` not opened) |
| `YM.PhysicalNext.WeightedGaussianMarginal45C.Issue.Cut.currency` | `YM/PhysicalNext/WEIGHTED_GAUSSIAN_MARGINAL_LIMIT_45C/Issue/Cut/Scissors.lean` | yes |
| `YM.Further.FreeCovariance.KP.Firm` | `YM/Further/FREE_COVARIANCE_KP/KP/Floor.lean` | yes |
| `YM.PhysicalNext.RankCovariance.chart_reads` | `YM/PhysicalNext/RANK_COVARIANCE_ATLAS/Fourier.lean` | statement only; consistent |

## What I did not check

- In the transport chapter, I did not open `crossing_preserves`, `optic_budget`, `train_issue`, `Radian.riveting`/`observatory`/`flown` or `Wall.on_demand`. That chapter's correspondence rests on the ledger's account, which I did not independently verify.
- I did not open `Episode.paid`/`bridge`/`covered_layer` or `colored_reads` (Fourier).
- I did not open `StrongScope`/`scopes`, `shade_auth`, `buys_shade`, `illuminates` or `steady_pass` (guarded), or `retime` (dawn).
- I did not open `Affine.identifies` or `onto_slice`, or other `GaugeProjection` declarations (tree).
- I did not open `cofinal_prices` or `Cut.cut_bounds`/`enough_room`/`Epoch.telescope` (short covariance).
- I did not read the full proofs of `fares`, `pay_mean` or `base_summary`; I checked only their statements.
- I ran no Lean build, kernel replay or axiom check.
