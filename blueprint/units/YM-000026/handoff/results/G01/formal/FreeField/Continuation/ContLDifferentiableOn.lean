import FreeField.Continuation.Base
import FreeField.Analytic.LineCDifferentiableOn


/-! Proofs consolidated from `FreeField/Work/contL_differentiableOn.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Continuation_ContLDifferentiableOn
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

variable {n : ℕ}

namespace ContHolomorphicProof

private theorem line_differentiableOn (v w : Fin n) (hvw : v < w) (α β : Idx)
    (u : Fin n → Space) :
    DifferentiableOn ℂ (fun z : Fin n → ℂ => lineC α β (z w - z v) (u w - u v))
      (Hierarchy.orderedTube n) := by
  apply (lineC_differentiableOn α β (u w - u v)).comp
    ((differentiable_apply w).sub (differentiable_apply v)).differentiableOn
  intro z hz
  change 0 < (z w - z v).im
  rw [Complex.sub_im, sub_pos]
  exact hz hvw

private theorem differentiableOn_prod {ι : Type} (s : Finset ι)
    (f : ι → (Fin n → ℂ) → ℂ) (t : Set (Fin n → ℂ))
    (h : ∀ i ∈ s, DifferentiableOn ℂ (f i) t) :
    DifferentiableOn ℂ (fun z => ∏ i ∈ s, f i z) t := by
  intro z hz
  exact (HasFDerivWithinAt.finsetProd fun i hi => (h i hi z hz).hasFDerivWithinAt).differentiableWithinAt

end ContHolomorphicProof

theorem contL_differentiableOn' (P : Fin n → (Mon →₀ ℂ)) (u : Fin n → Space) :
    DifferentiableOn ℂ (fun z => contL P z u) (Hierarchy.orderedTube n) := by
  unfold contL wickL
  apply DifferentiableOn.fun_sum
  intro m hm
  apply (differentiableOn_const _).mul
  unfold wickSum
  apply DifferentiableOn.fun_sum
  intro σ hσ
  apply ContHolomorphicProof.differentiableOn_prod
  intro l hl
  by_cases hvw : l.1 < (σ.1 l).1
  · simp only [if_pos hvw, kernelC]
    exact ContHolomorphicProof.line_differentiableOn l.1 (σ.1 l).1 hvw
      l.idx (σ.1 l).idx u
  · simp only [if_neg hvw]
    exact differentiableOn_const _

end YangMills.FreeField.Consolidated.Continuation_ContLDifferentiableOn

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff
variable {n : ℕ}

/-- [EASY, 150 lines; depends on `lineC_differentiableOn`] **Analyticity** of the continuation in
the complex times on the ordered tube, for fixed spatial points.

Proof idea: `contL` is a finite sum of products of `lineC α β (z w - z v) (u w - u v)` with
`v < w`, so `0 < (z w - z v).im` on the tube. For `0 < z.im` the integral `lineC` converges
absolutely (`|Amono α p * Bmono β p| ≤ (1 + ‖p‖)^k` and `weight p ≤ p_t⁴` on the cone, against
`exp (-z.im p_t)` with `‖p‖ ≤ √2 p_t`), and is complex differentiable by
`hasDerivAt_integral_of_dominated_loc_of_deriv_le`. About 250 lines. -/
theorem contL_differentiableOn (P : Fin n → (Mon →₀ ℂ)) (u : Fin n → Space) :
    DifferentiableOn ℂ (fun z => contL P z u) (Hierarchy.orderedTube n) := by
  exact Consolidated.Continuation_ContLDifferentiableOn.contL_differentiableOn' P u

end YangMills.FreeField
