import FreeField.Continuation.Base
import FreeField.Analytic.SContDiffOn


/-! Proofs consolidated from `FreeField/Work/corrL_contDiffOn.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Continuation_CorrLContDiffOn
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

variable {n : ℕ}

namespace CorrSmoothProof

private theorem line_contDiffOn (v w : Fin n) (hvw : v ≠ w) (α β : Idx) :
    ContDiffOn ℝ ∞ (fun x : Points n => lineS α β (x w - x v))
      (WilsonFamily.separated n : Set (Points n)) := by
  have hd : ContDiff ℝ ∞ (fun x : Points n => x w - x v) :=
    (PiLp.proj (𝕜 := ℝ) 2 (fun _ : Fin n => Spacetime) w).contDiff.sub
      (PiLp.proj (𝕜 := ℝ) 2 (fun _ : Fin n => Spacetime) v).contDiff
  have hm : MapsTo (fun x : Points n => x w - x v)
      (WilsonFamily.separated n : Set (Points n)) {(0 : Spacetime)}ᶜ := by
    intro x hx
    change x w - x v ≠ 0
    intro h
    exact hvw ((show Injective x.ofLp from hx) (sub_eq_zero.mp h)).symm
  exact contDiffOn_const.mul ((partialDeriv_S_contDiffOn (α + β)).comp hd.contDiffOn hm)

private theorem wick_contDiffOn (P : Fin n → (Mon →₀ ℂ)) :
    ContDiffOn ℝ ∞ (fun x : Points n => wickL (kernelS x.ofLp) P)
      (WilsonFamily.separated n : Set (Points n)) := by
  unfold wickL
  apply ContDiffOn.sum
  intro m hm
  apply contDiffOn_const.mul
  unfold wickSum
  apply ContDiffOn.sum
  intro σ hσ
  apply contDiffOn_prod
  intro l hl
  by_cases hvw : l.1 < (σ.1 l).1
  · simp only [if_pos hvw, kernelS]
    exact line_contDiffOn l.1 (σ.1 l).1 (ne_of_lt hvw) l.idx (σ.1 l).idx
  · simp only [if_neg hvw]
    exact contDiffOn_const

end CorrSmoothProof

theorem corrL_contDiffOn' (P : Fin n → (Mon →₀ ℂ)) :
    ContDiffOn ℝ ∞ (corrL P) (WilsonFamily.separated n : Set (Points n)) := by
  apply (CorrSmoothProof.wick_contDiffOn P).congr
  intro x hx
  exact if_pos hx

end YangMills.FreeField.Consolidated.Continuation_CorrLContDiffOn

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff
variable {n : ℕ}

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
  exact Consolidated.Continuation_CorrLContDiffOn.corrL_contDiffOn' P

end YangMills.FreeField
