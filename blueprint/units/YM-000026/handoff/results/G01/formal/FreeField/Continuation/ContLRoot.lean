import FreeField.Continuation.Base
import FreeField.Analytic.LineCEuclid


/-! Proofs consolidated from `FreeField/Work/contL_root.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Continuation_ContLRoot
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff

variable {n : ℕ}

namespace ContRootProof

private theorem kernel_root (x : Points n) (h : StrictMono fun i => time (x i))
    (v w : Fin n) (hvw : v < w) (α β : Idx) :
    kernelC (Hierarchy.imaginaryTimes x) (Hierarchy.spatialPoints x) v w α β =
      kernelS x.ofLp v w α β := by
  have ht : time (x w - x v) = time (x w) - time (x v) := rfl
  have hs : spatial (x w - x v) = spatial (x w) - spatial (x v) := rfl
  have hd : 0 < time (x w - x v) := by
    rw [ht]
    exact sub_pos.mpr (h hvw)
  simpa only [kernelC, kernelS, Hierarchy.imaginaryTimes, Hierarchy.spatialPoints,
    ht, hs, Complex.ofReal_sub, sub_mul] using lineC_euclid α β hd

end ContRootProof
theorem contL_root' (P : Fin n → (Mon →₀ ℂ)) (x : Points n)
    (h : StrictMono fun i => time (x i)) :
    contL P (Hierarchy.imaginaryTimes x) (Hierarchy.spatialPoints x) = corrL P x := by
  have hx : x ∈ WilsonFamily.separated n := by
    intro v w hvw
    exact h.injective (congrArg time hvw)
  rw [corrL, if_pos hx]
  unfold contL wickL
  apply Finset.sum_congr rfl
  intro m hm
  congr 1
  unfold wickSum
  apply Finset.sum_congr rfl
  intro σ hσ
  apply Finset.prod_congr rfl
  intro l hl
  by_cases hvw : l.1 < (σ.1 l).1
  · simp only [if_pos hvw]
    exact ContRootProof.kernel_root x h l.1 (σ.1 l).1 hvw l.idx (σ.1 l).idx
  · simp only [if_neg hvw]

end YangMills.FreeField.Consolidated.Continuation_ContLRoot

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff
variable {n : ℕ}

/-- [EASY, 150 lines; depends on `lineC_euclid`] **Euclidean points**: at purely imaginary,
strictly increasing times the continuation is the Euclidean correlation (term by term, with
`ξ = x w - x v`, `time ξ > 0` for `v < w`).

Proof idea: such `x` is separated. For `v < w` put `τ = t_w - t_v > 0`, `u = 𝐱_w - 𝐱_v`. By (EI)
and differentiation under the integral,
`∂^γ S (u, τ) = ∫ ∏_{i<3} (i p_i)^{γ_i} (-p_t)^{γ_t} exp (-τ p_t + i ⟪u, 𝐩⟫) weight p dp`,
and `Amono α p * Bmono β p = (-1)^{|α|} ∏_{i<3} (i p_i)^{α_i+β_i} (-p_t)^{α_t+β_t}`. Hence
`lineC α β (i τ) u = lineS α β (x w - x v)`, and the Wick sums agree term by term.
(EI) is proved by analytic continuation in one variable from the real Lorentz boosts
(DESIGN.md (d)); about 500 lines in total. -/
theorem contL_root (P : Fin n → (Mon →₀ ℂ)) (x : Points n)
    (h : StrictMono fun i => time (x i)) :
    contL P (Hierarchy.imaginaryTimes x) (Hierarchy.spatialPoints x) = corrL P x := by
  exact Consolidated.Continuation_ContLRoot.contL_root' P x h

end YangMills.FreeField
