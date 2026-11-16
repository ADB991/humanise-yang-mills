# Review of a proof unit

- Unit: YM-000026 (`blueprint/units/YM-000026`); bounded renewed review of the #384 revision of the #373 note, for #372.
- Role: Lean correspondence
- Human reviewer: stalex444
- Agent assistance: Claude (Fable 5.2 and Opus 5.5): a correspondence read of the revision against the release source and the earlier probe outputs, and a separate elaboration probe (three runs, `Probe384_v1`–`v3`). The findings rest on the probe outputs and the text read, as marked per item; agreement between agents is not offered as evidence.
- Content SHA-256: per-file SHA-256 in `hashes.json`; the 17 source files hashed equal `Lean/SOURCES.sha256` at `3166276d` and the release checkout at `3456e5e`. The unit fingerprint does not cover the note (see README, Records).
- Manuscript files and labels: `manuscript/existence/trace-rounded-receipt.tex` (`lem:trace-receipt-width`, `lem:trace-receipt-cost`, `prop:trace-rounded-receipt`, the supply paragraph, the open list); the #384 change to `trace-rounded-comparison.tex`; the author record `results/C15/author/hairer-claude-372-20261114/README.md` (correspondence table l.18–30 and addendum l.55–76).
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Review task and PR: #372; reviewed PR #384 (commit `6865f2b3`, merged at `6426c0be`); this report is added by its own pull request.
- Outcome: accepted locally, conditional on stated dependencies ((A), (B); the items of #383 N9–N19 not settled below); no required change. L1 is addressed, with the remark that (B) remains stronger than `lava_vSky` and is now an explicit open input. L15 is addressed. L12 (a suggestion) is partly addressed: the bank premise is stated, the level of the ticket is not. No pairing among L2–L11, L13, L14 and L16 changes its verdict. L19 (Minor) concerns the author record only.

## What was elaborated and what was carried

- **Elaborated in this review.** `evidence/Probe384_v1.lean`, `Probe384_v2.lean`, `Probe384_v3.lean` were elaborated with Lean 4.32.0 (toolchain `leanprover/lean4:v4.32.0`), with the YM `.olean` files of `3456e5e7` from the compiled release archive `ym-build-3456e5e.tgz` used by #383 (SHA-256 `07c145c3…`, equal to `source/build.md` l.37, as recorded in #383's validation; the sources were read and hashed, not placed on `LEAN_PATH`), and the Mathlib and other dependency `.olean` files from a local Lake package cache, using `lean -DmaxHeartbeats=0 -DmaxRecDepth=4096 <file>` (command, exit codes and resources in `evidence/RUNLOG.txt` and validation.md). All three runs exited 0. The outputs contain:
  - the definitions of `Ship.bank`, `protection`, `Station.ticket`, `Rep.exCost`, `PathData.loopsPrice`, `baseBudget`, `ent`, `strength`, `HaarBudget`, `Station.Meets`, `Calendar.monitor`, `Calendar.loopCap`, `Calendar.threshold` and `Ship.yardSky` (v3 l.1–94);
  - the statements of `Station.affordable`, `Ship.banking`, `FitSky.stencils`, `widerSky`, `beforeSky`, `Fits.deep`, `Fits.mono`, `AllocatedSky`, `ChargeSky.allot` and `LegacyCostSky.age`, and `trays` (v3 l.67–131);
  - the probe theorems `probe_yard_depth`, `probe_chamber_depth`, `probe_allowance_of_poised` (with an instance at slot `trays d`), `probe_monitor_ge_one`, `probe_a_le_gap`, `probe_lower_spacing`, `probe_reduced_threshold` and `probe_bank_at_root_depth`.

  `#print axioms` was run for seven of the eight probe theorems and for `affordable`, `banking` and `FitSky.stencils`; each depends only on `[propext, Classical.choice, Quot.sound]` (v3 l.76, 79, 106, 111–116, 120). `probe_lower_spacing` is used in the proof of `probe_reduced_threshold`, whose axiom list therefore covers it. No `sorryAx` occurs in the v1–v3 outputs. v1 printed one deprecation warning (`push_neg` deprecated) and no error; v2 and v3 printed no warning or error. The probe's own theorems were checked by Lean's kernel as they were elaborated.
- **Carried from #383, not re-elaborated.** From `blueprint/units/YM-000026/handoff/results/C15/review/stalex444-claude-373rev-20261114/evidence/Probe372_v1.out` … `Probe372_v5.out`: the elaborated types of `lava_vSky`, `await`, `boatsSky`, `wakesSky`, `open_readSky`, `couponSky`, `rebate`, `PoisedSky`, `LegacyCostSky`, `ChargeSky`, `AllocatedSky`, `AllowedSky` and `FitSky`; the proof-term constant lists; the binder scan of `open_readSky` (L15); and the probe theorems `probe_width_explicit` and `probe_cost_explicit`. "P372 v1 l.N" below refers to lines of those files.
- **Not done.** The release's proofs were loaded from compiled files and not replayed by an independent kernel checker (no `leanchecker`); nothing was built from source (no `lake`); Mathlib was not rebuilt. The extracted files were not re-verified one by one against the archive in this review, and the dependency `.olean` files were not independently verified (#383 N9, N10).

The note names no Lean declaration; the pairings are the author record's (README l.18–30) or #383's. Paths are relative to `Lean/YM/`. "v3 l.N" refers to lines of `evidence/Probe384_v3.out`. Note line numbers are those of `trace-rounded-receipt.tex` at `3166276d`.

## Findings and evidence

| # | Declaration (file:line) | Note's counterpart at `3166276d` | Verdict now | Level, evidence |
|---|---|---|---|---|
| L1 | `MergeProof.East.lava_vSky` (`TraceExtension/Prom/Orion/Reach.lean:34`) | (B), l.55–56, l.64–84; open item 2 l.270–272 | Addressed, with remark: (B) remains stronger; it is now stated as such and listed as an input | Carried, P372 v1 l.268–314; below |
| L2 | `SeqPair` (`TraceExtension/Prom/Zoom/Boats.lean:21`) | parent (G3), byte-unchanged | Unchanged | Carried |
| L3 | `TimberSky.plate`, `Vane.checked`, `costHint` | cost index l = i, d = i (l.149, l.153–154) | Unchanged | Carried |
| L4 | private `await` (`Boats.lean:31`) | first assertion, l.143–174 | Unchanged; the depth identification is now stated (see L16) | Carried |
| L5 | `boatsSky` (`Boats.lean:49`) | "Moreover" assertion, l.154–157, l.176–197 | Pairing holds (a selected level above any prescribed bound); the note's mechanism now differs from the source's; the note's mechanism holds over the release definitions | Carried, P372 v1 l.95–140; elaborated `probe_monitor_ge_one`, `probe_a_le_gap`, `probe_reduced_threshold` (v3 l.114–116) |
| L6 | `AllowedSky.dilation` (`TraceExtension/Prom/Hill/Station.lean:42–43`) | (A) with K_A, l.58–63 | Source implies the note's (A): every witness carries it at its own level, so K_A = 0 is permitted | Elaborated `probe_allowance_of_poised` (v3 l.113) |
| L7 | `FitSky` | fitness, l.41–46 | Unchanged | Carried |
| L8 | `open_readSky` (`TraceExtension/Prom/Orion/Suds.lean:35`) | width lemma, l.86–110 | Unchanged; `probe_width_explicit` (dilation and 8R ≤ μ_k² at a fixed level) covers the statement with k ≥ K_A | Carried, P372 v4 |
| L9 | `Ship.pot`, `allowance`, `budget`, `diminishes` (`Next/RANK/Allowance.lean:26–34`) | cost lemma, l.112–132; I_k, a, l.206 | Unchanged; the rename n → M now matches the source's letter | Carried |
| L10 | `Ship.fixed` | a ≥ 1, l.206 | Unchanged | Carried |
| L11 | `MergeProof.East.trays` (`MergeProof/East/Gran.lean:25`) | M = M_d = d+2, l.26–32 | Matches; M is the slot argument | Elaborated, v3 l.121–131; below |
| L12 | `couponSky` (`TraceExtension/Prom/Port/Soft/Denarii.lean:31`); `Ship.bank` (`Next/RANK/Allowance.lean:40`) | supply paragraph l.200–231; item 2(c) l.283 | Partly addressed (suggestion): premise stated, level not stated | Elaborated definitions, v3 l.1–66; statements v3 l.67–79; carried P372 v1 l.634–656 |
| L13 | `Ship.rebate` | author README l.30 | Unchanged | Carried |
| L14 | `earningsSky`, `y_readySky`, `tenderlySky` | author README l.28 | Unchanged; the row still writes n (L19) | Carried |
| L15 | `open_readSky` proof term | author README l.27, addendum l.74 | Addressed | Carried, P372 v4, v5 |
| L16 | `SeqPair.boot`/`yardSky`, `FitSky.stencils`, `widthSky` | l.38–41, l.145–147 | The note states the identification the source makes by construction | Elaborated now (was text only): `probe_yard_depth`, `probe_chamber_depth` (v3 l.111–112) |
| L19 | — | author README l.20–40, l.47 | Minor (author record): original table, "Proved"/"Open" text and l.47 not marked superseded | Text |

### L1. (B) and `lava_vSky`

`lava_vSky`'s threshold comes after a fixed panel sequence with `ArcSky` (P372 v1 l.268–314); the panel sequence is returned by the producer together with the level curve (`Boats.lean` l.51–53). So `lava_vSky` is the per-curve form, and the note's (B), with K_B(d) independent of the chart (l.75–77), is stronger. The note now says so in substance: the thresholds are fixed before the chart is chosen (l.55–56), the chart-uniform form is what the proposition's second assertion uses, and a threshold depending on the returned level curve would suffice for the first assertion only (l.79–84). That description is accurate, and open item 2 asks for the uniform form. Neither of the two routes #383 suggested was taken (stating (B) along the curve, or deriving the uniform form); the note took a third, making the stronger requirement an explicit input. Whether the source yields the uniform form remains #383 N14.

Remark (optional; not a defect). The uniform demand is a cost of the chosen route. The source arranges the levels with the per-curve form: `boatsSky` takes an arbitrary lower bound Y and returns a level i ≥ Y (`Boats.lean` l.50), obtaining its point with `Filter.Eventually.exists` over a conjunction that contains `await`'s eventual `SeqPair` along the returned curve (l.55, l.59). That works because the point is chosen inside the producer, after the curve is known; a level lower bound fixed before the call would not let a per-curve threshold serve, since the curve is returned by the call. If the gallery stated that the producer's point can be taken late along its returned curve (the late-point property of #383 M1), the per-curve form of (B) would suffice for both assertions, as #383 L1 noted.

### L5. The note's level arrangement over the release definitions

The note's reduced-threshold argument (mathematics.md C13) corresponds to neither of the source's mechanisms; the property paired (a selected level above a prescribed bound) is the same. Elaborated in this review: `probe_monitor_ge_one` (1 ≤ `monitor k` at every k, since `monitor` = exp((log log β̂)²), v3 l.84–85, l.114); `probe_a_le_gap` (b ≥ 0 ⇒ a_k ≤ `gap A b k`, v3 l.115); `probe_reduced_threshold` (for every K and θ > 0 there is 0 < θ' ≤ θ such that `gap A b k < θ'` with b ≥ 0 implies K ≤ k, v3 l.116). The radius identity and 5 < b are `boatsSky`'s output (`Boats.lean` l.50; `TimberSky.high` l.43), read as text. The author record's row for the selection part (README l.24) still describes the source's route accurately; it no longer describes the note's.

### L6. (A) in the source

`probe_allowance_of_poised` (v3 l.113) proves that every `PoisedSky` witness at level k carries `AllowedSky A (P χ).arc k`, its dilation inequality, and the ticket bound at slot n and depth `widthSky`, for every panel χ, with no level threshold. The route is the source's own (`supply → LegacyCostSky.age → ChargeSky.allot → AllocatedSky.permitted`, rewritten by `Panel.factor`, as in `await`, `Boats.lean` l.36–37). The note's (A), now required only for k ≥ K_A (C12), is therefore implied by what the source supplies. The #374 audit report reads the same from the source as text (its README l.54, l.64); this probe elaborates it.

### L11. M = `trays d` as the slot argument

`trays d = d + 2` is reducible (v3 l.121–122). The slot chain `PoisedSky n`, `LegacyCostSky u`, `ChargeSky slot`, `AllocatedSky M` type-checks with n := `trays d` (the `example` in section C2 of `Probe384_v2/v3.lean`; statements v3 l.123–131); `await` passes `trays d` to `PoisedSky` and `lava_vSky` (`Boats.lean` l.31, l.33). So M pairs with the slot argument of `AllocatedSky`, `Ship.pot`, `Ship.budget` and the third argument of `Station.ticket`, which `bank` pairs with X ≤ 1+M. The source bounds it by 2 ≤ n in `lava_vSky` and n ≤ M in `couponSky`, which matches "since $M\ge2$, they are admissible" (l.228–229). The gallery's l is a separate argument, with l ≤ `trays d` in `boatsSky` (P372 v1 l.107), so "It is not the arity cap $l$" (l.31) is right. The "per cell" reading of M was not checked beyond this.

### L12. The supply paragraph, `bank` and the level of the ticket

Elaborated definitions (v3 l.1–66): `bank O A m` says that for every period, every representation on the torus of level m with `Meets`, and X ≤ 1 + k, `protection` − 4·lieDim·log g / #sites ≤ `ticket O (A.params m) k`. `protection` = 2·`exCost` + #PlaqAxes + β·`baseBudget` + X + 3·`ent` − 4 log `O.small`, with `exCost` = δ + β(Aθ³ + Aθ⁴) + Λθ², `baseBudget` = #PlaqAxes(c_dir g²/2 + (Ag)²/2), `ent` = log `O.big` − D log `strength`. This is P_R(X) of rank-root l.181 term for term, and `ticket` is T_M of rank-root l.255–257 term for term, under the symbol correspondence c_− = `O.small`, c_+ = `O.big`, A = stage paths, μ_k = `monitor` (definitions read and printed, not a formal link; #383 N17). `Meets` (v3 l.49–66) carries the representation-side conditions: the same clip, β ≤ 4β̂_m, βg² = 1, 0 < g ≤ θ_R ≤ `threshold m`, δ ≤ 1, Λ ≤ `loopCap m`. The harmonic condition and the late-scale purchases are not hypotheses of `bank`; `affordable` proves them eventually in m, uniformly in the period (statement v3 l.67–76; the bodies of `rolls_law`, `four_prices` and `exp_bills` read as text only), and `banking` gives `bank` eventually (v3 l.77–79). So #383 N13 is settled for `bank`, `protection` and `ticket` at the level of definitions: the note's displayed premise (l.214) with its conditions (l.217–224) is `bank` with `Meets` and `affordable`. `Ferm` and `estimateSky` remain unchecked.

The level is not stated in the note. In the source, `couponSky`'s `bank`, representation and hypotheses are all at `widthSky A b k` (P372 v1 l.634–656), and `AllocatedSky.charge` bounds the ticket at `A.params (widthSky A b k)` (`TraceExtension/Prom/Hill/Allowance.lean` l.22, read as text; used as `hA.charge` in `probe_allowance_of_poised`, `Probe384_v3.lean` l.101; axioms v3 l.113), that is, at the root depth. The note's "output level $m$" (l.216) is not identified with the root depth w, and item 2(c) (l.283) does not say at which profile T_M is taken. The response table has no row for L12. At `3166276d`, rank-root l.317–320 and l.375–376 (merged after #384) state both. Suggestion, unchanged: one clause in item 2 saying that the output level is the root depth w and that T_M is computed at the profile of that level.

### Open item 2(b) against the source

`probe_bank_at_root_depth` (v3 l.120): there is K, depending only on A, O and simplicity of G, such that `bank O A (widthSky A b k)` holds for every k ≥ K and every b with `AllowedSky A b k`. The proof follows `earningsSky`'s own step (`TraceExtension/Prom/Front/West/Tael.lean` l.69–84, read as text): `banking`'s eventual threshold, `Fits.deep` (J → ∞), `Fits.mono` (J monotone), and the `AllowedSky.bracket` field (J k − 1 ≤ J m for `widthSky` ≤ m ≤ k). So the harmonic and late-scale part of item 2(b) is realized in the source with a chart-independent threshold in k, as the note asks, using the `bracket` field; the representation-side conditions (β ≤ 4β̂_m, same clip, θ_R ≤ θ_clock, Λ ≤ Λ_clock, δ ≤ 1) remain hypotheses of `bank` through its `Meets` argument. That field is a further field of the same allowance witness; the note's (A) exports only the dilation inequality. This agrees with mathematics M12, where `prop:rank-root-output-ticket` names the same bracket property as an input. In the source, item 2(c) is the witness field `AllocatedSky.charge`, present at every witness level (`probe_allowance_of_poised`), not a separate clock purchase. The #374 audit report traces the same route as text (its README l.116).

### L15

Carried from #383 (P372 v4, v5): the binder `hv : 1 ≤ mag V 1 k` does not occur in `open_readSky`'s proof term, and a copy without the filter elaborates to the same type. The addendum records this (README l.74). The note still uses μ_k ≥ 1 elsewhere (l.22, l.182–183, in the new M1 argument); the source has it at every level (`probe_monitor_ge_one`), so that use is consistent with the source. Addressed.

### L16. (G3) and (G4) at one depth (now elaborated)

`probe_yard_depth` (v3 l.111) shows by `rfl` that `Ship.yardSky C b hN p`, the tiling of the root test in `SeqPair.boot` and `lava_vSky`, is `Cells.center C.S (m := widthSky A b k) p _ 0`. `probe_chamber_depth` (v3 l.112) restates `FitSky.stencils` (v3 l.95–106) with its depth written as `widthSky A b k` and closes it with the release lemma. So the root test and the chamber use one centered tiling at one depth, with `widthSky` ≤ `middleSky` ≤ k (v3 l.107–110). The note's w is defined as that common depth (l.38–41) and the proposition makes the identification (l.145–147). The note does not, and need not, give w's formula.

### L19. The author record's text above the addendum (Minor; author record)

The addendum (README l.55–76) was appended and the earlier part left unedited, consistent with an addendum. The earlier part is not marked as superseded where the addendum differs: l.28–29, l.36, l.38 and l.40 write the marker allowance as n ("μ_k^{-1/(16n)}", "ε^{-16n}", "T_n ≤ I_k"); l.47 says "The manuscript therefore uses n = d+2 ≥ 2.", which is no longer true of the note; and l.37 gives the level arrangement as "late points of a level curve tending to ∞", which the note no longer uses. Rows l.24 and l.27 describe the source, which did not change; l.24's pairing still holds, though the note's route now differs (L5), and l.27 is answered at l.74. Each addendum row is accurate on its own terms. Suggestion: one line saying that the text above the addendum (the table, the "Proved" and "Open" paragraphs, and l.47) is superseded where the addendum differs.

## Required changes and remaining uncertainty

Required: none for this role. Remark: L1 (stronger (B) now an explicit input). Suggestion: L12 (level of the ticket). Record note: L19.

Not checked (labels of #383 where unchanged):

- N9, N10. Independent kernel replay of the release's proofs; byte identity of the extracted compiled files with the archive and of the dependency `.olean` files with the lock file.
- N11. That `(invoiceSky …).part s` is the note's Φ_s.
- N12. The bodies of `earningsSky` beyond `Tael.lean` l.69–84, and of `y_readySky`, `tenderlySky`, `fliesSky`, `supply_wheel`, `FiresSky.earns`, `podiumSky`, `s_postage`; the bodies of `rolls_law`, `four_prices`, `exp_bills` (read as text only).
- N13 (in part). `Ferm` and `estimateSky` against the note's coefficient price a^{q_0|I|} with X ≤ 1+M on a lawful representation.
- N14. The chart-uniform form of (B) from the source. The #374 audit report argues (its README l.140) that its threshold depends only on panel data fixed along the gallery; that argument was not reviewed here.
- N16, N17. Whether the probe theorems state the note's lemmas faithfully, and the symbol correspondence, are correspondence judgments made here, not kernel facts.
- N15 settled by L16. N18 settled at the level of definitions by L6, L11 and L12 (`AllocatedSky.charge`: the ticket at `A.params (widthSky A b k)`, slot `trays d`, bounded by `pot`), subject to N16, N17. N19: only the 17 source files in hashes.json were compared with the release.
- N28. At which levels the source's producer supplies witnesses (L6's K_A = 0 concerns the levels that carry one); the Lean counterpart of `prop:rank-root-output-ticket` (#386), which is not under review (its manuscript proof is N24).

## Acceptance

The responsible human reviewer records acceptance only after required changes are resolved. A new content fingerprint requires renewed acceptance. Human acceptance is unset.
