import FreeField.Analytic

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

theorem weight_le' (p : Spacetime) : weight p ≤ time p ^ 4 := by
  unfold weight
  split_ifs with hp
  · have hs : ‖spatial p‖ ≤ time p := hp
    have ht : 0 ≤ time p := (norm_nonneg _).trans hs
    have hm : 0 ≤ minkowskiSquare p := by
      unfold minkowskiSquare
      nlinarith [norm_nonneg (spatial p)]
    have hmle : minkowskiSquare p ≤ time p ^ 2 := by
      unfold minkowskiSquare
      nlinarith [sq_nonneg ‖spatial p‖]
    have hl : 1 ≤ Real.log (Real.exp 1 + minkowskiSquare p) := by
      rw [Real.le_log_iff_exp_le (by positivity)]
      linarith
    have hl2 : 1 ≤ Real.log (Real.exp 1 + minkowskiSquare p) ^ 2 := by
      nlinarith
    apply (div_le_iff₀ (by positivity :
      0 < Real.log (Real.exp 1 + minkowskiSquare p) ^ 2)).2
    calc
      minkowskiSquare p ^ 2 ≤ (time p ^ 2) ^ 2 := pow_le_pow_left₀ hm hmle 2
      _ = time p ^ 4 := by ring
      _ ≤ time p ^ 4 * Real.log (Real.exp 1 + minkowskiSquare p) ^ 2 :=
        le_mul_of_one_le_right (by positivity) hl2
  · positivity

end YangMills.FreeField
#print axioms YangMills.FreeField.weight_le'
