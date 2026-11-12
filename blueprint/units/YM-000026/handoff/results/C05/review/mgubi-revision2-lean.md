# Additional Lean correspondence review of C05 revision 2

- Unit/package: YM-000026 / C05; additional revision-2 verification.
- Author PR: [#72](https://github.com/hairer/humanise-yang-mills/pull/72), final head `889deac713c6004e383fe0e5f4ec6f6510aacd46` (merged 2026-11-12 20:34:43 UTC).
- Compared with: `8b15d44410a2784d25e765b5b7b9ca2b05e5582c`.
- Source: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; Lean `leanprover/lean4:v4.32.0`.
- Reviewer: independent OpenAI Codex subagent under authorized account `mgubi`, session `mgubi-codex-review72-20261112`; not a C05 author. Independence is agent-based. No human acceptance is asserted.
- Claim: [issue #46](https://github.com/hairer/humanise-yang-mills/issues/46#issuecomment-6835587411), checked again before submission.
- Whole-unit snapshot fingerprint: `59ad9fe6249c394cb2a6c005bf188de1a521c7ae5f8fb85a431f09c5a1d981a0`; this identifies the snapshot, not a whole-unit review. File hashes and coverage are in [validation](mgubi-revision2-validation.md).

- Role: textual Lean correspondence, separate from mathematical validity.
- Outcome: the main repairs faithfully expose the source assumptions; the three residual interface corrections in [mathematical review](mgubi-revision2-mathematics.md) remain. No new elaboration, `#print axioms`, or kernel replay was run by this reviewer.

## Checked declarations and interfaces

All paths below are relative to `Lean/` at the stated immutable source pin. Line numbers are supplementary.

| Revised interface | Exact source evidence | Result |
| --- | --- | --- |
| Opened rather than centered payment scale | `YM.OPE.terminalAfford` and `YM.OPE.funding`, `YM/OPE/Prices/Circuit.lean:40,64` | `funding` passes opened `P` to `terminalAfford`, which evaluates `alto`, `gainChart` and `fly` there. The root-test scale remains centered `k`; `stakes` uses both. M1 remains. |
| Meaning of opened depth | `YM.Stock.Tabs.opens`, `YM/Overlay/Prior.lean:23` | Exact predicate `i <= j` and `s * coverSize(j)^2 <= a(i)/a(j)`; specialize `s=1`. M2 remains. |
| Local trial price/regularity | `YM.Push.RelayDifference.RawProtected`, `.clothed`, `.unpriced`, `YM/Push/RELAY_DIFFERENCE/RawTop.lean:24,27,33`; `YM.RG.BudgetPoint.Regular`, `.supBounds`, `YM/RG/Masks.lean:154,164` | A fixed stencil containing zero; two slow prices on the ordered cutoff tail, uniformly at every origin; regularity and bounds for the rescaled observable. `Regular` includes chart smoothness and recursive derivative existence separately from `supBounds`. M3 remains. |
| Mixed covariance and reality | `YM.Table.Rotation.Oriented`, `YM/Euclid/Stress.lean`; `YM.Table.Homogeneous`, `YM.Table.RealSpin.real`, `YM/Euclid/Table.lean`; `YM.OPE.Orbits.discrepancy_spin`, `YM/OPE/Orbits/Quotes.lean:80`; `YM.OPE.Orbits.whole_bar`, `YM/OPE/Orbits/Receipts.lean` | The new standing laws supply the missing correlation assumptions, distinct from laws of the label action. Reality applies to the combined separated word. Producer remains conditional. |
| Ordinary phase conjugation | `YM.Work.B17.conj_M`, `YM/Work/B17.lean:22` | Requires both `Theme` and `Phase.reflects`; uses distinctness, permutation and reversal to give ordinary word conjugation. The revised text names its conditional input rather than deriving it from reflection positivity alone. |
| Grouping covariance | `YM.MergeProof.Ribbons.Fibers.Permutes`, `.CopyFamily`, `YM/OPE/Grouping/Family.lean:20,44`; `YM.MergeProof.Ribbons.Fibers.CopyFamily.twines`, `YM/OPE/Grouping/Care.lean:57` | `run` and `pin` preserve grouping and representative; `who`, `ways`, `debut`, `kin`, `jets` give the full focused copy hypotheses. The output requires focused grouped modes. New prose (a)–(d) matches. |
| Differentiation of mixed reads | `YM.OPE.observeBump`, `.under_read`, `YM/OPE/Interpolate/Chart.lean:34,66` | Requires hierarchy, `DiffPlan.Derivatives`, phase compatibility `A.respects S`, and injective positions. Revised explicit slot-identity input is necessary. |
| Forced remainder normalization | `YM.Source.Coefficient.remBound`, `YM/Source/Insertion.lean:63` | Separate nonnegative ordinary/forced budgets with sum at most the total; the forced budget is multiplied by one common positive constant. This supports the normalized sum added in the prose. |

## Correspondence-record cleanup

Add the three fully qualified grouping declarations `YM.MergeProof.Ribbons.Fibers.Permutes`, `YM.MergeProof.Ribbons.Fibers.CopyFamily`, and `YM.MergeProof.Ribbons.Fibers.CopyFamily.twines` to the author correspondence, since the new covariance hypotheses are precisely their content. Its concluding “nine unchanged chapters”/“not re-read” paragraph is still a revision-1 record and should be explicitly dated or updated, as revision 2 changes ten chapters. This is audit-trail clarity rather than another mathematical defect.

Errors in canonical `ope-evidence.md` / `local-projection-evidence.md` were already assigned outside the author scope in #79/#85. This pass does not silently correct or accept those files. C16 singleton wording is separately owned and is not part of the reviewed revision-2 diff.

## Formal evidence and limits

The source files checked for this review match their entries in `Lean/SOURCES.sha256` (see validation). Source-text inspection establishes the reported syntax and hypotheses; it is not a new elaboration or transitive-axiom audit.

Reuse [issue #37](https://github.com/hairer/humanise-yang-mills/issues/37) and its evidence PRs [#67](https://github.com/hairer/humanise-yang-mills/pull/67), [#75](https://github.com/hairer/humanise-yang-mills/pull/75), [#78](https://github.com/hairer/humanise-yang-mills/pull/78): the reported clean project build, 17-endpoint replay, path-only artifact differences and qualified Comparator success. These are other contributors' results, not checks rerun here. External package caches were not rebuilt; Comparator used the default Lean kernel with nanoda disabled. The ten missing imported verification logs do not imply missing Lean source files.

No human acceptance or formal approval is recorded. The role here is agent-independent textual correspondence verification of the scoped revision.
