import FreeField.Wick

/-!
# Free-field witness: shared analytic prerequisites

Statements used by modules A (Fock host), D (OPE) and E (continuation). Each is stated once here.
See `FreeField/DESIGN.md` section 4 and `FreeField/TASKS.md`. Difficulty tags: EASY / MEDIUM / HARD.

Conventions: `p = (𝐩, p_t)` with time last; all pairings Euclidean; `weight` is supported in the
closed forward cone `‖spatial p‖ ≤ time p`, where `0 ≤ weight p ≤ (time p)^4`.
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

/-- The one-particle measure `weight p dp` on momentum space. -/
def mu : Measure Spacetime := volume.withDensity fun p => ENNReal.ofReal (weight p)

/-! ## The weight -/

theorem weight_nonneg (p : Spacetime) : 0 ≤ weight p := by
  unfold weight
  split_ifs
  · positivity
  · exact le_rfl

/-- [EASY, 30 lines] On the cone `0 ≤ p² ≤ p_t²` and `log (e + p²) ≥ 1`; off the cone the weight
is `0 ≤ p_t^4` (even power). -/
theorem weight_le (p : Spacetime) : weight p ≤ time p ^ 4 := by
  sorry

/-- [EASY, 30 lines] `weight` is an `ite` over a closed set of continuous functions. -/
theorem measurable_weight : Measurable weight := by
  sorry

/-- `weight` vanishes off the closed forward cone. -/
theorem weight_eq_zero {p : Spacetime} (hp : p ∉ forwardCone) : weight p = 0 := by
  unfold weight; rw [if_neg hp]

/-- [MEDIUM, 120 lines] Laplace integrability with polynomial weights: on the cone
`‖p‖ ≤ √2 p_t` and `weight p ≤ p_t^4`, so the integrand is at most
`(√2 p_t)^k p_t^4 exp (-r p_t)` on the cone, whose integral over `{‖𝐩‖ ≤ p_t}` is a Gamma
integral. -/
theorem integrable_pow_exp_weight {r : ℝ} (hr : 0 < r) (k : ℕ) :
    Integrable fun p : Spacetime => ‖p‖ ^ k * Real.exp (-r * time p) * weight p := by
  sorry

/-- [MEDIUM, 150 lines] Lorentz invariance of the weight under the Euclidean transpose: for
`Λ` proper orthochronous, `Λᵀ = J Λ⁻¹ J` with `J` the reflection of the spatial coordinates, and
`J`, `Λ⁻¹` preserve the cone and `minkowskiSquare`. -/
theorem weight_adjoint (Λ : ProperLorentz) (p : Spacetime) :
    weight (ContinuousLinearMap.adjoint (Λ.1.val : Spacetime →L[ℝ] Spacetime) p) = weight p := by
  sorry

/-- [MEDIUM, 80 lines] `mu` is invariant under `Λᵀ`: `weight_adjoint` and `|det Λᵀ| = 1`
(`MeasureTheory.Measure.map_linearMap_addHaar_eq_smul_addHaar`). Depends on `weight_adjoint`. -/
theorem mu_map_adjoint (Λ : ProperLorentz) :
    Measure.map (ContinuousLinearMap.adjoint (Λ.1.val : Spacetime →L[ℝ] Spacetime)) mu = mu := by
  sorry

/-! ## The Euclidean two-point function -/

/-- [HARD, 400 lines] **Euclidean invariance (EI).** For `τ > 0` the Fourier–Laplace transform of
the one-particle measure at `(u, τ)` depends only on `τ² + ‖u‖²`.

Proof: fix `τ` and a unit vector `e` with `u = ‖u‖ e`. `G s = ∫ exp (-τ p_t + s ⟪e, 𝐩⟫) weight p`
is holomorphic on the strip `|re s| < τ` (domination by `integrable_pow_exp_weight`, since
`|⟪e,𝐩⟫| ≤ p_t` on the cone). For real `s` it equals `Sr (sqrt (τ² - s²))` by the boost in the
`(e, t)` plane mapping `(-s e, τ)` to `(0, sqrt (τ² - s²))` and `mu_map_adjoint`. `Sr` extends
holomorphically to `re z > 0`, and `s ↦ sqrt (τ² - s²)` maps the strip into `re > 0`. The identity
theorem (`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`) gives equality at `s = i ‖u‖`.
Sign check: at `u = 0` both sides are `Sr τ` by definition. -/
theorem Sr_euclid {τ : ℝ} (hτ : 0 < τ) (u : Space) :
    ∫ p : Spacetime, Complex.exp (-((τ * time p : ℝ) : ℂ) +
        Complex.I * ((⟪u, spatial p⟫_ℝ : ℝ) : ℂ)) * (weight p : ℂ) =
      (Sr (Real.sqrt (τ ^ 2 + ‖u‖ ^ 2)) : ℂ) := by
  sorry

/-- [MEDIUM, 250 lines] `S = Sr ∘ ‖·‖` is smooth away from the origin: `Sr` is smooth on `(0,∞)`
by repeated differentiation under the integral (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`
with `integrable_pow_exp_weight`), and the norm is smooth off `0`. -/
theorem S_contDiffOn : ContDiffOn ℝ ∞ S {(0 : Spacetime)}ᶜ := by
  sorry

/-- [EASY, 60 lines] Induction on `dirList γ`: `fderiv` of a smooth function on an open set,
applied to a fixed vector, is smooth there. Depends on `S_contDiffOn`. -/
theorem partialDeriv_S_contDiffOn (γ : Idx) :
    ContDiffOn ℝ ∞ (partialDeriv γ S) {(0 : Spacetime)}ᶜ := by
  sorry

/-- [MEDIUM, 150 lines] One more derivative raises the multi-index (partial derivatives of a
smooth function commute; `ContDiffAt.isSymmSndFDerivAt`). Depends on `S_contDiffOn`. -/
theorem partialDeriv_S_succ (γ : Idx) (i : Fin 4) {ξ : Spacetime} (hξ : ξ ≠ 0) :
    fderiv ℝ (partialDeriv γ S) ξ (EuclideanSpace.single i (1 : ℝ)) =
      partialDeriv (γ + Pi.single i 1) S ξ := by
  sorry

/-- [EASY, 60 lines] Parity. `S` is even, and `fderiv` of an even (odd) function applied to a
fixed vector is odd (even), with no differentiability hypothesis; induct on `dirList γ`, whose
length is `idxOrder γ`. -/
theorem partialDeriv_S_neg (γ : Idx) (ξ : Spacetime) :
    partialDeriv γ S (-ξ) = (-1) ^ idxOrder γ * partialDeriv γ S ξ := by
  sorry

/-- [MEDIUM, 250 lines] Derivatives of `S` in the upper half space as momentum integrals:
differentiate (EI) under the integral. A spatial derivative `∂_i` produces `i p_i`, the time
derivative produces `-p_t`. Depends on `Sr_euclid`, `integrable_pow_exp_weight`.
Sign check (`γ = e_t`, `spatial ξ = 0`): the right side is `-∫ p_t exp (-τ p_t) weight p < 0`,
and `S` is decreasing in `τ`. -/
theorem partialDeriv_S_integral (γ : Idx) {ξ : Spacetime} (hξ : 0 < time ξ) :
    partialDeriv γ S ξ =
      ∫ p : Spacetime, (∏ i : Fin 3, (Complex.I * (p i.castSucc : ℂ)) ^ γ i.castSucc) *
        (-(time p : ℂ)) ^ γ timeAxis *
        Complex.exp (-((time ξ * time p : ℝ) : ℂ) +
          Complex.I * ((⟪spatial ξ, spatial p⟫_ℝ : ℝ) : ℂ)) * (weight p : ℂ) := by
  sorry

/-- [MEDIUM, 300 lines] **Scaling bound.** `|∂^γ S ξ| ≤ C ‖ξ‖^{-8-|γ|}` for all `ξ ≠ 0`.

Proof: `|Sr^{(k)} r| ≤ ∫ p_t^{k+4} exp (-r p_t) 1_cone dp = c_k r^{-8-k}` (from `weight_le` and
scaling), and `∂^γ (Sr ∘ ‖·‖)` is a finite sum of `Sr^{(k)}(‖ξ‖)` times functions homogeneous of
degree `k - |γ|` and bounded on the unit sphere. Alternatively rotate `ξ` to the time axis
(`S` is rotation invariant) and use `partialDeriv_S_integral`. -/
theorem partialDeriv_S_bound (γ : Idx) :
    ∃ C : ℝ, ∀ ξ : Spacetime, ξ ≠ 0 → ‖partialDeriv γ S ξ‖ ≤ C / ‖ξ‖ ^ (8 + idxOrder γ) := by
  sorry

/-! ## Line kernels -/

/-- [EASY, 20 lines] Symmetry of the Euclidean line kernel, from `partialDeriv_S_neg` and
`add_comm`: `(-1)^{|β|} (-1)^{|α+β|} = (-1)^{|α|}`. -/
theorem lineS_symm (α β : Idx) (ξ : Spacetime) : lineS α β ξ = lineS β α (-ξ) := by
  sorry

/-- [MEDIUM, 150 lines] `lineC` converges absolutely on the upper half plane and is holomorphic
there (`hasDerivAt_integral_of_dominated_loc_of_deriv_le`; `‖Amono α p * Bmono β p‖ ≤ ‖p‖^{|α|+|β|}`
and `integrable_pow_exp_weight`). -/
theorem lineC_differentiableOn (α β : Idx) (u : Space) :
    DifferentiableOn ℂ (fun z => lineC α β z u) {z : ℂ | 0 < z.im} := by
  sorry

/-- [EASY, 80 lines] At a Euclidean point the continued line kernel is the Euclidean one:
`Amono α p * Bmono β p = (-1)^{|α|} ∏_{i<3} (i p_i)^{α_i+β_i} (-p_t)^{α_t+β_t}` and
`partialDeriv_S_integral`. Depends on `partialDeriv_S_integral`.
Sign check (`α = e_t`, `β = 0`, `spatial ξ = 0`): `lineC = ∫ p_t exp (-τ p_t) weight p > 0` and
`lineS = -∂_τ S > 0`. -/
theorem lineC_euclid (α β : Idx) {ξ : Spacetime} (hξ : 0 < time ξ) :
    lineC α β ((time ξ : ℂ) * Complex.I) (spatial ξ) = lineS α β ξ := by
  sorry

/-! ## Matching integrals -/

variable {n : ℕ}

/-- [HARD, 600 lines] **Absolute integrability of matching integrands (AI).**

Proof (directed cuts): for `j < n - 1` let `Q_j` be the sum of the momenta of the lines from a
vertex `≤ j` to a vertex `> j`; then `Q_j = -∑_{v ≤ j} k_v` with `k_v = vertexMomentum σ q v`.
On the support of the weights every `q ℓ` lies in the cone, so `(q ℓ)_t ≥ 0`, every line crosses
some cut, and `∑_ℓ (q ℓ)_t ≤ ∑_j (Q_j)_t ≤ (n - 1) ∑_v ‖k_v‖`. With `‖q ℓ‖ ≤ √2 (q ℓ)_t`:
`1 + ∑_ℓ ‖q ℓ‖ ≤ C ∏_v (1 + ‖k_v‖)`. The Schwartz decay of `fourierE (f v)` of order `N` then
bounds the integrand by `C ∏_ℓ (1 + ‖q ℓ‖)^{d_ℓ - N'}` on the product of cones, which is
integrable for large `N`. (A single vertex momentum may vanish while the lines through the vertex
are large; only the cuts control the lines.) -/
theorem matching_integrable (m : Fin n → Mon) (σ : Matching m) (f : Fin n → TestFunction) :
    Integrable fun q : Line σ → Spacetime =>
      (∏ ℓ : Line σ, Amono ℓ.1.idx (q ℓ) * Bmono (σ.1 ℓ.1).idx (q ℓ) * (weight (q ℓ) : ℂ)) *
        ∏ v : Fin n, fourierE (f v) (vertexMomentum σ q v) := by
  sorry

/-- [HARD, 300 lines] The Wightman functions are jointly continuous in the tests (they are
multilinear and bounded by a product of Schwartz seminorms: the constants in the proof of
`matching_integrable` are seminorms of the `f v`). Shares its proof with
`matching_integrable`. -/
theorem wightmanL_continuous (P : Fin n → (Mon →₀ ℂ)) :
    Continuous fun f : Fin n → TestFunction => wightmanL P f := by
  sorry

end YangMills.FreeField
