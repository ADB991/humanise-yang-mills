# Mathematical validity: PR #227 and PR #234 (session ADB991-claude-20261113-b066)

Scope: the changed hunks of the five chapters at the reviewed heads (see `README.md`), the definitions they use and their immediate consumers. Each item below records what I checked and how.

## A. PR #234, `trace-free-rank.tex`

### A1. Radial reconstruction (answers PR #117 Part 1 F2)

Setting: A = (A_a) is a homogeneous polynomial one-form of degree r+1 with Σ_i z_i A_i(z) = 0, and F_{ia} = ∂_i A_a − ∂_a A_i.

- Differentiating the radial identity in z_a gives A_a + Σ_i z_i ∂_a A_i = 0. Euler's identity for the degree-(r+1) component A_a gives Σ_i z_i ∂_i A_a = (r+1) A_a. Hence Σ_i z_i F_{ia} = (r+1)A_a + A_a = (r+2)A_a, which is eq:ex-trace-radial-reconstruction. Injectivity of the linear curl follows. **Correct.**
- r = 0: F is constant, F = f, so (A_0)_a = ½ Σ_i z_i f_{ia}. **Correct.**
- r = 1: F_{kl} is linear, so F_{kl}(z) = Σ_r z_r ∂_r F_{kl} = Σ_r z_r j_{rkl}. Then (A_1)_a = ⅓ Σ_k z_k F_{ka} = ⅓ Σ_{r,k} z_k z_r j_{rka}. **Correct.**
- Leg sums. With (ℓ^0_{ij}c)_a = ½(δ_{aj} z_i − δ_{ai} z_j)c, I get ½ Σ_{ij} (ℓ^0_{ij} f_{ij})_a = ¼(Σ_i z_i f_{ia} − Σ_j z_j f_{aj}) = ½ Σ_i z_i f_{ia}, using antisymmetry of f. With (ℓ^1_{rkl}c)_a = ⅓(δ_{al} z_k − δ_{ak} z_l) z_r c, I get ½ Σ_{rkl} (ℓ^1_{rkl} j_{rkl})_a = ⅙(Σ_{rk} z_k z_r j_{rka} − Σ_{rl} z_l z_r j_{ral}) = ⅓ Σ_{rk} z_k z_r j_{rka}, using antisymmetry of j in its last two indices. Both agree with the displayed lines and with the reconstruction. **Correct.**
- The legs are radial and have the right degree: Σ_a z_a (ℓ^1_{rkl}c)_a = ⅓(z_l z_k − z_k z_l) z_r c = 0, and likewise for ℓ^0. The text's remark that the legs need not be linearly independent is right, and the "determined by values on legs" conclusion needs only spanning.
- Bianchi: j_{rkl} + j_{klr} + j_{lrk} = ∂_r∂_k A_l − ∂_r∂_l A_k + ∂_k∂_l A_r − ∂_k∂_r A_l + ∂_l∂_r A_k − ∂_l∂_k A_r = 0, since partial derivatives of a polynomial commute. **Correct.**
- "Equality as polynomial functions is equality of their symmetric coefficients": true over ℝ (polarization). Fine.

Minor points: M1 (identify curl_0/curl_1 with f/j) and M2 (order/degree terminology); see `README.md`.

### A2. Derivative plan and divergence probes (answers PR #117 Part 1 F1)

- The rank proposition now states its dependence on reality, signed covariance and eq:ex-trace-derivative-compatibility. These are stated as inputs and are not claimed to be constructed. This is the honest conditional form the finding asked for.
- Well-definedness of D_0: (D_0T)_b = Σ_a 𝒟_a T_{ab}. Under a signed permutation s, the covariance law transforms 𝒟_a by s_{ca}, and T_{ab} transforms as a 2-tensor. The contraction over a cancels by orthogonality (s^T s = I), leaving the vector action on b. With reality, D_0 lands in the real covariant vector table. The one-line justification in the text is adequate.
- Probe identity: φ_1 correlates the b = 0 component at e_0 with the quadratic probe (01,01) at the origin. By linearity and eq:ex-trace-derivative-compatibility, with the stress as first insertion and the probe as the only spectator, φ_1(D_0T_w) = Σ_u ∂_u ⟨T_{u0}(x) P(0)⟩|_{x=e_0} = Σ_u ∂_u S_w(01,01;u0;e_0). The configuration (e_0, 0) is separated, so the identity applies. The same holds for φ_2. **Correct.**
- Downstream use. The independence of the two coefficient rows, dim 𝒱_5 = 2, surjectivity and the Weyl kernel are unchanged from the base, and only now use the probe identity. I re-did the common-kernel step. From −512w_2 − 128w_3 = 0 we get w_2 = −w_3/4. Substituting into −256w_1 − 512w_2 + 128w_3 = 0 gives −256w_1 + 256w_3 = 0, so w_1 = w_3. This matches (1, −1/4, 1).

## B. PR #227

### B1. Uniform chamber threshold (`actual-stress-shell-nodes.tex`, `actual-stress-annulus.tex`; PR #177 request 2)

- Conclusion of `prop:ex-lattice-actual-shell-node`: ∃ m_0 ∀ m ≥ m_0 ∀ x in the level-m collar, there is a label sequence with a late event. To fix m_0 before x, every m-threshold used in the proof must be uniform in x. The old hypothesis ("for each … anchor x … for all sufficiently large m") gave an x-dependent threshold. With growing collars, it cannot be made uniform by taking a finite maximum. The new hypothesis supplies one m_ch per (p_0,k), B, T, 𝔣 for all anchors in all collars with m ≥ m_ch. The proof adds m_ch to the list taken before x. **The gap is closed.**
- The late (N,q) event may depend on m and x. That is consistent with the conclusion ("The late event may depend on x") and with the pointwise placement event. It is required to be common to all grade-D labels z. That is needed, because the correction z_x(N,q) is constructed after (N,q) is chosen, so the chamber condition for O_{N,q}(z,0) must hold for whichever z arises. The proof uses exactly this.
- The paragraph before the proposition now separates the uniform birth-level threshold from the pointwise placement event, consistently with the proof.
- Consumer: the `actual-stress-annulus.tex` input sentence now names the uniform form. A grep for other uses of the chamber receipt or the proposition found only this file (lines 124, 169–174, 497, 511) and `trace-probe-assembly.tex`. The latter concerns a different object, a buffered reflection-chamber estimate for a one-point probe, and does not cite the proposition. No consumer relies on the weaker old form.

### B2. Centered scalar trace (`trace-firesky-gallery.tex`; PR #177 request 3)

- Θ_T is the trace Σ_a J_aa of the physical stress, centred by subtracting its T-one-point value times the unit. The display r_i^4 U_{i,4}^{-1} Θ_T = e_i 1 + d_i (4O) is a statement in the two-dimensional span of the unit and O in the reference grade-four table. It has the limits b_i d_i → d_2 and b_i e_i → 0, hence d_i, e_i → 0 because b_i → ∞. The zoomed receipt b_i r_i^4 U^{-1} Θ_T → 4d_2 O is then consistent with the representation: b_i(e_i 1 + d_i 4O) → 0 + 4 d_2 O. The text's remark that the limit is a multiple of O and not of the unit is therefore correct.
- The two quantifier regimes are kept: comparison tables obeying the hierarchy laws and respecting the selected table for the representation, and every comparison table for the zoomed limit.
- Minor wording point M3 (U_{i,4} is invertible at every index); see `README.md`.

### B3. Ward translation (`physical-ward-propagation.tex`; PR #177 request 4)

With the angular expression of eq:ward-angular-expression and a common shift h:

- Rotation-row terms: S(q[i↦(d_i, 𝒴(K)v_i)]; x+h) = S(…; x), by translation invariance of every moment.
- Orbital terms: Σ_b (K(x_i+h))_b S(q[i↦P_b v_i]; x+h) = Σ_b (Kx_i)_b S(q[i↦P_b v_i]; x) + Σ_b (Kh)_b S(q[i↦P_b v_i]; x), using linearity of K and translation invariance.
- The difference is Σ_b (Kh)_b Σ_i S(q[i↦P_b v_i]; x) = Σ_b (Kh)_b Σ_i ∂_{x_{i,b}} S(q;x), by the derivative rule. The inner sum is d/ds S(q; x + s e_b) at s = 0, which is 0.

This is the displayed identity, with its zero. The consequence on parallel lines follows: if x_i = h + t_i e_a with distinct t_i, then 𝒜_K(q;x) = 𝒜_K(q;x−h) = 0 by the collinear hypothesis. The new text no longer contains the false non-invariance reason, and the theorem statement is unchanged. **Correct.**

## Verdict

No blocking defect and no required change. M1–M3 are optional wording fixes. Both PRs keep their remaining inputs explicit and do not claim to discharge them.
