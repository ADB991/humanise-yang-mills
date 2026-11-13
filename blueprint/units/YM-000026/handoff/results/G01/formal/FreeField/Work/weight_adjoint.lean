import FreeField.Analytic

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

private def spatialReflection_work (p : Spacetime) : Spacetime :=
  WithLp.toLp 2 fun i => if i = timeAxis then p i else -p i

private theorem reflection_involutive_work (p : Spacetime) :
    spatialReflection_work (spatialReflection_work p) = p := by
  ext i
  by_cases h : i = timeAxis <;> simp [spatialReflection_work, h]

private theorem time_reflection_work (p : Spacetime) :
    time (spatialReflection_work p) = time p := by
  simp [time, spatialReflection_work]

private theorem spatial_reflection_work (p : Spacetime) :
    spatial (spatialReflection_work p) = -spatial p := by
  ext i
  simp [spatial, spatialReflection_work, Fin.castSucc_ne_last]

private theorem weight_reflection_work (p : Spacetime) :
    weight (spatialReflection_work p) = weight p := by
  simp [weight, forwardCone, minkowskiSquare, time_reflection_work, spatial_reflection_work]

private theorem minkowski_polarization_work (x y : Spacetime) :
    minkowskiSquare (x + y) - minkowskiSquare x - minkowskiSquare y =
      2 * ⟪spatialReflection_work x, y⟫_ℝ := by
  simp [minkowskiSquare, EuclideanSpace.real_norm_sq_eq, time, spatial,
    spatialReflection_work, PiLp.inner_apply, Fin.sum_univ_succ, timeAxis, Fin.last]
  ring

private theorem lorentz_polarization_work (Λ : ProperLorentz) (x y : Spacetime) :
    ⟪spatialReflection_work (Λ.1.val x), Λ.1.val y⟫_ℝ =
      ⟪spatialReflection_work x, y⟫_ℝ := by
  have hsum := Λ.2.2.1 (x + y)
  rw [map_add] at hsum
  have hx := Λ.2.2.1 x
  have hy := Λ.2.2.1 y
  linarith [minkowski_polarization_work x y,
    minkowski_polarization_work (Λ.1.val x) (Λ.1.val y)]

private theorem adjoint_reflection_work (Λ : ProperLorentz) (x : Spacetime) :
    ContinuousLinearMap.adjoint Λ.1.val (spatialReflection_work (Λ.1.val x)) =
      spatialReflection_work x := by
  apply ext_inner_right ℝ
  intro y
  rw [ContinuousLinearMap.adjoint_inner_left]
  exact lorentz_polarization_work Λ x y

private theorem adjoint_formula_work (Λ : ProperLorentz) (p : Spacetime) :
    ContinuousLinearMap.adjoint Λ.1.val p = spatialReflection_work
      ((ContinuousLinearEquiv.unitsEquiv ℝ Spacetime Λ.1).symm (spatialReflection_work p)) := by
  let e := ContinuousLinearEquiv.unitsEquiv ℝ Spacetime Λ.1
  have h := adjoint_reflection_work Λ (e.symm (spatialReflection_work p))
  change ContinuousLinearMap.adjoint Λ.1.val
    (spatialReflection_work (e (e.symm (spatialReflection_work p)))) = _ at h
  simpa only [e.apply_symm_apply, reflection_involutive_work] using h

theorem weight_adjoint' (Λ : ProperLorentz) (p : Spacetime) :
    weight (ContinuousLinearMap.adjoint (Λ.1.val : Spacetime →L[ℝ] Spacetime) p) = weight p := by
  let e := ContinuousLinearEquiv.unitsEquiv ℝ Spacetime Λ.1
  have hw (q : Spacetime) : weight (e q) = weight q := by
    change weight (Λ.1.val q) = weight q
    simp only [weight, Λ.2.2.1, Λ.2.2.2]
  rw [adjoint_formula_work, weight_reflection_work]
  calc
    weight (e.symm (spatialReflection_work p)) = weight (spatialReflection_work p) := by
      simpa only [e.apply_symm_apply] using (hw (e.symm (spatialReflection_work p))).symm
    _ = weight p := weight_reflection_work p

end YangMills.FreeField
#print axioms YangMills.FreeField.weight_adjoint'
