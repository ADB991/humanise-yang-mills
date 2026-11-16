# #374: chart-to-launch contract for the pairwise receipt (G3) (audit report)

- **Session:** `hairer-claude-374-20261114` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/374#issuecomment-6878463329
- **Base:** `codex/existence-monograph` @ `bdd348c`.
- **Pin:** `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. All 24 Lean files cited here match `Lean/SOURCES.sha256` (see `hashes.json`).
- **Status:** report-only and unreviewed. This is a **textual** reading of the source. No Lean was elaborated, because the network blocks the Mathlib download.
- **Consumers:**
  - #372 (final combination with `prop:trace-rounded-receipt`);
  - #375 (one-step purchases), #376 (output transport), #378 (ticket);
  - the open list of `subsec:trace-rounded-receipt` as revised in #384.

## 0. Where the contract sits in the source

The (G3) chain at the pin runs as follows.

```
boatsSky ──await──> lava_vSky (Prom/Orion/Reach.lean)
   witness T : PoisedSky (P k) B H O J n z k T      (Prom/Orion/Plume.lean:23)
   └─ he.supply x  →  l r, L : LegacyCostSky …, and for N>k:  V, ActumSky …, StampDuty with .T = T N p d
   └─ poured (MergeProof/East/Ladle.lean:27)  →  Solves for the corrected label ladd
earningsSky (Prom/Front/West/Tael.lean)  →  launch data, money/principal bounds, bank at widthSky
   └─ y_readySky (Prom/Front/West/Lys.lean)  [#375/#376]  →  tenderlySky → Soft.couponSky  [#376/#378]
```

Here n = `trays d` = d+2 (`MergeProof.East.Gran`), which is the marker allowance M of #384. The grade cutoff is `D` = d. The configuration has m+1 = 2 points, so the hypotheses `hn' : m+1 ≤ n` and `hn : 2 ≤ n` of `lava_vSky` hold.

## 1. The chart witness (what the chart supplies)

`YM.MergeProof.East.PoisedSky (P) B H O J n z k t` (`Plume.lean:23–28`) is a Prop-structure on a panel family `P : ι → Panel D` and a table `t : ℕ → ℕ → TableL C D`. Its fields:

| Field | Content (exact) | Role |
|---|---|---|
| `early` | `∀ d ≤ D, C.ref d ≤ k` | the grade references are below the level |
| `limit` | `max(factor(J k), factor(J k − 1)) ≤ monitor k` | clock factor bound |
| `charts N p (k<N)` | `Charting D k (t N p) N p`: for every grade d ≤ D, `Tested C d k N p (t N p d)` and signed-motion equivariance (`MergeProof/East/Plume.lean:22`) | the chart reading T = t N p d |
| `bank N p (k<N) i` | `InvoiceSky C k N p i (t N p i)`: ‖awake x − T x‖ ≤ bill(−1/2, β̂_k)·‖awake x‖ in coefficient size (`Orion/Eupho.lean:11`) | a reading accurate to a factor bill(−1/2) |
| `supply χ` | for each panel χ there are `l r` and `L : LegacyCostSky B J (−3) z ξ k n D O l r`, with ξ = `(P χ).bag (J k)`. For every N > k and p there is `V : Rep G (C.side k p)` with `ActumSky … L V` and, for every grade d ≤ D, a `StampDuty C k N p d ξ.taylor V ξ.era.coast.Q (stamp A N p)` whose `.T` equals `t N p d` | the cost, actuation and stamp data |

`Tested C d k N p T` (`Next/RANK/Matrices.lean:67`) consists of three conditions:
- T(1_ref) = e_0;
- T(v*) = T(v)*;
- ‖awake(v) − T v‖ ≤ ½‖awake(v)‖ in coefficient size.

`Tested.bijective` gives that T is bijective (used below).

**Uniformity.** A witness is produced by `stagingSky` (`Plume.lean:30`) eventually in k. That uses `mintingSky` and `follows_prices`, and needs the clock bound `limit` and a `LegacyCostSky` for every panel. `LegacyCostSky` is produced in `Order/Sofa.lean` (`office`, `CapacitySky`); see §5. The witness is chosen before N, p, the fit point and the labels, and every field above is quantified over them.

## 2. Exported allowance (A) and the chart's depths

`L.age : ChargeSky A ξ.band k n O ξ.era` (`Hill/Incoming.lean:56`) carries `allot : AllocatedSky A n k O ξ.band` (`Hill/Allowance.lean:20`), whose two fields are:

- `permitted : AllowedSky A b k` (`Hill/Station.lean:42`), with b = ξ.band = `(P χ).arc` by `Panel.factor`. Its four fields are:
  - `dilation`: m·μ_k² ≤ a_{ℓ}/a_k, with m = `mag A b k` = μ_k^b and ℓ = `middleSky A b k`. **This is (A) of #384, exactly.**
  - `depth`: (coverSize_k)^{10} ≤ a_w / a_ℓ, with w = `widthSky A b k`.
  - `large`: 2 ≤ `wheelSky A k`.
  - `bracket`: w ≤ j ≤ k ⇒ J(k) − 1 ≤ J(j). Every level between the root depth and k lies in the current or the previous clock stage.
- `charge : ticket O (A.params w) n ≤ pot A n k`. This is the ticket bound T_M ≤ I_k at the output level w; see §5 and #378.

**Definitions the manuscript lacks** (M3 of review #383). In the source they are definitions, not hypotheses (`Station.lean:14–32`). `gainSky T i r` = max{ j ≤ i : a_j / a_i ≥ r } (0 if the set is empty). Hence:
- the **middle level** is ℓ = max{ j ≤ k : a_j ≥ m μ_k² a_k }, and the middle cell is the cell of spacing a_ℓ. `dilation` says this set is nonempty, i.e. the defining inequality holds at ℓ;
- the **root depth** of the chart is w = `widthSky` = max{ j ≤ ℓ : a_j ≥ (coverSize_k)^{10} a_ℓ }. The tiling of `Ship.yardSky C b … p` is `center C.S (m := widthSky A b k) p … 0` (`Allowance.lean:26–28`). This is the centered tiling on which the (G3) root test is taken. So the identification w_i = w required in #384 is the source's own: (G3) and (G4) are both stated at `widthSky` (review #383, L16).

**Threshold K_A.** None beyond the witness itself: (A) holds at every level k that carries a witness. The width clause additionally needs μ_k² ≥ 800 (`open_readSky`, `Orion/Suds.lean`), which is a pure clock condition.

## 3. The corrected label and the `Solves` identity

`YM.Next.Rank.East.ladd C b k N p d T` (`MergeProof/East/Ladle.lean:18`) is defined as follows. If T is bijective, then

  ladd(x) = T^{-1}( σ^{-1} · W_b x ),

and otherwise ladd = 0. The ingredients are:
- σ = `shrink C k N p` = (√β_{N,p,k})^{-1} / `threshold k` > 0 (`Matrices.lean:104`, `shrink_pos`);
- σ^{-1}· is the frame scaling `(C.labels.level d).scaled σ^{-1}`;
- W_b = `weightTag C d b` multiplies the component of grade j by b^j (`Matrices.lean:89`).

In `lava_vSky` the label is v_i = `ladd C (mag A b k) k N p (t i) (T N p (t i)) (y i)`, with magnification m = μ_k^b and the chart reading T = `T N p (t i)`. **This is the manuscript's X^{(i)}_{N,p} e of (G2) (`trace-rounded-comparison.tex`) at e = y i**, with m = m_i, at the selected chart.

`Solves C ρ d k N p T basis v` (`Matrices.lean:126`) is the identity

  σ · T(v) = W_ρ(basis)   (frame scaling by σ).

**Proof that the corrected label solves it** (`poured`, `Ladle.lean:27`). The hypotheses are C.ref d ≤ k (`early`), k ≤ N, and `Tested … T` (`charts`). Then T is bijective (`Tested.bijective`), so ladd(x) = T^{-1}(σ^{-1}W_m x) and T(ladd x) = σ^{-1}W_m x. Applying the frame scaling σ, and using that σ·σ^{-1} is the identity because the scaling is coordinatewise multiplication by powers of σ ≠ 0 (`Frame.scaled_inv`), gives σ·T(ladd x) = W_m x. ∎

Solutions are unique (`Matrices.solve`: T is injective). Hence every v with `Solves … T x v` equals ladd(x), and the corrected label is determined by the chart reading.

**Stamp form.** `lava_vSky` needs `Solves` for the stamp duty's `.T`, not for t N p d. They agree because `supply` gives a stamp duty Y with `(Y d).T = t N p d` (`hy`), and `rw [ha, hy]` rewrites the band. So `Solves … (Y (t i)).T (y i) (v i)` holds.

## 4. Money and principal-source bounds for the launched invoice

Write s = β̂_k (`clim A k = A.clock.hatBeta k`, `ParticleGate.lean:26`) and bill(a, s) = exp((log log s)²·a) (`Reign.lean:25`). For a label t write
- paid(t) = ‖awake(t)‖ in coefficient size (`Insiders.lean:48`);
- moneys(t) = columns_k · paid(t) (`Insiders.lean:50`).

**Source lemma** `YM.Next.Rank.Ribbon.StampDuty.procureSky h H d D v` (`Prom/Sway/Tilt.lean:11`). Eventually in k, the following holds for every b ≥ 0 and every y with y + b·d + saves(d) ≤ −8, given `year C D k` (supplied by the witness field `L.moves.year`, `Hill/Ratchet.lean:22`), every N ≥ k, every p, every stamp duty F at (k, N, p, d, D), and every t with `Solves (mag b k) d k N p F.T v t`:

  bill(y, s) · moneys(t) ≤ bill(−8, s)   and   coin(F.W t) ≤ bill(b·d + saves(d), s).

Here saves(d) = leash(level d) + 2 (`ParticleGate.lean:44`). The proof passes through `Atlas.incomeSky` (`Sway/Price.lean:10`): μ_k · paid(t) ≤ bill(b·d + saves(d), s), eventually in k. It also uses the stamp's `weight` field, coin(W x) ≤ bill(1, s)·paid(x) (`Next/RANK/Tilt.lean:23`).

**Application in `earningsSky`** (`het`, `Tael.lean`). For each of the m+1 labels, the lemma is applied with:
- v = g i (the basis label);
- b = the panel arc;
- y = e, the panel currency, so that bill(e, s) = `ξ.cash s` (`Ratios.lean:45`, `Panel.vital`).

The premise e + arc·d_i + saves(d_i) ≤ −8 is derived from the panel constraints `loose`/`vital` and `(M.bag 0).fits`. The principal bound is then raised to ξ.principal(s) = bill(credit, s), via `Glimmer.billed` and arc·d_i + saves(d_i) ≤ credit (`hQ`, from `Panel.loose` and `Tapes.savings`). These are exactly the hypotheses `hg` (money) and `hK` (principal) of `y_readySky`.

**Uniformity.** The threshold of `procureSky` depends on the label v and the grades d ≤ D, finitely many in all (`eventually_all`). It comes before N, p, the stamp duty and the solution, which are universally quantified after it. The premise on y is checked from panel data that are constant along the panel sequence (`ArcSky`).

## 5. What the chart does not supply (separate inputs, with owners)

These are the remaining hypotheses of `y_readySky`/`earningsSky`, with their sources.

| Input | Source statement | Kind | Owner |
|---|---|---|---|
| Bank at the output level: `Ship.bank O A w`, which is P_R(X) − 4D log g/q ≤ T for every representation that `Station.Meets` | `Ship.banking` (`Next/RANK/Allowance.lean:42` = `Station.affordable`), eventual in the level m. Moved to m = w by showing w ≥ u eventually in k (`hΩ`, from `bracket` and `fits.deep`) | clock, eventual in k | #378 (open item 2(b) of #384) |
| Ticket T_n ≤ I_k at w | the witness field `AllocatedSky.charge` (§2). Produced in `Order/Sofa.lean` (`office`): `ticket O (S i) u ≤ log P(s)/(16u)` eventually in s, for the finitely many stage profiles i ∈ `farSky j` = {j, j−1}. `bracket` puts the profile of w among them | witness field; producer in the cost construction | #378 |
| Walls `WallsSky b hi g Kz θ k` | `mural_castSky` (eventual in k; depends on the labels g, the compact window Kz, the arc bound u₀ and θ) | launch geometry, eventual | #375 |
| Tickets for walls (`hh`), Seal ⇒ Wall.Model (`hγ`) | `hat_rate … tremor`, `Radian.commissioned` (eventual) | clock/Gaussian, eventual | #375 |
| `StakeXSky` on spaced seats (`hx`) | `caughtXSky` (`Tael.lean`, last bullet) from `hp` (Scrim) and occupancy | marked compiler input | #375 |
| `WhipSky` path to w (`ActumSky.acts`) | the witness field (§1), produced by `prospectSky`/`repertoiresSky` from `LegacyCostSky.hours/token/moves` | witness field | #375 consumes it |
| Output transport and the identification of `(invoiceSky …).part s` with Φ_s | `tenderlySky` → `Soft.couponSky` | output | #376 |

## 6. The precise chart-to-launch statement (contract)

**Contract.** Fix a grade cutoff d, M = d+2, the window 𝒲, and bases of E_{d'} for d' ≤ d. Fix also the panel data: currency e, θ = Δ, and an arc bound u₀ (as in `ArcSky`). There is K_0, depending only on these data, such that for every level k ≥ K_0 and every chart witness at level k (`PoisedSky`), the following hold for each panel with arc b ≤ u₀.

1. **(A)** holds with b, the middle level ℓ and the root depth w as defined in §2. `bracket`, `depth` and `large` also hold, and the ticket bound `ticket(params w, M) ≤ log μ_k/(16M)` holds.
2. For every N > k and every p:
   - the chart readings T_{d'} = t N p d' are `Tested` and bijective;
   - the corrected labels X_{N,p} e = T_{d'}^{-1}(σ^{-1} W_{μ_k^b} e) satisfy σ·T_{d'}(X_{N,p}e) = W_{μ_k^b} e (§3);
   - there are a representation V at level k with an actuation path to w, and stamp duties with `.T` = T_{d'}.
3. For every basis label e of grade d' ≤ d, and every N ≥ k and p, the corrected label t = X_{N,p}e satisfies
   - bill(e, β̂_k)·moneys(t) ≤ bill(−8, β̂_k), and
   - coin(W t) ≤ bill(credit, β̂_k) ≤ ξ.principal(β̂_k) for the stamp's polynomial W.
4. The output level satisfies w ≥ u_bank, so `Ship.bank O A w` holds.

**Order of quantifiers.** K_0 comes before N, p, the fit configuration and the basis labels.

**Not chart-uniform** (L1 of review #383). K_0 depends on the panel data (e, Δ, u₀). Along the gallery these are fixed per panel sequence (`ArcSky`: constant currency and θ, arcs a_i + e_k with e_k ∈ [0,1]). So K_0 is uniform over all charts whose panels share those data, which is what (A)/(B) of #384 need. It is not uniform over arbitrary panels.

**Proof status.**
- Items 1 and 2 are read directly from fields and definitions; the `Solves` identity is proved in §3.
- Item 3 is `procureSky` composed with the panel inequalities.
- Item 4 is `banking` plus `bracket`.
- Each of these steps is a textual reading of the cited proofs at the pin; none was elaborated.

## 7. Manuscript locators and missing producers

**In the manuscript:**
- (G2)'s maps X^{(i)}_{N,p} (`trace-rounded-comparison.tex`, `(G2)`) are the corrected labels of §3. The manuscript takes them as data and does not state the `Solves` identity.
- (A) is stated in `trace-rounded-receipt.tex` (`eq:trace-receipt-allowance`).
- The ticket purchase and the bank premise are in `sec:rank-root-normalization` ("Choose the comparison depth k on a constant-profile interval…"; "At an output level m, β ≤ 4β̂_m…").

**Missing from the manuscript.** Each item below is a precise statement owned by the C15 gallery chapter (`trace-firesky-gallery.tex`, `sec:ex-lattice-firesky-gallery`) or by #372:
- (i) The definitions of the middle level ℓ and the root depth w (§2), and the statement that the funded chart witness satisfies `AllowedSky` (dilation, depth, wheel ≥ 2, bracket) and the ticket bound at w.
- (ii) The definition of the corrected label (§3) and its `Solves` identity, with the stated two-line proof.
- (iii) The money and principal bounds of §4, as a lemma: eventually in k, uniformly in b ≥ 0, N ≥ k and p, for solutions of the `Solves` identity with a tested reading. Its proof is the coefficient-size estimate `incomeSky`. I did not locate a manuscript proof of `incomeSky`. The nearest candidates, the calibrated-entry estimates of `centered-construction.tex` (l.47 onward), were **not** matched; this is left open.

None of these needs a new analytic idea. Items (i) and (ii) are definitions plus a short argument. Item (iii) needs a translation of `incomeSky` (`Prom/Sway/Price.lean`), which I recommend as a small `explain` task under C15, unless the C02/C12 calibrated-entry estimates are found to cover it.

## Checks actually run

- Textual reading of the declarations cited above at the pin.
- SHA-256 of the 24 cited Lean files checked against `Lean/SOURCES.sha256`: all match.
- `python3 scripts/check_blueprint.py`: see the PR.
- Not run: Lean elaboration (network), manuscript build (no manuscript change).
