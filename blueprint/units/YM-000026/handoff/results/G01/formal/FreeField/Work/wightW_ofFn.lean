import FreeField.Theory
import Mathlib.LinearAlgebra.Multilinear.Finsupp

set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

theorem wightW_ofFn' {n : ℕ} (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction) :
    wightW (List.ofFn fun i => (P i, f i)) = wightmanL P f := by
  exact congrArg (fun s : Σ n, Fin n → ((Mon →₀ ℂ) × TestFunction) =>
    wightmanL (fun i => (s.2 i).1) (fun i => (s.2 i).2))
    (List.equivSigmaTuple.apply_symm_apply ⟨n, fun i => (P i, f i)⟩)

private def labelExtension {n : ℕ} (K : (Fin n → Mon) → ℂ) :
    MultilinearMap ℂ (fun _ : Fin n => Mon →₀ ℂ) ℂ :=
  (MultilinearMap.fromDFinsuppEquiv (R := ℂ) (κ := fun _ : Fin n => Mon)
    (fun m => MultilinearMap.mkPiRing ℂ (Fin n) (K m))).compLinearMap
    (fun _ => (finsuppLequivDFinsupp ℂ).toLinearMap)

private theorem labelExtension_apply {n : ℕ} (K : (Fin n → Mon) → ℂ)
    (P : Fin n → (Mon →₀ ℂ)) :
    labelExtension K P =
      ∑ m ∈ Fintype.piFinset (fun i => (P i).support), (∏ i, P i (m i)) * K m := by
  simp [labelExtension, MultilinearMap.fromDFinsuppEquiv_apply,
    toDFinsupp_support, MultilinearMap.mkPiRing_apply]

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
  have hw := wightW_ofFn' (splice u.lab A v.lab) (splice u.test f v.test)
  rw [h, List.ofFn_fin_append, List.ofFn_cons, List.ofFn_get, List.ofFn_get] at hw
  exact hw

private theorem wightmanL_eq_extension {n : ℕ} (P : Fin n → (Mon →₀ ℂ))
    (f : Fin n → TestFunction) :
    wightmanL P f = labelExtension (fun m => wightmanMono m f) P :=
  (labelExtension_apply _ _).symm

theorem wightW_add_label' (u v : Word) (A A' : Mon →₀ ℂ) (f : TestFunction) :
    wightW (u ++ (A + A', f) :: v) = wightW (u ++ (A, f) :: v) + wightW (u ++ (A', f) :: v) := by
  simp only [wightW_splice, wightmanL_eq_extension]
  simpa only [splice_update] using
    (labelExtension (fun m => wightmanMono m (splice u.test f v.test))).map_update_add
      (splice u.lab A v.lab) (Fin.natAdd u.length 0) A A'

theorem wightW_smul_label' (u v : Word) (c : ℂ) (A : Mon →₀ ℂ) (f : TestFunction) :
    wightW (u ++ (c • A, f) :: v) = c * wightW (u ++ (A, f) :: v) := by
  simp only [wightW_splice, wightmanL_eq_extension]
  simpa only [splice_update, smul_eq_mul] using
    (labelExtension (fun m => wightmanMono m (splice u.test f v.test))).map_update_smul
      (splice u.lab A v.lab) (Fin.natAdd u.length 0) c A

private theorem fourierE_smul (c : ℂ) (f : TestFunction) (p : Spacetime) :
    fourierE (c • f) p = c * fourierE f p := by
  simp [fourierE, smul_eq_mul, mul_assoc, integral_const_mul]

private theorem fourier_product_smul {n : ℕ} (f : Fin n → TestFunction)
    (k : Fin n) (c : ℂ) (g : TestFunction) (p : Fin n → Spacetime) :
    (∏ i, fourierE (Function.update f k (c • g) i) (p i)) =
      c * ∏ i, fourierE (Function.update f k g i) (p i) := by
  rw [← Finset.mul_prod_erase Finset.univ _ (Finset.mem_univ k),
    ← Finset.mul_prod_erase Finset.univ (fun i => fourierE (Function.update f k g i) (p i))
      (Finset.mem_univ k)]
  simp only [Function.update_self, fourierE_smul, mul_assoc]
  congr 2
  apply Finset.prod_congr rfl
  intro i hi
  have hik := (Finset.mem_erase.mp hi).1
  rw [Function.update_of_ne hik, Function.update_of_ne hik]

private theorem wightmanMono_smul_test {n : ℕ} (m : Fin n → Mon)
    (f : Fin n → TestFunction) (k : Fin n) (c : ℂ) (g : TestFunction) :
    wightmanMono m (Function.update f k (c • g)) =
      c * wightmanMono m (Function.update f k g) := by
  unfold wightmanMono
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro σ _
  rw [← integral_const_mul]
  apply integral_congr_ae
  filter_upwards [] with q
  rw [fourier_product_smul]
  ring

private theorem wightmanL_smul_test {n : ℕ} (P : Fin n → (Mon →₀ ℂ))
    (f : Fin n → TestFunction) (k : Fin n) (c : ℂ) (g : TestFunction) :
    wightmanL P (Function.update f k (c • g)) =
      c * wightmanL P (Function.update f k g) := by
  unfold wightmanL
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro m _
  rw [wightmanMono_smul_test]
  ring

theorem wightW_smul_test' (u v : Word) (c : ℂ) (A : Mon →₀ ℂ) (f : TestFunction) :
    wightW (u ++ (A, c • f) :: v) = c * wightW (u ++ (A, f) :: v) := by
  simp only [wightW_splice]
  simpa only [splice_update] using
    wightmanL_smul_test (splice u.lab A v.lab) (splice u.test f v.test)
      (Fin.natAdd u.length 0) c f


end YangMills.FreeField

#print axioms YangMills.FreeField.wightW_ofFn'
#print axioms YangMills.FreeField.wightW_add_label'
#print axioms YangMills.FreeField.wightW_smul_label'
#print axioms YangMills.FreeField.wightW_smul_test'
