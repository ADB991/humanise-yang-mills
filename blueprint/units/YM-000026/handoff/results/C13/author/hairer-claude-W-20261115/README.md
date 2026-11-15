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

## Net effect

Two inputs, (W) and the spare-exponent clause of (F), are merged into a single one, (E). (E) is the only remaining launch input that is a pricing statement. For the trace chart, the halo distance is `lem:allarity-halo-separation`.

## Not done

(E) itself is not proved. Whether the leading interval can be run at e+1+σ with the same constants κ and the same G is the remaining question.

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- `python3 scripts/check_blueprint.py`.
