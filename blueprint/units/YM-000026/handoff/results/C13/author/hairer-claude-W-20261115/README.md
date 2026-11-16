# Discharging (W): the regular remainder at the restored weight (#413)

- **Session:** `hairer-claude-W-20261115` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/413#issuecomment-6891614600
- **Base:** `codex/existence-monograph` at 29c74dca. **Pin:** `3456e5e`.

## Change (`allarity-marked-propagation.tex`)

- **New input (E), the spare-exponent run.** This is the purchase that (F) already required: the compiler, realignment and support-reserve bounds at exponent e+1+σ on the leading interval. It is now stated once and has two conclusions at the middle level:
  - regular remainder ≤ H^{κ−q};
  - forced background ≤ G(x_ℓ).
  
  Both are at ω₋ and e+1+σ. (E) gives the first clause of (F).
- **New display `eq:allarity-dispersal`.** cov_B X ≥ λ t(X), with λ = D'/(3(2B+1)), for every support X with t(X) ≥ 2, forced or regular. The proof is the existing (S) argument, which never used that X is forced.
- **New `lem:allarity-remainder-restored`.** It replaces the input (W). The multi-cell letters are handled as follows.
  - Their supports contain the readers of their marks, by `lem:allarity-reader-containment`, and r_{c,j} ∈ X_{c,{j}} ⊆ Y_c. So t(X) ≥ t(I).
  - The dispersal bound then gives σ cov_B X ≥ Un t(I) log H for large s.
  - Monotonicity of chg_e in e turns (E) into p₁ ≤ H^{κ−q} at e and p₂ ≤ H^{κ−q} at e+σ.
  - `lem:allarity-weight-raise` then gives ≤ H^{−1} at ω, provided q ≥ κ+Un+2.
- **`prop:allarity-launch`** now assumes (E), the hypotheses of reader containment, and halo distance D' at the middle level, in place of (W), (F) and (S). (F) and (S) are derived in the proof. The status list and the parameter order are updated, and q ≥ κ+Un+2 is now a required parameter condition.

## Second commit: (E) as the existing inputs at e* = e+1+σ

(E) is now stated as the inputs already listed for the leading interval, required at the exponent e* = e+1+σ instead of e. These inputs are the applicability of the upper calculation and the terminal-source purchase. (E) also requires α ≥ 8T_{e*}, and σ ∈ (0,1] is fixed with e, before α.

The new `lem:allarity-spare-run` proves that the step-supply conclusions then hold at e*, with the same κ. The step-supply subsection uses the exponent only through R_e, R_{e+1} and T_e; I checked this by listing every occurrence in lines 296–600. A single run at e* replaces the run at e, by monotonicity of chg_e.

A remark examines the support purchase of the upper calculation at e*. In `sec:actual-mixed-marked-compiler` it is the block-length condition 10·15⁴(e*+7) ≤ L e*. This holds at all large stages because L_j → ∞: `eq:common-drift-floor` gives log L_j ≥ j²λ_j, and λ_j ≥ log 101. The other purchases inside "applicability of the upper calculation" are not examined at e*, in particular the unmarked compiler's purchase "for the larger support exponent".

The parameter order is now e, σ, α ≥ 8T_{e+1+σ}, b̄, U, q. I also updated the step-supply input list to name (CI), a leftover from #423.

## Net effect

(W) and the spare-exponent clause of (F) are no longer separate inputs. Both follow from the leading-interval inputs at a slightly larger fixed exponent, plus geometry that is proved for the trace chart (`lem:allarity-halo-separation`, `lem:allarity-reader-containment`).

## Not done

The applicability of the upper calculation, at e* as at e, remains an input. Only its support-cover floor is checked here.

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- `python3 scripts/check_blueprint.py`.
