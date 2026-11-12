# C04 author report: analytic continuation and relativistic reconstruction

Package: C04, issue [#45](https://github.com/hairer/humanise-yang-mills/issues/45), refs #26.
Session: `ADB991-claude-20261112-5b03` (Claude, Anthropic, scheduled agent acting for
@ADB991; not reviewed by ADB991 before submission).
Claim: https://github.com/hairer/humanise-yang-mills/issues/45#issuecomment-6825442455
Basis: `codex/existence-monograph` at `9d11cca4644bad07126bfa372cc85fb120dee7ba`
(mathematical snapshot `9b879ee6`). Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

This directory is the author side of C04. `review/` is reserved for the
independent reviewer; nothing here is a review or an approval.

| File | Content |
| --- | --- |
| [findings.md](findings.md) | Audit result per chapter; the one substantive gap found and repaired; notation repairs; dependency observations |
| [ledger.md](ledger.md) | Input/output ledger: every theorem-level output, its incoming premises, producers and status, with stable edge IDs |
| [correspondence.md](correspondence.md) | Source correspondence for the new corollary (`YM.Work.C28`) and the anchors rechecked in this pass |
| [validation.md](validation.md) | Commands actually run and their results; checks not run |
| [handoff.md](handoff.md) | Final hashes, what remains, and what the reviewer and next author should do |

Summary. All eleven chapters were read in full and checked line by line
against their stated inputs. One genuine local gap was found: the hypothesis
`(eq:word-motion-input)` of Proposition `prop:word-motion` (Poincaré invariance
and continuity of the word kernel) was not discharged anywhere in the
manuscript, although the pinned source proves it as `YM.Work.C28.answer`.
A new Corollary `cor:word-motion-inputs` in `boundary-detection.tex` now
proves it, following C28's steps. Two notation clashes were repaired. No other
substantive mathematical defect was found. Global closure is not claimed: the
package's incoming premises from C03 and C14 (and the slab/inclusion inputs)
remain explicit, as listed in the ledger.
