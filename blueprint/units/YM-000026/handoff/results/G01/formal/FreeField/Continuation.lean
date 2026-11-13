import FreeField.Analytic

/-!
# Free-field witness, module E: regularity, continuation and boundary values

See `FreeField/DESIGN.md`, section (d). Five statements about the explicit functions `corrL`,
`contL` and `wightmanL` of `FreeField.Wick`. No Hilbert space occurs in this file.

The analytic input is stated once in `FreeField.Analytic`; the five statements below are
assembly theorems over it (difficulty tags and dependencies in each docstring and in
`FreeField/TASKS.md`).
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

variable {n : ℕ}

/-- [MEDIUM, 400 lines; depends on `lineS_symm`] **Permutation symmetry** of the Euclidean
correlations.

Proof idea: a permutation `π` of the vertices induces a bijection of legs and of matchings. The
factor of a line is unchanged, because the line kernel is symmetric,
`lineS α β ξ = lineS β α (-ξ)`: `S` is even, so `∂^γ S (-ξ) = (-1)^{|γ|} ∂^γ S ξ`. Only the
orientation convention (earlier to later vertex) is affected. About 250 lines, combinatorial.
The hypothesis `hx` is not needed for the statement to hold (both sides vanish off the separated
set) but it is where smoothness of `S`, hence evenness of derivatives, is available. -/
theorem corrL_perm (P : Fin n → (Mon →₀ ℂ)) (x : Points n) (hx : x ∈ WilsonFamily.separated n)
    (π : Equiv.Perm (Fin n)) :
    corrL (P ∘ π) (WithLp.toLp 2 (x.ofLp ∘ π)) = corrL P x := by
  sorry

/-- [EASY, 150 lines; depends on `partialDeriv_S_contDiffOn`] **Smoothness** of the Euclidean
correlations on configurations of distinct points (finite sums and products of
`lineS α β (x w - x v)`, `v ≠ w`, composed with continuous linear maps).

Proof idea: on the open set `separated n` the correlation is a finite sum of products of
`∂^γ S (x w - x v)` with `v ≠ w`; `S = Sr ∘ ‖·‖` is smooth away from the origin because `Sr` is
smooth on `(0, ∞)` (differentiation under the integral; the integrand is dominated by
`p_t^k exp (-r₀ p_t) weight p`). About 300 lines; Mathlib has no `ContDiff` statement for
parametric integrals, so the induction on the order is done by hand. -/
theorem corrL_contDiffOn (P : Fin n → (Mon →₀ ℂ)) :
    ContDiffOn ℝ ∞ (corrL P) (WilsonFamily.separated n : Set (Points n)) := by
  sorry

/-- [EASY, 150 lines; depends on `lineC_differentiableOn`] **Analyticity** of the continuation in
the complex times on the ordered tube, for fixed spatial points.

Proof idea: `contL` is a finite sum of products of `lineC α β (z w - z v) (u w - u v)` with
`v < w`, so `0 < (z w - z v).im` on the tube. For `0 < z.im` the integral `lineC` converges
absolutely (`|Amono α p * Bmono β p| ≤ (1 + ‖p‖)^k` and `weight p ≤ p_t⁴` on the cone, against
`exp (-z.im p_t)` with `‖p‖ ≤ √2 p_t`), and is complex differentiable by
`hasDerivAt_integral_of_dominated_loc_of_deriv_le`. About 250 lines. -/
theorem contL_differentiableOn (P : Fin n → (Mon →₀ ℂ)) (u : Fin n → Space) :
    DifferentiableOn ℂ (fun z => contL P z u) (Hierarchy.orderedTube n) := by
  sorry

/-- [EASY, 150 lines; depends on `lineC_euclid`] **Euclidean points**: at purely imaginary,
strictly increasing times the continuation is the Euclidean correlation (term by term, with
`ξ = x w - x v`, `time ξ > 0` for `v < w`).

Proof idea: such `x` is separated. For `v < w` put `τ = t_w - t_v > 0`, `u = 𝐱_w - 𝐱_v`. By (EI)
and differentiation under the integral,
`∂^γ S (u, τ) = ∫ ∏_{i<3} (i p_i)^{γ_i} (-p_t)^{γ_t} exp (-τ p_t + i ⟪u, 𝐩⟫) weight p dp`,
and `Amono α p * Bmono β p = (-1)^{|α|} ∏_{i<3} (i p_i)^{α_i+β_i} (-p_t)^{α_t+β_t}`. Hence
`lineC α β (i τ) u = lineS α β (x w - x v)`, and the Wick sums agree term by term.
(EI) is proved by analytic continuation in one variable from the real Lorentz boosts
(DESIGN.md (d)); about 500 lines in total. -/
theorem contL_root (P : Fin n → (Mon →₀ ℂ)) (x : Points n)
    (h : StrictMono fun i => time (x i)) :
    contL P (Hierarchy.imaginaryTimes x) (Hierarchy.spatialPoints x) = corrL P x := by
  sorry

/-- [HARD, 800 lines; depends on `matching_integrable`, `integrable_pow_exp_weight`]
**Boundary values**: the smeared continuation converges to the Wightman function along every
ray into the ordered tube.

Proof idea: for `r > 0` the integrand is continuous and bounded by a constant times
`|tensorTest|`, since every line has `(z w - z v).im = r (height w - height v) ≥ r δ`; so the
Bochner integral is a genuine integral. Fubini (line momenta against positions) turns it into
`∑_σ ∫ ∏ (leg factors) ∏_v fourierE (f v) (vertexMomentum σ q v)
  exp (-r ∑_ℓ (height w_ℓ - height v_ℓ) (q ℓ)_t) dq`,
and dominated convergence with `matching_integrable` (directed cuts) gives the limit `wightmanL P tests`. About 600 lines. -/
theorem contL_boundary (P : Fin n → (Mon →₀ ℂ)) (height : Fin n → ℝ) (h : StrictMono height)
    (tests : Fin n → TestFunction) :
    Tendsto (fun r : ℝ => ∫ x : Points n,
        contL P (Hierarchy.complexShift r height x) (Hierarchy.spatialPoints x) *
          Hierarchy.tensorTest tests x)
      (𝓝[>] 0) (𝓝 (wightmanL P tests)) := by
  sorry

end YangMills.FreeField
