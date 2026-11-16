# Review of a proof unit

- Unit: YM-000026 (`blueprint/units/YM-000026`); bounded review of the #373 note for #372.
- Role: Lean correspondence
- Human reviewer: stalex444
- Agent assistance: Claude (Fable 5.2 and Opus 5.5): a text-level correspondence read and a separate elaboration probe (five runs). The Lean findings rest on the probe outputs and the text read; where the two-check verification of a mathematics finding also read the source, the item says so (L16). Agreement between agents is not offered as evidence.
- Content SHA-256: per-file SHA-256 in `hashes.json`; the 24 source files hashed equal `Lean/SOURCES.sha256` and the release checkout at `3456e5e`. The unit fingerprint does not cover the note (see README, Records).
- Manuscript files and labels: `manuscript/existence/trace-rounded-receipt.tex` (`lem:trace-receipt-width`, `lem:trace-receipt-cost`, `prop:trace-rounded-receipt`, the supply paragraph); the #373 change to `trace-rounded-comparison.tex`; the correspondence table of the author record `results/C15/author/hairer-claude-372-20261114/README.md` (l.18–30).
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Review task and PR: #372; reviewed PR #373 (commit `83eecbca`, merged at `a8c24495`); this report is added by its own pull request.
- Outcome: accepted locally, conditional on stated dependencies ((A), (B); N9–N19); no required change. No mismatch that breaks a step of the note was found. The note is stronger in form than the source in three places (L1, L8, L9); the two explicit lemma forms (L8, L9) were proved in the probe over the release definitions; the stronger form of (B) (L1) is what the proposition, with its threshold fixed in advance, uses, while, granting the late-point property of mathematics M1, its late-point argument would also go through per curve. L1 is recommended; L12 is a suggestion tied to mathematics M4; L15 concerns the author record only.

## What was elaborated and what was not

- **Elaborated.** Probe files `evidence/Probe372_v1.lean` … `Probe372_v5.lean` were elaborated with Lean 4.32.0 (toolchain `leanprover/lean4:v4.32.0`), with the YM `.olean` files of `3456e5e7` (the sources were read and hashed, not placed on `LEAN_PATH`) from the compiled release archive `ym-build-3456e5e.tgz` (SHA-256 `07c145c3…`, equal to `source/build.md` l.37; `source/evidence/clean-build-3456e5e.md` finds this artifact equal to a fresh build up to embedded source paths in stored linter messages), and the Mathlib and other dependency `.olean` files from a local Lake package cache, using `lean -DmaxHeartbeats=0 -DmaxRecDepth=4096 <file>` (command and resources in `evidence/RUNLOG.txt` and `validation.md`). The printed outputs are `evidence/Probe372_v1.out` … `Probe372_v5.out`. They contain the elaborated types of the declarations below, `#print axioms` for each, filtered proof-term constant lists for `await`, `boatsSky` and `open_readSky`, a binder-occurrence scan of `open_readSky`'s proof term, and two probe theorems (`probe_width_explicit`, `probe_cost_explicit`). Every declaration named below as "(ax)" depends only on `[propext, Classical.choice, Quot.sound]`; no `sorryAx` occurs in v1, v3, v4 or v5; v2 printed it for its failed `probe_cost_explicit`, fixed in v3 (v3 l.42; unchanged in v4–v5). The probe's own theorems were checked by Lean's kernel as they were elaborated.
- **Not done.** The release's proofs were loaded from compiled files and not replayed by an independent kernel checker (no `leanchecker`); nothing was built from source (no `lake`); Mathlib was not rebuilt. The extracted files were not re-verified one by one against the archive, and the dependency `.olean` files were not independently verified; a verbatim copy of `open_readSky`'s source proof elaborating to the same type (L15) is consistency evidence only (N10).
- **Hidden instances and coercions.** For the declarations below, the printed elaborated types fix implicit arguments, instances and name resolution; for example `trays` in `await` and `boatsSky` resolves to `MergeProof.East.trays`, and the norm in `SeqPair.width` is the `PiLp` 2-norm (Euclidean on ℝ⁸). This is inspection of printed types for the listed declarations, not an exhaustive instance audit.
- **Text only.** L14 call sites, L16 and L18 are text-level, as marked.

The note itself names no Lean declaration; the pairings below are the author record's (README l.18–30) or this review's. Paths are relative to `Lean/YM/`. "v1 l.N" refers to lines of `evidence/Probe372_v1.out`, and similarly for v2–v5.

## Findings and evidence

| # | Declaration (file:line) | Note's counterpart | Verdict | Level, evidence |
|---|---|---|---|---|
| L1 | `MergeProof.East.lava_vSky` (`TraceExtension/Prom/Orion/Reach.lean:34`) (ax); `ArcSky` (`:21`) | (B) | Note stronger (quantifier order); see below | Elaborated, v1 l.268–314 |
| L2 | `MergeProof.East.SeqPair` (`TraceExtension/Prom/Zoom/Boats.lean:21`) | (G3) as used by the note | Matches, except the window's separation metric ((G3) is stronger there; below) | Elaborated, v1 l.22–66, 264–267; v2 `#print YM.Axis`; `spaced`, `cubedist` text only |
| L3 | `TimberSky.plate`, `Vane.checked`, `costHint` | cost ε_i = (i+1)^{-1}, d = i, l = i | Matches (`costHint k = (k+1)⁻¹` by `rfl`) | Elaborated, v1 l.67–94, 141–144, 630–633 |
| L4 | private `MergeProof.East.await` (`Boats.lean:31`) (ax) | first assertion of the proposition | Matches in content (on the source's ℓ∞ window, see L2); Lean is eventual along one curve, the note gives an explicit threshold K(d,ε) uniform over charts (see L1) | Elaborated, v1 l.1–21; uses v4/v5 |
| L5 | `MergeProof.East.boatsSky` (`Boats.lean:49`) (ax); `wakesSky` (`:75`) (ax) | selection part of the proposition; the gallery's use of the selection | Matches | Elaborated, v1 l.95–140; uses v4 |
| L6 | `Next.Rank.Station.AllowedSky.dilation` (`TraceExtension/Prom/Hill/Station.lean:42–43`) | (A) | Matches | Elaborated, v2/v4 l.1–4; v1 l.213–242 |
| L7 | `Next.Rank.Station.FitSky` (`TraceExtension/Prom/Hill/Tuning.lean:15`) | "fit for the chart" | Matches | Elaborated, v1 l.199–212, 243–259 |
| L8 | `MergeProof.East.open_readSky` (`TraceExtension/Prom/Orion/Suds.lean:35`) (ax) | `lem:trace-receipt-width` | Note stronger in form; explicit form proved | Elaborated, v1 l.184–193; v4 |
| L9 | `Next.Rank.Ship.diminishes` (`Next/RANK/Allowance.lean:34`) (ax); `pot`, `allowance`, `budget` (`:26–28`) | `lem:trace-receipt-cost`; I_k, a, μ_k^{-1/(16n)} | Note stronger in form; explicit form proved; definitions unfold by `rfl` (μ_k^{-1/(16n)} then by the rpow identity, μ_k > 0) | Elaborated, v1 l.618–626; v4 last lines |
| L10 | `Next.Rank.Ship.fixed` (`Allowance.lean:30`) (ax) | a ≥ 1 | Matches (no hypotheses) | Elaborated, v1 l.627; v2 l.5 |
| L11 | `MergeProof.East.trays` (`MergeProof/East/Gran.lean:25`) | n = d+2 | Matches (reducible, d ↦ d+2, `rfl`) | Elaborated, v1 l.628–629, 691–698 |
| L12 | `PhysicalNext.InteractingRank.Soft.couponSky` (`TraceExtension/Prom/Port/Soft/Denarii.lean:31`) (ax) | supply of the level budget | Arithmetic matches; source takes more hypotheses than open item 2 names | Elaborated, v1 l.634–656; v2 l.11–30 |
| L13 | `Next.Rank.Ship.rebate` (`Allowance.lean:95`) (ax) | the author record's "non-trace analogue" | Different (non-trace) objects; the record's word "analogue" is accurate | Elaborated, v1 l.657–690 |
| L14 | `earningsSky`, `y_readySky`, `tenderlySky` (ax) | the author record's chain for (B) | Statements match the described chain; proof bodies not inspected | Statements elaborated, v1 l.355–481; call sites text only |
| L15 | `open_readSky` proof term | author record row for the width lemma | The μ_k ≥ 1 filter is unused | Elaborated, three ways (below) |
| L16 | `SeqPair.boot`, `FitSky.stencils`, `widthSky` | (G3) and (G4) at one depth (mathematics M2) | The source uses one depth by construction | Text only |
| L17 | — | records | No record in the repository prints `await`'s elaborated statement; `evidence/Probe372_v1.out` does | Text (search of C15 records) |
| L18 | 24 source files | file identity | Byte-identical between the release checkout and `Lean/` at `0f00ae72`, and equal to `Lean/SOURCES.sha256` | Hashes (`hashes.json`, validation.md) |

### L1. (B) is stronger than `lava_vSky` (Should)

Elaborated, `lava_vSky` has the form: for every panel sequence P with `ArcSky P` (which fixes the arc at each level) and fixed source data, eventually in k, for every chart table T with `PoisedSky (P k) …`, every N > k, every period, every point w with `tested … w ∈ R` and `FitSky … w`, and every nonempty s, `rootTest ≤ budget n k`. The threshold comes after P; uniformity holds only over T, (N, p), the point and s. The note's (B) has a threshold K_B(d) that does not depend on the chart, with dependence listed only on the grade cutoff, bases and window (l.66–68). So the note's (B) is the stronger statement.

The late-point argument needs only the per-curve form: `await` applies `lava_vSky` to the one panel sequence of the level curve, and the note's late-point argument (which rests on the property discussed in mathematics M1) also fixes the curve first. The proposition as written states its threshold K(i,(i+1)^{-1}) uniformly, which rests on the assumed stronger (B), and so does the threshold repair of mathematics M1. The uniform form would follow by a diagonal argument (failing charts at infinitely many levels would assemble one failing sequence) provided every chart of the family lies on an `ArcSky` sequence; `ArcSky.wave` (arcs a_i + e_k with e_k ∈ [0,1], currency and θ constant in k) makes this plausible for the gallery's offset panels. This was not checked (N14). Mathematics M1 describes how the choice between the two forms affects the repair of the "Moreover" argument.

Suggestion: add the panel sequence to the dependence sentence of (B) and state (B) along the selected level curve, or add a one-line remark deriving the uniform form.

Affects: whether (B) as stated is what the source supplies; not the deduction from (B).

### L2. (G3) = `SeqPair`

`width`: for x : Fin 2 → Cover, with y = `tag (mag b i)⁻¹ x`, y generic and ‖y‖ ≤ 100 imply `FitSky`. `boot`: for grades w : Fin (d+1), basis pairs, N > i, all periods, `tested` in `window 100 2`, `FitSky`, s nonempty: `rootTest ≤ ε`. Cover = ℤ⁴ (`Four ℤ` = `Axis → ℤ`, `Axis = Fin 4`), so x ∈ (ℤ⁴)²; the norm is the `PiLp` 2-norm on ℝ⁸. One difference: `Scaling.window 100 2` is {`spaced` 100⁻¹ x ∧ ‖x‖ ≤ 100} (v1 l.266–267), and `spaced` (`Space/Configurations.lean:70`) measures separation by `cubedist` (`:51`, the ℓ∞ distance), while 𝒲 (parent l.25) uses the Euclidean distance (parent l.18–19, l.324). So (G3) asks for the root bounds at more rounded points than `SeqPair.boot` (for example x = (0,(0.006,0.006,0.006,0.006)): Euclidean distance 0.012, ℓ∞ distance 0.006), and (G3) is stronger here. This comes from the parent's (G3), not from #373, and no step of the note depends on it: (B) is assumed on 𝒲, and `lava_vSky` accepts any compact R ⊆ conf. Not checked: that `(invoiceSky …).part s` is the note's Φ_s (N11).

### L4, L5. `await` and `boatsSky`

`await`'s printed type: given `G.Simple`, `Scrim`, generator ≤ z, a panel sequence x with `ArcSky x`, a level curve i → ∞ and `PoisedSky (x (i j)) … (trays d) z (i j) (R j)` for every j: for every ε > 0, eventually in j, `SeqPair (i j) (x (i j) 0).arc d (R j) ε`. Its proof-term constants include `lava_vSky`, `open_readSky`, `Ship.diminishes`, `Filter.eventually_all`, `ge_mem_nhds`, `Panel.factor`, `ChargeSky.allot` and `AllocatedSky.permitted`, matching the author record's row. `boatsSky`: under l ≤ trays d and s → 0 with s > 0, for any lower bound Y there are k ≥ Y with s k < θ and i ≥ Y with `TimberSky`; its constants include `await`, `fliesSky`, `LeapSky.rates`, `supply_wheel` and `Filter.Eventually.exists`. It also intersects `TimberSky.high` and `.early`, which fall under the note's remaining finite-level receipts. `wakesSky` yields `StrictMono p`, `StrictAnti (s ∘ p)`, levels → ∞, and `Vane.checked` at every d.

### L6, L7. (A) and fitness

`AllowedSky A b k → mag A b k · μ_k² ≤ a(middleSky A b k)/a_k`, with `mag = μ_k^b` and `gap = a_k · mag`. Carried by each witness through `PoisedSky.supply → LegacyCostSky.age → ChargeSky.allot → AllocatedSky.permitted`; the chain type-checks (v1 l.315–354, 482–573), with slot = n. Text level (one check): `middleSky` (`Station.lean:31`) is the largest j ≤ k with mag · monitor² ≤ a_j/a_k; `AllowedSky` has three further fields (depth, large, bracket) that the note does not need. `FitSky`: `usable` (key generic) and `deep` (|key i j| ≤ a(middleSky)/8) with key = a_k⌈m x⌉. The same `AllocatedSky` carries a field `charge` (the ticket at `A.params (widthSky A b k)` is at most `pot`). The author record (README l.30) identifies the corresponding field `Allocated.charge` of the non-trace `rebate` (ticket at `A.params k`) with T_M ≤ I_k; whether the trace field is the note's open item 2 was not verified (N18).

### L8, L9. The two lemmas

`open_readSky`: eventually in k, for every b with the full `AllowedSky` and every x, y generic and ‖y‖ ≤ R imply `FitSky`. The note gives the explicit condition μ_k² ≥ 8R and uses (A) alone. The probe theorem `probe_width_explicit` (dilation and 8R ≤ μ_k² at a fixed level imply fitness; b and R arbitrary; no R > 0; ax) proves the note's explicit form over the release definitions. `open_readSky`'s proof term uses only the `dilation` field of `AllowedSky`. The note's R > 0 is unneeded and harmless.

`pot = log μ_k/(16M)`, `allowance = exp(2 pot)`, `budget = exp(−pot)` (`rfl`); `diminishes`: `budget → 0` for simple G and M > 0. The probe theorem `probe_cost_explicit` (M > 0, ε > 0 and ε^{-16M} ≤ μ_k imply `budget ≤ ε`; ax; here n = d+2 > 0) proves the note's explicit threshold; ε ≤ 1 is not needed. The source has no standalone lemma for this step; it is inline in `await`.

Whether the two probe theorems state the note's lemmas faithfully is a correspondence judgment made here, not a kernel fact (N16).

### L12. Supply paragraph and `couponSky` (suggestion; see mathematics M4)

The calc exp I / a^{|s|} ≤ exp I / a = exp(−I) is the note's, step for step (proof body read as text). `couponSky` also requires `AllocatedSky` (whose `charge` is the ticket at `A.params (widthSky A b k)` ≤ `pot`, i.e. the ticket at the root-depth level), `bank O A (widthSky A b k)`, `Ferm P u q`, n ≤ M, `0 ≤ e`, c ≤ 1, d ≤ 1 and `estimateSky`. Open item 2 names only T_n ≤ I_k and does not say at which level's parameters the ticket is taken. `bank` (`YM.Next.Rank.Ship.bank`, `Next/RANK/Allowance.lean` l.40–41, the constant in `couponSky`'s elaborated type, v1 l.637) reads, as text, protection − 4·lieDim·log g / #sites ≤ ticket for X ≤ 1+k: the premise of mathematics M4. `couponSky`'s body (read as text) uses it at that step, and `banking` (l.42) supplies it eventually in the level. Whether `protection` is P_R(X), and whether `eq:rank-root` and its hypotheses contain `Ferm` and `estimateSky`, was not checked (N13).

The level matters: the trace `AllowedSky` has no `plateau` field (its `bracket`, `Prom/Hill/Station.lean` l.46, allows J m = J k − 1 for w ≤ m ≤ k), whereas the non-trace `rebate` moves the ticket from k to the width level by `plateau` (`Next/RANK/Allowance.lean` l.107–108); so in the source the trace witness does not supply the constant-profile choice of rank-root l.260–261. Suggestion: in item 2 say that the ticket is taken at the root-depth level w, and either list the bank inequality at w or point to where `sec:rank-root-normalization` establishes it (rank-root l.227–258; see M4).

### L14. The author record's chain for (B)

`lava_vSky → earningsSky → y_readySky → tenderlySky → couponSky`: all statements end in `rootTest ≤ budget u k` (ax). Call sites were matched as text (`Reach.lean:40`, `Front/West/Tael.lean:85`, `Front/West/Lys.lean:70`, `Front/West/Equity.lean:88`). `earningsSky`'s threshold comes after a fixed panel sequence U (consistent with L1); `y_readySky` and `tenderlySky` take `bank O A (widthSky …)` as a hypothesis. Proof bodies were not inspected (N12).

### L15. The exponent-1 filter in `open_readSky` is unused (Minor; author record)

Three checks at the elaborated level: (i) proof-term scan: the binder `hv : 1 ≤ mag V 1 k` does not occur in the body, while `hp : 8 * R ≤ mag V 2 k` does (v4); (ii) `probe_open_readSky_no_exp1`, the verbatim source proof with the μ_k ≥ 1 filter removed, elaborates with the standard axioms, as does a verbatim control copy (v4, v5); (iii) both probe copies have the same type as `open_readSky` (syntactic equality and `isDefEq` true; v5 l.72–73). The author record's row ("exponent 1 (μ_k ≥ 1)", README l.27) is accurate only in that the filter contains it. This concerns the author record, not the note.

### L16. (G3) and (G4) at one depth (text only)

The (G3) root test (`SeqPair.boot` on `yardSky`) and the (G4) chamber (`FitSky.stencils`) both use the centered tiling at `widthSky A b k`, with `widthSky ≤ middleSky ≤ k` (read as text by two checks; not in the probe). The source therefore makes the identification that mathematics M2 asks the note to state.

## Required changes and remaining uncertainty

Required: none for this role. Recommended: L1. Suggestion: L12 (with mathematics M4). Record note: L15.

Not checked:

- N9. The release's proofs were loaded from prebuilt `.olean` files and not replayed by an independent kernel checker (the probe's own theorems were kernel-checked as elaborated); neither the release nor Mathlib was rebuilt; no `lake`.
- N10. That the extracted YM `.olean` files are byte-for-byte those of the archive whose digest matches `source/build.md` l.37 (the tree was not re-verified against the archive), and that the dependency `.olean` files from the local Lake package cache are those of the lock file.
- N11. That `(invoiceSky …).part s` is the note's Φ_s (`Read.cylinder` and cumulants not inspected).
- N12. Bodies of `earningsSky`, `y_readySky`, `tenderlySky`; `FiresSky.earns`, `supply_wheel`, `fliesSky`, `podiumSky`, `s_postage`.
- N13. `estimateSky`, `Ferm` and `bank` against `sec:rank-root-normalization` and the allarity section; `bank` read as text, not against `eq:rank-root`.
- N14. The uniform form of (B) (L1 diagonal argument), including whether every chart of the family lies on an `ArcSky` panel sequence.
- N15. (G3)/(G4) at one depth (`widthSky`) in Lean: text level only; the definition of `widthSky` was read as text by one check.
- N16. Whether `probe_width_explicit` and `probe_cost_explicit` state the note's lemmas faithfully.
- N17. The correspondence of Lean objects to manuscript symbols (`monitor` = μ_k, `A.S.a` = a_k, `mag` = m) rests on names, definitions read and the author record, not on a formal link.
- N18. Whether `AllocatedSky.charge` is the note's T_n ≤ I_k (ticket formula, slot M and depth); the author record identifies only the non-trace `Allocated.charge` with T_M ≤ I_k (README l.30).
- N19. Only the 24 files in `hashes.json` were compared between the release and the monograph tree; some text-level checks read the monograph tree rather than the release.

## Acceptance

The responsible human reviewer records acceptance only after required changes are resolved. A new content fingerprint requires renewed acceptance. Human acceptance is unset.
