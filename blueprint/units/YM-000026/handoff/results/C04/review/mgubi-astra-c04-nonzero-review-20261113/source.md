# Textual source-correspondence review

**Argument matches the inspected source, with one minor required record correction (M1).** Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. This is a textual check of immediate declarations, not fresh Lean elaboration or a transitive axiom audit.

## M1 — correct the fully qualified names

At frozen target `42ca0b60a24d92dbbea4c43e70735ff477b3c510`:

- `blueprint/units/YM-000026/handoff/results/C04/correspondence.md`, line13: replace `YangMills.Reconstructed` by **`YangMills.Hierarchy.Reconstructed`** (or cite its field `YangMills.Hierarchy.Reconstructed.acts`). `ChallengeSpec.lean` enters `namespace YangMills` and then `namespace Hierarchy` before the structure.
- Same file, line14: replace `YM.HierarchyBridge.publicReconstruction` by **`YangMills.publicReconstruction`**. `HierarchyBridge` is the module filename, not its declaration namespace; `Lean/HierarchyBridge.lean` is in `namespace YangMills`.
- `results/C04/ledger.md`, new endpoint row at line73: use the same exact `YangMills.publicReconstruction` in place of `HierarchyBridge.publicReconstruction`, rather than leaving the module/name hybrid.

The source paths and the actual proof chain are right. This is a locator correction, not a mathematical failure. No manuscript change is requested for M1.

## Inspected chain

| Exact declaration | Path | Correspondence |
| --- | --- | --- |
| `YM.Register.scalar`, `YM.Register.one` | `Lean/YM/Euclid/Register.lean` | The source token is the scaled grade-dependent scalar label, not an arbitrary literal coordinate vector. The manuscript assumes a label with the required law and does not assert a finite-lattice identity for it. |
| `YM.Table.Basic.trivial`, `.unital` | `Lean/YM/Euclid/Table.lean` | Empty correlation is 1; head unit insertion removes the slot for every grade and every separated configuration. E6 restricts this stronger source premise to one grade. |
| `YM.Exterior`, `YM.Table.null`, `.criterion`, `.Field`, `.unit`, `.alive` | `Lean/YM/Euclid/Null.lean` | Exterior has n spectators and n+1 points. The criterion includes n=0. alive uses exactly n=0, the zero one-point configuration, unital and trivial. Field is the quotient by that all-spectator null submodule. |
| `YM.Table.spectra`, `.faithfully`; `YM.Table.Union`, `.pin`, `.pin_inj` | `Null.lean`; `Lean/YM/Euclid/Union.lean` | The response map on each quotient is injective by construction; pin_inj follows by forgetting the union subtype. This needs no analytic supplier and does not on its own produce inter-grade inclusions. `YM.DiffPlan.covered` separately uses symmetry and Inclusions. |
| `YM.Table.Hierarchy.laws`; `YM.Spec.Seed.kernel` | `Lean/YM/Euclid/Words.lean`; `Lean/YM/Spec/Closed.lean` | Basic is supplied through the seed hierarchy premise. Its occurrence in this local proof is not a manuscript derivation from lattice limits. |
| `YM.Boundary.Fields.notLost`; `YM.Boundary.Wightman.Realizes.faithful` | `Lean/YM/Fields/System.lean` | Nonzero union label implies some test with nonzero field, with fields mapping the common domain to itself. |
| `YangMills.publicReconstruction` | `Lean/HierarchyBridge.lean` | First deferred bullet chooses tag ⟨0,S.unit 0⟩, proves its pin nonzero using alive and pin_inj, then invokes F.realization.qt.faithful. The manuscript's explicit pairing argument is a valid way to expose this last implication. |
| `YangMills.labelsOf`, `.fieldsOf`, `.hierarchy` | `Lean/PublicView.lean`; `Lean/HierarchyBridge.lean` | The public labels are S.Union; fields/domain/vacuum are those of the supplied reconstruction. No second realization witness is introduced. |
| `YangMills.Hierarchy.Reconstructed.acts` | `Lean/ChallengeSpec.lean` | Requires an actual graded tag and Schwartz test with nonzero field, distinct from the universal faithful clause. The chosen class at d₀ supplies that tag. |

No required substantive source mismatch found. The conclusion is conditional on the existing detection inputs and new E6; the corollary's generalization from grade0 to one arbitrary grade is justified by alive's grade parameter. Prior source and mathematical reviews stay frozen. No claim that PR248's whole coordinate/endpoint audit has been independently renewed, and no independent C16 approval.
