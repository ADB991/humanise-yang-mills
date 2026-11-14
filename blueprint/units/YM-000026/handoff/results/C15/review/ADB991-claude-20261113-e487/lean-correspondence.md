# Lean correspondence review (textual)

Session `ADB991-claude-20261113-e487`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. I read the source text only; nothing was elaborated (Mathlib is unreachable from this environment). Paths are relative to `Lean/YM/`.

## 1. `trace-regular-atom.tex`

### 1.1 Conclusion
`YM.PhysicalNext.Repeat.Quince.salaryT` (`TraceExtension/Quince/Soil.lean` l.72–73) concludes
`PaidAtom … (salary (K z) b f) 0 (sprite G y L ξ₀ * m₀) (Doors.rate L * m₀)` with `m₀ = (K z).p.mass b c`.
`YM.Extra.Histories.PaidAtom` (`Extra/SOURCE_HISTORIES/LocalDebt.lean` l.96–101) is `∃ X, ∀ y : Motion, coeffSize(patch y X − patch y lead) ≤ c ∧ ∃ P, P.x = patch y X ∧ P.Format 0 ∧ P.remBound 0 … √forcedAllowance_m t ∧ P.density = dance y (blast …)`.
That is: one `X` before the motion, lead `0`, an order-zero format, the remainder at `√forcedAllowance_m`, and the exact pushed density. This matches the proposition and `eq:ex-lattice-regular-pushed-density`. `sprite G x L z = z / coinP G L x` (`Quince/Dawn.lean` l.12), and `coinP = √bankP` (`Quince/Glee.lean` l.13), so the cost is `ξχ⁻¹m₀`. `Doors.rate L = L^{-2/5}` (`Extra/SOURCE_HISTORIES/Reserve.lean` l.30), so `ρ = L^{-2/5}`. Match.

### 1.2 Budgets
`Quince.Bunk` (`Quince/Cache.lean` l.17–21): `reg` is `O(W u + H(L^d(v+v))) ≤ y` and `huge` is `O(H L^d(v+v) + H L^d(v+v)) ≤ y`, i.e. `O(Wu+2Hav) ≤ ξ` and `4OHav ≤ ξ`. `cycle` is `chief(L^d,p)·v ≤ u` for each test probe, i.e. `q_τ v ≤ u` (l.186–187). There is also a fourth field, `main`, which this chapter does not use. `foton` chooses `(u,v) = ((1+K)v, v)` by continuity at 0, as #338 noted. Match.

### 1.3 The price `v` of the cloud and tuition entries
`salaryT` takes `I : Medal … y ξ₀ z' …` and `hZ : Bunk … u' z' ξ₀`. The same `z'` is the Medal's price `z` and Bunk's `v`, and the same `ξ₀` is Medal's `y` and Bunk's `y`. `Medal.cloud` and `Medal.talent` (`Quince/Guild.lean` l.59, l.60) are bounded by `sprite G x L z`. So the cloud bound `C_i ≤ (v/χ)m₀` and the tuition bound `≤ v/χ` use the Bunk `v`, as the chapter says (l.70–74, l.262–263). The identification is internal to `salaryT`. The callers `Quince.mosaic` (`Kiosk.lean` l.29–30: `Bunk … u v y`, `Medal … x y v`) and `Quince.Soot` (`Soot.lean` l.21: `Bunk … u v (p j i)`, `Medal … x (p j i) v`) pass it consistently. This confirms #338's note.

### 1.4 Regimes
`Quince.mire` (`Mire.lean` l.69) has the hypothesis `coverNumber B (plate Z j).support ≤ B`. `Quince.desert` (`Day.lean` l.70) has `B < coverNumber …` and concludes `Regular p U ∧ ∃ t, supBounds 0 p U t ∧ t ≤ sprite G y L z' * mass`. The strict/non-strict split matches "at most"/"exceeds" (l.78, l.83). The geometric condition `20(r_d+R_d+1) < n₀` is `salaryT`'s `hL`. Match. The intermediate `R_i = e^{(α_c+2)q_i}S_i` (l.257) is not a statement of `desert` (N2).

### 1.5 Not checked
I did not open the internals of `regularCard`, `sendsCard`, `ribbonW`, `Local.testPrice`, `Local.readPrice` or `RegFit` (hypotheses (1)–(4)). The chapter treats them as inputs. Whether hypotheses (1)–(4) are exactly `RegFit … 0 d (hol G) b f` plus `supBounds 0 b f c` is therefore not certified here.

## 2. `trace-coffer-supplier.tex`

### 2.1 Coffer theorem
`YM.MergeProof.Accent.riches` (`TraceExtension/Soot/Coffer.lean` l.33–35) has these hypotheses: `k < N`; `ref d ≤ k`; `Buff G' E S L e`; `q > 0`; `coeffSize L.x + S ≤ q`; `4(1+columns_k)q ≤ B`; `Melts 1 (budget k) a forcedAllowance_k v'`; `e·ζ d k ≤ v'·B`; `SharpRead … b'`. Its conclusion is `∃ b`, with (i) `b'·coeffSize(L.x − (entries k (terminal.symm b)).x) ≤ 4(1+columns_k)q`, and (ii) for all `J m l` with `opens 1 J m`, `ref d ≤ m`, `m < k`, `room J k l` and `Interior (window 0 l) G'`: `rootTest(backTo G' − O b) ≤ stakes C J m / w`, where `w = a·((ζ d m/2)/(‖alto m d‖·(B/gainChart k m)))`. This matches `eq:ex-trace-coffer-inputs`, `eq:ex-trace-coffer-weight`, `eq:ex-trace-coffer-column` and `eq:ex-trace-coffer-root`, including the label being chosen before the window and `𝒞_k(b) = I_k(𝖳^{-1}b)`. The section variables add `H : C.Makes`, `h : Scrim …` (whose `costs.aim` supplies the selected hierarchy; `grows` and `jump` supply ζ) and `K : Stock.Tabs`. The chapter calls these "the response data". `Buff` (`Soot/Bloom.lean` l.44–49) is shell/sound/fuel/foam/hit = format, remainder at `√forcedAllowance_k`, attainment, forced profile, and `alto·density = eval·f`. Match with l.14–45.

### 2.2 Melting
`Accent.Melts m B a b c` (`Soot/Basin.lean` l.30–31) is `0<a ∧ a≤1 ∧ 0≤c ∧ 4≤B.supportExponent ∧ (2B.B+1)⁴t ≤ 3 ∧ e^t−1 ≤ 1`, with `t = b + r√b + a + rc` and `r = m·siteFactor B.B`. At `m = 1` this is exactly l.108–112. In `purchasing` it is supplied by `YM.Trace.Terrace.Meltdown` (`Terrace/Virtu.lean` l.33–51), which holds eventually in `i` under `supportQ P` (`∀ᶠ k, 4 ≤ supportExponent_k`) and `G.Simple`. `Meltdown` proves the stronger `(2B+1)⁴t ≤ 1` from `Lim (-1) t` and `Lim 0 (2B+1)⁴` along `β̂`. The manuscript never discharges this (S2).

### 2.3 Root estimate
`underS` (`Soot/Thrifty.lean` l.37, l.66) applies `Accent.spiker` (`MergeProof/South/Block.lean` l.34–35) at level `m`. Its hypotheses are `Served (R m) … w supportExponent_m 1` (anchored corrections with constant 1), `Vault w k₁ k₂ x y` (`MergeProof/Newell.lean` l.33–35: `w_i‖F_i‖ ≤ x`, `Σ_j w_i‖g_ij‖ ≤ y`), integrability, and the moment identity `∫(f U).part s = Z_{N,p}·M`. The conclusion is `‖M‖·toll w s ≤ exp(|Site_m|·treasury_m + |V|(x+y+2))`. The chapter's planted-expansion input uses `x = 2`, `y = 1`. The proof of `spiker` calls `Accent.sail` (`MergeProof/Arbol.lean` l.17) at radius `hatCoupling k ≤ threshold`, together with `Vac.suffices_bill` (treasury) and `History.partition_eq`. These are the hypotheses S1 asks the text to cite. `stakes C m k = exp((a m/a k)⁴·treasury k + 5)` (`MergeProof/Strudel.lean` l.21) uses the lattice spacing `C.S.a` (N4).

### 2.4 Bill
`YM.Trace.Terrace.Bill` and `purchasing` (`Terrace/Casa.lean` l.21–43):
- `Bill.norms`: `coeffSize v ≤ 1`.
- `Bill.bias`: `≤ threshold_k²·AgeK(−1/4)`.
- `Bill.root`: for `opens 1 i j`, `ref d ≤ j`, `j < k`, `room i k l`, `i ≤ k ≤ N` and `Interior (window 0 l) g`, the bound is `≤ nativeC C d i j k`, with `nativeC = stakes C i j / (β̂_k^{-1}(fly_j/2)/(‖alto_j‖·β̂_k³/gain(k,j)))`.
- `purchasing`: `supportQ` and `PostT`, `Stock.Tabs`, `Scrim`, `Sceptre`, `C.Makes`, `G.Simple` (section variables); `∀ᶠ k, ∀ᶠ p, ∀ N > k, ∀ X g, AtomD … (v·grantS β̂_k) β̂_k → ∃ s, Bill`.

The proof's specialization is `Z = β̂_k`, `Y = Z³`, `a = v' = Z^{-1}` (via `Meltdown`), `e = Z`, `b' = cameo k`. Supporting facts:
- `cameo = √monitor = AgeK(1/2)` (`Quince/Nectar.lean` l.20; `cameo_age`, `Terrace/Look.lean`).
- `grantS x = thetaP x²·Wave(1/6) x` (`Shunt/Cavity.lean` l.15), with `thetaP x = (√x)^{-1}·Wave 1 x` (`Swift/Happiness.lean` l.11) and `threshold_k = thetaP β̂_k` (`Tanya`).
- `PostT.share : columns_k ≤ log β̂_k` (`Terrace/Base.lean` l.32).
- `book_pay` gives `u·grantS ≤ 1` and `4(1+log x)u·grantS ≤ x³`. `bias_pay` gives the bias via `4(1+log β̂)u ≤ AgeK(1/12)`.
- `fly_le : fly ≤ 1` (`MergeProof/Traps.lean` l.33) (N3).
- Interiority of `alto·g` from that of `g`: `hV.scale` (N5).

All of these match the chapter's l.338–402 except where noted in S2/N3/N4/N5. The quantifier order matches.

### 2.5 Not checked
I did not read the proofs of `prevails`, `underS` (beyond its `spiker` call), `copious`, `Geyser.aim`, or the `SharpRead` producer. The chapter states these as inputs.
