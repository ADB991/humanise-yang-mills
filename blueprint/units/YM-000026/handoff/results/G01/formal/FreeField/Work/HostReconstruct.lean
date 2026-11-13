import FreeField.Reconstruction

set_option autoImplicit false
set_option backward.isDefEq.respectTransparency false
noncomputable section

namespace YangMills.FreeField
open MeasureTheory
open scoped InnerProductSpace Topology Classical

namespace Host.Reconstruction

variable {Lab : FieldLabels} (h : Host Lab)

abbrev Word := List (Lab.carrier × TestFunction)

def span : Submodule ℂ h.K.carrier := Submodule.span ℂ (Set.range h.Ψ)

def space : HilbertSpace := ⟨(span h).topologicalClosure⟩

def word (w : Word (Lab := Lab)) : (space h).carrier :=
  ⟨h.Ψ w, (span h).le_topologicalClosure (Submodule.subset_span ⟨w, rfl⟩)⟩

def domain : Submodule ℂ (space h).carrier := Submodule.span ℂ (Set.range (word h))

def vector (w : Word (Lab := Lab)) : domain h :=
  ⟨word h w, Submodule.subset_span ⟨w, rfl⟩⟩

theorem domain_induction {p : domain h → Prop}
    (hw : ∀ w, p (vector h w)) (hz : p 0)
    (ha : ∀ x y, p x → p y → p (x + y))
    (hs : ∀ (c : ℂ) x, p x → p (c • x)) (x : domain h) : p x := by
  obtain ⟨x, hx⟩ := x
  induction hx using Submodule.span_induction with
  | mem x hx => obtain ⟨w, rfl⟩ := hx; exact hw w
  | zero => exact hz
  | add x y hx hy ihx ihy => exact ha ⟨x, hx⟩ ⟨y, hy⟩ ihx ihy
  | smul c x hx ih => exact hs c ⟨x, hx⟩ ih

theorem inner_ext (x y : domain h)
    (he : ∀ w, inner ℂ x.1 (word h w) = inner ℂ y.1 (word h w)) : x = y := by
  have he' : ∀ z : domain h, inner ℂ x.1 z.1 = inner ℂ y.1 z.1 := by
    intro z
    induction z using domain_induction h with
    | hw w => exact he w
    | hz => simp
    | ha a b ha hb => simpa only [Submodule.coe_add, inner_add_right] using congrArg₂ (· + ·) ha hb
    | hs c a ha => simpa only [Submodule.coe_smul, inner_smul_right] using congrArg (c * ·) ha
  apply Subtype.ext
  apply sub_eq_zero.mp
  apply (inner_self_eq_zero (𝕜 := ℂ)).mp
  simpa only [Submodule.coe_sub, inner_sub_left, sub_eq_zero] using he' (x - y)

variable (hg : h.Good)

include hg in
theorem exists_prepend (A : Lab.carrier) (f : TestFunction) (x : domain h) :
    ∃ y : domain h, ∀ w, inner ℂ y.1 (word h w) =
      inner ℂ x.1 (word h ((h.adj A, conjugateTest f) :: w)) := by
  induction x using domain_induction h with
  | hw u => exact ⟨vector h ((A, f) :: u), hg.adjoint A f u⟩
  | hz => exact ⟨0, by simp⟩
  | ha x y hx hy =>
    obtain ⟨x', hx'⟩ := hx
    obtain ⟨y', hy'⟩ := hy
    exact ⟨x' + y', by intro w; simp only [Submodule.coe_add, inner_add_left, hx', hy']⟩
  | hs c x hx =>
    obtain ⟨y, hy⟩ := hx
    exact ⟨c • y, by intro w; simp only [Submodule.coe_smul, inner_smul_left, hy]⟩

def prependFun (A : Lab.carrier) (f : TestFunction) (x : domain h) : domain h :=
  (exists_prepend h hg A f x).choose

theorem prependFun_inner (A : Lab.carrier) (f : TestFunction) (x : domain h) (w : Word) :
    inner ℂ (prependFun h hg A f x).1 (word h w) =
      inner ℂ x.1 (word h ((h.adj A, conjugateTest f) :: w)) :=
  (exists_prepend h hg A f x).choose_spec w

def prepend (A : Lab.carrier) (f : TestFunction) : domain h →ₗ[ℂ] domain h where
  toFun := prependFun h hg A f
  map_add' x y := by
    apply inner_ext h
    intro w
    simp only [Submodule.coe_add, inner_add_left, prependFun_inner]
  map_smul' c x := by
    apply inner_ext h
    intro w
    simp only [RingHom.id_apply, Submodule.coe_smul, inner_smul_left, prependFun_inner]

theorem prepend_inner (A : Lab.carrier) (f : TestFunction) (x : domain h) (w : Word) :
    inner ℂ (prepend h hg A f x).1 (word h w) =
      inner ℂ x.1 (word h ((h.adj A, conjugateTest f) :: w)) :=
  prependFun_inner h hg A f x w

@[simp] theorem prepend_vector (A : Lab.carrier) (f : TestFunction) (w : Word) :
    prepend h hg A f (vector h w) = vector h ((A, f) :: w) := by
  apply inner_ext h
  intro v
  rw [prepend_inner]
  exact (hg.adjoint A f w v).symm

theorem map_ext {E : Type*} [AddCommGroup E] [Module ℂ E]
    (L M : domain h →ₗ[ℂ] E) (hw : ∀ w, L (vector h w) = M (vector h w)) : L = M := by
  ext x
  induction x using domain_induction h with
  | hw w => exact hw w
  | hz => simp
  | ha x y hx hy => simp [hx, hy]
  | hs c x hx => simp [hx]

def fields : FieldSystem (space h) Lab where
  domain := domain h
  vacuum := vector h []
  field :=
    { toFun := fun A =>
        { toFun := prepend h hg A
          map_add' := fun f g => by
            apply map_ext h
            intro w
            change prepend h hg A (f + g) (vector h w) =
              prepend h hg A f (vector h w) + prepend h hg A g (vector h w)
            simp only [prepend_vector]
            apply Subtype.ext; apply Subtype.ext
            exact hg.add_test A f g w
          map_smul' := fun c f => by
            apply map_ext h
            intro w
            change prepend h hg A (c • f) (vector h w) = c • prepend h hg A f (vector h w)
            simp only [prepend_vector]
            apply Subtype.ext; apply Subtype.ext
            exact hg.smul_test c A f w }
      map_add' := fun A B => by
        apply LinearMap.ext
        intro f
        apply map_ext h
        intro w
        change prepend h hg (A + B) f (vector h w) =
          prepend h hg A f (vector h w) + prepend h hg B f (vector h w)
        simp only [prepend_vector]
        apply Subtype.ext; apply Subtype.ext
        exact hg.add_label A B f w
      map_smul' := fun c A => by
        apply LinearMap.ext
        intro f
        apply map_ext h
        intro w
        change prepend h hg (c • A) f (vector h w) = c • prepend h hg A f (vector h w)
        simp only [prepend_vector]
        apply Subtype.ext; apply Subtype.ext
        exact hg.smul_label c A f w }

@[simp] theorem fields_vector (w : Word) : (fields h hg).vector w = vector h w := by
  induction w with
  | nil => rfl
  | cons a w ih =>
    rw [FieldSystem.vector, ih]
    exact prepend_vector h hg a.1 a.2 w

theorem domain_map : (domain h).map (span h).topologicalClosure.subtype = span h := by
  apply le_antisymm
  · rintro _ ⟨x, hx, rfl⟩
    induction hx using Submodule.span_induction with
    | mem x hx =>
      obtain ⟨w, rfl⟩ := hx
      exact Submodule.subset_span ⟨w, rfl⟩
    | zero => exact (span h).zero_mem
    | add x y hx hy ihx ihy => exact (span h).add_mem ihx ihy
    | smul c x hx ih => exact (span h).smul_mem c ih
  · apply Submodule.span_le.mpr
    rintro _ ⟨w, rfl⟩
    exact ⟨word h w, (vector h w).property, rfl⟩

theorem dense_domain : Dense (domain h : Set (space h).carrier) := by
  apply (@Subtype.dense_iff h.K.carrier _
    ((span h).topologicalClosure : Set h.K.carrier)
    (domain h : Set (space h).carrier)).mpr
  have hm := congrArg (fun p : Submodule ℂ h.K.carrier => (p : Set h.K.carrier))
    (domain_map h)
  rw [Submodule.map_coe] at hm
  change closure (span h : Set h.K.carrier) ⊆
    closure ((span h).topologicalClosure.subtype '' (domain h : Set (space h).carrier))
  exact (congrArg closure hm).symm.le

theorem tempered (A : Lab.carrier) (x : domain h) :
    Continuous fun f => (prepend h hg A f x).1 := by
  induction x using domain_induction h with
  | hw w =>
    simp only [prepend_vector]
    exact (hg.tempered A w).subtype_mk _
  | hz => simpa only [map_zero, Submodule.coe_zero] using
      (continuous_const : Continuous fun _ : TestFunction => (0 : (space h).carrier))
  | ha x y hx hy => simp only [map_add, Submodule.coe_add]; exact hx.add hy
  | hs c x hx => simp only [map_smul, Submodule.coe_smul]; exact hx.const_smul c

theorem domain_axioms : (fields h hg).DomainAxioms where
  normalizedVacuum := hg.vacuum_norm
  denseDomain := dense_domain h
  cyclicVacuum := by simp only [fields_vector]; rfl
  tempered := tempered h hg

theorem adjoint : (fields h hg).AdjointAxiom h.adj := by
  intro A f x y
  change inner ℂ (prepend h hg A f x).1 y.1 =
    inner ℂ x.1 (prepend h hg (h.adj A) (conjugateTest f) y).1
  induction y using domain_induction h with
  | hw w => simp only [prepend_vector]; exact prepend_inner h hg A f x w
  | hz => simp
  | ha y z hy hz => simp only [map_add, Submodule.coe_add, inner_add_right, hy, hz]
  | hs c y hy => simp only [map_smul, Submodule.coe_smul, inner_smul_right, hy]

theorem locality : (fields h hg).LocalCommutativity := by
  intro A B f g hfg x
  have he : (prepend h hg A f).comp (prepend h hg B g) =
      (prepend h hg B g).comp (prepend h hg A f) := by
    apply map_ext h
    intro w
    simp only [LinearMap.comp_apply, prepend_vector]
    apply Subtype.ext; apply Subtype.ext
    exact hg.locality A B f g w hfg
  exact LinearMap.congr_fun he x

include hg in
 theorem poincare_span (s : h.poincare.Symmetry) :
    Set.MapsTo (h.poincare.onStates s) (span h) (span h) := by
  intro x hx
  induction hx using Submodule.span_induction with
  | mem x hx =>
    obtain ⟨w, rfl⟩ := hx
    rw [hg.covariant]
    exact Submodule.subset_span ⟨_, rfl⟩
  | zero => simp only [map_zero]; exact (span h).zero_mem
  | add x y hx hy ihx ihy => simp only [map_add]; exact (span h).add_mem ihx ihy
  | smul c x hx ih => simp only [map_smul]; exact (span h).smul_mem c ih

include hg in
theorem poincare_closed (s : h.poincare.Symmetry) :
    Set.MapsTo (h.poincare.onStates s) (span h).topologicalClosure
      (span h).topologicalClosure :=
  (poincare_span h hg s).closure (h.poincare.onStates s).continuous

def poincareOp (s : h.poincare.Symmetry) : (space h).Operator :=
  (h.poincare.onStates s).restrict (poincare_closed h hg s)

@[simp] theorem poincareOp_coe (s : h.poincare.Symmetry) (x : (space h).carrier) :
    (poincareOp h hg s x).1 = h.poincare.onStates s x.1 := rfl

@[simp] theorem poincareOp_word (s : h.poincare.Symmetry) (w : Word) :
    poincareOp h hg s (word h w) =
      word h (w.map fun a => (h.poincare.onLabels s a.1, h.poincare.onTests s a.2)) := by
  apply Subtype.ext
  exact hg.covariant s w

def poincare : PoincareAction (space h) Lab where
  Symmetry := h.poincare.Symmetry
  onStates := poincareOp h hg
  onLabels := h.poincare.onLabels
  onTests := h.poincare.onTests
  pureTranslation := h.poincare.pureTranslation
  identity := by
    ext x
    apply Subtype.ext
    exact DFunLike.congr_fun h.poincare.identity x.1
  composition s t := by
    ext x
    apply Subtype.ext
    exact DFunLike.congr_fun (h.poincare.composition s t) x.1
  unitary s x := h.poincare.unitary s x.1
  stronglyContinuous x := (h.poincare.stronglyContinuous x.1).subtype_mk _
  coordinates := h.poincare.coordinates
  identityCoordinates := h.poincare.identityCoordinates
  productCoordinates := h.poincare.productCoordinates
  translationCoordinates := h.poincare.translationCoordinates
  pullback := h.poincare.pullback
  translationZero := h.poincare.translationZero
  translationAdd := h.poincare.translationAdd

include hg in
 theorem translation_closed (a : Spacetime) :
    Set.MapsTo (h.translations.operator a) (span h).topologicalClosure
      (span h).topologicalClosure := by
  rw [← hg.compat]
  exact poincare_closed h hg _

def translationOp (a : Spacetime) : (space h).Operator :=
  (h.translations.operator a).restrict (translation_closed h hg a)

@[simp] theorem translationOp_coe (a : Spacetime) (x : (space h).carrier) :
    (translationOp h hg a x).1 = h.translations.operator a x.1 := rfl

def translations : TranslationAction (space h) where
  operator := translationOp h hg
  identity := by
    ext x
    apply Subtype.ext
    exact DFunLike.congr_fun h.translations.identity x.1
  add a b := by
    ext x
    apply Subtype.ext
    exact DFunLike.congr_fun (h.translations.add a b) x.1
  unitary a x := h.translations.unitary a x.1
  stronglyContinuous x := (h.translations.stronglyContinuous x.1).subtype_mk _

theorem translation_inverse (a : Spacetime) (x : h.K.carrier) :
    h.translations.operator a (h.translations.operator (-a) x) = x := by
  rw [← ContinuousLinearMap.comp_apply, h.translations.add, add_neg_cancel,
    h.translations.identity, ContinuousLinearMap.id_apply]

theorem translation_inner (a : Spacetime) (x y : h.K.carrier) :
    inner ℂ x (h.translations.operator a y) =
      inner ℂ (h.translations.operator (-a) x) y := by
  have he := (LinearMap.norm_map_iff_inner_map_map (𝕜 := ℂ)
    (h.translations.operator a)).mp (h.translations.unitary a)
    (h.translations.operator (-a) x) y
  rwa [translation_inverse] at he

include hg in
 theorem translation_cross {u v : h.K.carrier}
    (hu : u ∈ (span h).topologicalClosureᗮ) (hv : v ∈ (span h).topologicalClosure)
    (a : Spacetime) :
    inner ℂ u (h.translations.operator a v) = 0 ∧
      inner ℂ v (h.translations.operator a u) = 0 := by
  constructor
  · exact Submodule.inner_left_of_mem_orthogonal (translation_closed h hg a hv) hu
  · rw [translation_inner]
    exact Submodule.inner_right_of_mem_orthogonal (translation_closed h hg (-a) hv) hu

include hg in
 theorem diagonal_add_eq_sub {u v : h.K.carrier}
    (hu : u ∈ (span h).topologicalClosureᗮ) (hv : v ∈ (span h).topologicalClosure)
    (c : ℂ) :
    h.energyMomentum.diagonal (u + c • v) = h.energyMomentum.diagonal (u - c • v) := by
  apply Measure.ext_of_charFun
  funext a
  rw [hg.spectral, hg.spectral]
  obtain ⟨huv, hvu⟩ := translation_cross h hg hu hv a
  simp only [map_add, map_sub, map_smul, inner_add_left, inner_add_right,
    inner_sub_left, inner_sub_right, inner_smul_left, inner_smul_right, huv, hvu,
    mul_zero, add_zero, zero_add, sub_zero, zero_sub]
  ring

include hg in
 theorem projection_cross {u v : h.K.carrier}
    (hu : u ∈ (span h).topologicalClosureᗮ) (hv : v ∈ (span h).topologicalClosure)
    {B : Set Spacetime} (hB : MeasurableSet B) :
    inner ℂ u (h.energyMomentum.projection B v) = 0 := by
  have he (c : ℂ) :
      inner ℂ (u + c • v) (h.energyMomentum.projection B (u + c • v)) =
        inner ℂ (u - c • v) (h.energyMomentum.projection B (u - c • v)) := by
    rw [← h.energyMomentum.diagonalIdentity hB, ← h.energyMomentum.diagonalIdentity hB,
      diagonal_add_eq_sub h hg hu hv c]
  have h1 := he 1
  have hi := he Complex.I
  simp only [one_smul, map_add, map_sub, inner_add_left, inner_add_right,
    inner_sub_left, inner_sub_right] at h1
  simp only [map_add, map_sub, map_smul, inner_add_left, inner_add_right,
    inner_sub_left, inner_sub_right, inner_smul_left, inner_smul_right,
    Complex.conj_I] at hi
  linear_combination (norm := ring_nf) (h1 - Complex.I * hi) / 4
  simp [Complex.I_sq]

include hg in
 theorem projection_closed {B : Set Spacetime} (hB : MeasurableSet B) :
    Set.MapsTo (h.energyMomentum.projection B) (span h).topologicalClosure
      (span h).topologicalClosure := by
  intro v hv
  rw [← (span h).topologicalClosure.orthogonal_orthogonal]
  apply (Submodule.mem_orthogonal _ _).mpr
  intro u hu
  exact projection_cross h hg hu hv hB

def projectionOp (B : Set Spacetime) : (space h).Operator :=
  if hB : MeasurableSet B then
    (h.energyMomentum.projection B).restrict (projection_closed h hg hB)
  else 0

@[simp] theorem projectionOp_coe {B : Set Spacetime} (hB : MeasurableSet B)
    (x : (space h).carrier) :
    (projectionOp h hg B x).1 = h.energyMomentum.projection B x.1 := by
  simp only [projectionOp, dif_pos hB]
  rfl

def energyMomentum : EnergyMomentumMeasure (space h) where
  projection := projectionOp h hg
  empty := by
    ext x
    apply Subtype.ext
    rw [projectionOp_coe h hg MeasurableSet.empty, h.energyMomentum.empty]
    rfl
  univ := by
    ext x
    apply Subtype.ext
    rw [projectionOp_coe h hg MeasurableSet.univ, h.energyMomentum.univ]
    rfl
  intersection {B C} hB hC := by
    ext x
    apply Subtype.ext
    change (projectionOp h hg B (projectionOp h hg C x)).1 =
      (projectionOp h hg (B ∩ C) x).1
    rw [projectionOp_coe h hg hB, projectionOp_coe h hg hC,
      projectionOp_coe h hg (hB.inter hC)]
    exact DFunLike.congr_fun (h.energyMomentum.intersection hB hC) x.1
  selfAdjoint {B} hB := by
    apply Eq.symm
    apply (ContinuousLinearMap.eq_adjoint_iff _ _).mpr
    intro x y
    change inner ℂ (projectionOp h hg B x).1 y.1 =
      inner ℂ x.1 (projectionOp h hg B y).1
    rw [projectionOp_coe h hg hB, projectionOp_coe h hg hB]
    rw [← h.energyMomentum.selfAdjoint hB, ContinuousLinearMap.adjoint_inner_left]
    rw [h.energyMomentum.selfAdjoint hB]
  countablyAdditive B hB hd x := by
    apply (Topology.IsInducing.hasSum_iff
      (g := (span h).topologicalClosure.subtypeL)
      Topology.IsEmbedding.subtypeVal.isInducing _ _).mp
    change HasSum (fun i => (projectionOp h hg (B i) x).1)
      (projectionOp h hg (⋃ i, B i) x).1
    simpa only [projectionOp_coe h hg (hB _),
      projectionOp_coe h hg (MeasurableSet.iUnion hB)] using
      h.energyMomentum.countablyAdditive B hB hd x.1
  diagonal x := h.energyMomentum.diagonal x.1
  finite x := h.energyMomentum.finite x.1
  diagonalIdentity {B} hB x := by
    change _ = inner ℂ x.1 (projectionOp h hg B x).1
    rw [projectionOp_coe h hg hB]
    exact h.energyMomentum.diagonalIdentity hB x.1

def theory : WightmanTheory (space h) Lab where
  fields := fields h hg
  adjointLabel := h.adj
  translations := translations h hg
  energyMomentum := energyMomentum h hg
  poincare := poincare h hg
  translationCompatibility a := by
    ext x
    apply Subtype.ext
    exact DFunLike.congr_fun (hg.compat a) x.1

theorem w0 : (theory h hg).W0 where
  spectralRepresentation x a := hg.spectral x.1 a
  positiveEnergy := by
    change projectionOp h hg forwardConeᶜ = 0
    by_cases hB : MeasurableSet forwardConeᶜ
    · ext x
      apply Subtype.ext
      rw [projectionOp_coe h hg hB, hg.positive]
      rfl
    · simp only [projectionOp, dif_neg hB]
  uniqueVacuum x hx := by
    obtain ⟨c, hc⟩ := hg.unique x.1 (fun a => congrArg Subtype.val (hx a))
    refine ⟨c, ?_⟩
    apply Subtype.ext
    exact hc

theorem w1 : (theory h hg).W1 := ⟨domain_axioms h hg, adjoint h hg⟩

theorem w3 : (theory h hg).W3 := ⟨locality h hg⟩

theorem poincare_domain (s : h.poincare.Symmetry) :
    Set.MapsTo (poincareOp h hg s) (domain h) (domain h) := by
  intro x hx
  induction hx using Submodule.span_induction with
  | mem x hx =>
    obtain ⟨w, rfl⟩ := hx
    rw [poincareOp_word]
    exact Submodule.subset_span ⟨_, rfl⟩
  | zero => simp only [map_zero]; exact (domain h).zero_mem
  | add x y hx hy ihx ihy => simp only [map_add]; exact (domain h).add_mem ihx ihy
  | smul c x hx ih => simp only [map_smul]; exact (domain h).smul_mem c ih

def domainOp (s : h.poincare.Symmetry) : domain h →ₗ[ℂ] domain h :=
  (poincareOp h hg s).toLinearMap.restrict (poincare_domain h hg s)

@[simp] theorem domainOp_vector (s : h.poincare.Symmetry) (w : Word) :
    domainOp h hg s (vector h w) =
      vector h (w.map fun a => (h.poincare.onLabels s a.1, h.poincare.onTests s a.2)) := by
  apply Subtype.ext
  exact poincareOp_word h hg s w

theorem covariance_map (s : h.poincare.Symmetry) (A : Lab.carrier) (f : TestFunction) :
    (domainOp h hg s).comp (prepend h hg A f) =
      (prepend h hg (h.poincare.onLabels s A) (h.poincare.onTests s f)).comp
        (domainOp h hg s) := by
  apply map_ext h
  intro w
  simp only [LinearMap.comp_apply, prepend_vector, domainOp_vector, List.map_cons]

theorem w2 : (theory h hg).W2 where
  labelIdentity := hg.label_one
  labelComposition := hg.label_mul
  domainInvariant := poincare_domain h hg
  vacuumInvariant s := poincareOp_word h hg s []
  fieldCovariance s A f x := congrArg Subtype.val
    (LinearMap.congr_fun (covariance_map h hg s A f) x)

theorem vacuumExpectation (n : ℕ) (P : Fin n → Lab.carrier) (f : Fin n → TestFunction) :
    (fields h hg).vacuumExpectation P f =
      inner ℂ (h.Ψ []) (h.Ψ (List.ofFn fun i => (P i, f i))) := by
  rw [FieldSystem.vacuumExpectation, fields_vector]
  rfl

theorem faithful
    (hf : ∀ A : Lab.carrier, A ≠ 0 → ∃ f u, h.Ψ ((A, f) :: u) ≠ 0) :
    (fields h hg).Faithful := by
  intro A hA
  obtain ⟨f, u, hne⟩ := hf A hA
  refine ⟨f, ?_⟩
  intro he
  have hv := LinearMap.congr_fun he (vector h u)
  change prepend h hg A f (vector h u) = 0 at hv
  rw [prepend_vector] at hv
  exact hne (congrArg (fun x : domain h => x.1.1) hv)

end Host.Reconstruction

 theorem Host.reconstruct' {Lab : FieldLabels} (h : Host Lab) (hg : h.Good) :
    ∃ (H : HilbertSpace) (th : WightmanTheory H Lab), th.Axioms ∧
      (∀ (n : ℕ) (P : Fin n → Lab.carrier) (f : Fin n → TestFunction),
        th.fields.vacuumExpectation P f =
          inner ℂ (h.Ψ []) (h.Ψ (List.ofFn fun i => (P i, f i)))) ∧
      ((∀ A : Lab.carrier, A ≠ 0 → ∃ f u, h.Ψ ((A, f) :: u) ≠ 0) → th.fields.Faithful) := by
  refine ⟨Host.Reconstruction.space h, Host.Reconstruction.theory h hg,
    ⟨Host.Reconstruction.w0 h hg, Host.Reconstruction.w1 h hg,
      Host.Reconstruction.w2 h hg, Host.Reconstruction.w3 h hg⟩,
    Host.Reconstruction.vacuumExpectation h hg, Host.Reconstruction.faithful h hg⟩

end YangMills.FreeField

#print axioms YangMills.FreeField.Host.reconstruct'
