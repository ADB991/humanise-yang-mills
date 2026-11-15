/-
Probe437_scope_v1.lean -- feasibility probe (scope lane) for a possible independent review of
hairer/humanise-yang-mills PR #437 (thm:ex-construction-headline, manuscript/existence/
construction-headline.tex). Release: ~/ym-release/2026-11-11/OpenAI-YM-20261028 @ 3456e5e7.
Prints release declarations only; no probe theorems. The last command is a deliberate negative
test: YangMills.award_eq is `private` in TraceBridge.lean (l.24) and is expected NOT to resolve.

Prints (crosswalk rows of the author record README):
  preamble / order : YangMills.constructed (+ axioms), YM.Nonperturbative.existence
  normalization    : YM.Source.Projects, YM.Source.SectionData.Sound
  insertion        : YM.Family.O, YM.Family.Makes, YM.Family.normalized, YM.Source.TransferData.Based
  item 1 quotient  : YM.Table.criterion
  item 4 locals    : YM.Spec.Locals
  item 3           : YM.Nonperturbative.Headline.Reconstruction
  item 4 trace     : YM.Nonperturbative.Headline.TraceExclusions, YM.Trace.Verse.award,
                     YangMills.publicTrace, YangMills.Hierarchy.TraceTest
-/
import Construction

set_option pp.proofs false

/-! ## Preamble and choice order -/
#check @YangMills.constructed
#print axioms YangMills.constructed
#check @YM.Nonperturbative.existence

/-! ## Normalization (eq:headline-jet-normalization) -/
#print YM.Source.Projects
#print YM.Source.SectionData.Sound

/-! ## Insertion (eq:headline-insertion) -/
#print YM.Family.O
#print YM.Family.Makes
#check @YM.Family.normalized
#print YM.Source.TransferData.Based

/-! ## Item 1: field quotient -/
#check @YM.Table.criterion

/-! ## Item 4: local structure and stress -/
#print YM.Spec.Locals

/-! ## Item 3: every-character reconstruction -/
#print YM.Nonperturbative.Headline.Reconstruction

/-! ## Item 4: centered trace and constant -/
#print YM.Nonperturbative.Headline.TraceExclusions
#print YM.Trace.Verse.award
#check @YangMills.publicTrace
#print YangMills.Hierarchy.TraceTest

/-! ## Negative test: private declaration (expected error: unknown identifier) -/
#check @YangMills.award_eq
