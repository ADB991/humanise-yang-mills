# C13 review, part 1: Lean correspondence

Reviewer: Claude (Anthropic, Opus 5.5), subagent of session `schmittj-claude-c13-review-20261113` (issue #54), reviewer 1 of 3. Worktree `/home/jo314/ym-wt/c13-review` at `be0e87d`; Lean source under `Lean/` at pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Statement types and meaning-determining definitions were read directly; no Lean build, elaboration or axiom replay was run. Agent review, not an approval.

Scope: same seven chapters as `part1-mathematics.md`, with priority on the PR #103 changes to `allarity-planted-compiler.tex`, `actual-mixed-marked-compiler.tex` and `actual-local-compiler-handoff.tex`, and on the records `HANDOFF.md`, `common-tuple.md` (items 1–2 and the C1/C2 note), and `ledger.md` sections "C1/C2 matrix identity", "C1–C8 common-tuple check", "Corrected body and owner energy", the mixed-compiler paragraph of "Marked propagation".

Summary: every correspondence claim I checked holds at the pin, including all three PR #103 repairs that touch the source (actual versus transported-flat matrix; loading positivity via `Export.normal`; upper marker allowance). One description of a source hypothesis in the handoff chapter is wrong (F1 below, mirrored in `part1-mathematics.md` F1). The handoff poses as an input a matrix certificate which the source proves (F2).

## Findings, ordered by severity

### L1. INACCURACY — `actual-local-compiler-handoff.tex` lines 22–24, 261–265 — manuscript — pre-existing

The English describes the hypothesis `2*i.era.coast.a ≤ K/4` of `YM.PhysicalNext.InteractingRank.Soft.accepts_stock` (`Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Soft/French.lean`, line 41) as a bound on "the incoming coefficient in the small-remainder budget" that "pays" the genuine remainder. In the source `coast : Demand` and `Demand.gas c u = Real.exp (-c.a * hot u ^ 2)` (`Lean/YM/Next/RANK/Bird.lean`, lines 21–35); the hypothesis is forwarded to `Soft.weathered` (`Soft/Diamond.lean`, line 21, as `hv` with `α := K`) and used there only in `Wax.flint` (`Blazing.lean`, line 23), whose conclusion is `max (acres v x (betaF G x L)) (Line …) ≤ Real.exp (t*hot (betaF G x L)^2)` with `acres ξ x y = max (gas ξ.era.coast x ^2)⁻¹ (gas ξ.era.coast y)⁻¹` (`Posts.lean`, line 24). It pays forced inflation against owner decay. The additive remainder is paid by `Soft.affixed` (`Soft/Hem.lean`, line 19; conclusion price `e+4*d`) together with `Escalates.reserves` (`Soft/Nuance.lean`, line 50). Requested change as in mathematics F1. Status: open.

### L2. INACCURACY — `actual-local-compiler-handoff.tex` lines 54–59 — manuscript — introduced by PR #103

The English says the selected-row gap and screened covariance estimates are "required ... with the producer matched to it". In the source they are proved, not assumed: `YM.AnalyticBridge.RelativeLogdet.Physical.late_price` (`RELATIVE_LOGDET_TRACE/Year.lean`, line 113) obtains them from `YM.Next.SectorChange.opaqueCost` (`Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Chosen.lean`, line 102), whose conclusion for `U := Rows.gram T x V k (shots S x) A F` is `Pours U … v K ∧ Gapped U η ∧ U.PosDef ∧ Pours (fog … - U⁻¹) … 0 (E*rate (-b) (radiusB x/60)) ∧ (fog …).PosDef`, with the gap from `Gap.not_flat`. `accepts_stock` has no such hypothesis. The English is therefore weaker than the source, and the manuscript has the matching producer `prop:actual-global-row-prices`. The identification itself (actual selected Gram, completed by identity, versus the transported-flat `YM.ConnectedActivityE6.…plate = form.transpose * form + sleepy` in `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Gram.lean`, line 86) is correct. Status: open.

### L3. NIT — `actual-local-compiler-handoff.tex` lines 177–186 — manuscript — pre-existing

"If the base gap is $\eta$": the source's derivative-gap lemma `Covariance.nearby_gap` (`SECTOR_COVARIANCE_JETS/Deposit.lean`, line 33) is applied in `trusting` to the active Gram `pilot … 0` with gap `η`; for the completed matrix `coverall` (`Roof.lean`, line 39) uses `ε = min η 1`. The English radius $r_0=\min\{r_1,\eta/[2(1+U_0)]\}$ and conclusion gap $\eta/2$ match `nearby_gap` exactly (`min r ((η/2)/(1+Z*(sparkCount*C)))`). No action needed beyond F6(e) of the mathematics file.

## Verification of PR #103 repairs against the source

1. Actual matrix (handoff lines 54–62): `Physical.AFull` (`Boards.lean`, line 92) is `(wide (Rows.gram …) (1 : Square (vacant …))).submatrix e.symm e.symm`; `Physical.Certified.text` (`Year.lean`, lines 92–96) gives `Schur.Gapped Q η ∧ Q.PosDef ∧ (fog …).PosDef ∧ Priced … (AFull …) v C (currency b (radiusB x))` for `Q := Rows.gram …`, under `A.flags = RG.flags (temp x) V`. `Certified.wider` covers every recut with `Schur.Bars W (place S) (radiusB x/60)` (English: "windows contain their radius-$B/60$ neighborhoods"). `Covariance.pilot` (`Quote.lean`, line 77) is `gram T x (increment V B) t …`, the actual selected Gram at the incremented field, so the first-derivative subsection also uses the actual matrix. Matched.
2. Constants (handoff lines 67–107): `late_price` sets `L = max M 1`, `h = min η 1`, `Y = safeRate s L h`, `m = Y/2`, `v = m/2`, `C = max L (U*(min (h/2) 1)⁻¹)`, `R = (m-v)/120`, `b = R/2`, `d = b/2`, `θ = (b/4)/(l+2)`, inventories `parcel … 0` and `parcel … 1` with `l = 20` (from `accepts_stock`), side `100*(1+radiusB x) ≤ c.val`. Matched symbol for symbol.
3. First-derivative stock (handoff lines 206–221): `EndpointLoadF16.DetLong.stores` (`PHYSICAL_JOINT_ENDPOINT_LOAD_F16/DLog/Fund.lean`, line 120) is invoked by `accepts_stock` with `(n,k,l) = (2,1,20)`; `Fund.finalCost G n k = 4*letterFee G n k*exp 1*myCost k`, `myCost k = (2*(k+1))^k`, so `myCost 1 = 4` matches $\{2(1+1)\}^1$; `Stock.cover : finalCost*currency d B ≤ currency (d/2) B` matches "at most $e^{-d_0B/2}$"; `Fund.width G k = min (radius G k/2) q.r` with `q.r = r/2` from `coverall` matches $\min\{r_0/2,r_G(1)/2\}$ and "restrict once more to half its radius". `stores` and `late_price` are separate invocations with separate constants, as `common-tuple.md` item 1 and the chapter (lines 216–219) say. Matched.
4. Loading positivity (handoff lines 271–277): `RelativeLogdet.Export.normal` (`RELATIVE_LOGDET_TRACE/Sector.lean`, line 45) takes `Certified S T x v C η b`, a forest `F`, tag `k` and `S.patch.Branches S.kernel G`, and returns `(Native.kinetic T F k x).PosDef ∧ Q.det = (Native.kinetic T F k x).det` for `Q := Rows.gram T x 1 k (shots S x) (voidStore S) F`; `accepts_stock` uses `(Export.normal hS _ _ …).1.det_pos` with the dyed step's own forest `v'.mode` and tag `v'.token`. Matched (English: identity coarse field, empty store, reference forest and tag).
5. Palette receipts (handoff lines 228–230): consistent with `Pump.Grid.Pupil` / `Pump.ballot` as recorded in the ledger; I checked the manuscript side (`actual-palette-warning.tex`), not these declarations' bodies.
6. Marker allowance (mixed lines 218–220): `Display.Docking.purchases` (`Snap.lean`, line 97) concludes `Spot Q (troupe …) lightcast T l r e (salary e*k+salary e*k)`; `enlightens` (line 77) proves the exact $\Gamma+(1-\Gamma)$ factorization using `Glyph.plate_pair` (square of a nonempty marker monomial is zero). The remainder piece uses the rare-event alternative with hypothesis `l * (viewer …).real (away …) ≤ 1`. Matched; the new "pays for" wording is the correct (upper-bound) reading.
7. Uniform interval (handoff lines 238–249, mixed lines 249–306): `Soft.Kraft.prescribes` quantifies `x ∈ Set.Icc (s/2) s` after `Escalates` and before `S, v, n, Tissue`; `accepts_stock` intersects eventual predicates and uses `Perch.half.eventually_ge_atTop r`. `Docking.TimeBand` (`Chimes.lean`, line 70) has distinct `lower : Tailprice L P Q S.coast.e` and `upper : Tailprice L P Q (load S)`, `cadence : exp(kinetics t/4)-1+kinetics t/4 ≤ kinetics t`, `infl : Line … * x^(-1) ≤ 1`, and `risibleQ` uses `Q.B = walls x = M x ^ 2`, matching $B_c=\lceil(\log x)^2\rceil^2$. Matched.

## Records checked

`common-tuple.md` item 2: verified literally in `Soft/French.lean` lines 27–34: after `Escalates`, interval, stretch, `Tissue v.source …` and `Seeks (neutral v) P d x`, the statement chooses `H : Draft v P (retime x) W` and `M : Plate v (retime x) W`, asserts positivity of `v.loading`, then for every `Q` with `Q.p = v.bp` and `25*radiusB (retime x)+30 ≤ Q.p.B` gives `Veins (white v.source) Q z … ∧ BodyGrant v.things v.source … z …` with the same `z := shiftZ O hq.symm (sprouting H M O j)`. Correct. Item 1: correct (separate `late_price` and `stores`). Ledger "C1/C2 matrix identity": correct in every sentence I could check (`Certified.text`, `AFull`, `pilot`, `plate`, `Export.normal`). Ledger "Corrected body and owner energy": `Soft.affixed` conclusion `Q.base = M.base` and price `e+4*d` checked. Ledger mixed paragraph: smallness `(2B_c+1)^4Σ ≤ 1` is `Risible`; checked via `risibleQ`. `HANDOFF.md`: its description of the edits in my three chapters is accurate. I did not find in the records the misdescription of `a_coast` (L1); the ledger and evidence do not mention it, so the records are silent rather than wrong there.

## Per-chapter correspondence table

| Chapter | Correspondence checked | Verdict |
| --- | --- | --- |
| `actual-local-compiler-handoff` | `late_price`, `Certified`, `AFull`, `a_det`, `Export.normal`, `opaqueCost`, `nearby_gap`, `trusting`, `coverall`, `DetLong.stores`, `Fund.Stock`, `Fund.Recital`, `Kraft`, `accepts_stock` | Matched except L1, L2 |
| `allarity-planted-compiler` | `Soft.affixed`; final arithmetic of `accepts_stock` (`g0+4*weather ≤ 6*weather`); `Escalates.reserves` (`Line*(exp(8*weather)-1) ≤ sailboat`); `Wax.flint` for the $2a_{\rm coast}\le\alpha/4$ sentence | Matched; the algebraic `Flux.*` and `s_*_ft` declarations were not opened |
| `actual-mixed-marked-compiler` | `Docking.purchases`, `enlightens`, `TimeBand`, `risibleQ` | Matched; `Display.Dockets`, `Iced`, `Revival`, `Moon` not opened |
| `restarted-rank-history` | `Escalates` (`accept : spray s + 16*sailboat s n ≤ rollup s (n+1)`, `rate`, `reserves`) | Matched with \eqref{eq:restart-recurrence}; `Soft.white`, `fury`, `made_soft` not opened |
| `actual-harvested-owner-energy` | `Wax.Peaking`, `spun` (`Hearth.lean`): `m*phase(betaF)^2*shares ≤ depth …`, obtained with `m = b/8` | Matched with \eqref{eq:owner-actual-heft} (constant $b_0/8$) |
| `actual-corrected-body-compiler` | `weathered` hypothesis `M.base j p ≤ -(α*hot y^2)*shares` (matches \eqref{eq:actual-body-averaged}); `betaF x ≥ x` used in `flint` (supports "$\beta_F(y)\ge y$") | Matched where checked; `Pump.issued`, `foreshadows` not opened |
| `actual-reader-local-gaussian-prices` | `Venue.aperture` (`WEIGHTED_GAUSSIAN_MARGINAL_LIMIT_45C/Venue/Chips.lean`, line 31): errors `x^(-7/8)`, `x^(-1/4)` at the parameter later specialized to `retime x` (the chapter's $t$); column index interior (`separation o (front A F i) ≤ vista r x/4`), all active rows `j` | Matched |

## Declarations opened

| Fully qualified name | Path (under `Lean/YM/`) | Matched |
| --- | --- | --- |
| `YM.AnalyticBridge.RelativeLogdet.Physical.Certified` | `AnalyticBridge/RELATIVE_LOGDET_TRACE/Year.lean` | yes |
| `YM.AnalyticBridge.RelativeLogdet.Physical.late_price` | same | yes |
| `YM.AnalyticBridge.RelativeLogdet.Physical.parcel` | same | yes |
| `YM.AnalyticBridge.RelativeLogdet.Physical.AFull`, `CFull`, `a_det`, `a_pos` | `AnalyticBridge/RELATIVE_LOGDET_TRACE/Boards.lean` | yes |
| `YM.AnalyticBridge.RelativeLogdet.Export.normal` | `AnalyticBridge/RELATIVE_LOGDET_TRACE/Sector.lean` | yes |
| `YM.Next.SectorChange.opaqueCost`, `fog`, `panels`, `meeting`, `boards` | `SectorNext/GAUSSIAN_SECTOR_CHANGE/Chosen.lean` | yes |
| `YM.AnalyticBridge.Covariance.nearby_gap`, `trusting`, `Trust` | `AnalyticBridge/SECTOR_COVARIANCE_JETS/Deposit.lean` | yes |
| `YM.AnalyticBridge.Covariance.coverall` | `AnalyticBridge/SECTOR_COVARIANCE_JETS/Roof.lean` | yes |
| `YM.AnalyticBridge.Covariance.pilot`, `pilot_eq` | `AnalyticBridge/SECTOR_COVARIANCE_JETS/Quote.lean` | yes |
| `YM.ConnectedActivityE6…plate` (namespace as in file) | `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Gram.lean` | yes (distinct from actual Gram) |
| `YM.PhysicalNext.EndpointLoadF16.DetLong.stores`, `Fund`, `Fund.myCost`, `Fund.finalCost`, `Fund.width`, `Fund.Stock`, `Fund.Recital`, `Stock.recite`, `Recital.maestro` | `PhysicalNext/PHYSICAL_JOINT_ENDPOINT_LOAD_F16/DLog/Fund.lean` | yes |
| `YM.PhysicalNext.InteractingRank.Soft.Kraft`, `Soft.accepts_stock` | `PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Soft/French.lean` | yes (L1 concerns the English description of `hl`) |
| `YM.PhysicalNext.InteractingRank.Soft.weathered` | `…/Soft/Diamond.lean` | yes |
| `YM.PhysicalNext.InteractingRank.Soft.affixed` | `…/Soft/Hem.lean` | yes |
| `YM.PhysicalNext.InteractingRank.Soft.Escalates` | `…/Soft/Nuance.lean` | yes |
| `YM.PhysicalNext.InteractingRank.Wax.flint` (namespace as in file) | `…/Blazing.lean` | yes |
| `…acres` | `…/Posts.lean` | yes |
| `YM.Next.Rank.Demand`, `Demand.gas` | `Next/RANK/Bird.lean` | yes |
| `…Wax.Peaking`, `spun` | `…/Hearth.lean` | yes |
| `YM.PhysicalNext.InteractingRank.Display.Docking.TimeBand`, `risibleQ` | `…/Chimes.lean` | yes |
| `YM.PhysicalNext.InteractingRank.Display.Docking.lampBead`, `troupe`, `enlightens`, `purchases` | `…/Snap.lean` | yes |
| `YM.PhysicalNext.WeightedGaussianMarginal45C.Venue.aperture` | `PhysicalNext/WEIGHTED_GAUSSIAN_MARGINAL_LIMIT_45C/Venue/Chips.lean` | yes |

## What I did not check

`Soft.lifted`, `fury`, `stove`, `arousing`, `cast_off`, `wheeled`, `fitPost`, `tabloid`, `Pump.hoops`, `Pump.issued`, `foreshadows`, `Pump.Grid.Pupil`, `Pump.ballot`, `StrongScope`, `Display.ReturnTrip` (the source of \eqref{eq:planted-holes}), `Display.Dockets`, `Iced`, `Flux.*`, `Soft.s_*_ft`, `Soft.white`, `made_soft`, `Market.Purchases`; hence `common-tuple.md` items 3–5 and ledger entries C3, C6–C8 were not verified by me. Hidden instances and coercions were inspected only where they occur in the statements quoted above. No `#print axioms`.
