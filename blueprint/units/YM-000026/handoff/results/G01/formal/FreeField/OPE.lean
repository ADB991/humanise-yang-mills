import FreeField.OPE.GopeCoefficients
import FreeField.OPE.SplitCorrFderiv
import FreeField.OPE.GwickGroupedFactor
import FreeField.OPE.LineSKernelHyp
import FreeField.OPE.SplitCorrCollapse
import FreeField.OPE.GopeRemainder

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff
variable {I J : Type}

/-! ## The hierarchy -/

/-- **Operator product expansion.** The explicit coefficient family `gcoef lineS` satisfies both
clauses of `OperatorProductExpansion` for the hierarchy of every gauge group, Wightman theory and
trace scale. -/
theorem exists_ope_coefficient :
    ∃ coef : Coef, ∀ (g : GaugeGroup) (H : HilbertSpace) (th : WightmanTheory H labels)
      (lam : ℂ), (hier g H th coef lam).OperatorProductExpansion := by
  refine ⟨gcoef lineS, fun g H th lam => ?_⟩
  exact
    { coefficients := fun {I} _ a M η ε hM hη hε j i =>
        gope_coefficients lineS_kernelHyp a M η ε hM hη hε j i
      remainder := fun {I J} _ _ a b M η c ε hM hη hc hε D => by
        filter_upwards [gope_remainder lineS_kernelHyp a b M η c ε hM hη hc hε D]
          with r hr x o y hW hC s
        exact hr x o y hW hC }

end YangMills.FreeField
