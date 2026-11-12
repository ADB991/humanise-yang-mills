# Selected-course binding: source crosswalk

Status: draft source correspondence for
`manuscript/existence/selected-course-binding.tex`; not independently reviewed.
Imported Lean source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
from `source/upstream.json`.

## Finding

The unconditional mathematical result in the manuscript is the same-family
binding. The returned `Run` retains `bought : Ahead R.b R.Q`; specializing
that continuation to the bolt, schedule, transfers and doors stored in the
same run yields the binding for the literal `R.family`. The `Chateau`
reception supplies its `RankCovariance.Binding`, and the public run assembly
identifies the family levels with the directed alloy levels.

A separate elementary lemma proves `Paid V a → Paid U a` when the three wait
requests decrease coordinatewise. It treats the period condition as a global
inequality for every schedule index and proves containment of the entire
plateau interval, including truncated natural subtraction. This is a general
weakening lemma, not evidence that the public output has a particular paid
wait.

The service construction has an intermediate upgraded wait and a universal
franchise receipt internally. The exported selected-run interface does not
expose that raw receipt for the final chosen run: it is consumed while
constructing the calibrated company. This source observation alone does not
show that downstream use is impossible: the exported `Chateau` rated,
warrant and market outputs may suffice for later local estimates without
recovering the raw frequent-stage receipt. The exact question for the next
source pass is whether those outputs supply the quantified inputs used by
`earn_epoch`, the bush construction and the later local consumers on this
same `R.family`. Do not infer a new analytic obstruction from the absent
raw receipt. In the internal franchise receipt, `Metering.cost` is a
`Launch` on the same family, stage, current purse and price parameters, and
its `coup` is the `Corridor`; no separate launch purchase is needed if that
receipt is used.

## Exact source mapping

| Mathematical content in the prose | Inspected declaration and source path | Match checked |
|---|---|---|
| Public selected run and family | `YM.Independent.constructionRun`, `Lean/YM/Independent/ConstructionRun.lean`; `YM.PhysicalNext.Repeat.Legato.Run` and `Run.family`, `Lean/YM/FullVolume/Cross.lean` | Public construction calls `YM.PhysicalNext.Repeat.Legato.R2I.RG05Joint.selectRunWithTreasuryPeriod_preselected_quote_orders_postnumeric`. The returned `Run` contains its bolt, tuning, schedule, transfer records, doors, making data, carries, books, alloy and `bought` continuation. `Run.family` is formed from the same bolt history, schedule and transfers. |
| Same-family levels | `YM.PhysicalNext.Repeat.Legato.R2I.RG05Joint.engageWithCustodyFactor`, `Lean/YM/Integration/RG05Preconstruction/PeriodConstruction.lean` | The result explicitly includes `R.family.path.levels = A.B.a`. This is the selected level schedule used by the directed alloy and is the schedule argument expected by the franchise receipt if it is later specialized. |
| Continuation retained in the public Run | `YM.PhysicalNext.Repeat.Legato.Ahead`, `Lean/YM/FullVolume/Forge.lean`; `YM.PhysicalNext.Repeat.Legato.Unlatched`, `Lean/YM/FullVolume/Unlatch.lean`; field `Run.bought`, `Lean/YM/FullVolume/Cross.lean` | `Ahead` is an `Unlatched` continuation. `Unlatched` universally quantifies over bolt, nesting, schedule, transfers and doors, and asks for making, climbing and freight data. `Run` stores exactly these objects and receipts. |
| Binding on exact selected family | `YM.PhysicalNext.Repeat.Legato.Chateau`, `Lean/YM/MergeProof/Almandine.lean`; `YM.PhysicalNext.Repeat.Legato.castle`, `Lean/YM/MergeProof/Snow.lean` | `Chateau.reception` contains `∃ B : RankCovariance.Binding C, B.world ≍ A.B.M ∧ B.prices=M.K`. `castle` constructs this binding from ShapePort, exact path equality, shell domination, and the same Alloy/Bolt. Its proof uses Bolt sticks for path attachment and the paid volume/shell comparison for the larger-patch field. `Unlatched` specializes to `C=R.family` using the Run fields above. |
| Franchise receipt and wait order | `YM.PhysicalNext.Repeat.Legato.franchise`, `Lean/YM/MergeProof/Snow.lean`; actual caller `YM.PhysicalNext.Repeat.Legato.R2I.RG05Joint.richFaresWithPrediction`, `Lean/YM/Integration/RG05Preconstruction/Fares.lean` | The theorem returns an upgraded wait `Z` and a universal implication for every `C`, `Paid Z C.path.levels`, and `B` with `B.prices=K`; for each panel index it yields frequently many stages with Tender, Metering, ShowHours and Vents. The Fares caller consumes this receipt in constructing the calibrated company. The exported selected-run interface does not retain a proof identifying the receipt's `Z` and paid-family witness with the final alloy levels of the fixed `R`. The next audit should first check whether `Chateau`'s exported rated/warrant/market fields bypass the need for this raw link. Coordinatewise weakening of `Paid` is proved in the manuscript, but does not itself establish either route. |
| Launch is already in Metering | `YM.Next.Rank.Tapes.Metering`, `Lean/YM/Next/RANK/Concord.lean`; `YM.Next.Rank.Tapes.Launch`, `Lean/YM/Next/RANK/Ratchet.lean` | `Metering.cost` has type `Launch C k (F.current k) w F.mark`; it is not a separate purchase. `Launch.coup` is a Corridor on the same `C.path.levels`. |
| Same-course survivor and bush consumers | `YM.PhysicalNext.InteractingRank.earn_epoch`, `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Epoch.lean`; `YM.PhysicalNext.InteractingRank.bush_start` and `follows_prices`, `.../Leashes.lean`; `YM.PhysicalNext.InteractingRank.Soft.embroidered`, `.../Soft/Coupons.lean`; `.../Soft/Grows.lean` | `ShowHours.flash.monitor`, `ShowHours.canvas`, and `ShowHours.oldPrices` are the selected storefront, room-test and table-ready inputs used with the same launch pane in `earn_epoch`. It returns survivors on `C`. `bush_start` uses the same `ShowHours`, Launch, survivor, making data, and the selected family's Wilson-running estimate; the Launch corridor is passed through the construction. `Coupons` consumes Vents and Launch on that same course; `Grows` supplies the leaf/thicket step. |
| Existing manuscript framework | Parent files `manuscript/existence/common-funded-history.tex` (`sec:common-funded-history`), `original-history-portfolio-attachment.tex` (`prop:ex-original-history-attachment`), `common-observable-purchases.tex` (`sec:common-observable-purchases`), `common-scale-selection.tex` (`sec:common-scale-selection`), `ope-history-service.tex` (`sec:ope-history-service`), `ope-scale-purchases.tex` (`sec:ope-scale-purchases`), `selected-history-limits.tex` (`sec:selected-history-limits`), and `background-path-convergence.tex` (`sec:background-path-convergence`) | These chapters fix one family/history/schedule and provide the same-history limits/services. The new subsection adds the same-family specialization of `Run.bought` and the generic paid-wait weakening. It does not claim that these canonical chapters or the returned run expose the intermediate franchise receipt for the already selected run. |

## Paid-wait weakening used

For waits over the same bar, `U ≤w V` means pointwise `r_U(j)≤r_V(j)` and
`w_U(j,s)≤w_V(j,s)` for all stages and scales, and `p_U≤p_V` for the
minimum-period request. `Paid(U,A)` has a separate global condition
`p_U≤P_A(i)` for every schedule index `i`. Its plateau condition says that
for every eligible stage `j` there is a scale index `k` with
`r_U(j)≤s_A(k)`, `w_U(j,s_A(k))≤k`, and `J_A(i)=j` throughout the whole
truncated interval from `k−w_U(j,s_A(k))` to `k+w_U(j,s_A(k))`.

Under `U≤w V`, the global period inequalities weaken pointwise. At each
plateau, reuse the same `k`: if `a=w_U(j,s_A(k))≤b=w_V(j,s_A(k))`, then
`max(0,k−b)≤max(0,k−a)` and `k+a≤k+b`. Thus the `V` plateau interval
contains the full `U` interval, and its ready-time and window upper bounds
imply the corresponding bounds for `U`. This proves `Paid(V,A)→Paid(U,A)`;
no reverse implication is used.

## Public route versus nearby alternatives

The reviewed run is produced by
`YM.Independent.constructionRun` through
`YM.PhysicalNext.Repeat.Legato.R2I.RG05Joint.selectRunWithTreasuryPeriod_preselected_quote_orders_postnumeric`.
The same-family binding supplier is `Run.bought` on the public run. The
franchise receipt is constructed internally along the native
`RG05Preconstruction/Fares` path and consumed before the exported run
interface. The next source comparison must test the later `Chateau`
rated/warrant/market outputs against actual local-consumer inputs. This
crosswalk does not treat the separate `preFoundK` grantor in
`Lean/YM/FullVolume/Roll/Novena.lean` as a substitute.

## Reads and checks

Source reads were limited to the declarations listed in the table and their
immediate caller path: `Lean/YM/Independent/ConstructionRun.lean`,
`Lean/YM/Integration/NativePreselectedPostnumericPeriodRun.lean`,
`Lean/YM/Integration/NativeSelection/FundedCompanySelection.lean`,
`Lean/YM/Integration/NativeSelection/FundedPredictionSupply.lean`,
`Lean/YM/Integration/RG05Preconstruction/PeriodConstruction.lean`,
`Lean/YM/Integration/RG05Preconstruction/Expenses.lean`,
`Lean/YM/Integration/RG05Preconstruction/Fares.lean`,
`Lean/YM/FullVolume/Cross.lean`, `Lean/YM/FullVolume/Forge.lean`,
`Lean/YM/FullVolume/Unlatch.lean`, `Lean/YM/FullVolume/Rods.lean`,
`Lean/YM/FullVolume/Shroud/Clan.lean`, `Lean/YM/PCalc/Band.lean`,
`Lean/YM/Price/Intent.lean`, `Lean/YM/RG/History.lean`,
`Lean/YM/PhysicalNext/RANK_COVARIANCE_ATLAS/Consumer.lean`,
`Lean/YM/MergeProof/Almandine.lean`, `Lean/YM/MergeProof/Snow.lean`,
`Lean/YM/MergeProof/North/Bonus.lean`,
`Lean/YM/Next/RANK/Concord.lean`, `Lean/YM/Next/RANK/Ratchet.lean`,
`Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Pleas.lean`,
`.../Soft/Postsale.lean`, `.../Epoch.lean`, `.../Leashes.lean`,
`.../Soft/Grows.lean`, and `.../Soft/Coupons.lean`.
Read-only parent chapters checked are the eight listed in the table above.

Commands actually used: targeted `rg -n` searches for `castle`, `franchise`,
`ShapePort`, `Metering.cost`, `Storefront`, `Launch`, `structure Run`, and
family constructors; bounded `sed -n` excerpts of the declarations and call
sites listed above; `ls` and `pwd` to confirm the isolated clone and parent
manuscript paths. No Lean source was edited and no Lean build was run. No full
manuscript build or blueprint checker was run for this draft.
