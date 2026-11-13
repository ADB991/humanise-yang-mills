import FreeField.Analytic.Base


/-! Proofs consolidated from `FreeField/Work/measurable_weight.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Analytic_MeasurableWeight
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

private theorem continuous_time_work : Continuous time := by
  unfold time
  fun_prop

private theorem continuous_spatial_work : Continuous spatial := by
  unfold spatial
  fun_prop

private theorem continuous_minkowskiSquare_work : Continuous minkowskiSquare := by
  exact (continuous_time_work.pow 2).sub (continuous_spatial_work.norm.pow 2)

theorem measurable_weight' : Measurable weight := by
  unfold weight
  apply Measurable.ite
  · exact (isClosed_le continuous_spatial_work.norm continuous_time_work).measurableSet
  · exact (continuous_minkowskiSquare_work.measurable.pow_const 2).div
      ((measurable_const.add continuous_minkowskiSquare_work.measurable).log.pow_const 2)
  · exact measurable_const

end YangMills.FreeField.Consolidated.Analytic_MeasurableWeight

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace
variable {n : ℕ}

/-- [EASY, 30 lines] `weight` is an `ite` over a closed set of continuous functions. -/
theorem measurable_weight : Measurable weight := by
  exact Consolidated.Analytic_MeasurableWeight.measurable_weight'

end YangMills.FreeField
