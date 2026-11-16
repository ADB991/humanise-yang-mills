# Independent review of the #315 phase-1 audit (funded selected-history record, PR #324)

Issue #315. Session `ADB991-claude-20261113-2684` (account ADB991, a different account from the
audit's author). Claim: https://github.com/hairer/humanise-yang-mills/issues/315#issuecomment-6867116905.
Prepared autonomously by Claude (Anthropic) running as a scheduled agent on behalf of ADB991. ADB991 had not
reviewed it before submission.

## What was reviewed

| Object | Version |
| --- | --- |
| Audit report | PR #324 head `8921b078b55526bc6d88d73f7bd59e9bf2b4438f` (merged as `9c921842`), `results/C12/endpoints/codex-funded-record-20261113-2254/README.md`, SHA-256 `11a49059…19eaf` |
| Manifest | same directory, `input-git-blobs.txt`, SHA-256 `465eeb49…04e30` |
| Canonical text | `codex/existence-monograph` @ `9c921842f25479533e00235452c8ce6b1aa49aac` |
| Lean | pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, read as text; nothing elaborated |

`inspected-sha256.txt` in this directory lists SHA-256 values for every file read. All 44 git blob IDs in the
audit's manifest equal those at snapshot `922d1fe5` and are unchanged at `9c921842`; I recomputed them with
`git rev-parse <commit>:<path>`.

**Independence.** ADB991 wrote neither the audit nor any of the producer chapters it matches. Three of the files
it inspects do contain earlier ADB991 text:
- the site-count and assigned-support wording of hypothesis (iv) in `centered-public-service.tex` (`65f1c851`);
- the input I-C02-finite-interpolation wording in `centered-freight-producer.tex` (`b8b9de0e`);
- C16 revision 1 in `common-scale-selection.tex` (`aab25d77`).

None of the findings below rests on judging that text.

**Method.** I checked the "Which history?" section myself. The 16 table rows went to four reviewer subagents of
this session in disjoint groups: (A) C02 (i) and freight, (B) C02 (ii)/(iii) with R1–R3 and R5, (C1) C02 (iv)/(v)
with R6–R7, (C2) bounded grade balls and the four birth inputs. Each was briefed to read the consumer statement, the
cited producer statement and its proof, and the cited Lean declarations. Before including the three M findings and
the locator corrections, I rechecked each of them against the source myself (see "Evidence"). Agreement between
agents is not evidence of correctness; every finding cites file and line.

## Verdict

The audit is **accepted with three required status corrections (M1–M3)**. Its central conclusions are sound:
- one fixed run and door field, taken from the direct `Run.again` projection;
- no re-selection per period or volume;
- the C02/C12 overlap, a common Geyser core with Scrim extras;
- the claim that `eq:history-three-identities` does not provide the terminal hook;
- the follow-ups #317–#321 cover every genuine gap.

M1 changes one status from "missing" to "supplied conditionally", which narrows #317. M2 and M3 change two statuses
in the other direction, and #321 and #320 already cover both. The ledger owners should apply M1–M3 when they update
the C02 and C12 rows. N1–N13 are locator and premise corrections, and O1–O5 are optional.

## "Which history?": agreed

Checked directly:
- **`Run.ramp` (`FullVolume/Cross.lean:42-47`).** It obtains alloy, factor, Bandage and the `Unlatched` record from
  `dagger`, the bolt and `Chosen` from `rod`, and `t` from `fits.deep`. It then gets the doors, stories, `makes`,
  `carries` and `books` from `squad`.
- **`Run.again` (:59-61).** It calls `ahead h R.bought …` once and returns `Ties.scrim`. `ahead` (`Forge.lean:56-60`)
  applies `hx` to exactly nine arguments (`_ hy t ht S D hm hp he`), as the audit says. Nothing re-calls `ramp`.
- **`Scrim` (`MergeProof/Biscuit.lean:29-34`).** Its fields are `costs : Geyser`, `back` (1≤r i), `grows` (ζ>0),
  `jump` (exponent d+1) and `listens` (Tones).
- **`Geyser` (`Badlands.lean:42-50`).** Its fields are `night : Moonlit`, `cost`, `back`, `stay : Brine`, `mom`,
  `heights` (∃X for each (d,k,N,p)) and `aim : Freightage`.
- **`Geyser.pond` (`Fields/Pond.lean:29-31`).** It restricts to `Retain` at level k.
- **`Campaign.ponds` (`Shroud/Pool.lean:33`).** It requires `1≤i`. It rebuilds retention through `glassDoor` on
  `doorT`, which is `⟨0⟩` at m=0 (:28), and takes heights and `endow` from the `Run.again` Geyser.
- **`billbook` (`Shroud/Clan.lean:65`).** It is `rfl` for the stamped original.

One observation: `Run.ramp` instantiates `Q` as `fun _ => 1` through `dagger`. The occupancy schedule of the realized
run is therefore `mutt α (fun _=>1)`, constant 1. This is consistent with R3 and does not affect any status.

## Findings

### Required (status corrections)

**M1. The terminal endowment is supplied conditionally, not missing.** This concerns row "C02 (i), duty and terminal
endowment; R4". The consumer content is fixed at `centered-construction.tex:239-241`: (2B_N+1)^4 C_N≤3,
e^{C_N}−1≤1 and ν_N−3≥0, where C_N = forcedAllowance_N + r_N S_{B_N} u_N. The manuscript proves this bound:
- `lem:ex-geyser-radial`, second display `eq:ex-geyser-second` (`centered-geyser-scale-estimates.tex:29-31`, proof
  :51-83), gives (2B(x)+1)^4(stain(x)+p_j siteFactor(B(x))s(x))≤3 and e^{…}−1≤1;
- `thm:ex-selected-geyser-steam` collects it at the selected delays;
- `prop:ex-geyser-service-fields` applies it at j=J(m+1), x=x_m, but leaves this clause out of its displayed
  conclusion.

The required identifications are stated elsewhere:
- stain = forcedAllowance: `common-funded-history.tex:248-249`, `common-scale-selection.tex:263`;
- u_m=η_m=s(x_m): `selected-centered-service.tex:223`;
- r_m=N_{J(m+1)};
- exponent 100≥3.

Lean takes the same route. `Bandage.escape` (`MergeProof/Stove.lean:64`) proves `Moonlit.endow` from the third clause
of `stamina` (:31-32), whose parameters are exactly p=Q(J(m+1)), forcedAllowance and `stub x`.

Correct status: supplied conditionally, under the same paid-delay premises as the R2 row. What remains is an
explicit export: add the clause to `prop:ex-geyser-service-fields` and state the identifications. #317's
instruction to "prove terminal endowment separately" should be narrowed to that export. The audit's sentence that a
terminal voice with a hook does not give the bound is true. It answers `selected-centered-service.tex:124-132`,
which misattributes the clause.

**M2. R1 room and bank has no manuscript producer.** This concerns row "C02 (ii); R1". Every cited label consumes
room and bank as hypotheses:
- `ex-freight-backward`, hypothesis (iv) (`centered-freight-producer.tex:171-180`);
- the cone calculation, "The bank certificate says … The fine room certificate gives" (:128-133);
- `prop:ex-original-history-attachment` (`original-history-portfolio-attachment.tex:103-106`) says only that they
  "use the budget fields of the selected factor".

A grep of `manuscript/existence/` for `100000`, `64W`/`64D`, `puffs` and `bank` finds only further consumers:
`actual-marked-portfolio-calibration.tex:211-213`, `phase-quantitative-producer.tex:518,592` and
`trace-price-recurrence.tex`. By the audit's own convention ("Status refers to manuscript production"), the status is
**missing as a manuscript export** (Lean: `YM.Bid.buffer`, `roomCost`, `Bank` in `Bid/Loan.lean:36-57`), owned by
#321, whose body already names these declarations.

**M3. Birth input 4: the identification of the denominator with Z_{N,p} is only asserted.** The audit lists
"Wilson mass preservation identifies the local denominator with the terminal partition function" inside the
conditionally supplied part. In the manuscript this appears only as assertions: `centered-construction.tex:109` ("the
transition-mass identity identifies Z_A with … Z_{N,p}") and `centered-public-service.tex:52-54`. What is proved is
∫(B_k)_I dμ_k = Z_{N,p} ω_{N,p}(∏T_a) (`centered-birth-receipt.tex:64-77`), which gives ∫(B_k)_∅ = Z_{N,p} at I=∅.
That eval(A) = (B_k)_∅, i.e. that the integrated local representative is the propagated quiet coefficient, is not
proved, and it needs the same service identification as birth input 1 (`centered-birth-receipt.tex:38`).
`thm:ex-selected-birth-moment` itself takes Z_{N,p}≥exp(σ−D_k) as a hypothesis (:35, :88). Move this clause into the
missing part under #320; #320's body ("with the same scalar and terminal partition function") already covers it.

### Minor (locators, omitted premises)

- **N1. Row C02 (i), background.** Add the proposition's actual premise, that the run "carries its funded
  continuation certificate" (`original-history-portfolio-attachment.tex:30`). Flag the nesting receipt as unproved
  (:142-144), along with the retained strengthened local conditions (`selected-centered-service.tex:32-41`).
- **N2. Volant/Duty locator on the direct route.** `Bandage.glassDoor` (`FullVolume/Shroud/WAx.lean:47-51`) yields
  Volant at `U_.gate`, a Boutique (campaign) door. For the stored doors `D N p m` the audit adopts, the producer is
  `Bandage.paneer` (`MergeProof/Wax.lean:44`, under `Climbs`), assembled for all N, p, m<N in `Bandage.escape`
  (`MergeProof/Stove.lean:60-63`). The two files `WAx.lean` and `Wax.lean` differ only in case, and the `Stove.lean`
  meant is `MergeProof/Stove.lean`.
- **N3. Tariff and shipment.** The duty row and the freight row should cite `prop:ex-lattice-eventual-tariff` and
  `eq:ex-lattice-price-shipping` (`rg-price-receipts.tex:85-108`) as the eventual tariff and shipment purchase. What
  is missing is their attachment at the selected delays plus `HasSlots`/contact (`MergeProof/Tanger.lean:63-70`), not
  the inequality itself.
- **N4. R2.**
  - B_i≥8 is part of `eq:ex-geyser-first` (`centered-geyser-scale-estimates.tex:28`; Lean `stamina`, first clause),
    not of the contact estimate.
  - The premise B_{m+1}²≤2B_m² holds only "eventually" in the manuscript (`fullmesh-correlation-cauchy.tex:298`).
    Lean takes it from `Stock.Tabs.grows`, used in `evaporates` (`MergeProof/Stove.lean:41-46`); name it.
  - R2 says "every i", which needs the proposition at k=0. This is available because the scale fields do not depend
    on d.
- **N5. Locators in the R5 row.**
  - `Bandage.resides` is in `MergeProof/Stove.lean:49`, not `Inns.lean`.
  - `chaletrail` is `YM.PhysicalNext.Repeat.Legato.chaletrail` (`Inns.lean:33`), not in `Bandage`.
  - `eq:ex-marked-height-jump` is labelled in `marked-portfolio-calibration.tex:280`; `common-observable-purchases.tex`
    only cites it.
  - φ_i≤1 is needed by both consumers and is supplied (`centered-geyser-scale-estimates.tex:145`), but goes unlisted.
- **N6. Camera bound.** `prop:ex-geyser-service-fields` is conditional ("If … taken from the uniform estimate") and
  only states uniformity in m. Uniformity over periods and volumes is asserted at `selected-centered-service.tex:160-162`
  (`local-sections.tex:163-167` gives the underlying derivative bounds uniform in the period), and is proved in Lean by `Doors.cameras_holds`
  (`Extra/SOURCE_HISTORIES/Delays.lean:22`). Attribute it there.
- **N7. Ledger handoff.** N_j≥1 is not C12-only downstream. `ex-centered-main-bound` assumes 1≤r_i
  (`centered-construction.tex:6`), so the C02 projection must keep it too.
- **N8. Row C02 (iv)/R6, linear voice.**
  - Hypothesis (i) of `ex-freight-backward` also needs the terminal voice to agree with the calibrated top frame and
    to satisfy the terminal reflection condition (`centered-freight-producer.tex:172`). `prop:terminal-marked-voice`
    does not state reflection.
  - Address-level linearity and coefficient-independent supports are not proved in `centered-freight-producer.tex`.
    They are proved in `prop:ex-selected-interpolation` (`phase-quantitative-producer.tex:586-726`, (H5) and the
    "disjoint-address merge"), conditional on the outstanding merger (:474-476). Cite that proposition with its
    condition.
- **N9. The manuscript overclaims, and the audit should name where.**
  - `eq:history-three-identities` is labelled at `heading-history-handoff.tex:232`, not in
    `original-history-portfolio-attachment.tex`.
  - The audit's "missing" statuses for R4/retention, R6 and R7 contradict these manuscript sentences:
    - `selected-centered-service.tex:98-101` and `:176-178` ("its terminal forced-profile identity is the third
      identity in eq:history-three-identities");
    - `selected-centered-service.tex:121-132`, `:231-233`, `:236-238` ("are (R6)") and `:241-250`;
    - `original-history-portfolio-attachment.tex:117-123`;
    - `centered-public-service.tex:26`.
  - The ledger owners and #317/#318/#319 should correct or caveat these sentences, so that the chapters do not
    claim what the audit finds missing.
- **N10. Bounded grade balls.** The cone bound q_k(v)≤g_{d,R}∏_{i<k}Γ_{i+1} is a stated hypothesis of
  `ex-centered-main-bound` (`centered-construction.tex:16`), and its induction step is only asserted. List it as a
  retained premise rather than as given by "the calibrated adjacent cone". The width with the extra Γ_k, and its
  independence from p, N and site, are correct (:52-62; columns depend only on the level, `SpringT.lean:18`).
- **N11. Label types.** `ex-centered-steer`, `ex-centered-sail` and `ex-selected-birth-integral` are equation labels,
  and `ex-centered-construction` is a section. Cite them as "\eqref{…} in the proof of Theorem `ex-centered-main-bound`".
- **N12. Birth input 1, Lean.** `Ponds.past` (`Fields/Pond.lean:32`) returns `Nectar`/`tapes`, not `Served`; only
  `Geyser.at` (`Badlands.lean:56-58`) returns `Served` at every i∈[k,N]. `Geyser.at` allows k=N, whereas the
  manuscript theorem needs k<N.
- **N13. Notation.** Give a one-line gloss for the letters the audit uses:
  - C_i is the manuscript's Γ_i;
  - ζ is fly_k = 𝔣_k = ζ_d(k);
  - R4's y, w are finite-menu's u, t and C02's t_i, y_i (`centered-construction.tex:202`).

### Optional

- **O1. Row R6, exact top and Carol.** Item 5 of `prop:ex-selected-interpolation` is a conditional producer of the
  finite-wing Tale/Carol, with budgets R_F‖Iv‖₁(t+2s) and a(v) that match Lean `Carol` (`Largo.lean:13`). Citing it
  narrows #318 to the merger plus attachment on the same Music. #318 could also mention the sound-section camera
  premise.
- **O2. Row R7.** The tuning inequality (1+2c_j)·rate(L)≤barunit(L) for L≥v_j is proved conditionally at
  `marked-portfolio-calibration.tex:209-217`, subject to the condition at :262-266. Also note an η clash: R7's η_i is
  `Doors.rate(L_i)`=L_i^{-2/5}, while `selected-centered-service.tex:231` uses η_m=u_m.
- **O3. Birth input 3.** Name the support-placement condition and the per-origin towed bound
  Σ_{S∋o}a_S e^{e·cover}≤f with e≥0 as premises of the counting step (`centered-construction.tex:86`). A grep for
  another vault producer found only `lem:ex-uniform-confluence-vault` (`phase-quantitative-producer.tex:845`), whose
  constants are not 3ζ and ζ. "Missing" therefore stands.
- **O4. Birth input 1.** Note that the conditional finite downward Served induction exists in
  `ex-centered-construction`, so only the selected instantiation is missing.
- **O5. Row C02 (i), background.** The consumer fixes "a campaign album on its trail" (`centered-public-service.tex:6`),
  while the producer is the direct run. This is the album-versus-run question already assigned to #321.

## Rows with no finding beyond the above

- R3 occupancy: agreed. N_j≥1 and monotonicity hold (`common-observable-purchases.tex:22-23`,
  `selected-centered-service.tex:148-149`; Lean `Scrim.back` from `hQ'`), and C02 (ii) needs only monotonicity.
- R5 terminal bank: agreed, apart from N6.
- R7 Lean description: agreed. `Relay.Tones` (`Accord.lean:22-24`) has Q.x=0, `Format 0`, `remBound … sqrt(forcedAllowance)`,
  Coupon prices (ηq,ηq,2q) and (1+2C_i)η≤barunit. `Bandage.ravine` assumes d+3≤J(m). `Campaign.ridgeT` pays tuning
  with the grade-0 purchase and the Coupon at grade d.
- C02 (v) thresholds: agreed.
- Freight R4 "all offers" missing: agreed. `finite-menu-history-handoff.tex:126-130` and
  `actual-marked-portfolio-calibration.tex:457-458` say production remains open, and `Menu.Volant`
  (`Copse.lean:20-24`) matches the description.
- Birth input 2: agreed.

## Evidence (commands actually run)

- `git rev-parse 922d1fe5:<path>` and `git rev-parse origin/codex/existence-monograph:<path>` for all 44 manifest
  entries: 44 match, 0 changed.
- Direct reads, by this session:
  - `FullVolume/Cross.lean`, `Forge.lean`, `Unlatch.lean:20-40`, `Fields/Pond.lean:18-31`, `Shroud/Pool.lean:15-57`
    and `Shroud/Clan.lean` (grep), `Dusk/Cargo.lean` (`ridgeT`);
  - `MergeProof/Biscuit.lean:29-34`, `Badlands.lean:42-67`, `Stove.lean:25-66`, `Wax.lean:44-47`;
  - `Shroud/WAx.lean:47-51`, `Fields/Tarry.lean:18-20`;
  - the M1 sources `centered-geyser-scale-estimates.tex:20-35, 110-160` and `centered-construction.tex:236-242`;
  - the M2 sources `centered-freight-producer.tex:128-133, 172`, `original-history-portfolio-attachment.tex:103-107`,
    `actual-marked-portfolio-calibration.tex:200-218`, plus greps for `100000`, `64W`, `puffs` and `Bank` over
    `manuscript/existence/`;
  - the M3 sources `centered-construction.tex:98-118` and `centered-birth-receipt.tex:20-80`;
  - `selected-centered-service.tex:176-178`.
- The four subagents read the remaining cited ranges with `cat -n`/`sed -n` and grepped labels and declarations.
  Their commands are summarized in the issue handoff.
- `python3 scripts/check_blueprint.py`: "Blueprint structure OK: 4 units."
- `python3 -m unittest discover -s tests`: 22 tests OK.
- No LaTeX build and no Lean elaboration or axiom replay: this PR changes no manuscript or Lean file.
