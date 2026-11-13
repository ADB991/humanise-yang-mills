import FreeField.Main

/-! Kernel dependency report for all 75 tasks, the main theorem, and five assembly lemmas.
Every audited declaration must depend on exactly `[propext, Classical.choice, Quot.sound]`.
Any missing or additional kernel dependency is a build error.
Run with `lake env lean FreeField/AxiomReport.lean`, or as part of `lake build`.
-/

#print axioms YangMills.jointExistence_of_freeField
#print axioms YangMills.FreeField.weight_le
#print axioms YangMills.FreeField.measurable_weight
#print axioms YangMills.FreeField.integrable_pow_exp_weight
#print axioms YangMills.FreeField.weight_adjoint
#print axioms YangMills.FreeField.mu_map_adjoint
#print axioms YangMills.FreeField.Sr_euclid
#print axioms YangMills.FreeField.S_contDiffOn
#print axioms YangMills.FreeField.partialDeriv_S_contDiffOn
#print axioms YangMills.FreeField.partialDeriv_S_succ
#print axioms YangMills.FreeField.partialDeriv_S_neg
#print axioms YangMills.FreeField.partialDeriv_S_integral
#print axioms YangMills.FreeField.partialDeriv_S_bound
#print axioms YangMills.FreeField.lineS_symm
#print axioms YangMills.FreeField.lineC_differentiableOn
#print axioms YangMills.FreeField.lineC_euclid
#print axioms YangMills.FreeField.matching_integrable
#print axioms YangMills.FreeField.wightmanL_continuous
#print axioms YangMills.FreeField.Host.reconstruct
#print axioms YangMills.FreeField.fockOp_apply
#print axioms YangMills.FreeField.transOp_zero
#print axioms YangMills.FreeField.transOp_add
#print axioms YangMills.FreeField.transOp_norm
#print axioms YangMills.FreeField.transOp_continuous
#print axioms YangMills.FreeField.projOp_empty
#print axioms YangMills.FreeField.projOp_univ
#print axioms YangMills.FreeField.projOp_inter
#print axioms YangMills.FreeField.projOp_adjoint
#print axioms YangMills.FreeField.projOp_hasSum
#print axioms YangMills.FreeField.diagMeasure_finite
#print axioms YangMills.FreeField.diagMeasure_apply
#print axioms YangMills.FreeField.charFun_diagMeasure
#print axioms YangMills.FreeField.projOp_cone
#print axioms YangMills.FreeField.poinOp_one
#print axioms YangMills.FreeField.poinOp_mul
#print axioms YangMills.FreeField.poinOp_norm
#print axioms YangMills.FreeField.poinOp_continuous
#print axioms YangMills.FreeField.poinOp_translation
#print axioms YangMills.FreeField.rhoL_one
#print axioms YangMills.FreeField.rhoL_mul
#print axioms YangMills.FreeField.rhoL_bijective
#print axioms YangMills.FreeField.wightW_ofFn
#print axioms YangMills.FreeField.openAmpW_memLp
#print axioms YangMills.FreeField.openAmpW_eq_zero
#print axioms YangMills.FreeField.Psi_apply
#print axioms YangMills.FreeField.cut_identity
#print axioms YangMills.FreeField.inner_Psi
#print axioms YangMills.FreeField.Psi_nil_norm
#print axioms YangMills.FreeField.wightW_add_label
#print axioms YangMills.FreeField.wightW_smul_label
#print axioms YangMills.FreeField.wightW_add_test
#print axioms YangMills.FreeField.wightW_smul_test
#print axioms YangMills.FreeField.wightW_local
#print axioms YangMills.FreeField.Psi_add_label
#print axioms YangMills.FreeField.Psi_smul_label
#print axioms YangMills.FreeField.Psi_add_test
#print axioms YangMills.FreeField.Psi_smul_test
#print axioms YangMills.FreeField.Psi_adjoint
#print axioms YangMills.FreeField.Psi_tempered
#print axioms YangMills.FreeField.Psi_local
#print axioms YangMills.FreeField.Psi_covariant
#print axioms YangMills.FreeField.transOp_invariant
#print axioms YangMills.FreeField.Psi_faithful
#print axioms YangMills.FreeField.corrL_perm
#print axioms YangMills.FreeField.corrL_contDiffOn
#print axioms YangMills.FreeField.contL_differentiableOn
#print axioms YangMills.FreeField.contL_root
#print axioms YangMills.FreeField.contL_boundary
#print axioms YangMills.FreeField.lineS_kernelHyp
#print axioms YangMills.FreeField.gwickGrouped_factor
#print axioms YangMills.FreeField.splitCorr_collapse
#print axioms YangMills.FreeField.splitCorr_fderiv
#print axioms YangMills.FreeField.gope_coefficients
#print axioms YangMills.FreeField.gope_remainder
#print axioms YangMills.FreeField.Sr_asymptotic
#print axioms YangMills.FreeField.wickProfile_excluded
#print axioms YangMills.FreeField.fockHost_good
#print axioms YangMills.FreeField.exists_fockHost
#print axioms YangMills.FreeField.exists_wightmanTheory
#print axioms YangMills.FreeField.exists_ope_coefficient
#print axioms YangMills.FreeField.hier_reconstructed

namespace YangMills.FreeField.AxiomReport
open Lean Elab Command

run_cmd do
  let names : Array Name := #[
    ``YangMills.jointExistence_of_freeField,
    ``YangMills.FreeField.weight_le,
    ``YangMills.FreeField.measurable_weight,
    ``YangMills.FreeField.integrable_pow_exp_weight,
    ``YangMills.FreeField.weight_adjoint,
    ``YangMills.FreeField.mu_map_adjoint,
    ``YangMills.FreeField.Sr_euclid,
    ``YangMills.FreeField.S_contDiffOn,
    ``YangMills.FreeField.partialDeriv_S_contDiffOn,
    ``YangMills.FreeField.partialDeriv_S_succ,
    ``YangMills.FreeField.partialDeriv_S_neg,
    ``YangMills.FreeField.partialDeriv_S_integral,
    ``YangMills.FreeField.partialDeriv_S_bound,
    ``YangMills.FreeField.lineS_symm,
    ``YangMills.FreeField.lineC_differentiableOn,
    ``YangMills.FreeField.lineC_euclid,
    ``YangMills.FreeField.matching_integrable,
    ``YangMills.FreeField.wightmanL_continuous,
    ``YangMills.FreeField.Host.reconstruct,
    ``YangMills.FreeField.fockOp_apply,
    ``YangMills.FreeField.transOp_zero,
    ``YangMills.FreeField.transOp_add,
    ``YangMills.FreeField.transOp_norm,
    ``YangMills.FreeField.transOp_continuous,
    ``YangMills.FreeField.projOp_empty,
    ``YangMills.FreeField.projOp_univ,
    ``YangMills.FreeField.projOp_inter,
    ``YangMills.FreeField.projOp_adjoint,
    ``YangMills.FreeField.projOp_hasSum,
    ``YangMills.FreeField.diagMeasure_finite,
    ``YangMills.FreeField.diagMeasure_apply,
    ``YangMills.FreeField.charFun_diagMeasure,
    ``YangMills.FreeField.projOp_cone,
    ``YangMills.FreeField.poinOp_one,
    ``YangMills.FreeField.poinOp_mul,
    ``YangMills.FreeField.poinOp_norm,
    ``YangMills.FreeField.poinOp_continuous,
    ``YangMills.FreeField.poinOp_translation,
    ``YangMills.FreeField.rhoL_one,
    ``YangMills.FreeField.rhoL_mul,
    ``YangMills.FreeField.rhoL_bijective,
    ``YangMills.FreeField.wightW_ofFn,
    ``YangMills.FreeField.openAmpW_memLp,
    ``YangMills.FreeField.openAmpW_eq_zero,
    ``YangMills.FreeField.Psi_apply,
    ``YangMills.FreeField.cut_identity,
    ``YangMills.FreeField.inner_Psi,
    ``YangMills.FreeField.Psi_nil_norm,
    ``YangMills.FreeField.wightW_add_label,
    ``YangMills.FreeField.wightW_smul_label,
    ``YangMills.FreeField.wightW_add_test,
    ``YangMills.FreeField.wightW_smul_test,
    ``YangMills.FreeField.wightW_local,
    ``YangMills.FreeField.Psi_add_label,
    ``YangMills.FreeField.Psi_smul_label,
    ``YangMills.FreeField.Psi_add_test,
    ``YangMills.FreeField.Psi_smul_test,
    ``YangMills.FreeField.Psi_adjoint,
    ``YangMills.FreeField.Psi_tempered,
    ``YangMills.FreeField.Psi_local,
    ``YangMills.FreeField.Psi_covariant,
    ``YangMills.FreeField.transOp_invariant,
    ``YangMills.FreeField.Psi_faithful,
    ``YangMills.FreeField.corrL_perm,
    ``YangMills.FreeField.corrL_contDiffOn,
    ``YangMills.FreeField.contL_differentiableOn,
    ``YangMills.FreeField.contL_root,
    ``YangMills.FreeField.contL_boundary,
    ``YangMills.FreeField.lineS_kernelHyp,
    ``YangMills.FreeField.gwickGrouped_factor,
    ``YangMills.FreeField.splitCorr_collapse,
    ``YangMills.FreeField.splitCorr_fderiv,
    ``YangMills.FreeField.gope_coefficients,
    ``YangMills.FreeField.gope_remainder,
    ``YangMills.FreeField.Sr_asymptotic,
    ``YangMills.FreeField.wickProfile_excluded,
    ``YangMills.FreeField.fockHost_good,
    ``YangMills.FreeField.exists_fockHost,
    ``YangMills.FreeField.exists_wightmanTheory,
    ``YangMills.FreeField.exists_ope_coefficient,
    ``YangMills.FreeField.hier_reconstructed]
  let standard : Array Name := #[``propext, ``Classical.choice, ``Quot.sound]
  unless names.size == 81 && names.toList.eraseDups.length == names.size do
    throwError "Expected 81 distinct declarations: main theorem, 75 tasks, five assembly lemmas"
  for n in names do
    let axs ← collectAxioms n
    unless axs.size == standard.size && standard.all axs.contains &&
        axs.all standard.contains do
      throwError "Unexpected dependencies for {n}: {axs}; expected exactly [propext, Classical.choice, Quot.sound]"
  logInfo "TASK AUDIT: 75 of 75 use exactly [propext, Classical.choice, Quot.sound]."
  logInfo "AUDIT PASSED: 81 of 81 declarations use exactly [propext, Classical.choice, Quot.sound]."

end YangMills.FreeField.AxiomReport
