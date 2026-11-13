import FreeField.Theory.Base
import FreeField.Analytic.MatchingIntegrable


/-! Proofs consolidated from `FreeField/Work/wightW_add_test.lean`. -/

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField.Consolidated.Theory_WightWAddTest
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

private theorem fourierE_integrand_integrable (f : TestFunction) (p : Spacetime) :
    Integrable (fun x : Spacetime =>
      f x * Complex.exp (Complex.I * ((⟪x, p⟫_ℝ : ℝ) : ℂ))) := by
  apply f.integrable.norm.mono'
  · apply Continuous.aestronglyMeasurable
    fun_prop
  · exact ae_of_all _ (fun x => by simp [Complex.norm_exp_I_mul_ofReal])

private theorem fourierE_add (f g : TestFunction) (p : Spacetime) :
    fourierE (f + g) p = fourierE f p + fourierE g p := by
  unfold fourierE
  simp only [add_apply, add_mul]
  exact integral_add (fourierE_integrand_integrable f p) (fourierE_integrand_integrable g p)

private theorem fourier_product_update {n : ℕ} (f : Fin n → TestFunction)
    (k : Fin n) (g : TestFunction) (p : Fin n → Spacetime) :
    (∏ i, fourierE (Function.update f k g i) (p i)) =
      fourierE g (p k) * ∏ i ∈ Finset.univ.erase k, fourierE (f i) (p i) := by
  rw [← Finset.mul_prod_erase Finset.univ _ (Finset.mem_univ k), Function.update_self]
  congr 1
  apply Finset.prod_congr rfl
  intro i hi
  rw [Function.update_of_ne (Finset.mem_erase.mp hi).1]

private theorem fourier_product_add {n : ℕ} (f : Fin n → TestFunction)
    (k : Fin n) (g h : TestFunction) (p : Fin n → Spacetime) :
    (∏ i, fourierE (Function.update f k (g + h) i) (p i)) =
      (∏ i, fourierE (Function.update f k g i) (p i)) +
      ∏ i, fourierE (Function.update f k h i) (p i) := by
  simp only [fourier_product_update, fourierE_add, add_mul]

private theorem wightmanMono_add_test {n : ℕ} (m : Fin n → Mon)
    (f : Fin n → TestFunction) (k : Fin n) (g h : TestFunction) :
    wightmanMono m (Function.update f k (g + h)) =
      wightmanMono m (Function.update f k g) +
      wightmanMono m (Function.update f k h) := by
  unfold wightmanMono
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro σ _
  rw [← integral_add (matching_integrable m σ (Function.update f k g))
    (matching_integrable m σ (Function.update f k h))]
  apply integral_congr_ae
  filter_upwards [] with q
  rw [fourier_product_add, mul_add]

private theorem wightmanL_add_test {n : ℕ} (P : Fin n → (Mon →₀ ℂ))
    (f : Fin n → TestFunction) (k : Fin n) (g h : TestFunction) :
    wightmanL P (Function.update f k (g + h)) =
      wightmanL P (Function.update f k g) + wightmanL P (Function.update f k h) := by
  unfold wightmanL
  simp only [wightmanMono_add_test, mul_add, Finset.sum_add_distrib]

private def splice {α : Type*} {m n : ℕ} (u : Fin m → α) (a : α) (v : Fin n → α) :
    Fin (m + (n + 1)) → α := Fin.append u (Fin.cons a v)

private theorem splice_update {α : Type*} {m n : ℕ} (u : Fin m → α) (a b : α)
    (v : Fin n → α) :
    Function.update (splice u a v) (Fin.natAdd m 0) b = splice u b v := by
  funext i
  refine Fin.addCases (fun j => ?_) (fun j => ?_) i
  · have hn : Fin.castAdd (n + 1) j ≠ Fin.natAdd m 0 := by
      intro h
      have := congrArg Fin.val h
      simp only [Fin.val_castAdd, Fin.val_natAdd, Fin.val_zero, Nat.add_zero] at this
      omega
    rw [Function.update_of_ne hn]
    simp [splice]
  · refine Fin.cases ?_ (fun j => ?_) j
    · simp [splice]
    · have hn : Fin.natAdd m j.succ ≠ Fin.natAdd m 0 := by
        simp [Fin.ext_iff]
      rw [Function.update_of_ne hn]
      simp [splice]

private theorem wightW_splice (u v : Word) (A : Mon →₀ ℂ) (f : TestFunction) :
    wightW (u ++ (A, f) :: v) =
      wightmanL (splice u.lab A v.lab) (splice u.test f v.test) := by
  have h : (fun i => (splice u.lab A v.lab i, splice u.test f v.test i)) =
      Fin.append u.get (Fin.cons (A, f) v.get) := by
    funext i
    refine Fin.addCases (fun j => ?_) (fun j => ?_) i
    · simp [splice, Word.lab, Word.test]
    · refine Fin.cases ?_ (fun j => ?_) j <;> simp [splice, Word.lab, Word.test]
  have hw : wightW (List.ofFn fun i => (splice u.lab A v.lab i, splice u.test f v.test i)) =
      wightmanL (splice u.lab A v.lab) (splice u.test f v.test) := by
    exact congrArg (fun s : Σ n, Fin n → ((Mon →₀ ℂ) × TestFunction) =>
      wightmanL (fun i => (s.2 i).1) (fun i => (s.2 i).2))
      (List.equivSigmaTuple.apply_symm_apply
        ⟨_, fun i => (splice u.lab A v.lab i, splice u.test f v.test i)⟩)
  rw [h, List.ofFn_fin_append, List.ofFn_cons, List.ofFn_get, List.ofFn_get] at hw
  exact hw

theorem wightW_add_test' (u v : Word) (A : Mon →₀ ℂ) (f f' : TestFunction) :
    wightW (u ++ (A, f + f') :: v) = wightW (u ++ (A, f) :: v) + wightW (u ++ (A, f') :: v) := by
  simp only [wightW_splice]
  simpa only [splice_update] using
    wightmanL_add_test (splice u.lab A v.lab) (splice u.test f v.test)
      (Fin.natAdd u.length 0) f f'

end YangMills.FreeField.Consolidated.Theory_WightWAddTest

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-- [MEDIUM, 150 lines] Additivity in each test: `fourierE` is additive and the matching
integrands are integrable. Depends on `matching_integrable`. -/
theorem wightW_add_test (u v : Word) (A : Mon →₀ ℂ) (f f' : TestFunction) :
    wightW (u ++ (A, f + f') :: v) = wightW (u ++ (A, f) :: v) + wightW (u ++ (A, f') :: v) := by
  exact Consolidated.Theory_WightWAddTest.wightW_add_test' u v A f f'

end YangMills.FreeField
