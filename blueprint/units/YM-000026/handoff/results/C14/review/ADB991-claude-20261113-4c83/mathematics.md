# Mathematical validity: PR #256 delta `f3a0a4b..f9ddbdb`

Scope: every changed hunk of `manuscript/existence/trace-calibration-producer.tex` in the delta. Line numbers are at the head `f9ddbdb`. I also read the immediate consumer `manuscript/existence/actual-stress-normalization.tex` (l. 1–75), which is unchanged from the base. The earlier findings A1–A4 of review #260 (notation, early-index completion, exact identity range, calibrated-stress argument) concern text the delta does not touch, and they still stand.

## B1. Calibrated-stress set-up (l. 319–333)

The subsection now fixes the curve retained by the joint input. It then forms, for that curve's admissible choices, the corrected maps `C_{i,d}` and their completion `U_{i,d}`, and defines `U_i=U_{i,4}` and `Y_i(T)=r_i^4U_i^{-1}T`. The sentence "The theorem applies to every admissible choice, so it applies to this same retained curve" is now justified by the theorem as stated (B3). `Y_i` is defined at every `i` because `U_i` is an isomorphism at every index (review #260, A2). ✔

The text refers forward to the completion paragraph after the theorem ("described below"). The completion depends only on the maps `C_{k,d}`, so this forward reference is not circular. ✔

## B2. Joint-curve input (l. 335–377)

Order of quantifiers:

1. Fixed first: the physical and reference tables, their derivative maps, `R`, `R_0`, `O`, `κ`, the extraction and its ultrafilter.
2. Then: *there exist* a positive null sequence, admissible one-stage selections and finite-volume limits satisfying the theorem's hypotheses.
3. On the curve so obtained, with its corrected and completed maps, the following receipts hold:
   - the eventual optical kernel identity;
   - the coherence identities;
   - `𝓑_i →` an isomorphism in operator norm, and `‖X_i‖ ≤ C_1A_i`;
   - the correction receipts eq:ex-lattice-trace-correction-bound to eq:ex-lattice-trace-trace-inputs, with `𝓟_i=Y_i`;
   - `φ_i(R)→y≠0` and `φ_i(T̃_i)→y`.

This is exactly the shape requested in review #260. The receipts that use `U_i`, `Y_i` and `T̃_i` now come after those objects are defined, and they are quantified over the same witness as the charts. ✔

What is used downstream, and where it is supplied:

- **Rank one** (`lem:ex-lattice-trace-rank-one`). It needs property 3 (the optical kernel identity) and property 4 (stable inversion). Property 4 comes from `𝓑_i →` an isomorphism and `‖X_i‖ ≤ C_1A_i` via `lem:ex-lattice-trace-stable-inversion`. All of these are listed in the input. ✔
- **Correction limits** (`lem:ex-lattice-trace-correction-limits` with `𝓟_i=Y_i`). Its receipts are listed. ✔
- **Normalization** (l. 380–403). The two shell-flux limits are listed. "Since the conserved space has dimension one, eventually `T̃_i=t_iR`" then uses `R≠0`. This holds because `φ_i(R)→y≠0`. ✔
- **Further subsequences.** These are allowed only for all data together. Tails may depend on finite collections of grades, labels and tests. ✔

The second paragraph (l. 367–377) correctly separates two things. The existential one-curve input suffices for this application. Any all-sequence trace-asymptotic consumer must carry its own joint requirement. I found no claim in the delta that one curve supplies the all-sequence statement. ✔

**P1 (optional).** Item 2 asks the witness to satisfy *all* the theorem's hypotheses, including the prescribed-sequence one-stage property eq:ex-lattice-trace-one-stage. That property is used only in the theorem's existence clause, through `lem:ex-lattice-trace-strict-subsequence`. The conclusions about `C` are proved for any admissible selection and do not use it (B3). So for the one-curve application the property is redundant. It is also satisfiable whenever a chosen-radii curve exists: take `s_n` to be that curve's own radii and restrict the cutoff-`n` chart receipts to cutoff `d≤n` (`lean.md`, L1). The input is therefore correct as written but slightly over-specified. A sentence covering this, or a weaker wording ("an admissible strictly decreasing selection with the chart receipts"), would make the match with the source's one-curve route immediate.

## B3. The chart theorem and its proof (l. 605–664)

Hypotheses:

- a fixed positive null sequence with the one-stage property;
- fixed tables, inclusions, derivative maps, extraction and ultrafilter;
- the finite-volume lift bound;
- the exact unit, reality and signed-covariance identities;
- the dimension receipt;
- the reference separating-test property;
- the short-test bound at each cutoff.

Conclusions:

1. Admissible selections exist.
2. For every admissible selection and every choice of limits with the receipts, the resulting `C_{k,d}` have the following properties:
   - fixed-grade eventual bijectivity;
   - the unit, reality and covariance identities;
   - tested convergence and the uniform estimate eq:ex-lattice-trace-uniform-tests;
   - fixed-pair eventual inclusion compatibility.

Check of each step against the proof and the text above the theorem:

- **Existence.** This is `lem:ex-lattice-trace-strict-subsequence`. Its recursion (l. 433–444) is correct: lower index `n_d` and threshold `s_{n_d}` give `n_{d+1}>n_d` and `s_{n_{d+1}}<s_{n_d}`, and `n_d→∞` forces `s_{n_d}→0`. ✔
- **Ultralimits.** For fixed `k` the lifts are bounded on a late set, and `𝓛_k` is finite-dimensional. So the ultrafilter limit `Y_k` exists (l. 544–561). Given the ultrafilter it is unique, so "every choice of finite-volume limits" adds no generality but is harmless. ✔
- **Exact identities.** Reality, signed reflection and the unit identity hold on an ultrafilter set and pass to the limit by continuity. ✔
- **Tested estimate.** The short-test bound passes to the limit by the `η`-slack argument (l. 566–586). ✔
- **Bijectivity.** The separating-test argument (l. 588–603) uses the reference separating-test property, which is now listed among the hypotheses. Before the delta it was used but not listed, so this is an improvement. Together with the dimension receipt it gives eventual bijectivity for each fixed `d`. ✔
- **Uniform estimate.** The finite-slot expansion (l. 652–660) has a number of terms and labels independent of `k` and `t`, which gives the `(k+1)^{-1}MK_v` bound. ✔
- **No hidden receipts.** None of the steps uses the optical, beam, trace or shell-flux receipts, so removing them from the hypotheses is correct. The added closing sentence of the proof ("uses only the stated receipts … applies to every admissible choice") is accurate. ✔

R1 of review #260 is therefore resolved.

## B4. Uniform estimate for the completed maps (l. 670–678)

Fix a tuple `v` with grades `d_1,…,d_n`. For each `a`, `U_{k,d_a}=C_{k,d_a}` for `k≥K_a`. Put `K=max_a K_a`. For `k≥K`, `A^U_{k,v}(t)=A^C_{k,v}(t)` for every test `t`, because the tested correlation depends on the maps only through these `n` grade maps. The supremum over tests therefore agrees for `k≥K`, and eq:ex-lattice-trace-uniform-tests transfers to `U`. ✔ (O1 of review #260 is resolved.)

**P2 (optional, outside the delta).** The consumer's maps are `U_{k,d}`, but it cites the theorem, which is about `C`, for eq:stress-uniform-tests (`actual-stress-normalization.tex` l. 44–50). The proof of the transfer is in the completion paragraph, which has no label. A label there, cited by the consumer, would complete the chain. The consumer is unchanged by this PR.

## B5. Prescribed-scale selection (l. 407–453)

- The heading and the opening now present eq:ex-lattice-trace-one-stage as an *assumed* input for a prescribed sequence. ✔
- The new remark (l. 446–453) is correct. A good radius below every threshold need not belong to a given sequence. A chosen-radii construction picks its own radii, so it yields the one-stage property only for its own radius sequence. ✔
- The sentence "If that input is available for every positive null sequence, the conclusion holds for every such sequence; that additional availability is not proved here" is accurate. ✔

N1 of review #260 is resolved. The base text's attribution of the every-sequence statement to "the scale part of the source" is gone.

## B6. Closing paragraph (l. 688–702)

"Production of the full calibrated curve" now lists the chart selection, "with the stronger prescribed-sequence property if that version is requested", among the outstanding analytic inputs. This matches B2 and B5. ✔

## Conclusion

No mathematical error in the delta. R1, R2, O1 and N1 of review #260 are resolved. P1 and P2 are optional.
