import FreeField.Symmetry

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- The conjugate word: reverse, conjugate labels and tests. -/
def dagger (u : Word) : Word := u.reverse.map fun a => (adjL a.1, conjugateTest a.2)

end YangMills.FreeField
