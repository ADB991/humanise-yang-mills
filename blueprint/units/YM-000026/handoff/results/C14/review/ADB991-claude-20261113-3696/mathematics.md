# Mathematical validity: PR #256 at `f3a0a4b`

Scope: every changed hunk of `manuscript/existence/trace-calibration-producer.tex` (line numbers below are at the PR head), with the immediate consumer `manuscript/existence/actual-stress-normalization.tex` (unchanged; base and head agree). This report does not cover the chapter's unchanged analytic receipts.

## A1. Notation (lines 321–338, 439–558, 632)

Every former raw `U_{k,d}` in the recursion (`eq:ex-trace-corrected-lift`), the exact inclusion calculation, the symmetry induction, the mixed-slot identity, the gluing (`U^raw_{k,d}=P_d∘Y_k(d)`), the short-test bound and the separating-test argument is now `U^raw`. `C_{k,d}` is used for corrected maps. `U_{k,d}` (no superscript) appears only in the calibrated-stress subsection and in the completion paragraph, where it means the completed isomorphisms. I found no remaining collision. The mixed-slot identity is unchanged in content: the slots already corrected use `C`, the others `U^raw`. With `p_i=R_dv_i` and `q_i=(1-ι^E_dR_d)v_i`, the recursion gives `C_{k,d+1}v_i = ι^S_d C_{k,d}p_i + U^raw_{k,d+1}q_i`. The table inclusion identity then turns the first term into a grade-`d` slot. The identity displayed at lines 478–482 follows.

## A2. Early-index completion (lines 653–669)

Definition: for each `d`, fix `k_d≥d` with `C_{k_d,d}` invertible; it exists by the theorem's eventual invertibility. Set `U_{k,d}=C_{k,d}` if `d≤k` and `C_{k,d}` is invertible, and `U_{k,d}=C_{k_d,d}` otherwise.

- Each `U_{k,d}` is an isomorphism `E_d→S_d`. ✔
- For fixed `d`, the set `{k : U_{k,d}≠C_{k,d}}` lies in `{k<d} ∪ {k : C_{k,d} not invertible}`. This set is finite, because invertibility holds on a tail. ✔
- Tested limits: a fixed tuple uses finitely many grades. Hence `A^U_{k,v}=A^C_{k,v}` for all large `k`, and the limits agree. ✔ (The uniform-in-tests estimate transfers the same way. This is not said; see O1.)
- Balanced identity for `U`: for fixed `d≤e`, on the intersection of the agreement tails of `d` and `e`, which also requires `k≥e`, `U_{k,e}ι^E_{d,e} = C_{k,e}ι^E_{d,e} = ι^S_{d,e}C_{k,d} = ι^S_{d,e}U_{k,d}`. ✔
- Unit, reality and signed covariance for `U`: these hold for `C_{k,d}` whenever `d≤k`. The unit identity follows from the grade-zero unit identity and the balanced relation, `C_{k,d}1_d = C_{k,d}ι^E_{0,d}1_0 = ι^S_{0,d}C_{k,0}1_0 = 1^S_d`. They transfer to `U` on the agreement tail. ✔
- The claim that no tail is uniform in all grades is correct, and nothing downstream needs one. The consumer `sec:actual-stress-normalization` asks only for fixed-grade and fixed-pair eventual properties and for invertibility at every index. ✔

The base text set `U_{i,d}=C_{i,d}` and applied `U_i^{-1}`, which could be undefined at early `i`. The completion removes this defect without changing any limit. Of the claims in this paragraph, only "the same argument transfers the unit and symmetry identities" is left to the reader, and it is immediate.

## A3. Exact identity range (lines 456–461)

`C_{k,d}` is now defined only for `d≤k`, so restricting the balanced identity to `d≤e≤k` is correct. The induction on `e` uses `R_dι^E_d=1` and transitivity of the inclusions, and stays within grades `≤k`. ✔ The theorem's final clause ("for all sufficiently large `k`") is consistent with this, since `k≥e` eventually.

## A4. Calibrated-stress subsection (lines 321–365)

With `U_i` invertible at every `i`, `Y_i(T)=r_i^4U_i^{-1}T` is defined. The remainder of the normalization argument is unchanged and correct: Lemma `lem:ex-lattice-trace-correction-limits`, rank one, `t_i=φ_i(T̃_i)/φ_i(R)→1`. The sentence "Every use of grades four and five below is restricted to a common tail on which their corrected maps are invertible and the stated optical and coherence identities hold" is correct as a restriction. "Optical" refers to the optical map of the chapter's first subsection.

## A5. Joint-curve input and the theorem (lines 565–628) — R1, R2

1. **What is assumed.** The tables, derivative maps, `R`, `R_0`, `O`, `κ`, the extraction and the ultrafilter are fixed first. Then, for every null sequence, there exist admissible one-stage choices and finite-volume limits such that every correction and normalization receipt holds on the resulting corrected curve. This is the right shape for PR #177's request: a single curve and a single choice of fixed data, with subsequences applied to all receipts together. The closing paragraph correctly says that separate curves, or ratios of scalar normalizers, would not supply it.

2. **R1 (required, minor).** The theorem is existential: "there is … `n_k` … and there are corrected maps `C_{k,d}`". The calibrated-stress subsection uses "the corrected maps `C_{i,d}` of Theorem …" and then assumes the receipts on "these same" charts. For the argument to be valid, the theorem's curve must be the joint-input curve. That is true, because the proof applies to every admissible choice. The statement does not say so. Moreover, the theorem lists as hypotheses the correction receipts (eq:ex-lattice-trace-correction-bound to eq:ex-lattice-trace-trace-inputs) and the shell-flux limits `φ_i(R)→y`, `φ_i(T̃_i)→y`. These are formulated through `U_i=U_{i,4}`, `Y_i` and `T̃_i`, which are built from the theorem's own conclusion and the completion after it. The proof does not use them. As written, the hypotheses of the theorem refer to objects defined from its conclusion. Required: (a) say that the conclusions hold for every admissible choice of the selections and limits, in particular on the joint-input curve; (b) remove the correction, beam, trace and shell-flux receipts from the theorem's hypotheses. Keep them as the joint input consumed in the calibrated-stress subsection, where they are used. No mathematical content changes.

3. **R2 (recommended).** Assuming the joint input for *every* positive null sequence is stronger than the consumer needs. `sec:actual-stress-normalization` constructs "one physical tensor and one comparison curve", and the source's trace interface is indexed by one `J : Scaling S` (`lean.md`, L3). An existential input (there exist a null sequence and admissible choices with all receipts) is a weaker outstanding obligation and suffices for every consumer I found (`git grep` for `thm:ex-lattice-selected-trace-gallery` at the head: only `actual-stress-normalization.tex:47` and this chapter).

## A6. Remaining text

Lines 671–685 are unchanged and remain accurate about what the chapter does not prove.

No other mathematical issue was found in the delta.
