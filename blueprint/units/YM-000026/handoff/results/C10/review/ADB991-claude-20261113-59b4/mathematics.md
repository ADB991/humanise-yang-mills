# Mathematical validity: C10 part A, five chapters

Reviewer session `ADB991-claude-20261113-59b4`; text at `ddc3c90`. Line numbers are those of the reviewed files. "Checked" means recomputed by hand by the reviewer, not taken from the author's records.

## 1. `weighted-frame-penalty.tex`

**Finite-measure calculus (l.10–55).** Checked. The charge norms are sup, `L²(ν)` and `L¹(ν)`. Products with total charge at most 2 are covered by Hölder; the only nontrivial case is `L²·L²⊂L¹`. Averaging contracts every norm. Changing measure under `ν'≤Hν` with `H≥1` costs at most `√H≤H` in `L²` and `H` in `L¹`. The sup norm is unaffected because the support shrinks. The bound `𝓒_{n,F,z}(C)` is the Faà di Bruno sum with every block bounded by `C`. The charge of a block is the sum of its directions' charges, so the total is preserved. For the `DF(z)=0` refinement: the excluded partition is the single block `{1,…,n+1}`, which is the only term containing `D^{n+1}f`. Correct.

**Long paths (l.57–76).** Checked. Write `(1+u)(1+v)=1+u+v+uv`. In `D^{n+1}(uv)` every Leibniz term has both orders positive, because `u(0)=v(0)=0`. So `u` enters only through order `≤n` (bound `Q_n`), and every term carries a derivative of `v` (factor `μ`). Each new factor therefore adds at most `μ(C+R_n)` to the order-`(n+1)` bound, and `K/μ` factors give `K(C+R_n)`. The bound is uniform in the path length, as claimed. Here `K=8(J+3)` (four pieces of length `≤2(J+3)L`).

**Pair-space reads (l.78–92).** The measure-preservation argument works because `𝓑` is a coordinate box, so the splice map pushes the uniform measure on `𝓑×𝓑` to the uniform measure on `𝓑`. See S3 for wording.

**Measure `ω` (l.94–108).** The argument is right once the summands are uniform on a complete residue system; see **R2**. Given that, `ω(x)≤P(\text{residue}=x \bmod L)=L^{-4}`, and `ω≤H_Jν` holds because `supp ω⊂𝓑`.

**Elimination (l.110–141).** Checked. `𝓕(T_x)=ΠT_x+R(T_x)=ΠJ_0+S_x`. Apply `Π` and average against `ω`: `Π1=ΠJ_0+Σ_yω(y)ΠS_y`. This gives `eq:ex-centered-frame-elimination`. (`Π1=0` for the real Frobenius inner product, since `1` is orthogonal to the anti-Hermitian matrices; the formula is correct either way.) The two equations `eq:ex-centered-frame-equations` are imported from the selected minimizer (Dependency 4). The text says so at l.130–132.

**Induction (l.143–157).** Checked. In `D^{n+1}[F_y(E_{xy}-1)]` the only term containing `D^{n+1}F` is multiplied by `E_{xy}(0)-1=0`. `T_x(0)=Σν·1=1`, so `DR(1)=0` applies at the right point and `R(T_x)` through order `n+1` needs `T` only through order `n`. In the averaged term `Σ_yω(y)ΠD^kS_y` the sum is independent of `x`. Its absolute value is at most `‖D^kS‖_{L¹(ω)}≤H_J‖D^kS‖_{L¹(ν)}`, which is at most the charge-`b` norm for every `b`. The total is `(1+H_J)A'_n`, as stated.

**Predictor and penalty (l.159–188).** The step "the fine-link directions have norm at most `μC` … these are precisely the link bounds used above" needs the coarse and gauge coordinates (bound `C`, no factor `μ`) not to enter the fine link matrices. The text does not say this explicitly. I checked it in the source (`lean.md`, item F3): `pianoU` reads only the fine fields `whipF`, and the coarse and gauge coordinates enter only through `musicStand`/`pianoV`, outside the long-path products. So the argument is complete. S4 suggests one sentence.

**Fourier legs (l.190–236).** `P(p)` factors as a real-diagonal matrix with entries `e^{-Im p·z/L}` (`z` in a block of side `L`), times a unitary, times phases. Hence `‖P^{±1}‖≤e^4` on the strip of width 1. Checked: unit weighted `u` gives `|u|_{ℓ²}≤e^4μ^{-1}` and normalized `L²` norm `≤e^4μ`. **R1** concerns l.210–213. With the corrected inequality, `|q(k_l)|≤|q(\operatorname{Re}k_l)|+4μ≤h_l+4h_l=5h_l`. The fine-difference bounds `5e^4` (unnormalized) and `5e^4μ²` (normalized) then follow. The padded-stencil phase bound `exp(4+4(J+5))` follows from `|r(z)|_1≤4(J+6)` and `|Im p|_∞<1`.

## 2. `weighted-stationary-inverses.tex`

**Continuation lemma (l.14–47).** Checked. `Q_x=\tilde S_X^{-1}K\tilde S_Y` has norm `≤H²A`. Cauchy's estimate on complex lines through `x` in the max-norm ball gives the Lipschitz constant `k=2H²A/σ` on `|p−x|<σ/2`. At `x=\operatorname{Re}p` the replacement norms equal the actual ones and `Q_x(x)` is the weighted real matrix, so `|Q_x(p)v|≥(a−k|p−x|)|v|≥(a/2)|v|` for `|p−x|<η`. Invertibility needs `X_p` and `Y_p` of equal dimension. That holds in every application here; S2 suggests saying so. No dimension enters, as claimed.

**Frozen-weight replacement (l.49–61).** Checked. `h_l(z)` depends only on `\operatorname{Re}z`, so freezing it at `x` agrees with it on the slice `\operatorname{Re}z=x`. For real arguments `|q(a)-q(b)|_2≤2|a−b|_∞`, so `h_l(z)≤h_l(x)+4μ|z−x|≤5h_l(x)` for `|z−x|≤1`. The stated `H=6` is valid. The opposite-momentum pairing `P(-p)^TP(p)` is exactly the alias permutation `l↦-l`, holomorphically: the `\operatorname{Im}` factors cancel. This confirms l.130–132.

**Scalar symbols (l.63–89).** Checked. `eq:ex-scalar-weight-floor`: the two cases as written are correct. On `|\operatorname{Im}k|_∞<μ/128`, write `q(±k)=q(±\operatorname{Re}k)+δ_±` with `|δ_±|≤4μ/128`. This gives `|ω(k)-|q(\operatorname{Re}k)|²|≤2|q|μ/32+μ²/1024`. With `2ab≤a²/32+b²·32`, `|s_μ|≥(31/32)|q|²+(1-1/32-1/1024)μ²≥\tfrac12h²`. Hence `|d_μ|≤2` and `|c_μ|≤2^9μ²`.

**Gauge-completed floor (l.91–124).** Checked at real `k`. `⟨v,D_μv⟩≥ε|d_1v|²+|d_0^*v|²+c_μ|v|²≥\min\{ε,1\}(|q|²+c_μ)|v|²≥2^{-10}\min\{ε,1\}h²|v|²`. Steps: Lagrange's identity in `ℂ^4` with the Hermitian product (componentwise in colour), `c_μ≥0`, `\min≤1`, and `eq:ex-scalar-weight-floor`. The density step is valid for any unbounded set of periods, because grid spacing `2π/m→0`.

**Quotient floor (l.137–192).** Checked in full.
- `|q(k_l)|≥2μ` for `l≠0` with `p∈[-π,π]^4` and `|l_a|≤(L−1)/2`: some `|θ_a|∈[π/L,π]`, and `2\sin(|θ|/2)≥2|θ|/π`.
- Longitudinal subtraction is exact, with `a_l=-d_0^*u_l/|q_l|²`.
- `J` couples all aliases, so `a_0` is chosen last to cancel the coarse scalar. This needs only `J_0≠0`, and the text correctly says no bound on `a` is needed.
- The geometric-sum bound gives `(2/π)` per factor, so the stated `1/16` is conservative.
- `(ε/2)A_h`: for transverse `b_l`, `|q|²≥(4/5)h²`.
- The principal singular value `μ²·(L/16)·c_J`, the weighted bound `C_J` for `QP`, the squared triangle inequality and `h_0²≤(4π²+1)μ²` all check.

**Gauge-fixing square (l.194–231).** Checked. `‖𝓡a‖_W≤C|Γ_μa|` follows from `h_l|q_l|≤h_l²≤2^{10}γ_μ(k_l)` and `|Ja|≤C'_Jμ²|a|≤2^{10}C'_J|Γ_μa|`. From `‖v‖≤Cc+(CD+1)b` and `a_0b²+c²≤𝓖(v)+|Fv|²`, the inverse floor `\max\{2C²,2(CD+1)²/a_0\}` follows.

## 3. `selected-stationary-linear-data.tex`

The chapter mostly identifies objects and states two named inputs: the difference bounds of the retained row (Dependency 1) and the stationary tangent (Dependency 2). Both are honestly marked as inputs, with their premises. The stage-indexed wording (findings N2) is right.

**Gauge identity (l.98–151).** Checked algebraically. `𝓡a=(-d_0a,-Ja)` and the fine component of the gauge tangent is `d`, so `d=-d_0` on the fine part and `d^*d=d_0^*d_0`. With `X𝓡=I`, `F𝓡=d^*d+C_μ=Γ_μ`, whose symbol is `ω+c_μ=γ_μ`. Triangular chart change: `(−d_0a,−Ja)↦(−d_0a,−Ja−K_0d_0a)=(−d_0a,−a_{\rm root})`, using `K_0d_0a=a_{\rm root}−Ja`. This is the rooted gauge tangent, as claimed. Reality `F(−p)=\overline{F(p)}` for real finite-volume matrices gives `F(−p)^T=F(p)^*` on the real slice. See S5 for a sign remark.

**Bound for `F` (l.153–176).** Checked. `|d^*u|≤5e^4·`(colour constant). `|Xv|_{\rm unnorm}≤CL²`, because a unit weighted `v` is an admissible charge-one direction (`e^4μ`). `‖C_μ‖≤2^9μ²·e^8`. Hence `|C_μXv|≤C'C`.

## 4. `selected-kinetic-response.tex`

**Stitch count (l.222–245).** Checked. Two internal legs in normalized `L²` and the external legs in sup norm, by Hölder. External legs: `Dμ^{1+|ℓ|}≤Rμ^{1+|ℓ|}`. Internal legs: `e^4μ` with no difference, `5e^4μ²` with one difference, both `≤Rμ^{1+|ℓ|}` with `R=D+5e^4`. Then `L^4μ^{(n+2)+Σ|ℓ_j|}=L^4μ^4=1`. Hence `R^{n+2}`.

**Phases (l.247–258).** Checked. Residue differences contribute `<4L` per leg in `ℓ¹`, so the stated `8L` is conservative. `|z|_1` must be the total `ℓ¹` size of the multi-shift, summed over legs. The source's `Laurent.size` is exactly that, and its weight is `inch L·σ=μσ`, so the condition `μσ≤t_*` suffices (`Width.mono`). See S4.

**Identification (l.280–312).** Correct as a finite-volume Fourier argument, given (SR2) and the bridge identification. The coarse-momentum delta and the cardinality factor check.

## 5. `stationary-determinant-prices.tex`

**Jet calculus (l.17–48).** Checked. Products: `1+2+4` terms, so the common bound is `4AB`. The inverse jets are the standard formulas, and the stated common bound `F+F²A+2F³A²+F²A` holds.

**Local inputs (l.50–93).** Checked. Each placement of `d(U)-d(1)` costs `μ` from the bridge leg and `e^4μ^{-1}` per Euclidean-to-weighted conversion. In `d^*d` and `dd^*` the counts balance (one or two factors `μ` against one or two conversions).

**Nuclear calculus (l.95–158).** Checked.
- `n=0`: `|d_μ|≤2`.
- `n≥1`: `|θ_a|≥(2n−1)π/L`, so `|q|≥2μ(2n−1)≥2μn` and `|d_μ|≤2/(4n²+1)≤2/(n+1)²`.
- Shell count `≤(2n+1)^4≤16(n+1)^4`, so `Σ|d|³≤128Σ(n+1)^{-2}`.
- Distributing two derivatives over three factors gives `1,3,9` terms. Each has an undifferentiated factor, so `9a²b≤20a²b`. The source constant is the same `20` (`triple_charge`).

**Cancellation (l.160–217).** Checked. `F^*F=X^*X+X^*T+T^*F` and `X^*X=b^*dd^*b` give `eq:ex-core-rank-difference` exactly, at all three jet levels. The nuclear bounds of each term check:
- `Q^*HQ` and `e^*e` have fixed rank.
- `T=CX_{\rm fr}`: `C_1μ²·CL²`.
- The regulator block: `C_1μ²·e^8μ^{-2}`.

**Trace densities (l.219–278).** Checked.
- The formula is `∂_i∂_j\log\det M`, with consistent intermediate momenta.
- The resolvent and telescoping steps give `D=F_0kF_0` and `E=DA+F_0k`.
- The four-factor telescoping gives `(EF_0+F_0AD)A+F_0AF_0k`.
- These constants are identical to `YM.Stationary.ledger_cmp`.
- The scalar determinant cancels in the core/rank difference.

## Required changes

- **R1** and **R2**: see `README.md`.

## Suggestions (not blocking)

- **S1** (`stationary-determinant-prices.tex` l.184–186). Add the reason that the zero-background penalty Hessian equals its constraint pullback. At zero background `Z=1`, and the Hessian of `\tfrac{k}{2c_G^2}\|Z-1\|^2` at a point where `Z-1=0` is `\tfrac{k}{c_G^2}⟨DZ\cdot,DZ\cdot⟩`, because the `D²Z` term is multiplied by `Z−1`. Then identify `DZ` with `Q` and the coarse form with `H`.
- **S2** (`weighted-stationary-inverses.tex` l.17–24). The clause "and first restrict `0<σ≤1`" sits inside the hypothesis on the replacements. Move it to the definition of the strip, and say that `X_p` and `Y_p` have equal dimension.
- **S3** (`weighted-frame-penalty.tex` l.81–86). "Reads outside the path contribute the constant identity" should say that positions beyond the length of the piece, for a given pair, contribute the identity factor. Also say that the splice pushes the uniform measure of `𝓑×𝓑` to that of `𝓑` because `𝓑` is a coordinate box.
- **S4** Two small explicit statements. (a) In `weighted-frame-penalty.tex` l.173–179, say that the coarse and gauge coordinates do not enter the fine link matrices, only the root frame and the coarse element. (b) In `selected-kinetic-response.tex` l.255–258, say that `|z|_1=Σ_j|z_j|_1` is the total size of the multi-shift.
- **S5** (`selected-stationary-linear-data.tex` l.99–117). State `d=-d_0` on the fine part, so a reader does not need to infer the sign of `d^*d`.

## Not checked

The producers of Dependencies 1–6 in `README.md`. Whether the part-A findings' "audit only" items outside these five chapters are correct. The three other part-A chapters.
