# Textual Lean-correspondence review

Session `ADB991-claude-20261113-46a7`, source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Source files were read as text. Every inspected file's SHA-256 matches `Lean/SOURCES.sha256` (list in `inspected-sha256.txt`). Nothing was elaborated.

## `trace-small-means.tex` vs `YM.Trace.Terrace.small_means` (`Terrace/Terrain.lean`)

| Manuscript | Source | Match |
|---|---|---|
| conclusion `z_i^p s_i(v_i) → 0` with `z_i = β̂_{k_i}` | `Tendsto (fun i => hatBeta (Stern V i)^p • s i (v i)) atTop (𝓝 0)` | yes |
| `k_i` = summit of `j_i`, with `k_i > j_i` | `Stern V i = summit A (V i).k` (`Gondola.lean` l.32); `stellar` | yes |
| medium identity `v_i(α) = ζ_i^{-1} E_{k_i}(x_i(α))`, eventually | hypothesis `hv`: `(v i).val a = (Z.β (Stern V i))⁻¹ • swale Z 5 (Stern V i) ((x i).val a)` | yes (`E_k = swale Z 5 k`, `ζ_i = Z.β(k_i)`) |
| response identity, eventually | `Spun.starts` (`Prism.lean`): `(s i v).val d = (X.U i 5).symm (Vault … (crown …) (v.val d))` | yes |
| night scaling with `c_i = ζ_i (a_i b_i)^5`, needs `k_i ≥` reference level | `fisc` (needs `C.ref 5 ≤ j`); `crown Z X Q d i = Z.β (Q i) * (X.r i)^d` (`Path.lean` l.47); `X.r i = a·b` (`hq.season`) | yes |
| night condition for entries of `B` | `frames_night` (`Vector.lean` l.24) | yes |
| configuration `ζ_i^pt`, `r_i ζ_i^pt` | `beaconV`, `nearPoint` (`SkyEar.lean` l.14, 53); `kamago` | yes (`nearPoint x = (⌈x⌉,1,1,1)`) |
| `b_i → ∞` | `grow_big` | yes |
| price bound `≤ Θ_i = exp(−(100/10^4)(log β̂_{j_i})^48)` | `ear_price` (`PriceLimit.lean`): `≤ Tau A j (−100)`; `Tau P i x = watch P (x·Dust) i`, `Dust = 1/10000` (`Arms.lean` l.10–11), `watch P a k = exp(a · Gate(β̂_k))`, `Gate x = (log x)^48` | yes |
| detector inputs (1), (2) | `ears_det` (hypothesis on all grade-4 `g` at `camera 0`); `spots` (every `z → camera 0`) | yes |
| detector derivation | `listened_G` → `finite_faithful_R`, `sewn`, `hear_matrix` (`Ears.lean`) | yes; the left-inverse route is equivalent to the lower bound `c‖y‖` |
| rate tickets | `Ticket` (`Fund.lean` l.12, includes nonnegativity), `Ticket.prod`, `stickK`, `titles`, `ticket_exp`, `whither` | yes (O1: the first two are proved in the source) |
| `b_i ≤ m_i = tiltcap(j_i)` | `tiltP … (hq.season i).1.high.2`; `tilt_cap` (`Fund.lean` l.36) | yes |

N1: `X.U i d : Spin.change S d` (`Climb/Cells.lean` l.25) is used as a linear equivalence (`.symm`, `.toLinearMap`, `LinearEquiv.apply_symm_apply`). The manuscript should state this linearity.

## `trace-crown-buffer.tex` vs `YM.Trace.Terrace.stageCrown` (`Terrace/Crown.lean`)

| Manuscript | Source | Match |
|---|---|---|
| quantifier order: `i_0`, then ∀ `i ≥ i_0`, `N ≥ k`, `p`, fields, sites | `∀ᶠ i in atTop, ∀ N p, ∀ hp : k ≤ N, ∀ u, Crown … → ∀ g, … → ∀ a b, a ≠ b → …` | yes |
| `F_i(q) = exp(q G_i/10^4)` | `Tau A i q` | yes |
| Crown witness: interiority in window `l`, room, `\|P\| ≤ F(1000)`, sup bound `F(5·10^5)`, healthy bound `F(−5·10^5)` at `ϑ_k/16`, root bound `F(−1.2·10^6)` | `structure Crown`, field `cost` | yes |
| `g`: sup `≤ F(1.5·10^5)`, window `l_4`, room | `lensScope C 4` | yes |
| conclusion `≤ F(−30000)` | same | yes |
| good term via the translated tiled product and the sup root | `pulpit` (`HomePort.lean` l.20) → `rooted_translates` (`Push/GRID_APPROXIMATION/Translate.lean` l.104) → `source_for_translate`, `planted`; `root_sup` | the source has the translate-to-copy step (M1) |
| decomposition by linearity (E11) | `differ` (`Peeking.lean`) with `cylinder_env` envelopes | yes |
| common window `max{l, l_4}` for the product identity | case split `le_or_gt j l` with `backProd` | yes |
| soils / funeral / small tail | `expire`, `funeral` (`Mortal.lean`); `hQ` in `stageCrown` with `hugeW 100000`; `toll_small … 3` | yes |
| funeral receipts `y^6`, `10·16² y(y^6+2q) ≤ m²`, `yC ≥ 1`, `xϑ² = m²`, `β_k ≥ x/2` | `θ.purse`/`treasury_stage` + `θ.bloom`; `hQ` in `funeral`; `θ.jig`; `ht'`; `represents … band.1` | yes |
| support count after translation | `Finset.card_image_le` | "at most" (O2) |

The proposition assumes the seam condition, the transfer identity and the one-site estimate. The source proves them (`seamless P N p`; `soils` inside `expire`, with room from `point_room`). Assuming them is conservative, and the author records them as open inputs (part-A N2).

## `trace-price-recurrence.tex`

| Manuscript | Source | Match |
|---|---|---|
| `prop:ex-lattice-trace-sharp-read`: eventually in `n`, uniformly in `N ≥ k`, comparison and `w ≥ 0`, `κ_k ‖x_k‖ ≤ 4(1+c_k)w` | `YM.PhysicalNext.Repeat.Quince.ascend` (`Quince/Apace.lean` l.87): `∀ᶠ n, ∀ N, k ≤ N → ∀ B w, Duet.Woke … → (∀ i, B.atPoint i = 0) → 0 ≤ w → cameo T k * coeffSize (B.voice k).x ≤ 4*(1+columns_k)*w` | yes (marked sites at the origin = `atPoint = 0`) |
| induction from `x_m = 0` with the cone bound | `ascend` proof: `hr` via `Work.G09.answer`; `Nat.le_induction` with `pricey` | yes |
| `c_j` is a real allowance `≥ 1` (E1) | `YM.RG.Stage.columns : ℝ`, `columns_ge` (`RG/History.lean` l.53, 60) | yes |
| `M_d = 1 + Σ_{q≤d} 2^q (q+1)^q` (E2) | `gaugeMeter d = 1 + Σ_{i ∈ range(d+1)} polarCost i` (`Cub/Speed.lean` l.27); `speedTest` | yes for the formula; `polarCost` itself was not opened |
| derivative-sum identity and its induction (E3) | `line_fare` (`Quince/Latch.lean`): induction on `l`, `increment U (t•a)`, `dent_open`, `hasDerivAt_tsum_of_isPreconnected` | yes |
| polarization statement (S1) | `speedTest`: hypotheses `Local.Chart d f 1`, `Local.Chart d g 1` (class C^d near 1) and the bound on `leftDerivs` of lists of length `≤ d` with `dirBound` | the statement matches; the manuscript gives no proof |

Not opened: `rideE`/`pricey` internals, `Surrey.include_one`, `polarizes`, `polarCost`, `Work.G09.answer`. The insertion paragraph and the period-index threshold (G3) were checked only against `ascend`'s statement and the `pricey` call (`∀ᶠ n` per `j ∈ Ico m k`, uniform in `N`).
