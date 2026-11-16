# Textual Lean-correspondence review: five local C15 chapters

Session `hairer-claude-c15-local-20261114`. Source pin
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. All 40 inspected files match
`Lean/SOURCES.sha256` (see `hashes.json`). This is a textual comparison of
statements and meaning-determining definitions. No Lean was elaborated.

**Verdict: every proved manuscript statement matches its source declaration
in hypotheses, constants and conclusion.** There is one crosswalk locator
correction (S1) and no blocking source discrepancy.

## `trace-medal-prices.tex`

- **Monitor and price.** `Quince.sprite G x L z = z / coinP G L x`
  (`TraceExtension/Quince/Dawn.lean`). Here `coinP = √bankP` and
  `bankP = Delay.fineMonitor = Vac.Numbers.P (betaF …)`, with
  `P s = exp((log log s)²)`. This is s_a = a/χ with χ = H^{1/2} and
  H(x) = exp((log log β(x))²). Matches.
- **Rate.** `ConnectedActivityE6.Rate G L a w` means ∀ v > a, eventually
  |w x| ≤ betaF^v. This is the strict-power definition. `Target.stop : rate < 0`.
- **Medal fields** (`Quince.Medal`, `TraceExtension/Quince/Guild.lean`):
  - `cloud` is marvel ≤ sprite z · mass, where `Blush.marvel` = mass ·
    exp(−ε·coverNumber) · poster (`Blush/Confetti.lean`).
  - `talent` is tuition ≤ sprite z.
  - `gas` is `Doors.rate L * Blush.glyph (betaF G x L) ≤ sprite y`, with
    `Doors.rate L = L^{−2/5}` (`Extra/SOURCE_HISTORIES/Reserve.lean`) and
    glyph s = √exp(−(exp((log log s)²))^{1/5}) = exp(−H^{1/5}/2) at s = β(x).

  All three match (1), (4) and (2). The manuscript's |𝓜_Q| is a harmless
  strengthening: its proof bounds |p_Q|.
- **Tuition.** `Mercury.tuition Q L x j i = volt x j i · goal⁻¹ ·
  exp(−radiusB/2)`, with `volt = shiftG^{ij} · polyPrice (1/2) (ij)`.
  Further, `shiftG s = 4(2·radiusB s + 1)` (`Hem.lean`), `polyPrice ε k =
  ε^{−k}k!e^ε` (`Reserves.lean`), and `radiusB x = ⌈(log x)²⌉`
  (`Pressure/Seeds.lean`). This matches (3) and the explicit A and P_{1/2}.
  `Mercury.tutored` gives rate z for every z, as in the lemma.
- **Prices y and z.** In `Quince.decorate` the Medal is built from `fare_pr`
  (cloud, price z), `force_pr` (gas, price y) and `sprited ∘ fGood ∘ tutored`
  at rate −1 (tuition, price z). This matches the closing paragraph. In
  `Quince.Soot` the Medal's (y, z) are instantiated as (p j i, v), the target
  price and the summability budget (see mathematics E1).

**S1 (locator, non-blocking).** `trace-medal-prices-evidence.md` names
`YM.PhysicalNext.Repeat.Blush.fruition` (`Blush/Little.lean`) for the
"uniform cloud mass price". That declaration proves a different two-part
estimate: ‖o‖(V+V) ≤ b·m together with a jewel-debt/glyph bound, with no
monitor factor. The producer of the Medal `cloud` field, matching
Lemma `lem:ex-lattice-medal-cloud-price`, is
`YM.PhysicalNext.Repeat.Quince.fare_pr` (`TraceExtension/Quince/Guild.lean`).
Likewise, the gas bound (2) is `Quince.force_pr` in the same file, not only the
definitions `glyph`/`glyphpos`. The evidence's later row on `decorate` does
list `fare_pr` and `force_pr`. Only the cloud-price row's locator should
be corrected. The reviewer did not edit author records.

## `trace-local-paid-budgets.tex`

- `Quince.chief G X p = partPrice p · (gaugeMeter d · (X·4)) + X·2` with
  X = L^d (`Quince/Cache.lean`). This is q_τ = 4aG_dπ_τ + 2a.
- `Quince.Bunk`'s fields are `cycle`, `reg`, `huge` and `main`:
  - `reg` is O(Wu + H·a(v+v)).
  - `huge` is O(H·a·2v + H·a·2v) = 4OHav.
  - `main` is O(Wv + H·a·2v·credibility(P1)).

  These are the four displayed inequalities, with c =
  `credibility` of the target stage's profile.
- `Quince.foton` proves ∃ u, v > 0 with `Bunk … u v y`. The source obtains
  the budgets by continuity at 0 rather than by the explicit choice
  v = y/(2B). Both are valid, and the manuscript's choice is a correct
  explicit witness.
- `Graces/Crowns.goodD s j i d = StepStages j i ∧ d+1 ≤ order_i ∧ d ≤
  power_j ∧ d+2 ≤ j`, with `StepStages j i = i ≤ j ∧ j ≤ i+1`
  (`Push/PRICE_COMPILER/Basic.lean`). Together with `s.first ≤ i`, this is
  exactly 𝓘_j.
- `Quince.parliament` (`Quince/Soot.lean`) quantifies d over
  `Finset.range j`. It applies `foton` and then `decorate`, which requires
  `(H j i).ε ≤ 1/4`. It then takes `collect_upper` over
  `eventually_transitions`, a prefix maximum above the old threshold
  `V.betaEntry`. This matches Lemma `lem:ex-lattice-monotone-threshold` and
  the application paragraph.

## `trace-local-charge.tex`

- `YM.Trace.Margin.brass` (`TraceExtension/Margin/Beans.lean`) concludes:
  - ‖Revise R V‖ ≤ Wave(1/6, t);
  - |MintR(Revise R V) − midPay a J/12| ≤ 4‖MintR‖·Wave(−1, t) + calorie t/12.

  Here `Revise = (threshold²)⁻¹ •` = σ·, `Wave a x = exp(a·(log log x)²)`
  (`Zn/Have.lean`, with `ellZ = Real.log`) and `calorie x = x^{−30}`
  (`Zn/Setup.lean`). This is Proposition `prop:ex-lattice-charge-bounds`.
- The size condition in the source is directionwise: coeffSize(W i) ≤ θ²x
  for all i, followed by `Push.Local.norm_le_size` and `pi_norm_le_iff`. The
  manuscript's abstract s with ‖A‖_∞ ≤ s(A) is a faithful encoding.
- The local identity `hV` is V = W + F∘B − F∘K + F∘D + E + L′. The
  manuscript's (eq:ex-lattice-charge-decomposition) reproduces it with the
  same evaluated arrays.
- `mack` (`Margin/Sky.lean`) gives the distinguished component as Re Holt/12,
  which is the manuscript's h/12. `earning` (`Zn/Setup.lean`) gives
  |midPay − Re Holt| ≤ calorie, which is |h − m| ≤ c(t).
- **Payment accuracy.** `Margin/Ansel.lean` field `accurate` states
  |midPay a J − landPay G| ≤ shock x. Here `landPay G = −12·slopeConstant`
  (`Loft/Awake.lean`) and `shock x = x^{−100}` (`Zn/Trail.lean`). This is
  exactly |m + 12κ| ≤ t^{−100}. `Slate/Pony.lean` (lines 32, 58, 63) uses it at
  the same argument as `calorie`. The #105 repair is source-correct.

## `trace-local-pairing.tex`

- `Cells.Tiling.rootTest β F = ‖moment β (∏ cells copy F)‖^{1/#cells}`
  (`Cells/Tiling.lean`). Matches 𝓡_i.
- `YM.Trace.Terrace.mileage` (`Terrace/Meteor.lean`) bounds
  ‖pew … x z P Q‖ ≤ Tau i (−100) eventually in i, for x ≠ z. Its proof obtains
  F0 P ≤ t 5 from `concert`. It gets F0 V ≤ t(−300) + t 5 via `seamless …
  .semi` applied to V = (V−Q) + Q. It then bounds the three terms as in the
  manuscript, with `toll_small` giving 4 ≤ Tau 1. The exponents agree.
- `Terrace.Probe.toll` provides the witness A0 with rootTest(A0 − V) ≤ v(−200)
  and the separated-site estimate against every g with ‖g‖ ≤ v 150000, in
  the window, under `room`. This matches the application subsection. The
  source's difference is witness-minus-marker (mathematics E4).

## `trace-local-rate-selection.tex`

- `Quince.δℓ σ k m b K M = 4·(e^{−(σ/2)b}·(K+K)·(1+4m)^k·widthCost(σ/2)k·M)`
  and `εℓ = Σ_{k≤d} δℓ σ (dk)`. Also `horn₀ = 4K·widthCost σ (dk)·M·(1 + 4
  depthW L m)^{dk}` and `corn₀ = 1 + Σ horn₀` (`Quince/Quart.lean`).
  `Quince.εGoal` (`Dawn.lean`) evaluates these at m = radiusD x and b = reach x
  and proves the fRate (χ·Z_d → 0) of exactly (12). Matches.
- `Quince.scales_m` (`Quince/Grade.lean`) has the hypotheses of (14) and
  β ≥ betaF/2. Its conclusion is F ≤ 1 and clocks t · F · meter(heads, 0, D.K,
  4(n+1)) ≤ y/coinP · t, which is (17). The manuscript's extra hypothesis
  0 ≤ P.threshold is harmless.
- Supporting definitions:
  - `uval`, `aprice = boost·hail^{fuse} + 16/D.ε` and `straps = 1 +
    guests(n+1)·hail^{visitors(n+1)}` are U_*, A_* and K_*, with `hail =
    bulk(packing)` = B_* and `packing = (2·depthW(R)+1)⁴` = P_*.
  - `Heir/Cover.lean`: `fuse = 8+2p+2pn`, `visitors m = 4(1+4m)`, `guests =
    2·season^{1+4m}·inflate_{4m}`, `season = 1+16·#Co`, `boost = blaze +
    (blaze+1)L³ + haze`, `blaze = (clinicFee+C)(2t)²` and `haze =
    2n·season²(D.Z+1)D.Z`. All agree with (14a).
  - `Moments.meter d 0 Q m = 2(1+d)^{m+1}·inflate_m(Q⁻¹/8)` and
    `inflate m u = (1+m/u)^m`.
  - `Heir/Depth.lean`: `headCount p = (2p+1)⁴·#Co`, `breadth` and `scope`.
  - `Heir/Musical.lean`, `Reprise.lean`, `Morceau.lean` and `Quince/Sol.lean`:
    `segment`, `tranche`, `scratch` and `paintW` (loom at radiusD). These
    agree with (14b).
- **Clock linearity.** `Cub.clocks C τ = (devBill C τ 1 + 2·reachBill C τ)·
  (4n+1)^n`. `scales_m` proves `clocks C t = t·clocks C 1` by `ring`, which
  confirms the manuscript's linear-clock hypothesis.

## Not checked

The incoming producers named as inputs in each chapter were not checked:
`primaryT`/`salaryT`/`gasT`, `bairn`/`decade`, `Wealth`/`Merch`/`Craft`/
`Combat`, `concert`/`outside`, the probe instance, the strip/growth/chart
receipts, and the ultrafilter transfer. Their construction remains open, as
the chapters state.
