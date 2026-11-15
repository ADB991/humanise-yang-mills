/-
Probe437a_v1.lean -- elaborated probe, lane A of the review of hairer/humanise-yang-mills #437
(thm:ex-construction-headline, manuscript/existence/construction-headline.tex at 9c631687):
the PREAMBLE, the two NORMALIZATIONS (eq:headline-jet-normalization, eq:headline-insertion)
and ITEM 1 (eq:headline-wilson-limit, the field quotient).
Release: ~/ym-release/2026-11-11/OpenAI-YM-20261028 @ 3456e5e7; YM .olean files from
~/ym-release/full/tree/lib/lean. Modelled on scope/Probe437_scope_v1.lean (imports Construction only).
Nothing here is added to the release; the probe theorems below live only in this probe's
environment and are definitional restatements of release declarations (all `rfl`; no sorry).

Sections:
  A. top-level statements and axioms: YangMills.constructed, YM.Nonperturbative.existence,
     Headline.WilsonExistence
  B. group: GaugeGroup, GaugeGroup.IsSimple, GaugeGroup.core, GaugeGroup.coreSimple
  C. orders: Extraction.Sequence(.full/.after), Order, Order.refine, Order.limits, Order.Ordered,
     Order.smears; probe theorems for the full-mesh order used in `constructed`
  D. running input: WilsonRegularity, wilsonFamily, WilsonFamily.mesh, smear_eq, moment_eq
  E. jet normalization: Labels.{Jet, Taylor, read, coord, generation, height, limited, localFields,
     Label, eval_ext}, Labels.Frame (structure), Frame.{coords, e0, scaled, coords_unit},
     Source.{scaleJet, potential, partConnection, Hol, Hol.links, Projects, SectionData,
     SectionData.evaluate, SectionData.places, SectionData.Sound}
  F. insertion: Source.initial, TransferData, TransferData.cylinder, TransferData.Based, Family,
     Family.O, Family.Makes, Family.normalized, Family.translation; probe theorem: O unfolded
  G. history: RG.History, History.Selected, History.Transfer, History.Running, Spec.Calibrated
  H. item 1: Family.book, Family.seen, Family.numeric, Family.num, Table.null, Table.criterion,
     Table.vanishes, Table.equivalent, Table.Field, Spec.Seed, Spec.Final, Spec.Locals,
     DiffPlan.Inclusions, DiffPlan.inject
-/
import Construction

set_option pp.proofs false

/-! ## A. Top-level statements -/
#check @YangMills.constructed
#print axioms YangMills.constructed
#check @YM.Nonperturbative.existence
#print axioms YM.Nonperturbative.existence
#print YM.Nonperturbative.Headline.WilsonExistence

/-! ## B. Gauge group -/
#print YangMills.GaugeGroup
#print YangMills.GaugeGroup.IsSimple
#print YangMills.GaugeGroup.core
#check @YangMills.GaugeGroup.coreSimple

/-! ## C. Orders and the Wilson limit -/
#print YM.Extraction.Sequence
#print YM.Extraction.Sequence.full
#print YM.Extraction.Sequence.after
#print YM.Extraction.Order
#print YM.Extraction.Order.refine
#print YM.Extraction.Order.limits
#print YM.Extraction.Order.Ordered
#print YM.Extraction.Order.smears

/-- The full-mesh order of `constructed` uses the identity mesh. -/
theorem probe_full_mesh (p q : YM.Extraction.Order) (j : ℕ) :
    (YM.Extraction.Order.mk YM.Extraction.Sequence.full (p.refine q).per).mesh j = j := rfl

/-- ... and the period sequence p ∘ q. -/
theorem probe_full_per (p q : YM.Extraction.Order) (k : ℕ) :
    (YM.Extraction.Order.mk YM.Extraction.Sequence.full (p.refine q).per).per k = p.per (q.per k) := rfl

/-- The refined order of `Final` composes both sequences: (u ∘ v, p ∘ q). -/
theorem probe_refine (p q : YM.Extraction.Order) (j k : ℕ) :
    (p.refine q).mesh j = p.mesh (q.mesh j) ∧ (p.refine q).per k = p.per (q.per k) := ⟨rfl, rfl⟩

/-! ## D. Running input -/
#print YangMills.WilsonRegularity
#print YangMills.wilsonFamily
#print YangMills.WilsonFamily.mesh
#check @YangMills.smear_eq
#check @YangMills.moment_eq
#check @YangMills.regular

/-! ## E. Jet normalization -/
#print YM.Labels.Jet
#print YM.Labels.Taylor
#print YM.Labels.read
#print YM.Labels.coord
#print YM.Labels.generation
#print YM.Labels.height
#print YM.Labels.limited
#print YM.Labels.localFields
#print YM.Labels.Label
#check @YM.Labels.eval_ext
#print YM.Labels.Frame
#print YM.Labels.Frame.coords
#print YM.Labels.Frame.e0
#print YM.Labels.Frame.scaled
#check @YM.Labels.Frame.coords_unit
#print YM.Source.scaleJet
#print YM.Source.potential
#print YM.Source.partConnection
#print YM.Source.Hol
#print YM.Source.Hol.links
#print YM.Source.Projects
#print YM.Source.SectionData
#print YM.Source.SectionData.evaluate
#print YM.Source.SectionData.places
#print YM.Source.SectionData.Sound

/-- scaleJet multiplies the order-j component (weight j+2) by t^(j+2). -/
theorem probe_scaleJet {G : YM.Gauge} (J : YM.Labels.Jet G) (t : ℝ) (j : ℕ) :
    YM.Source.scaleJet J t j = (t ^ (j + 2)) • J j := rfl

/-! ## F. Insertion -/
#print YM.Source.initial
#print YM.Source.TransferData
#print YM.Source.TransferData.cylinder
#print YM.Source.TransferData.Based
#print YM.Family
#print YM.Family.O
#print YM.Family.Makes
#check @YM.Family.normalized
#check @YM.Family.translation

/-- eq:headline-insertion, unfolded: O = a_N^(-d) • L_d(D_{θ_N^(-1)} (terminal⁻¹ v)) at o. -/
theorem probe_O_unfold {G : YM.Gauge} (C : YM.Family G) (N p d : ℕ) (v : C.label d)
    (o : YM.Lattice.Site (C.side N p)) :
    C.O N p v o = ((C.S.a N : ℂ) ^ d)⁻¹ •
      (C.localSection d).places
        ((C.labels.level d).scaled (C.path.levels.clock.threshold N)⁻¹
          ((C.factory d N p).terminal.symm v)) o := rfl

/-! ## G. Shared Wilson history -/
#print YM.RG.History
#print YM.RG.History.Selected
#print YM.RG.History.Transfer
#print YM.RG.History.Running
#print YM.Spec.Calibrated

/-! ## H. Item 1: moments and the field quotient -/
#print YM.Family.book
#print YM.Family.seen
#print YM.Family.numeric
#check @YM.Family.num
#print YM.Table.null
#check @YM.Table.criterion
#print YM.Table.vanishes
#check @YM.Table.equivalent
#print YM.Table.Field
#print YM.Spec.Seed
#print YM.Spec.Final
#print YM.Spec.Locals
#print YM.DiffPlan.Inclusions
#check @YM.DiffPlan.inject

/-! ## Axioms of the probe theorems -/
#print axioms probe_full_mesh
#print axioms probe_full_per
#print axioms probe_refine
#print axioms probe_scaleJet
#print axioms probe_O_unfold
