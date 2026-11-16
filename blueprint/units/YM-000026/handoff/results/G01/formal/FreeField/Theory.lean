import FreeField.Theory.FockOpApply
import FreeField.Theory.OpenAmpWEqZero
import FreeField.Theory.OpenAmpWMemLp
import FreeField.Theory.WightWAddTest
import FreeField.Theory.RhoLOne
import FreeField.Theory.DiagMeasureFinite
import FreeField.Theory.WightWOfFn
import FreeField.Theory.PoinOpTranslation
import FreeField.Theory.WightWLocal
import FreeField.Theory.PoinOpOne
import FreeField.Theory.PoinOpContinuous
import FreeField.Theory.ProjOpCone
import FreeField.Theory.PoinOpMul
import FreeField.Theory.ProjOpHasSum
import FreeField.Theory.PoinOpNorm
import FreeField.Theory.CharFunDiagMeasure
import FreeField.Theory.DiagMeasureApply
import FreeField.Theory.TransOpContinuous
import FreeField.Theory.PsiApply
import FreeField.Theory.CutIdentity
import FreeField.Theory.PsiFaithful
import FreeField.Theory.InnerPsi
import FreeField.Theory.TransOpInvariant
import FreeField.Theory.PsiCovariant

/-!
# Free-field witness, module A2: the Fock host is good

The data are defined in `FreeField.Fock` and `FreeField.Symmetry`. The imported layers
contain the proofs of the facts about them; this module assembles `exists_fockHost` and
`exists_wightmanTheory`. See `FreeField/CONSOLIDATION.md` for the dependency layout and the
three remaining unfinished statements, and `FreeField/DESIGN.md` section 5 for the construction.
-/
set_option autoImplicit false
noncomputable section
namespace YangMills.FreeField
open Function Filter Set MeasureTheory TopologicalSpace
open scoped Topology BigOperators Classical InnerProductSpace ENNReal

/-! ## B. Translations -/

/-- The translation action on the host. -/
def fockTranslations : TranslationAction fockSpace where
  operator := transOp
  identity := transOp_zero
  add := transOp_add
  unitary := transOp_norm
  stronglyContinuous := transOp_continuous

/-! ## C. The energy–momentum measure -/

/-- The energy–momentum measure of the host. -/
def fockEnergyMomentum : EnergyMomentumMeasure fockSpace where
  projection := projOp
  empty := projOp_empty
  univ := projOp_univ
  intersection := projOp_inter
  selfAdjoint := projOp_adjoint
  countablyAdditive := projOp_hasSum
  diagonal := diagMeasure
  finite := diagMeasure_finite
  diagonalIdentity := diagMeasure_apply

/-! ## D. Poincaré transformations -/

/-- The Poincaré action on the host and on labels. -/
def fockPoincare : PoincareAction fockSpace labels where
  Symmetry := Sym
  onStates := poinOp
  onLabels := fun g => LinearEquiv.ofBijective (rhoL g.lor) (rhoL_bijective g.lor)
  onTests := onTests
  pureTranslation := fun x => (((1 : ProperLorentz), x) : Sym)
  identity := poinOp_one
  composition := poinOp_mul
  unitary := poinOp_norm
  stronglyContinuous := poinOp_continuous
  coordinates := Homeomorph.refl (ProperLorentz × Spacetime)
  identityCoordinates := ⟨rfl, rfl⟩
  productCoordinates := fun _ _ => ⟨rfl, rfl⟩
  translationCoordinates := fun _ => ⟨rfl, rfl⟩
  pullback := fun _ _ _ => rfl
  translationZero := rfl
  translationAdd := fun x y =>
    Prod.ext (Subtype.ext (one_mul (1 : (Spacetime →L[ℝ] Spacetime)ˣ)).symm) (add_comm x y)

/-! ## F. Assembly -/

/-- The Fock host of the generalized free field. -/
def fockHost : Host labels where
  K := fockSpace
  Ψ := Psi
  adj := adjL
  translations := fockTranslations
  energyMomentum := fockEnergyMomentum
  poincare := fockPoincare

theorem fockHost_good : fockHost.Good where
  compat := poinOp_translation
  vacuum_norm := Psi_nil_norm
  add_label := Psi_add_label
  smul_label := Psi_smul_label
  add_test := Psi_add_test
  smul_test := Psi_smul_test
  adjoint := Psi_adjoint
  tempered := Psi_tempered
  locality := Psi_local
  covariant := Psi_covariant
  label_one := fun A => by
    show rhoL 1 A = A
    rw [rhoL_one]; rfl
  label_mul := fun s t A => by
    show rhoL (s.lor * t.lor) A = rhoL s.lor (rhoL t.lor A)
    rw [rhoL_mul]; rfl
  spectral := charFun_diagMeasure
  positive := projOp_cone
  unique := transOp_invariant

/-- **The Fock host.** A good host over the Wick labels whose vacuum expectations are the
explicit Wightman functions `wightmanL`, and in which every non-zero label moves a word vector. -/
theorem exists_fockHost :
    ∃ h : Host labels, h.Good ∧
      (∀ (n : ℕ) (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction),
        inner ℂ (h.Ψ []) (h.Ψ (List.ofFn fun i => (P i, f i))) = wightmanL P f) ∧
      (∀ A : Mon →₀ ℂ, A ≠ 0 → ∃ f u, h.Ψ ((A, f) :: u) ≠ 0) := by
  refine ⟨fockHost, fockHost_good, fun n P f => ?_, fun A hA => ?_⟩
  · show inner ℂ (Psi []) (Psi (List.ofFn fun i => (P i, f i))) = wightmanL P f
    rw [inner_Psi]
    show wightW (List.ofFn fun i => (P i, f i)) = _
    exact wightW_ofFn P f
  · obtain ⟨f, hf⟩ := Psi_faithful A hA
    exact ⟨f, [], hf⟩

/-- The Wightman theory of the Wick monomials of the generalized free field: W0–W3, faithful
labels, and the explicit vacuum expectations. -/
theorem exists_wightmanTheory :
    ∃ (H : HilbertSpace) (th : WightmanTheory H labels), th.Axioms ∧ th.fields.Faithful ∧
      ∀ (n : ℕ) (P : Fin n → (Mon →₀ ℂ)) (f : Fin n → TestFunction),
        th.fields.vacuumExpectation P f = wightmanL P f := by
  obtain ⟨h, hg, hvev, hfaith⟩ := exists_fockHost
  obtain ⟨H, th, hax, hv, hf⟩ := h.reconstruct hg
  exact ⟨H, th, hax, hf hfaith, fun n P f => (hv n P f).trans (hvev n P f)⟩

end YangMills.FreeField
