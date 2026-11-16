/-
Probe382i4_v1.lean -- local probe for hairer/humanise-yang-mills #382 item 4
(value of the running slope). Release ~/ym-release/2026-11-11/OpenAI-YM-20261028 @ 3456e5e7.
Imports Construction only. The probe theorems below live only in this probe's environment;
they restate or combine release declarations; no sorry.

Sections:
  A. statements printed: WilsonRegularity, regular, wilsonFamily, WilsonFamily.mesh,
     Family.beta, Family.Makes, History.Selected, History.Running, Calendar.hatBeta,
     Schedule.a, Schedule.scale, Pert.Asymptotics.b0, b0_normalizes, zeroUp_bound,
     Gauge.casimir, Gauge.slopeConstant, Gauge.trace_adjoint, Gauge.casimir_pos
  B. probe theorems P0 (value inside Makes), P1 (public restatement), P2 (uniqueness),
     P2b (the witness of any WilsonRegularity proof), P3 (for the constructed family),
     P4 (2*b0 written out)
-/
import Construction

set_option pp.proofs false

/-! ## A. Statements -/
#check @YangMills.WilsonRegularity
#print YangMills.WilsonRegularity
#check @YangMills.regular
#print axioms YangMills.regular
#print YangMills.wilsonFamily
#print YangMills.WilsonFamily.mesh
#print YM.Family.beta
#print YM.Family.Makes
#print YM.RG.History.Selected
#print YM.RG.History.Running
#print YM.RG.Calendar.hatBeta
#print YM.Schedule.a
#print YM.Schedule.scale
#print YM.Pert.Asymptotics.b0
#check @YM.Pert.Asymptotics.b0_normalizes
#print axioms YM.Pert.Asymptotics.b0_normalizes
#check @YM.Pert.Asymptotics.zeroUp_bound
#print axioms YM.Pert.Asymptotics.zeroUp_bound
#print YM.Gauge.casimir
#print YM.Gauge.slopeConstant
#check @YM.Gauge.trace_adjoint
#check @YM.Gauge.casimir_pos
#check @YangMills.constructed

/-! ## B. Probe theorems -/
namespace Probe382i4
open Filter Topology

/-- The running clause of `WilsonRegularity`, for a given slope, on the public family. -/
def RunsAt {g : YangMills.GaugeGroup} (W : YangMills.WilsonFamily g) (s : ℝ) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∀ᶠ N : ℕ in atTop, ∀ p, |W.beta N p / Real.log (W.mesh N)⁻¹ - s| < ε

/-- P0: the conjunct `C.Makes` itself carries the value: its field `wilson.running`
is a bound around `bar + slopeConstant * scale m`. -/
theorem P0 {g : YangMills.GaugeGroup} (C : YM.Family g.core) (h : C.Makes) :
    ∀ ε : ℝ, 0 < ε → ∀ᶠ m : ℕ in atTop, ∀ N p : ℕ, m ≤ N →
      |C.path.β N p m - (C.path.levels.clock.bar + g.core.slopeConstant * C.S.scale m)|
        ≤ ε * C.S.scale m :=
  h.wilson.running

/-- P1: public restatement through `zeroUp_bound`. -/
theorem P1 {g : YangMills.GaugeGroup} (C : YM.Family g.core) (h : C.Makes) :
    RunsAt (YangMills.wilsonFamily C) (2 * YM.Pert.Asymptotics.b0 g.core) := by
  intro ε hε
  filter_upwards [YM.Pert.Asymptotics.zeroUp_bound C h hε] with N hN
  exact fun p => hN N p le_rfl

/-- Any slope satisfying the running clause is the limit along p = 0. -/
theorem tendsto_of_runs {g : YangMills.GaugeGroup} (W : YangMills.WilsonFamily g) (s : ℝ)
    (hs : RunsAt W s) :
    Tendsto (fun N => W.beta N 0 / Real.log (W.mesh N)⁻¹) atTop (𝓝 s) :=
  Metric.tendsto_nhds.2 fun ε hε => (hs ε hε).mono fun N hN => by
    rw [Real.dist_eq]; exact hN 0

/-- P2: uniqueness: every slope witnessing running for `wilsonFamily C` equals `2*b0`. -/
theorem P2 {g : YangMills.GaugeGroup} (C : YM.Family g.core) (h : C.Makes) (s : ℝ)
    (hs : RunsAt (YangMills.wilsonFamily C) s) : s = 2 * YM.Pert.Asymptotics.b0 g.core :=
  tendsto_nhds_unique (tendsto_of_runs _ s hs) (tendsto_of_runs _ _ (P1 C h))

/-- P2b: whatever proof of `WilsonRegularity (wilsonFamily C)` is given, its chosen slope is `2*b0`. -/
theorem P2b {g : YangMills.GaugeGroup} (C : YM.Family g.core) (h : C.Makes)
    (R : YangMills.WilsonRegularity (YangMills.wilsonFamily C)) :
    Classical.choose R.running = 2 * YM.Pert.Asymptotics.b0 g.core :=
  P2 C h _ (Classical.choose_spec R.running).2

/-- P4: `2*b0` written out, and equal to the release's `slopeConstant`. -/
theorem P4 (G : YM.Gauge) :
    2 * YM.Pert.Asymptotics.b0 G = 11 * G.casimir / (24 * Real.pi ^ 2) ∧
    2 * YM.Pert.Asymptotics.b0 G = G.slopeConstant := by
  refine ⟨?_, YM.Pert.Asymptotics.b0_normalizes⟩
  unfold YM.Pert.Asymptotics.b0; ring

/-- P3: for the family supplied by `YangMills.constructed`: the value of the slope,
and its uniqueness, obtained from the conjunct `C.Makes`. -/
theorem P3 (g : YangMills.GaugeGroup) (hg : g.IsSimple) (b : ℝ) (hb : 0 < b) :
    ∃ C : YM.Family g.core, C.path.levels.clock.kernel.penalty = b ∧ C.Makes ∧
      RunsAt (YangMills.wilsonFamily C) (11 * g.core.casimir / (24 * Real.pi ^ 2)) ∧
      (∀ s, RunsAt (YangMills.wilsonFamily C) s → s = 11 * g.core.casimir / (24 * Real.pi ^ 2)) ∧
      0 < 11 * g.core.casimir / (24 * Real.pi ^ 2) := by
  obtain ⟨C, hpen, hmk, -, -⟩ := YangMills.constructed.{0,0} g hg b hb
  have e := (P4 g.core).1
  refine ⟨C, hpen, hmk, e ▸ P1 C hmk, fun s hs => e ▸ P2 C hmk s hs, ?_⟩
  have := YM.Gauge.casimir_pos (YangMills.GaugeGroup.coreSimple hg)
  positivity

end Probe382i4

#print axioms Probe382i4.P0
#print axioms Probe382i4.P1
#print axioms Probe382i4.P2
#print axioms Probe382i4.P2b
#print axioms Probe382i4.P3
#print axioms Probe382i4.P4
