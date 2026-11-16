# Mathematics review

Session `ADB991-claude-20261113-e487`. Line numbers refer to the files at `08e85a788378ae70be357c96f0091ea7f18bbd56` (hashes in `inspected-sha256.txt`).

## 1. `trace-regular-atom.tex`

### 1.1 Setting (l.1–113)
The hypotheses (1)–(4) on `f`, the charged mass `m₀ = e^{α_f q_f}c`, `χ = √𝓜_f`, `a = L^d` and the budgets `(eq:ex-lattice-regular-small-budget)`, `(…-large-budget)` are stated precisely. The text distinguishes clearly between the inputs (cloud bound `C_i ≤ (v/χ)m₀`, small-support read, large-support read with `S_i ≤ (v/χ)m₀`, the format/density/remainder certificate) and what the proposition proves. Good.

### 1.2 `prop:ex-lattice-regular-source-atom` (l.116–156)
- Small support: `O(Wuχ⁻¹m₀ + Ha(C₁+C₂)) ≤ O(Wuχ⁻¹m₀ + 2Ha·vχ⁻¹m₀) = O(Wu+2Hav)χ⁻¹m₀ ≤ ξχ⁻¹m₀`. This uses `O,H,a ≥ 0` and the cloud bound, then the regular budget. Correct.
- Large support: `S₁+S₂+C₁+C₂ ≤ 4vχ⁻¹m₀`, so `OHa(…) ≤ 4OHav·χ⁻¹m₀ ≤ ξχ⁻¹m₀`. Correct.
- The two cases (cover ≤ radius, cover > radius) are exhaustive. The format, density and remainder conclusions are passed through unchanged. Uniformity over motions: the bound is on `sup_ω‖ωX‖` with lead `0`, and `X` is fixed before `ω`. This matches the stated quantifier order.
- Conclusion: correct, no gap. The cost pair `(ξχ⁻¹m₀, ρm₀)` follows.

### 1.3 Realization paragraphs (l.158–273)
These explain how the local inputs arise. The chapter says explicitly (l.213–216) that they are inputs and not proved here, so I read them as exposition, not proof.
- l.184–197: `q_τ v ≤ u` is `Bunk.cycle`. The probe sum then gives `Wuχ⁻¹m₀` provided `W` is the probe-price sum over the recovery probes. That is the reading of `Local.testPrice`, which I did not expand (see validation).
- N2: l.199–216 and l.252–273 give the same large-support argument twice. Also, `R_i = e^{(α_c+2)q_i}S_i` with `S_i ≤ R_i` is a gloss. The source output (`desert`) is directly `sup ≤ sprite(z')·mass`.
- N1: `O\bigl(…\bigr)` in l.81 and l.136 looks like Landau notation.

## 2. `trace-coffer-supplier.tex`

### 2.1 Atomic response to Coffer input (l.12–91)
- `uD_X = eval·G'` with `G' = ug`: this is multiplication of `(eq:ex-trace-atomd-data)` by the scalar `u`. Correct.
- `4(1+c_k)(‖x_X‖+s) ≤ 4(1+c_k)q ≤ Z³`: correct, since `c_k ≥ 1 > −1` and `s ≥ 0`.
- `Z·fly_d(k) ≤ Z²`: true, because `fly_d(k) ≤ 1 ≤ Z`. N3: the text gives `fly_d(k) ≤ Z` as the reason. That is true but is not the supplied fact `fly ≤ 1`.
- SharpRead (`eq:ex-trace-sharp-read`): the meaning is stated with quantifiers (eventually in `p`, uniformly in `N ≥ k`, the comparison, and `w ≥ 0`). The left-end zero is a coefficient vector. Clear.

### 2.2 Coffer hypotheses and weight (l.93–129)
The melting formula matches `Melts 1` exactly (see `lean-correspondence.md` §2.2). The weight `w_m = a(ζ_m/2)/(‖alto_{m,d}‖·B/gain(k,m))` is positive, because `a > 0`, `ζ_m > 0` and `B > 0` (from `q > 0` and `4(1+c_k)q ≤ B`).

### 2.3 Column estimate (l.131–237)
The construction picks `v` (hence `b = 𝖳v`) from `X` alone, before any window. The column inequality is SharpRead with `w = q`, applied to the signed reference difference, whose spread condition `r_k ≤ q + c_k(q+‖Z_k.x‖)` is the SharpRead hypothesis with `w = q`. Consistent. I checked this only at the interface level: that the inputs `‖x_X‖+S ≤ q`, `4(1+c_k)q ≤ B`, `q > 0` and SharpRead are those passed to `prevails`. I did not re-derive `sec:reference-difference`, which is reviewed elsewhere.

### 2.4 Root estimate (l.238–336)
- Price of `pass(Q)` and `field(K)`: the bounds `𝒫(field K) ≤ ∏(1+𝒫(K_p)) ≤ exp Σ𝒫(K_p)` and `𝒫(pass Q) ≤ e^{𝒫(Q)}` follow from submultiplicativity and `1+x ≤ eˣ`. Correct, and they match `eq:ex-centered-steer`.
- Correction sums: every nonzero `H_Y` contains a mark, `α_m ≥ 0` gives `e^{α_m cov} ≥ 1`, and summing the anchored bound over the `K` marks gives `Σ_Y 𝒫_w(H_Y) ≤ K` (supports with several marks are over-counted, which is harmless). Correct. The same holds for `K_P`.
- Exponent: `2K` (site) + `K` (box) + `K` + `K` (two correction families) = `5K` = `K(x+y+2f)` with `x=2`, `y=1`, `f=1`. Correct.
- **S1.** From the pointwise price bound to `(eq:ex-trace-spiker)`, three steps are needed: integrate the pointwise bound; bound `E_m(U)` (by lawfulness) and the vacuum box activities `b_P` (by `sκ`) in the numerator; and divide by the Wilson partition function using an explicit lower bound for it. The chapter compresses these into "paid by the finite-volume denominator bound used next" (l.306–307) and "using the finite volume denominator bound" (l.313). No statement or reference is given, and the phrase occurs nowhere else in the monograph. The needed result is in the monograph: `eq:ex-centered-sail` in `centered-construction.tex` (numerator from `eq:ex-centered-steer`, small-ball lower bound for `Z_A`), applied with `ρ = ĥ_m = β̂_m^{-1/2} ≤ ϑ_m`. The treasury receipt then bounds the extensive bracket by `|Λ_m|Treasury(m)`, and the transition-mass identity gives `Z_A = Z_{N,p}`. These are the same three inputs `actual-marked-portfolio-calibration.tex` l.656–681 uses for the parallel census estimate. The fix: cite `eq:ex-centered-sail` and the treasury receipt, and name the hypotheses checked here (radius, lawfulness and nonnegativity of the level-`m` representation, `β ≥ 0`, integrability). Until then the step `|M|·toll ≤ exp(|Λ_m|Treasury(m)+5K)` is unsupported in the text.
- Root extraction: `|Λ_m| = K(A_J/A_m)⁴` gives `|M|w_m^K ≤ exp(K[(A_J/A_m)⁴Treasury(m)+5])`. Taking positive `K`-th roots gives `|M|^{1/K} ≤ stakes(J,m)/w_m`. If `M = 0` the bound is trivial, and the `K`-th root is monotone. Correct. N4: the tiling identity needs `A_j` to be the lattice spacing.

### 2.5 Bill specialization (l.338–402)
- Payment: `eζ_k = Z·fly_d(k) ≤ Z² = Z^{-1}·Z³ = v'B`. Correct.
- Weight: with `a = Z^{-1}`, `B = Z³` and `ζ = fly`, `w_gas` equals the denominator of `nativeC`. Correct.
- `q_k = uϑ_k²Age_k(1/6)`. Since `ϑ_k = β̂_k^{-1/2}Age_k(1)` (source `thetaP`), `ϑ_k²Age_k(1/6) = β̂_k^{-1}Age_k(13/6)`, which is what l.363–364 assert. `Age_k(a) = exp(a(log log β̂_k)²) = β̂_k^{o(1)}`, so `q_k → 0` and `4(1+log β̂_k)q_k ≤ Z³` eventually. `log β̂ = exp(log log β̂) ≤ c·Age(1/12)` eventually for any `c > 0`, because `(log log β̂)²/12 − log log β̂ → ∞`. All three displayed eventual inequalities hold.
- Norm entry: `‖x_X‖ ≤ ‖x_X‖ + s ≤ q_k ≤ 1`. Correct.
- Bias: `‖x_X − 𝒞_k(b)‖ ≤ 4(1+c_k)q_k/κ_k ≤ Age(1/12)·ϑ²Age(1/6)·Age(−1/2) = ϑ²Age(−1/4)`. This uses `c_k ≤ log β̂_k`, `κ_k = Age_k(1/2)` and `Age(a)Age(a') = Age(a+a')`. Correct.
- **S2.** The coffer transfer assumes the melting condition (l.106–112): `0 < a ≤ 1`, `v' ≥ 0`, support exponent `≥ 4`, `(2B_k+1)⁴t ≤ 3`, `e^t−1 ≤ 1`. With `a = v' = Z^{-1}`, the first two parts are immediate from `Z ≥ 1`. The rest is never verified: there is no argument that the support exponent is eventually `≥ 4`, nor that `(2B_k+1)⁴t_k → 0`, where `t_k = forcedAllowance_k + R_k√forcedAllowance_k + Z^{-1} + R_kZ^{-1}`. `lean-correspondence.md` §2.2 records that the source proves this eventually from an explicit hypothesis on the selected family. The final statement (l.391–402) should list it, along with the other standing inputs it uses: `c_k ≤ log β̂_k`, `β̂_k → ∞` at the stated rate, the selected hierarchy and costs, the window bookkeeping, and SharpRead. It should also give the short melting argument: `(2B_k+1)⁴` and `R_k` are subpolynomial in `β̂_k`, while `t_k` decays at rate −1 in `β̂_k` (in the source's `Lim (-1)` sense).
- Quantifier order (l.391–402): `u, d` fixed; then eventually in `k`; eventually in `p` (depending on `k`); every `N > k`; every certificate; there exists `b`. The root clause holds for all windows with the one `b`. This matches `purchasing` exactly.
