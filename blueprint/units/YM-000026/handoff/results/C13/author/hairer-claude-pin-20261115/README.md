# Reduction of the pin in (T2) to a pre-pin estimate (#415, step 3)

- **Session:** `hairer-claude-pin-20261115` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/415#issuecomment-6891686046
- **Base:** `codex/existence-monograph` at 29c74dca. **Pin:** `3456e5e`.

## Change (`actual-rank-purchases.tex`, after the statement of (T))

New `lem:rank-trace-pin-reduction`. Suppose the following:
1. 𝓗u = 𝒩_K p_u, the normal ordering of a plain polynomial of degree ≤ D with |p_u|₁ ≤ B|Au|₁, and |K_ij| ≤ ε;
2. the reader substitution is y_i ↦ ℓ_i + t a_i, with linear ℓ_i, a_i of degree ≥ 2, and |ℓ_i|₁, |a_i|₁ ≤ B;
3. the reading Λ has norm ≤ c;
4. the pre-pin estimate |Au − Λ(p_u∘(ℓ+ta))|₁ ≤ ε|Au|₁ holds.

Then the reading Tu = Λ((𝓗u)∘ℓ) of (T1) satisfies |Au − Tu|₁ ≤ (ε + cB a_D)|Au|₁, with a_D = DtB(2B)^D + ε w_D B^D and w_D = (D²/2)e^{D²/2}.

The proof uses three ℓ¹ bounds:
- linear substitution, factor B^D;
- the nonlinear correction, by telescoping;
- normal ordering, via |Δ_K y^α|₁ ≤ εm². This bound does not depend on the number of variables.

The closing paragraph of (T) now says that the pin reduces to the pre-pin estimate and items 1–3. The pre-pin estimate and the application of (T4) to the lifts remain unproved.

## Source correspondence (read at pin `3456e5e`, not built)

| Manuscript | Source |
| --- | --- |
| the lemma | `YM.Next.Rank.LiftMark.pins` (`Lean/YM/Next/RANK/Rails.lean`, l. 52) together with `stock` (`Lean/YM/Next/RANK/Pin.lean`, l. 41) |
| a_D | `annuity t B ε n` = n(tB)(2B)^n + ε(2(n+2))^n B^n (`Pin.lean`, l. 61). The source bounds the Wick error by ε(2(n+2))^n; the manuscript uses ε w_D. |
| items 1–2 | `MarkedStart` clauses 1–2 and `Diet` (`Pin.lean`, l. 32); the covariance hypothesis `hC` of `pins` |
| item 3 | `zonal … c` |
| pre-pin (item 4) | `MarkedStart` clause 4, `coin (expose b − trim (garnish T X t q)) ≤ |b| ε` |
| supplier of the pre-pin | `YM.Next.Rank.Spindle.prototype` (`Lean/YM/Next/RANK/RayGate.lean`, l. 199), from `WRead` and `Stamped`, with ε = bill(−1)(s) |

The source condition is 2c(ε + B·annuity) ≤ 1. Here it is ε + cB a_D ≤ ½, because the pre-pin estimate is stated before the reading, as in the source.

## Not done

- The pre-pin estimate. In the source it is `prototype` from `WRead`; translating that is the next step on #415.
- Checking that the actual insertion, reader map and covariance on the chart satisfy items 1–3 with bounded B and c.

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- `python3 scripts/check_blueprint.py`.
- Source files were read only; no Lean was built.
