import FreeField.Wick

/-!
# Free-field witness: shared analytic prerequisites

Statements used by modules A (Fock host), D (OPE) and E (continuation). Each is stated once here.
See `FreeField/DESIGN.md` section 4 and `FreeField/TASKS.md`. Difficulty tags: EASY / MEDIUM / HARD.

Conventions: `p = (𝐩, p_t)` with time last; all pairings Euclidean; `weight` is supported in the
closed forward cone `‖spatial p‖ ≤ time p`, where `0 ≤ weight p ≤ (time p)^4`.
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

/-- The one-particle measure `weight p dp` on momentum space. -/
def mu : Measure Spacetime := volume.withDensity fun p => ENNReal.ofReal (weight p)

/-! ## The weight -/

theorem weight_nonneg (p : Spacetime) : 0 ≤ weight p := by
  unfold weight
  split_ifs
  · positivity
  · exact le_rfl

/-- `weight` vanishes off the closed forward cone. -/
theorem weight_eq_zero {p : Spacetime} (hp : p ∉ forwardCone) : weight p = 0 := by
  unfold weight; rw [if_neg hp]

end YangMills.FreeField
