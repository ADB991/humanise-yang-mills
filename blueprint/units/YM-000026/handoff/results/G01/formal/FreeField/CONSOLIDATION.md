# FreeField consolidation

Consolidation is complete. The production graph contains the completed proofs of all 75
TASKS lemmas, including `wightW_local` in `Theory/WightWLocal.lean`. There are no remaining
proof holes outside `Work/`. All original theorem statements and definitions are unchanged.

The final pass changes only `Theory/WightWLocal.lean`, `AxiomReport.lean`, and this document.
All Work sources, the public files, `Adequacy.lean`, `GroupIndependence.lean`, `Main.lean`,
the toolchain, the dependency manifest, and `lakefile.toml` are byte-for-byte unchanged,
verified against content hashes taken before the pass. No files were added or deleted.

## Validation

1. `lake build` succeeds: `Build completed successfully (8734 jobs).`
2. A code-token scan of all 71 Lean files under `FreeField/` outside `Work/` finds zero
   `sorry` tokens. Nested block comments, line comments, and strings are excluded. The
   pre-existing prose occurrence in the `Main.lean` docstring remains unchanged.
3. `AxiomReport.lean` requires every one of its 81 distinct declarations to depend on
   exactly `[propext, Classical.choice, Quot.sound]`: the main theorem, all 75 TASKS
   lemmas, and five assembly lemmas. Its task list was compared with `TASKS.md` in order.
   It checks both the cardinality and membership of the kernel dependency set returned
   by `collectAxioms`; any missing or additional dependency raises a build error.
   There is no admission exception or unfinished-source allowance. The standalone report
   also succeeds. Two temporary negative checks both exit with an error: an audited
   declaration with no primitive dependencies, and a whitelist omitting `Quot.sound`.
4. The same code-token scan finds zero `axiom`, `native_decide`, `opaque`,
   `implemented_by`, `unsafe`, or `sorryAx` tokens in production Lean code.
5. This document records the final layout, proof imports, strict audit, and completed
   validation. The production import graph is acyclic and imports no Work modules.

The plain command remains in `AxiomReport.lean:9`:

```lean
#print axioms YangMills.jointExistence_of_freeField
```

Its build output and the audit summaries are:

```text
info: FreeField/AxiomReport.lean:9:0: 'YangMills.jointExistence_of_freeField' depends on axioms: [propext, Classical.choice, Quot.sound]
info: FreeField/AxiomReport.lean:94:0: TASK AUDIT: 75 of 75 use exactly [propext, Classical.choice, Quot.sound].
info: FreeField/AxiomReport.lean:94:0: AUDIT PASSED: 81 of 81 declarations use exactly [propext, Classical.choice, Quot.sound].
Build completed successfully (8734 jobs).
```

Reproduce the build and standalone kernel report with:

```sh
lake build
lake env lean FreeField/AxiomReport.lean
```

A literal `rg` search also finds comments/docstrings; the acceptance scan distinguishes
Lean code from nested comments and strings.

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
`Theory/InnerPsi.lean` imports the Wightman multilinearity layers and the completed locality
theorem before exporting the word-vector identities.

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

## Final locality integration

The completed `Work/wightW_local.lean` proof is copied directly into
`Theory/WightWLocal.lean`, before the original public theorem, under
`YangMills.FreeField.Consolidated.Theory_WightWLocal`. Its internal `WightLocal` helpers,
definitions, lemma statements, proof bodies, options, variables, and scopes are preserved
verbatim. In particular, both `set_option maxHeartbeats 1000000 in` lines are unchanged.
Only its outer namespace, imports, and diagnostic-command placement differ. The stale
Work-file status header was not copied; the Work file itself remains unchanged.

The original public `wightW_local` signature and scopes are preserved verbatim. Its body
now reads:

```lean
  exact Consolidated.Theory_WightWLocal.wightW_local' u v A B f g h
```

The proof's direct production imports were selected from the definitions and unprimed
lemmas it actually references:

| Provider | Referenced definitions or lemmas |
| --- | --- |
| `Fock` | `Word`, `Word.lab`, `Word.test`, `wightW`; lower-level label, two-point, and Wick definitions through its prerequisites. |
| `Analytic.IntegrablePowExpWeight` | `integrable_pow_exp_weight` |
| `Analytic.LineCDifferentiableOn` | `lineC_differentiableOn` |
| `Analytic.LineCEuclid` | `lineC_euclid` |
| `Analytic.LineSSymm` | `lineS_symm` |
| `Analytic.MatchingIntegrable` | `matching_integrable`, `wightmanL_continuous` |
| `Analytic.MeasurableWeight` | `measurable_weight` |
| `Analytic.PartialDerivSBound` | `partialDeriv_S_bound` |
| `Analytic.SrEuclid` | `Sr_euclid` |
| `Analytic.WeightLe` | `weight_le` |

`weight_nonneg` and `weight_eq_zero` come from the analytic base through these imports.
The Work file's additional Mathlib imports, `Mathlib.Analysis.Complex.SqrtDeriv` and
`Mathlib.Analysis.Fourier.Convolution`, are retained. `Fock` already re-exports the analytic
layers; the explicit analytic imports document the proof's actual prerequisites.

The old `Theory.Base` import was narrowed to `Fock`, which supplies the word definitions.
The prerequisite closure consists of 23 production modules and contains neither
`Theory`, `Theory.WightWLocal`, nor `Theory.InnerPsi`. Thus none of the prerequisites can
depend on `wightW_local` or `Psi_local`. No re-layering, entry-point import change, or Lake
module-list change was needed. The downstream order remains:

```text
Fock + analytic layers
  -> Theory.WightWLocal
  -> Theory.InnerPsi (including Psi_local)
  -> Theory
  -> Main
  -> AxiomReport
```

No proof repair or weakening was required. The six declarations formerly affected by the
locality admission now all use exactly the three standard principles:

- `YangMills.FreeField.wightW_local`
- `YangMills.FreeField.Psi_local`
- `YangMills.FreeField.fockHost_good`
- `YangMills.FreeField.exists_fockHost`
- `YangMills.FreeField.exists_wightmanTheory`
- `YangMills.jointExistence_of_freeField`

## Earlier completed proof integrations

The four previously completed proofs were inserted into their designated existing layers. No module was added,
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

## Files changed in the final pass

- `FreeField/Theory/WightWLocal.lean`: completed proof and cycle-free prerequisite imports.
- `FreeField/AxiomReport.lean`: exact three-principle requirement for every audited declaration.
- `FreeField/CONSOLIDATION.md`: final state and validation results.

All other source files are unchanged from the start of this pass, verified by content hashes.
