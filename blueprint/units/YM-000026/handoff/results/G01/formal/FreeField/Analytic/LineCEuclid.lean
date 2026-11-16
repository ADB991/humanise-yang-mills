import FreeField.Analytic.Base
import FreeField.Analytic.PartialDerivSIntegral


/-! Proofs consolidated from `FreeField/Work/lineC_euclid.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Analytic_LineCEuclid
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace

namespace LineEuclidWork

def coord (i : Fin 4) (p : Spacetime) : ℂ :=
  if i = timeAxis then -(p i : ℂ) else Complex.I * (p i : ℂ)

lemma Bmono_prod (α : Idx) (p : Spacetime) :
    Bmono α p = ∏ i : Fin 4, coord i p ^ α i := by
  rw [Fin.prod_univ_castSucc]
  simp only [coord, Fin.castSucc_ne_last, if_false, if_true, Bmono, time, timeAxis]

lemma Amono_prod (α : Idx) (p : Spacetime) :
    Amono α p = ∏ i : Fin 4, (-coord i p) ^ α i := by
  rw [Fin.prod_univ_castSucc]
  simp only [coord, Fin.castSucc_ne_last, if_false, if_true, neg_neg, Amono, time, timeAxis]

lemma Amono_signed (α : Idx) (p : Spacetime) :
    Amono α p = (-1) ^ idxOrder α * Bmono α p := by
  rw [Amono_prod, Bmono_prod]
  calc
    _ = ∏ i : Fin 4, (-1 : ℂ) ^ α i * coord i p ^ α i := by
      apply Finset.prod_congr rfl
      intro i _
      rw [← mul_pow, neg_one_mul]
    _ = _ := by rw [Finset.prod_mul_distrib, Finset.prod_pow_eq_pow_sum]; rfl

lemma Bmono_add (α β : Idx) (p : Spacetime) :
    Bmono (α + β) p = Bmono α p * Bmono β p := by
  simp only [Bmono_prod, Pi.add_apply, pow_add, Finset.prod_mul_distrib]

lemma euclidean_phase (ξ p : Spacetime) :
    Complex.I * (((time ξ : ℂ) * Complex.I) * (time p : ℂ) +
      ((⟪spatial ξ, spatial p⟫_ℝ : ℝ) : ℂ)) =
    -((time ξ * time p : ℝ) : ℂ) +
      Complex.I * ((⟪spatial ξ, spatial p⟫_ℝ : ℝ) : ℂ) := by
  push_cast
  ring_nf
  simp only [Complex.I_sq]
  ring

end LineEuclidWork

theorem lineC_euclid' (α β : Idx) {ξ : Spacetime} (hξ : 0 < time ξ) :
    lineC α β ((time ξ : ℂ) * Complex.I) (spatial ξ) = lineS α β ξ := by
  unfold lineC lineS
  rw [partialDeriv_S_integral (α + β) hξ, ← integral_const_mul]
  apply integral_congr_ae
  filter_upwards [] with p
  have hb : Amono α p * Bmono β p = (-1) ^ idxOrder α * Bmono (α + β) p := by
    rw [LineEuclidWork.Amono_signed, LineEuclidWork.Bmono_add]
    ring
  rw [LineEuclidWork.euclidean_phase, hb]
  unfold Bmono
  ring

end YangMills.FreeField.Consolidated.Analytic_LineCEuclid

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical ContDiff InnerProductSpace
variable {n : ℕ}

/-- [EASY, 80 lines] At a Euclidean point the continued line kernel is the Euclidean one:
`Amono α p * Bmono β p = (-1)^{|α|} ∏_{i<3} (i p_i)^{α_i+β_i} (-p_t)^{α_t+β_t}` and
`partialDeriv_S_integral`. Depends on `partialDeriv_S_integral`.
Sign check (`α = e_t`, `β = 0`, `spatial ξ = 0`): `lineC = ∫ p_t exp (-τ p_t) weight p > 0` and
`lineS = -∂_τ S > 0`. -/
theorem lineC_euclid (α β : Idx) {ξ : Spacetime} (hξ : 0 < time ξ) :
    lineC α β ((time ξ : ℂ) * Complex.I) (spatial ξ) = lineS α β ξ := by
  exact Consolidated.Analytic_LineCEuclid.lineC_euclid' α β hξ

end YangMills.FreeField
