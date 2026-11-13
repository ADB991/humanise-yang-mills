import FreeField.Analytic
import Mathlib.MeasureTheory.Measure.Lebesgue.EqHaar

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

private theorem det_adjoint_work (Λ : ProperLorentz) :
    LinearMap.det (ContinuousLinearMap.adjoint Λ.1.val).toLinearMap = 1 := by
  rw [← ContinuousLinearMap.adjoint_toLinearMap,
    ← LinearMap.det_toMatrix (EuclideanSpace.basisFun Axis ℝ).toBasis,
    LinearMap.toMatrix_adjoint (EuclideanSpace.basisFun Axis ℝ)
      (EuclideanSpace.basisFun Axis ℝ),
    Matrix.det_conjTranspose, LinearMap.det_toMatrix, Λ.2.1]
  simp

private theorem map_volume_adjoint_work (Λ : ProperLorentz) :
    Measure.map (ContinuousLinearMap.adjoint Λ.1.val) volume = (volume : Measure Spacetime) := by
  have hd := det_adjoint_work Λ
  have h := Measure.map_linearMap_addHaar_eq_smul_addHaar (volume : Measure Spacetime)
    (f := (ContinuousLinearMap.adjoint Λ.1.val).toLinearMap) (by rw [hd]; norm_num)
  simpa [hd] using h

theorem mu_map_adjoint' (Λ : ProperLorentz) :
    Measure.map (ContinuousLinearMap.adjoint (Λ.1.val : Spacetime →L[ℝ] Spacetime)) mu = mu := by
  let A := ContinuousLinearMap.adjoint Λ.1.val
  have hA : Measurable A := A.continuous.measurable
  have hv : Measure.map A volume = (volume : Measure Spacetime) := map_volume_adjoint_work Λ
  ext s hs
  rw [Measure.map_apply hA hs, mu, withDensity_apply _ (hA hs),
    withDensity_apply _ hs, ← lintegral_indicator (hA hs), ← lintegral_indicator hs]
  have hi := lintegral_map (μ := (volume : Measure Spacetime))
    (measurable_weight.ennreal_ofReal.indicator hs) hA
  rw [hv] at hi
  rw [hi]
  apply lintegral_congr
  intro p
  by_cases hp : A p ∈ s
  · simp only [Set.indicator_of_mem hp, Set.mem_preimage, hp, Set.indicator_of_mem]
    rw [weight_adjoint]
  · simp [hp]

end YangMills.FreeField
#print axioms YangMills.FreeField.mu_map_adjoint'
