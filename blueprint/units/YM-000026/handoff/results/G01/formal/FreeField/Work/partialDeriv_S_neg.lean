import FreeField.Analytic

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

private theorem dirDeriv_parity_work {f : Spacetime → ℂ} {c : ℂ}
    (hf : ∀ x, f (-x) = c * f x) (v x : Spacetime) :
    dirDeriv v f (-x) = -c * dirDeriv v f x := by
  have heq : f ∘ (ContinuousLinearEquiv.neg ℝ : Spacetime ≃L[ℝ] Spacetime) = c • f :=
    funext hf
  have hd := (ContinuousLinearEquiv.neg ℝ : Spacetime ≃L[ℝ] Spacetime).comp_right_fderiv
    (f := f) (x := x)
  rw [heq, fderiv_const_smul_field] at hd
  have hv := congrArg (fun L : Spacetime →L[ℝ] ℂ => L v) hd
  simp only [Pi.smul_apply, smul_apply, ContinuousLinearMap.comp_apply,
    ContinuousLinearEquiv.coe_coe, ContinuousLinearEquiv.neg_apply, map_neg, smul_eq_mul] at hv
  unfold dirDeriv
  linear_combination hv

private theorem dirList_length_work (γ : Idx) : (dirList γ).length = idxOrder γ := by
  simp [dirList, List.length_flatMap, ← Fin.sum_univ_def, idxOrder]

private theorem foldr_parity_work (vs : List Spacetime) : ∀ ξ : Spacetime,
    vs.foldr dirDeriv S (-ξ) = (-1) ^ vs.length * vs.foldr dirDeriv S ξ := by
  induction vs with
  | nil => intro ξ; simp [S]
  | cons v vs ih =>
      intro ξ
      simp only [List.foldr_cons, List.length_cons]
      rw [dirDeriv_parity_work ih]
      rw [pow_succ]
      ring

theorem partialDeriv_S_neg' (γ : Idx) (ξ : Spacetime) :
    partialDeriv γ S (-ξ) = (-1) ^ idxOrder γ * partialDeriv γ S ξ := by
  simpa only [partialDeriv, dirList_length_work] using foldr_parity_work (dirList γ) ξ

end YangMills.FreeField
#print axioms YangMills.FreeField.partialDeriv_S_neg'
