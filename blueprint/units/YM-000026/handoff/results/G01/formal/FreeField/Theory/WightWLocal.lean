import FreeField.Theory.Base
import FreeField.Analytic.SrEuclid
import FreeField.Analytic.MatchingIntegrable

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [HARD, 2000 lines] **Locality of the Wightman functions.** Exchanging two adjacent letters
with spacelike separated tests changes only the lines between the two vertices, which reverse.
For a matching with `c` such lines the two integrals differ by replacing
`∫ ∏ dμ(q_e) (leg factors) F̂(K - ∑ q_e) Ĝ(K' + ∑ q_e)` by the same with `q_e ↦ -q_e` in the
exponentials; in position space this is `∏_e W_e (y - x)` against `∏_e W_e (x - y)`, where each
`W_e` is a derivative of the boundary value of `F(ζ) = ∫ exp (i ⟪ζ, p⟫) dμ`. For spacelike
`ξ = a e₁` (after a rotation), `F` is constant `= Sr a` along the points
`(a cos θ, 0, 0, i a sin θ)`, `0 < θ < π`, of the tube (by `Sr_euclid`), so the boundary values at
`ξ` and `-ξ` agree, locally uniformly; first for compactly supported tests (the support of
`f ⊗ g` is then a compact subset of the open spacelike region), then for all tests by cut-offs
`f χ_R → f` in the Schwartz topology and `wightmanL_continuous`.
Depends on `Sr_euclid`, `partialDeriv_S_integral`, `matching_integrable`, `wightmanL_continuous`. -/
theorem wightW_local (u v : Word) (A B : Mon →₀ ℂ) (f g : TestFunction)
    (h : FieldSystem.SpacelikeSeparated f g) :
    wightW (u ++ (A, f) :: (B, g) :: v) = wightW (u ++ (B, g) :: (A, f) :: v) := by
  sorry

end YangMills.FreeField
