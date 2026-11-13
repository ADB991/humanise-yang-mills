import FreeField.Labels

/-!
# Free-field witness: the spectral weight and the two-point kernels

See `FreeField/DESIGN.md`, sections (c) and (d). Everything in this file is a definition.

Momentum space is `Spacetime = EuclideanSpace ℝ (Fin 4)` with time last, and all pairings are
the Euclidean inner product, as forced by `charFun` in `WightmanTheory.W0.spectralRepresentation`.
The one-particle measure is absolutely continuous with respect to Lebesgue measure, with the
Lorentz-invariant density `weight`. No Bessel function and no mass-shell measure occurs.
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open MeasureTheory
open scoped BigOperators Classical InnerProductSpace

/-- The density of the one-particle measure: `(p²)² / log² (e + p²)` on the closed forward cone,
where `p² = p_t² - |𝐩|²`, and `0` outside. In Källén–Lehmann terms the spectral weight is
`ρ(ds) = (2π)³ s² / log² (e + s) ds` on `s ≥ 0`. -/
def weight (p : Spacetime) : ℝ :=
  if p ∈ forwardCone then
    minkowskiSquare p ^ 2 / (Real.log (Real.exp 1 + minkowskiSquare p)) ^ 2
  else 0

/-- The Euclidean two-point function of `φ` at distance `r > 0`: the Laplace transform of the
one-particle measure in the energy. -/
def Sr (r : ℝ) : ℝ := ∫ p : Spacetime, Real.exp (-r * time p) * weight p

/-- The Euclidean two-point function of `φ`, a radial function, smooth away from the origin. -/
def S (x : Spacetime) : ℂ := (Sr ‖x‖ : ℂ)

/-- Momentum factor of a leg `ξ_α` that is the *earlier* (left) end of a line:
`∏_{i<3} (-i p_i)^{α_i} · p_t^{α_t}`. -/
def Amono (α : Idx) (p : Spacetime) : ℂ :=
  (∏ i : Fin 3, (-(Complex.I * (p i.castSucc : ℂ))) ^ α i.castSucc) * (time p : ℂ) ^ α timeAxis

/-- Momentum factor of a leg `ξ_β` that is the *later* (right) end of a line:
`∏_{i<3} (i p_i)^{β_i} · (-p_t)^{β_t}`. -/
def Bmono (β : Idx) (p : Spacetime) : ℂ :=
  (∏ i : Fin 3, (Complex.I * (p i.castSucc : ℂ)) ^ β i.castSucc) * (-(time p : ℂ)) ^ β timeAxis

/-- The analytically continued two-point function `⟨ξ_α(x) ξ_β(y)⟩` as a function of the complex
time difference `z = t_y - t_x` (absolutely convergent for `0 < z.im`) and the real spatial
difference `u = 𝐲 - 𝐱`. -/
def lineC (α β : Idx) (z : ℂ) (u : Space) : ℂ :=
  ∫ p : Spacetime, Amono α p * Bmono β p *
    Complex.exp (Complex.I * (z * (time p : ℂ) + ((⟪u, spatial p⟫_ℝ : ℝ) : ℂ))) * (weight p : ℂ)

/-- Derivative in the direction `v`. -/
def dirDeriv (v : Spacetime) (f : Spacetime → ℂ) : Spacetime → ℂ := fun x => fderiv ℝ f x v

/-- The list of coordinate directions of a multi-index, with multiplicity. -/
def dirList (γ : Idx) : List Spacetime :=
  (List.finRange 4).flatMap fun i => List.replicate (γ i) (EuclideanSpace.single i (1 : ℝ))

/-- The partial derivative `∂^γ f` (for smooth `f` the order of differentiation is immaterial). -/
def partialDeriv (γ : Idx) (f : Spacetime → ℂ) : Spacetime → ℂ := (dirList γ).foldr dirDeriv f

@[simp] theorem partialDeriv_zero (f : Spacetime → ℂ) : partialDeriv 0 f = f := by
  have h : dirList 0 = [] := by simp [dirList, List.flatMap_eq_nil_iff]
  rw [partialDeriv, h]
  rfl

/-- The Euclidean two-point function `⟨ξ_α(x) ξ_β(y)⟩ = ∂_x^α ∂_y^β S(y - x)` as a function of
`ξ = y - x ≠ 0`. It is symmetric: `lineS α β ξ = lineS β α (-ξ)`. -/
def lineS (α β : Idx) (ξ : Spacetime) : ℂ := (-1) ^ idxOrder α * partialDeriv (α + β) S ξ

end YangMills.FreeField
