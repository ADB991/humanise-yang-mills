import FreeField.Fock

/-!
# Free-field witness, module A2 (data): symmetries and the adjoint

The Poincaré group in the coordinates of `PublicTheory`, its action on tests, on labels and on the
host, and the conjugation of labels. See `FreeField/DESIGN.md` section 5.

Conventions (checked against `PoincareAction.pullback` and `W2.fieldCovariance`):
* `(Λ, a) * (Γ, b) = (Λ Γ, a + Λ b)`; `onTests (Λ, a) f x = f (Λ⁻¹ (x - a))`.
* On the host `(U(Λ, a) ψ)_k (p) = exp (i ⟪a, ∑ p_j⟫) ψ_k (Λᵀ p₁, …, Λᵀ p_k)`, `Λᵀ` the Euclidean
  transpose.
* The label `ξ_α` is `i^{α_t} ∂^α φ`. On first derivatives `Λ` acts by the matrix
  `ρ(Λ) = D⁻¹ Λ D`, `D = diag (1, 1, 1, i)`, columns being the images of the basis labels:
  `ρ(Λ) ξ_j = ∑_i D_i⁻¹ Λ_{ij} D_j ξ_i`. It is extended to `ξ_α` by the substitution
  `X_j ↦ ∑_i ρ_{ij} X_i` in the polynomial ring in four variables (`ξ_α ↔ X^α`), and to Wick
  monomials multiplicatively.
* The adjoint is conjugate-linear with `{α₁,…,α_k}† = (-1)^{∑ (α_j)_t} {α₁,…,α_k}`.
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-! ## The group -/

instance : One ProperLorentz := ⟨⟨1, by simp, fun _ => rfl, fun _ => Iff.rfl⟩⟩

instance : Mul ProperLorentz :=
  ⟨fun g h => ⟨g.1 * h.1, by
      rw [show (g.1 * h.1).val.toLinearMap = g.1.val.toLinearMap * h.1.val.toLinearMap from rfl,
        map_mul, g.2.1, h.2.1, one_mul],
      fun x => by
        rw [show (g.1 * h.1).val x = g.1.val (h.1.val x) from rfl, g.2.2.1, h.2.2.1],
      fun x => by
        rw [show (g.1 * h.1).val x = g.1.val (h.1.val x) from rfl, g.2.2.2, h.2.2.2]⟩⟩

/-- The proper orthochronous Poincaré group, in the public coordinates. -/
def Sym : Type := ProperLorentz × Spacetime

instance : TopologicalSpace Sym := inferInstanceAs (TopologicalSpace (ProperLorentz × Spacetime))

/-- The Lorentz part. -/
def Sym.lor (g : Sym) : ProperLorentz := g.1

/-- The translation part. -/
def Sym.shift (g : Sym) : Spacetime := g.2

instance : One Sym := ⟨((1 : ProperLorentz), (0 : Spacetime))⟩

instance : Mul Sym := ⟨fun g h => ((g.lor * h.lor : ProperLorentz), g.lor.1.val h.shift + g.shift)⟩

/-- The Euclidean transpose of a Lorentz transformation. -/
def lorT (Λ : ProperLorentz) : Spacetime →L[ℝ] Spacetime :=
  ContinuousLinearMap.adjoint (Λ.1.val : Spacetime →L[ℝ] Spacetime)

/-! ## Action on tests and on the host -/

/-- `f ↦ f (Λ⁻¹ (· - a))`. -/
def onTests (g : Sym) (f : TestFunction) : TestFunction :=
  SchwartzMap.compSubConstCLM ℂ g.shift
    (SchwartzMap.compCLMOfContinuousLinearEquiv ℂ
      (ContinuousLinearEquiv.unitsEquiv ℝ Spacetime g.lor.1⁻¹) f)

theorem onTests_apply (g : Sym) (f : TestFunction) (x : Spacetime) :
    onTests g f x = f ((g.lor.1⁻¹).val (x - g.shift)) := rfl

/-- The unitary of a Poincaré transformation on the host. -/
def poinOp (g : Sym) : FockCarrier →L[ℂ] FockCarrier :=
  fockOp (phase g.shift) fun _ p j => lorT g.lor (p j)

/-! ## Labels -/

/-- The number of time derivatives of a monomial. -/
def tdeg (m : Mon) : ℕ := (m.map fun α : Idx => α timeAxis).sum

/-- The conjugation of labels. -/
def adjL : (Mon →₀ ℂ) →ₛₗ[starRingEnd ℂ] (Mon →₀ ℂ) where
  toFun P := Finsupp.ofSupportFinite (fun m => (-1 : ℂ) ^ tdeg m * (starRingEnd ℂ) (P m))
    (P.support.finite_toSet.subset fun m hm => by
      simp only [Function.mem_support, ne_eq, mul_eq_zero, not_or] at hm
      simpa using hm.2)
  map_add' P Q := by
    ext m
    simp [Finsupp.ofSupportFinite_coe, mul_add]
  map_smul' c P := by
    ext m
    simp [Finsupp.ofSupportFinite_coe]
    ring

theorem adjL_apply (P : Mon →₀ ℂ) (m : Mon) :
    adjL P m = (-1 : ℂ) ^ tdeg m * (starRingEnd ℂ) (P m) := rfl

/-- The twist `D = diag (1, 1, 1, i)`. -/
def twist (i : Fin 4) : ℂ := if i = timeAxis then Complex.I else 1

/-- The matrix `ρ(Λ) = D⁻¹ Λ D`; `rhoMat Λ i j` is the coefficient of `ξ_i` in `ρ(Λ) ξ_j`. -/
def rhoMat (Λ : ProperLorentz) (i j : Fin 4) : ℂ :=
  (twist i)⁻¹ * ((Λ.1.val (EuclideanSpace.single j (1 : ℝ)) i : ℝ) : ℂ) * twist j

/-- The substitution `X_j ↦ ∑_i ρ_{ij} X_i` on derivative symbols. -/
def derivSubst (Λ : ProperLorentz) : MvPolynomial (Fin 4) ℂ →ₐ[ℂ] MvPolynomial (Fin 4) ℂ :=
  MvPolynomial.aeval fun j => ∑ i, MvPolynomial.C (rhoMat Λ i j) * MvPolynomial.X i

/-- The image of the one-leg label `ξ_α`: a combination of one-leg labels of the same order. -/
def rhoIdx (Λ : ProperLorentz) (α : Idx) : Mon →₀ ℂ :=
  ∑ β ∈ (derivSubst Λ (MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm α) 1)).support,
    Finsupp.single ({(β : Fin 4 → ℕ)} : Mon)
      ((derivSubst Λ (MvPolynomial.monomial (Finsupp.equivFunOnFinite.symm α) 1)).coeff β)

/-- The image of a Wick monomial: the product of the images of its legs, in the polynomial
algebra on one-leg labels (`AddMonoidAlgebra ℂ Mon`, multiplication = union of multisets). -/
def rhoMon (Λ : ProperLorentz) (m : Mon) : Mon →₀ ℂ :=
  ((m.map fun α => (AddMonoidAlgebra.ofCoeff (rhoIdx Λ α) : AddMonoidAlgebra ℂ Mon)).prod).coeff

/-- The action of a Lorentz transformation on labels. -/
def rhoL (Λ : ProperLorentz) : (Mon →₀ ℂ) →ₗ[ℂ] (Mon →₀ ℂ) :=
  Finsupp.lsum ℂ fun m => LinearMap.toSpanSingleton ℂ (Mon →₀ ℂ) (rhoMon Λ m)

theorem rhoL_single (Λ : ProperLorentz) (m : Mon) (c : ℂ) :
    rhoL Λ (Finsupp.single m c) = c • rhoMon Λ m := by
  simp [rhoL]

end YangMills.FreeField
