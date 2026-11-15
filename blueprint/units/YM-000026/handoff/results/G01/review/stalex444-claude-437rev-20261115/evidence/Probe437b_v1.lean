/-
Probe437b_v1.lean -- Lean correspondence lane B (items 2, 3, 4) of the review of
hairer/humanise-yang-mills PR #437 (thm:ex-construction-headline,
manuscript/existence/construction-headline.tex at 9c631687).
Release: ~/ym-release/2026-11-11/OpenAI-YM-20261028 @ 3456e5e7. Imports `Construction` only.

Prints release statements (#check @, #print, #print axioms). Three short probe theorems and one
`rfl` example, each a restatement or direct corollary of release declarations; no sorry:
  P1 probe_award            : Trace.Verse.award G = 3 * G.lieDim / pi^4 for simple G
                              (public definitions award, d2 = forceR, b0, slopeConstant)
  P2 probe_award_public     : the same constant as 3 * finrank R g.lieAlgebra / pi^4 for a
                              public GaugeGroup (the content of a private bridge lemma at
                              TraceBridge.lean:24, re-proved here from public declarations)
  P3 probe_traceTwo_rfl     : the public traceTwo of the hierarchy IS TraceExtension.euclidean F
  P4 probe_every_character_acts : in every character some smeared field is nonzero
                              (from EveryPhase.Completed.isTheory .faithful and vev_unit)
-/
import Construction

set_option autoImplicit false
set_option pp.proofs false
noncomputable section
open YM YM.Spec YM.OPE.Orbits YM.Nonperturbative

/-! ## Item 2: phase space, measure, characters (YM/Phase/Mixture.lean) -/
#print YM.OS.Selection
#print YM.OS.Spread.Resolution
#print YM.OS.Spread.Resolution.Out
#print YM.OS.Spread.Resolution.receives
#print YM.OS.Spread.algebra
#print YM.OS.Spread.atom
#print YM.OS.Chamber.D
#print YM.OS.Chamber.UniqueHeat
#print YM.OS.Selection.Certificate
#check @YM.OS.Spread.Resolution.barycenter
#print axioms YM.OS.Spread.Resolution.barycenter
#print YM.Table.Hierarchy

/-! ## Item 3: every-character reconstruction -/
#print YM.Nonperturbative.Headline.WightmanAxioms
#print YM.Nonperturbative.Headline.Reconstruction
#print YM.EveryPhase.Almanac
#print YM.EveryPhase.Completed
#check @YM.EveryPhase.recognizes
#print axioms YM.EveryPhase.recognizes
#check @YM.EveryPhase.exactly_fixed
#print axioms YM.EveryPhase.exactly_fixed
#check @YM.EveryPhase.all_characters
#print axioms YM.EveryPhase.all_characters
#print YM.Boundary.Wightman.Realizes
#print YM.Boundary.Fields.notLost
#print YM.Next.BOUNDARY.Compatible
#print YM.Independent.Core
#print YM.Mink.cone
#print YM.timeAxis

/-! ## Item 4: OPE, local structure and stress -/
#print YM.Nonperturbative.Headline.SeparatedOPE
#print YM.OPE.Viewers
#print YM.OPE.spectator
#print YM.Spec.Seed
#print YM.Spec.Algebra
#print YM.Spec.Locals
#print YM.Spec.Materializes
#print YM.Spec.Calibrated
#print YM.Spec.Final
#print YM.Table.Stress
#print YM.Table.Conserved
#print YM.Table.Tensorial
#print YM.Table.StressLaws

/-! ## Item 4: centered trace and constant -/
#print YM.Nonperturbative.Headline.TraceExclusions
#print YM.TraceExtension.selected
#print YM.TraceExtension.center
#print YM.TraceExtension.pinned
#print YM.TraceExtension.opposed
#print YM.TraceExtension.euclidean
#print YM.TraceExtension.stressTrace
#print YM.TraceExtension.euclideanVEV
#print YM.TraceExtension.centerIn
#print YM.TraceExtension.theta
#print YM.Trace.Verse.award
#print YM.Trace.Over.d2
#print YM.Trace.Over.forceR
#print YM.Trace.Over.b0
#print YM.Gauge.slopeConstant
#print YM.Gauge.lieDim
#check @YangMills.publicTrace
#print axioms YangMills.publicTrace
#print YangMills.Hierarchy.TraceTest
#print YangMills.Hierarchy.timePair
#print YangMills.Hierarchy.traceTwo
#check @YangMills.constructed
#print axioms YangMills.constructed

/-! ## Probe theorems -/

/-- P1. The release constant, from its public definitions. -/
theorem probe_award (G : YM.Gauge) (h : G.Simple) :
    YM.Trace.Verse.award G = 3 * (G.lieDim : ℝ) / Real.pi ^ 4 := by
  have hc := YM.Gauge.casimir_pos h
  unfold YM.Trace.Verse.award YM.Trace.Over.d2 YM.Trace.Over.b0 YM.Trace.Over.forceR
    YM.Gauge.slopeConstant
  field_simp [ne_of_gt hc, Real.pi_ne_zero]
  ring

/-- P2. The same, with the real dimension of the public Lie algebra. -/
theorem probe_award_public (g : YangMills.GaugeGroup) (hg : g.IsSimple) :
    YM.Trace.Verse.award g.core = 3 * (Module.finrank ℝ g.lieAlgebra : ℝ) / Real.pi ^ 4 := by
  have h : g.core.lie = g.lieAlgebra := by ext v; exact (g.generates v).symm
  have dim : g.core.lieDim = Module.finrank ℝ g.lieAlgebra :=
    congrArg (fun V : Submodule ℝ (Matrix (Fin (g.n+1)) (Fin (g.n+1)) ℂ) => Module.finrank ℝ V) h
  rw [probe_award g.core (YangMills.GaugeGroup.coreSimple hg), dim]

/-- P3. The public trace two-point function is the release's `euclidean F`. -/
theorem probe_traceTwo_rfl {g : YangMills.GaugeGroup} {C : YM.Family g.core}
    {p : YM.Extraction.Order} {S : YM.Table C.book} (F : YM.Spec.Final C p S)
    (Q : Reader F.sector.derivatives F.sector.turns F.room.kernel.spin) :
    (YangMills.hierarchy F Q).traceTwo = YM.TraceExtension.euclidean F := rfl

/-- P4. In every character, some smeared field is nonzero. -/
theorem probe_every_character_acts {G : YM.Gauge} {C : YM.Family G} {f : YM.Extraction.Order}
    {S : YM.Table C.book} (F : YM.Spec.Final C f S) (L : YM.EveryPhase.Almanac F)
    (H : YM.EveryPhase.Completed F L) (i : F.α.space.X) :
    ∃ (x : S.Union) (φ : YM.Test4), (L.actors i).operators.field x φ ≠ 0 := by
  have ht := F.phase.phase.states i
  have hs : (F.α.ensemble i).respects S := fun d => (F.phase.phase.retains i d).symm.le
  have h1 := YM.TraceExtension.vev_unit hs ht 0
  have hu : S.unit 0 ≠ 0 := by
    intro h0
    rw [h0, (YM.TraceExtension.vev_linear (S := S) (T := F.α.ensemble i) (d := 0)).map_zero] at h1
    exact zero_ne_one h1
  have hp : S.pin 0 (S.unit 0) ≠ 0 := fun h0 =>
    hu (S.pin_inj 0 (h0.trans (map_zero _).symm))
  exact ⟨_, (H.isTheory i).faithful _ hp⟩

#print axioms probe_award
#print axioms probe_award_public
#print axioms probe_traceTwo_rfl
#print axioms probe_every_character_acts
