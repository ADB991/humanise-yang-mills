# FreeField consolidation

The production graph now includes the completed proofs of `Sr_euclid`, `cut_identity`,
`Psi_covariant`, and `gope_remainder`. The sole remaining proof hole is `wightW_local` in
`Theory/WightWLocal.lean`. All original theorem statements and definitions are unchanged.
All Work files (including the incomplete `Work/wightW_local.lean`), the public files,
`Adequacy.lean`, `GroupIndependence.lean`, `Main.lean`, the toolchain, the dependency manifest,
and `lakefile.toml` are byte-for-byte unchanged by this consolidation pass.

## Validation

1. `lake build` succeeds (8,734 jobs), including `FreeField.AxiomReport`.
2. Outside `FreeField/Work/`, the sole executable `sorry` is the body of `wightW_local`
   in `Theory/WightWLocal.lean:26`. The only additional literal occurrence is the pre-existing
   docstring in `Main.lean:9`.
3. `AxiomReport.lean` prints kernel axioms for the main theorem, every one of the 75 entries
   in `TASKS.md`, and five assembly lemmas. It verifies that every dependency set is exactly
   `[propext, Classical.choice, Quot.sound]`, or those three principles plus `sorryAx`.
   It follows elaborated declaration bodies and permits an admission only through
   `wightW_local`; any other admission or unexpected primitive is an error.
   Among the 75 TASKS lemmas, 73 are clean and two depend on `sorryAx`.
   Across all 81 audited declarations, 75 are clean and six depend on `sorryAx` (listed below).
4. A token scan of every Lean source under `FreeField/`, including Work, finds no `axiom`,
   `native_decide`, `opaque`, `implemented_by`, or `unsafe` in code. The scan excludes nested
   comments and strings. The pre-existing prose occurrence of `axiom` in the docstring at
   `Work/wightW_local.lean:306` remains untouched.
5. This document records the final module layout, the actual dependency changes, and the
   mechanical insertion step for the remaining locality proof.

The four inserted proofs and helpers are verbatim copies of their Work sources apart from
namespace relocation, import selection, and removal of diagnostic commands. Their original
public theorem signatures are preserved verbatim. No non-mechanical proof repair, statement
change, new admission, or definition change was needed. The production import graph is
acyclic and imports no Work modules.

Reproduce the build and kernel report with:

```sh
lake build
lake env lean FreeField/AxiomReport.lean
rg -n '\bsorry\b' FreeField --glob '*.lean' --glob '!FreeField/Work/**'
```

The last command is a literal search, so it also reports the `Main.lean` docstring.

## Module layout

Each original module remains an import entry point. `Analytic.lean`, `Reconstruction.lean`,
and `Continuation.lean` re-export their layers. `Theory.lean` also retains the original host
assembly definitions and theorems, and `OPE.lean` retains `exists_ope_coefficient`.

Each `Base.lean` contains only the prerequisites needed before proving that module's lemmas:

| Base module | Contents / prerequisite imports |
| --- | --- |
| `Analytic/Base.lean` | Imports `FreeField.Wick`; original `mu`, `weight_nonneg`, `weight_eq_zero`. |
| `Reconstruction/Base.lean` | Imports `FreeField.Labels`; original `Host` and `Host.Good`. |
| `Theory/Base.lean` | Imports `FreeField.Symmetry`; original `dagger`. `Symmetry` already imports `Fock`, which imports Analytic and Reconstruction. |
| `Continuation/Base.lean` | Imports `FreeField.Analytic`. |
| `OPE/Base.lean` | Imports `FreeField.Hierarchy` and `FreeField.Analytic`; original `KernelHyp`, generic correlations, matchings, coefficient definitions, and `splitCorr`. |

The individual proof modules import their own base and the providers of the unprimed names
actually used by their Work sources. The graph was determined from those sources, not the
suggested order in `TASKS.md`. A proof module never imports its own entry point. In particular,
`Theory/InnerPsi.lean` imports the Wightman multilinearity layers and the unfinished locality
statement before exporting the word-vector identities.

Completed proof bodies and helpers are in separate namespaces
`YangMills.FreeField.Consolidated.<Module>_<Layer>`. Each layer then states the original theorem
in `YangMills.FreeField` with its verbatim original signature and an `exact` reference to the
namespaced primed proof. This avoids helper-name clashes and leaves the original Work sources
usable as independent files. Their diagnostic `#print axioms` commands were centralized in
`AxiomReport.lean`; their proof bodies were not changed.

All paths below are relative to `FreeField/`. This table lists every proof/statement layer;
together with the five bases above, these are the 55 layer files.

| Layer | Original theorem names exported |
| --- | --- |
| `Analytic/IntegrablePowExpWeight.lean` | `integrable_pow_exp_weight` |
| `Analytic/LineCDifferentiableOn.lean` | `lineC_differentiableOn` |
| `Analytic/LineCEuclid.lean` | `lineC_euclid` |
| `Analytic/LineSSymm.lean` | `lineS_symm` |
| `Analytic/MatchingIntegrable.lean` | `matching_integrable`, `wightmanL_continuous` |
| `Analytic/MeasurableWeight.lean` | `measurable_weight` |
| `Analytic/MuMapAdjoint.lean` | `mu_map_adjoint` |
| `Analytic/PartialDerivSBound.lean` | `partialDeriv_S_bound` |
| `Analytic/PartialDerivSIntegral.lean` | `partialDeriv_S_integral` |
| `Analytic/PartialDerivSNeg.lean` | `partialDeriv_S_neg` |
| `Analytic/SContDiffOn.lean` | `S_contDiffOn`, `partialDeriv_S_contDiffOn`, `partialDeriv_S_succ` |
| `Analytic/SrEuclid.lean` | `Sr_euclid` |
| `Analytic/WeightAdjoint.lean` | `weight_adjoint` |
| `Analytic/WeightLe.lean` | `weight_le` |
| `Reconstruction/HostReconstruct.lean` | `Host.reconstruct` |
| `Theory/CharFunDiagMeasure.lean` | `charFun_diagMeasure` |
| `Theory/CutIdentity.lean` | `cut_identity` |
| `Theory/DiagMeasureApply.lean` | `diagMeasure_apply` |
| `Theory/DiagMeasureFinite.lean` | `diagMeasure_finite` |
| `Theory/FockOpApply.lean` | `fockOp_apply`, `transOp_zero`, `transOp_add`, `transOp_norm`, `projOp_empty`, `projOp_univ`, `projOp_inter`, `projOp_adjoint` |
| `Theory/InnerPsi.lean` | `inner_Psi`, `Psi_nil_norm`, `Psi_add_label`, `Psi_smul_label`, `Psi_add_test`, `Psi_smul_test`, `Psi_adjoint`, `Psi_tempered`, `Psi_local` |
| `Theory/OpenAmpWEqZero.lean` | `openAmpW_eq_zero` |
| `Theory/OpenAmpWMemLp.lean` | `openAmpW_memLp` |
| `Theory/PoinOpContinuous.lean` | `poinOp_continuous` |
| `Theory/PoinOpMul.lean` | `poinOp_mul` |
| `Theory/PoinOpNorm.lean` | `poinOp_norm` |
| `Theory/PoinOpOne.lean` | `poinOp_one` |
| `Theory/PoinOpTranslation.lean` | `poinOp_translation` |
| `Theory/ProjOpCone.lean` | `projOp_cone` |
| `Theory/ProjOpHasSum.lean` | `projOp_hasSum` |
| `Theory/PsiApply.lean` | `Psi_apply` |
| `Theory/PsiCovariant.lean` | `Psi_covariant` |
| `Theory/PsiFaithful.lean` | `Psi_faithful` |
| `Theory/RhoLOne.lean` | `rhoL_one`, `rhoL_mul`, `rhoL_bijective` |
| `Theory/TransOpContinuous.lean` | `transOp_continuous` |
| `Theory/TransOpInvariant.lean` | `transOp_invariant` |
| `Theory/WightWAddTest.lean` | `wightW_add_test` |
| `Theory/WightWLocal.lean` | `wightW_local` |
| `Theory/WightWOfFn.lean` | `wightW_ofFn`, `wightW_add_label`, `wightW_smul_label`, `wightW_smul_test` |
| `Continuation/ContLBoundary.lean` | `contL_boundary` |
| `Continuation/ContLDifferentiableOn.lean` | `contL_differentiableOn` |
| `Continuation/ContLRoot.lean` | `contL_root` |
| `Continuation/CorrLContDiffOn.lean` | `corrL_contDiffOn` |
| `Continuation/CorrLPerm.lean` | `corrL_perm` |
| `OPE/GopeCoefficients.lean` | `gope_coefficients` |
| `OPE/GopeRemainder.lean` | `gope_remainder` |
| `OPE/GwickGroupedFactor.lean` | `gwickGrouped_factor` |
| `OPE/LineSKernelHyp.lean` | `lineS_kernelHyp` |
| `OPE/SplitCorrCollapse.lean` | `splitCorr_collapse` |
| `OPE/SplitCorrFderiv.lean` | `splitCorr_fderiv` |

## Dependency changes in this pass

All four proofs were inserted into their designated existing layers. No module was added,
and no entry-point import or Lake module-list change was needed. Each primed proof is
elaborated before its unprimed public wrapper, without importing its own entry point.

| Completed layer | Proof namespace (under `YangMills.FreeField.Consolidated`) | Production imports |
| --- | --- | --- |
| `Analytic/SrEuclid.lean` | `Analytic_SrEuclid` | `Analytic.Base`, `Analytic.IntegrablePowExpWeight`, `Analytic.MuMapAdjoint`, `Analytic.MeasurableWeight`, `Analytic.LineCDifferentiableOn` |
| `Theory/CutIdentity.lean` | `Theory_CutIdentity` | `Theory.Base`, `Analytic.MatchingIntegrable`, `Theory.OpenAmpWMemLp` |
| `Theory/PsiCovariant.lean` | `Theory_PsiCovariant` | `Theory.Base`, `Analytic.MuMapAdjoint`, `Theory.FockOpApply`, `Theory.PsiApply` |
| `OPE/GopeRemainder.lean` | `OPE_GopeRemainder` | `OPE.Base`, `OPE.GwickGroupedFactor`, `OPE.SplitCorrCollapse`, `OPE.SplitCorrFderiv` |

Additional Mathlib imports from each Work file are at the top of its layer. The Work
options, scopes, variables, helper definitions, and proof bodies are preserved.

The extra prerequisite for `Sr_euclid` is `lineC_differentiableOn`, used to establish
holomorphicity of its Laplace transform. Its direct use of `measurable_weight` is also
made explicit by an import. `LineCDifferentiableOn` depends only on the analytic base,
measurability, and exponential integrability; it does not depend on `Sr_euclid`.
The resulting order is:

```text
MeasurableWeight, IntegrablePowExpWeight
  -> LineCDifferentiableOn
  -> SrEuclid
  -> PartialDerivSIntegral
  -> LineCEuclid
  -> ContLRoot
```

The actual `Sr_euclid` proof establishes its reflection/boost change of variables directly;
its existing `MuMapAdjoint` import is retained. The other three completed Work files need
no additional production imports beyond those already in their stubs. In particular,
`CutIdentity` imports neither `InnerPsi` nor `Theory`, and `PsiCovariant` imports neither
`InnerPsi` nor `Theory`. Thus no completed proof can reach its own public wrapper through
an import cycle. The kernel audit confirms all four are free of admissions.

## Remaining proof dependencies

The exact list of audited declarations depending on `sorryAx` is:

- `YangMills.FreeField.wightW_local`
- `YangMills.FreeField.Psi_local`
- `YangMills.FreeField.fockHost_good`
- `YangMills.FreeField.exists_fockHost`
- `YangMills.FreeField.exists_wightmanTheory`
- `YangMills.jointExistence_of_freeField`

Every one traces solely to `wightW_local`. Of these, only `wightW_local` and `Psi_local`
are TASKS lemmas. All other 73 TASKS lemmas, as well as `exists_ope_coefficient` and
`hier_reconstructed`, use exactly the three standard principles.

This is a dependency report on elaborated proof terms: importing the locality stub does
not make an otherwise independent theorem depend on its admission. In particular,
`inner_Psi`, all its other word-vector identities, `Psi_covariant`, and the analytic,
continuation, and OPE results are now clean.

## Mechanical insertion of the remaining locality proof

`FreeField/Work/wightW_local.lean` is still incomplete and has not been changed or imported
by production. Once its proof is complete:

1. Edit only `FreeField/Theory/WightWLocal.lean` for the proof insertion. Keep its existing
   imports:

   ```lean
   import FreeField.Theory.Base
   import FreeField.Analytic.SrEuclid
   import FreeField.Analytic.MatchingIntegrable
   ```

   Copy any additional Mathlib imports from the completed Work file to the top of this
   layer. If it uses further unprimed lemmas, import their provider modules, checking their
   import closure for cycles. Never import `FreeField.Theory`, `FreeField.Theory.InnerPsi`,
   or the Work file itself here; the first two already import `WightWLocal`.
2. Copy the completed Work helper code and primed proof before the original public
   statement. Remove the Work import of `FreeField.Theory` and its diagnostic `#print axioms`
   commands. Change its outer opening and closing namespace to
   `YangMills.FreeField.Consolidated.Theory_WightWLocal`. Preserve its own options, variables,
   `open`, and `open scoped` commands.
3. Preserve the original `wightW_local` signature and its current scopes verbatim. Replace
   only its proof hole (currently line 26) with:

   ```lean
     exact Consolidated.Theory_WightWLocal.wightW_local' u v A B f g h
   ```

4. Run `lake build` and `lake env lean FreeField/AxiomReport.lean`. The report automatically
   follows the completed proof instead of treating `wightW_local` as an admitted source.
   No report-list edit is required. If the proof is complete and uses only clean
   prerequisites, the expected counts become 75 of 75 clean TASKS lemmas, 81 of 81 clean
   audited declarations, and an empty `sorryAx` dependency list. Update this document's
   validation and dependency counts after that succeeds.

The existing `FreeField.Theory` import of `FreeField.Theory.WightWLocal` stays in place.
No change to `Main.lean` or the Lake module list is needed.

## Files changed in this pass

- `FreeField/Analytic/SrEuclid.lean`
- `FreeField/Theory/CutIdentity.lean`
- `FreeField/Theory/PsiCovariant.lean`
- `FreeField/OPE/GopeRemainder.lean`
- `FreeField/AxiomReport.lean`
- `FreeField/CONSOLIDATION.md`

No files were added or deleted. All other source files are unchanged from the start of
this pass, verified by content hashes.
