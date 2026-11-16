# Zero-coordinate Coupon on the stored doors (C12 item R7)

Refs #319, #315, #26. Author session ADB991-claude-20261113-5d52. Claim https://github.com/hairer/humanise-yang-mills/issues/319#issuecomment-6867467884. Canonical base `dcbdcc82` (`codex/existence-monograph`). Upstream pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Prepared autonomously by Claude (Anthropic) as a scheduled agent on behalf of ADB991; ADB991 has not reviewed it. Independent review is required.

## What changed

`manuscript/existence/selected-centered-service.tex`:
- a new subsection `sec:selected-zero-coordinate-coupon` containing `prop:selected-zero-coordinate-coupon` with its proof, and a closing paragraph "What the proposition supplies";
- in the paragraph "Relation to the paid selected-history record", the (R7) sentence now points to the proposition. It also states that the proof of `prop:ex-original-history-attachment` names the estimate but does not derive it (review #328, N9).

The changed blob is `52369a0a406ee8e877490969943c1008e8c18cce`; the old one is `0ec0df9b6dec03b4c30817d334a5e97e19586f6b`.

## Status of each R7 field after this change

| R7 field | Status | Where |
|---|---|---|
| (1+2C_i)η_i ≤ barunit(L_i), with η_i = rate(L_i) = L_i^{-2/5} | **proved** from the purchase: the threshold v_j of `marked-portfolio-calibration.tex` is a block floor of every stage k ≥ j (`common-observable-purchases.tex`), and L_i is chosen at stage J(i+1) ≥ J(i) | proof, "Tuning" |
| ψ_i ≥ 0, η_i ≥ 0 | **proved** | proof, "Signs" |
| door sound | input (S); asserted in `sec:three-port-history` for the retained interpolating point | |
| finite wing, independent of Q | **proved** (finite torus, Keeper tags) | proof, last paragraph |
| Coupon (η_i q, η_i q, 2q) for every Q with Q.x = 0, terminal format, remainder q at weight sqrt(w^f_{i+1}) | **reduced** to (K) single-insertion regular/forced estimates on the stored door and (M) the countable Coupon merger. The repacking onto Keeper addresses, the decomposition and the price accounting are proved | proof, "Repacking", "Decomposition", "Summation" |

So #319 is now reduced to (K), (S) and (M) on the selected doors. (K) and (S) are the conditional content of `sec:three-port-history` (#313 match) attached to the stored door. (M) is the outstanding merger of `ex-selected-linear-interpolation` (`phase-quantitative-producer.tex`, l. 462–476), extended to Tale witnesses.

## Source correspondence (textual reading at the pin; nothing elaborated)

- Consumer: `YM.Extra.Histories.Relay.Tones` (`Lean/YM/MergeProof/Accord.lean:22-24`). The `tuned` field holds the tuning inequality, `SoundDoor`, 0≤t and 0≤η. The `priced` field gives a finite `X` such that every `Q` with `Q.x=0`, `Q.Format 0 A R` and `Q.remBound 0 R (sqrt forcedAllowance(i+1)) q` has `Coupon … X (Q.density) 0 (η q) (η q) (2q)`. This is the manuscript statement with lead 0.
- Selected run (trail route): `Scrim.listens` (`Biscuit.lean:34`) requires `C.ref d ≤ i < N`. It is supplied in `hearthstone` (`FullVolume/Hearth.lean:42`, same at `MergeProof/Inns.lean:41`) by `Bandage.ravine` (`MergeProof/Ravine.lean:24`) with η = `Doors.rate (block m)` and t = `waybill a m`. Tuning is `(hu i 0 _).2.2.2 _ (S.fits.mono i.le_succ)`, where `paper` (`MergeProof/Apres.lean:20`) is taken at grade 0 and stage J(i+1), and its last clause is applied at j = J(i) ≤ J(i+1). This is the "grade-zero floor" of the manuscript. `params_eq` and `block_eq` give C_i = columns of the profile at J(i) and L_i = the block length of stage J(i+1).
- Campaign route: `Campaign.ridgeT` (`FullVolume/Dusk/Cargo.lean:51`) uses `Matric.Tool.tuneR` (`Dusk/Jaws.lean:27`) on `doorT` with the same η and the same grade-0 tuning (`hu m 0`). Which route the C02/C12 consumers use (Run vs Album) is #321's question; the proposition is stated for the stored doors.
- `ravine` body: soundness comes from `sound_duet` (`Visit.lean:24`) and `sounds`. The wing is V' = origin `logKey`s ∪ Keeper `gasKey`s (`cart`), with the Keeper `Guard.Keeper.sufficient (h.samples …)`, i.e. from `Nest.samples` (cf. the #317 note). The Coupon is `asideP` (`MergeProof/Gelatin.lean:23`) fed by the Stampede of `clocksHere` (`MergeProof/Crowding.lean:67`), with w = `Doors.rate`. In the manuscript the Stampede's regular/forced fields are (K); its `main` field is not needed because Q.x = 0.
- `asideP` proof ↔ manuscript proof:
  - `rack`/`stowK`/`stows`/`keeps`/`rack_format` (`Stow.lean`) ↔ "Repacking", items (ii), (iv), (v);
  - `reentry` with `tariff`/`chamber` (`BarCode.lean`) ↔ item (iii). The transposition argument is `tariff`; the disjoint-support step is the `hp` sub-proof there;
  - `zeroSlot` (`Fleece.lean:17`) ↔ the zero clause of (M);
  - `Stampede.regular`/`forced` (`Wallet.lean:27-30`) ↔ (K);
  - `Coupon.weaken` (`Sonata.lean:28`) and `coupons` (`Sonata.lean:56`) ↔ (M);
  - `SumBudget` sums `g`, `k` with z' ≤ t ↔ "Summation".
- Definitions used: `Coefficient.exponentialEntry`/`density`/`marked`/`Format`/`remBound` (`Source/Insertion.lean:37-66`), `dressed` (`Extra/SOURCE_HISTORIES/Dressing.lean:27`), `salary`/`fare` (`LocalDebt.lean:53-58`), `Doors.rate` (`Extra/SOURCE_HISTORIES/Reserve.lean:30`), `barunit` (`Bid/Loan.lean:35`), `waybill` (`MergeProof/Escarp.lean:26`), `BudgetPoint.mass` (`RG/Masks.lean:144`).

## Open questions

- Q1. Item (iii) uses the admissibility facts that admissibility depends only on supports and inventories, and that distinct members of an admissible set have disjoint supports. These are read from `reach` and the `hp` step of `tariff` (`BarCode.lean`), not from a manuscript statement. A reviewer should check them against the manuscript's activity expansion.
- Q2. In the manuscript the Keeper of a nonterminal upper representation belongs to the retained slot realization. On the selected run it comes from `Nest.samples`. Its preservation at lower levels is the open item of #317.
- Q3. The `asideP` route needs κ ≤ 1 (`hK`), which is used for the weakening 2m ≤ 2m/κ. In the manuscript this follows from w^f ≤ 1.
- Not changed (outside this claim): `original-history-portfolio-attachment.tex:117-123` still says "specializing the tariff inequality to the zero-grade section gives the required relay bounds". It is correct for the tuning clause only. The owner of that file should add a pointer to `prop:selected-zero-coordinate-coupon`.

## Evidence (commands actually run)

- `python3 scripts/check_blueprint.py`: "Blueprint structure OK: 4 units."
- `python3 -m unittest discover -s tests`: 22 tests OK.
- `git diff --check`: no output.
- `latexmk -pdf -interaction=nonstopmode -outdir=<scratch> existence.tex` from `manuscript/` on this branch: exit 0, 1017 pages, no undefined references. pp. 697–700 (the new subsection) were rendered to PNG and inspected.
- No Lean elaboration or axiom replay: Lean was read as text only.
