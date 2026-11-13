# Mathematics review

Session `ADB991-claude-20261113-6afa`. Line numbers refer to the files at `7475e65d` (hashes in `inspected-sha256.txt`).

## 1. `trace-bill-prices.tex`

### 1.1 Native price identity (l.32–45)
`n = s / [t^{-1}·(f/2)/(A_J^{-d} t^3/γ)]`. The bracket equals `t^{-1}·(f/2)·γ A_J^d / t^3 = fγA_J^d/(2t^4)`, so `n = 2st^4/(fγA_J^d)` and `A_i^d n = 2 s v t^4/(fγ)` with `v=(A_i/A_J)^d`. Checked, and it agrees with l.44–45.

### 1.2 Ticket calculus (l.49–58)
- Product rule: given `b > α+α'`, put `η=(b−α−α')/2 > 0`. Eventually `0≤F≤e^{(α+η)G}` and `0≤F'≤e^{(α'+η)G}`, so `0≤FF'≤e^{bG}`. Correct; it needs only `G_i ≥ 0` eventually, which holds because `G_i → ∞`.
- Sum rule: `u+v ≤ 2max(u,v) ≤ 2e^{(α+η)G} ≤ e^{(α+2η)G}` once `e^{ηG} ≥ 2`, which holds eventually since `G→∞`. Correct. "By the same argument" is terse but adequate.
- N5: `G_i` first appears at l.47, while its definition is at l.52. Tickets of rate `α ≠ 0` are used but only rate zero is defined. The intended definition is "∀ b>α, eventually `0≤F_i≤e^{bG_i}`", which is the source's `Ticket` (`Fund.lean` l.12).

### 1.3 Rate (l.60–89)
`B_i = 2 s v t^4 f^{-1}` is a product of five rate-zero sequences: the constant 2, `s`, `v`, `t^4` and `f^{-1}`. So `B_i ≤ τ_i(70)` eventually (take `b = 70/10^4`). The gain estimate gives `γ_i ≥ τ_i(500)`, hence `A_i^d n = B/γ ≤ τ(70)/τ(500) = τ(−430)`. Checked. The source's gain bound (`gainsK` from `glacier`: `G/2 ≤ S_K − S_J`, so `γ ≥ e^{G/16}`) is stronger than `τ(500) = e^{G/20}`, so the stated input is consistent.

### 1.4 `lem:ex-trace-bill-column-size` (l.91–113)
A triangle inequality, using `ϑ² Age ≤ 1` from the two stated bounds. Correct.

### 1.5 `prop:ex-trace-bill-root-price` (l.115–164)
`q_i g = A_i^d·(A_K^{-d} g)` holds for scalars. `𝓑(q g) − 𝓞(A_i^d x) = A_i^d(𝓑(A_K^{-d}g) − 𝓞(x))` uses only real homogeneity of `𝓑` and `𝓞`. Absolute homogeneity of `𝓡` then gives `≤ A_i^d n_{d,i} ≤ τ_i(−430)`. Correct. The threshold depends only on `d` (and the fixed family), so uniformity in `N, p, l, g` is justified. The column-size conclusion is independent of the rest and comes straight from the lemma.

No mathematical defect in this chapter.

## 2. `trace-probe-assembly.tex`

### 2.1 Coefficient bound (l.156–169)
`‖Col(X_d − βY_d)‖ ≤ 2 + 2β` uses real-linearity and `β > 0`. Then:

- `c(2+2β) ≤ c(2+4t) ≤ 6ct`, using `β ≤ 2t` and `1 ≤ t`;
- `6ct ≤ t²`, using `6c ≤ t` and `t ≥ 0`;
- `t² ≤ t⁴`, using `t ≥ 1`.

Scaling by `a^5 > 0` gives `‖Col(a^5Z_d)‖ ≤ a^5t^4`. Checked. The averaging step `‖Col((𝒮_5V)_d)‖ ≤ c sup_e ‖Col V_e‖` needs `Col` to commute with each `ρ_μ`, which l.69–70 states. It also needs the cost `c` to be defined with the column-transported operator norm, which l.76–77 does. Correct.

### 2.2 Covariance and oddness (l.58–66, l.170–172)
Recomputed (N2). Write `ν = gμ`, with `ν.perm = g.perm∘μ.perm` and `sign(ν,e) = sign(μ,e)·sign(g, μ.perm e)`. Then:

- `prev(ν, g.perm d) = μ.perm^{-1}(d) = prev(μ,d)`;
- `ε(ν, g.perm d) = sign(ν, prev(μ,d)) = ε(μ,d)·sign(g,d)`.

Since `ρ_gρ_μ = ρ_ν` and `μ ↦ gμ` is a bijection of `𝔄`, this yields `ρ_g(𝒮_5V)_d = sign(g,d)(𝒮_5V)_{g.perm d}`. For central inversion (`perm = id`, all signs −1) this gives `ρ Z_d = −Z_d`. Correct, under the stated convention that `ρ` is a group action of `𝔄`. The conjugation bit commutes with the real signed-permutation action. The text compresses this to "using the defining previous-axis and sign formulas", and one displayed line would make it checkable. N4: the probe needs oddness of `a^5Z_d`, which follows by real-linearity of `ρ`.

### 2.3 Root error (l.174–187)
- Decomposition: `U − P = 𝒮_0𝓑J − 𝓞(a^5𝒮_5(X−βY))`, which equals `𝒮_0[(𝓑(qx) − 𝓞(a^5X)) − β(𝓑(qy) − 𝓞(a^5Y))]` by the covariance identities and linearity. Checked.
- Averaged root bound: `𝓡((𝒮_0W)_d) ≤ R Σ_μ |ε| 𝓡(σ_μ W_{prev}) ≤ sup_e 𝓡(W_e)`. This uses subadditivity, absolute homogeneity (not listed at l.179 but implied by "seminorm"), and invariance.
- `𝓡(W_e) ≤ E + βE`, so `(1+β)E ≤ τ(230)τ(−430) = τ(−200)`. Checked.
- N1: the additivity of `𝓑` used here holds on the window-interior class only. In the source, `backTo_add` needs `Envelope` hypotheses, discharged by `cylinder_env` from window interiority (`Grid.lean` l.62). The chapter assumes window interiority (l.87–88), so the step is valid, but l.106–107 should name the class.

### 2.4 Separated-site bound (l.116–128, l.148–150, l.189–191): M1
The arithmetic `τ(−30000) ≤ τ(−200)` is fine. The defect is the test class. `eq:ex-trace-probe-buffered` requires `g` "interior to the same locality window, with that window fitting in the available room", that is, the radius-`l` window of `x_d, y_d`. Three other sources use the fixed radius `l_4` instead:

- the producer `prop:ex-trace-crown-buffer`, which requires the window of radius `l_4` (grade-four stencil radius + 4) and room for `l_4` (crown-buffer l.95–98, 246);
- the consumer, mission-price l.37–40, which uses "the fixed grade-four locality window";
- the source, where `Probe.toll` quantifies over `g` interior to `window 0 (lensScope C 4)` with `room j k (lensScope C 4)`, while `tide` takes `l` arbitrary.

So conclusion (3), as written, is a statement about a different test class than the one the mission consumes. It coincides only if `l = l_4`. The repair is to replace the window clause of `eq:ex-trace-probe-buffered` by the `l_4` clause of crown-buffer. The proof is unchanged, because the buffer estimate is applied verbatim.

### 2.5 Scale inputs (l.30–35, l.210–212): S1
`1+2t ≤ τ_j(230)` follows because `1` and `2t` are rate-zero (`t = β̂_{K_j}` is the summit-scale ticket already used in bill-prices, with `K_j = summit(j)`). Their sum is rate zero, hence eventually `≤ τ_j(230)`. `6c ≤ t` holds eventually because `β̂_k → ∞` along `k = summit(j) ≥ j` and `c` is a constant. Both are two-line consequences of facts already in the monograph's input list. Recording them as unproved inputs is conservative but leaves avoidable open items: part-B ledger row `I-C15-probe-scales`.

## 3. `trace-mission-price.tex`

### 3.1 `prop:ex-trace-mission-price-transfer` (l.84–126)
The argument has four steps:

- On an `𝓛`-large set the finite expectations lie in the closed disk of radius `Θ_i`.
- Both arguments converge along `𝓛`: `a^5 t_i(p) → a^5 x_i` because scalar multiplication is continuous, and `H_{i,p}(w) → y_i(w)`.
- The table limit maps the expectations to `𝓜_i(π_5(a^5x_i), π_4 y_i(w)) = 𝓜_i(a^5π_5x_i, U^{(4)}_i w)`, by real-linearity of `π_5`.
- A closed set is stable under limits along a filter: if `f(p) ∈ D` eventually and `f(p) → L`, then `L ∈ D`.

Correct. The threshold in `i` is the maximum of finitely many "eventually" thresholds for fixed `w`, so it depends on `w`, as stated.

### 3.2 Mileage arithmetic (l.130–153)
The identity is `⟨P,Q⟩ = ⟨U,V⟩ + ⟨P,Q−V⟩ + ⟨P−U,V⟩`; expanding the right side gives the left. The three terms are bounded as follows:

- the first by `τ(−200)`;
- the second by `τ(5)τ(−300) = τ(−295)`;
- the third by `τ(−200)·𝓡(V)`, where `𝓡(V) ≤ 𝓡(Q) + 𝓡(V−Q) ≤ τ(5)+τ(−300)`, giving `τ(−195)+τ(−500)`.

The sum of the four exponentials is `≤ 4τ(−195)`, by monotonicity (`G ≥ 0`). Then `4 ≤ τ(1)` eventually because `G → ∞`, and `4τ(−195) ≤ τ(−194) ≤ τ(−100)`. All checked. The two root costs `≤ τ(5)` and the localization receipt are upstream inputs, as the text says. I did not review their producers (`concert`, `outside`).

### 3.3 Geometry (l.73–81)
`z_i = b_i^{-1}ξ_i` and `r_i = a_ib_i` give `r_iz_i = a_iξ_i`. Correct. N6: `a_i` here must be `a_{j_i}`, the field scale at the frame level, because `kamago` gives `X.r i = C.S.a (V i).k · b_i`.

### 3.4 Join with small-means and the C14 edge (T1)
Small-means (l.89–100) evaluates the same two-point configuration `b_i^{-1}(⌈b_i⌉,1,1,1)`, `0`, dilated by `r_i = a_ib_i`, with `a_i` the field dilation at `j_i`. The mission transfer's output is therefore at exactly the point where small-means applies `C14-to-C15-chart-pairing-convergence` (`spots`), and convergence of the point to `(e_0,0)` uses `b_i → ∞`, which small-means states as a scale input. None of the three reviewed chapters consumes the C14 edge. The table limit used in mission-price (`proxi`, finite volume → selected table at fixed `i`) is a different input and is correctly ledgered as `unlocated-to-C15-mission-chart-limits`.

## 4. Literature
The three chapters invoke only elementary real analysis: the triangle inequality, closedness of disks and limits along filters. No external result needs citing. No literature search was needed for these steps.
