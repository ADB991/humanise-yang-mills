# #375: one-step hypotheses of the allarity recurrence on the leading interval (author note)

- Session: `hairer-claude-375-20261114` (Claude, on behalf of @hairer).
- Claim: https://github.com/hairer/humanise-yang-mills/issues/375#issuecomment-6878623922
- Base: `codex/existence-monograph` @ `3166276`.
- Pin: `3456e5e`.
- Status: **draft, unreviewed**. It needs an independent review by an account other than `hairer`.

## Output

New `subsec:allarity-step-supply` in `manuscript/existence/allarity-marked-propagation.tex`, with no edits to existing text.

**Placement deviation from the claim:** the subsection is inserted after the marker-weight paragraph, just before `\subsection{The scalar envelope…}`, not before it. It uses `eq:allarity-weighted-discrepancy` and the weight ω, which are defined there.

Contents:
- `lem:allarity-step-outputs`: from the upper calculation of `sec:actual-mixed-marked-compiler`, with z ∈ [H^{-q}, H^{-4}], leading budget H^{-4} and forced input G(y_i):
  - nonleading marker-root price ≤ H^{-3}/l ≤ (α+1)z;
  - leading price ≤ T_eη + a ≤ H^{-3} ≤ H^{-2};
  - forced site price ≤ (e^Σ−1)/m ≤ G(x_i)².

  The window z ≤ H^{-4} is preserved, because d_{k−l} ≤ H^{1−q}.
- `lem:allarity-step-charge`: R_e = exp{e(⌈a⌉+1)^4}, a constant (prescribed supports lie within aB of a reader).
- `lem:allarity-step-discrepancy`: y = τΠ from `eq:principal-comparison-final`, where Π has upper exponent −1/2 and τ has upper exponent < 1/2. This gives `eq:allarity-weighted-discrepancy` eventually.
- `lem:allarity-step-purchases`:
  - G_i + nH^{-2}R_{e+1} ≤ H^{-1}, since G decays faster than any power of H;
  - (2B_i+1)^4 ≤ H for log log s ≥ 17;
  - e^{1/H} − 1 ≤ 1;
  - the step count (α+2)^{k−ℓ} ≤ H. This comes from a_{ℓ+1}/a_k < H^{b+2}, the bracket J(j) ≥ J(k)−1 on [ℓ, k], and the block-length floor log L_j ≥ 2(b̄+2) log(α+2) (`eq:allarity-length-floor`).
- A status paragraph lists four open inputs:
  1. the applicability and primitive purchases of the upper calculation;
  2. the leading budget H^{-4} and the terminal-source purchase. This is a **mismatch**: the #374 launch bound coin ≤ ξ.principal = H^{credit} is a positive power of H, and the converting normalization was not located;
  3. the identification of the prescribed connected polynomial with the Gaussian reference integral, and the exponent of τ;
  4. the block-length floor, to be added to the floors of `sec:public-run-binding` with α and b̄ fixed first.

## Source correspondence (textual, at the pin)

| Manuscript | Source |
|---|---|
| one-step outputs on [ℓ, k) | `PlesseySky.sparks` (`Prom/Front/West/Dink.lean`): `IgnFtSky`/`PleaFtSky` with price `loot B x u`, produced by `billing_XSky` (`PayW.lean`) from the witness tariff `LegacyCostSky.tariff` (`TimeBand`, `PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Chimes.lean`: fields `upper`/`lower`/`day`/`night` ↔ the upper/lower calculations) |
| rungs [w, ℓ) (not treated) | `PlesseySky.dark` (`NonLeadingSky`) ↔ the lower calculation; belongs to #376 |
| purchases (geometry, step, margin) | `Caff` (`MergeProof/West/Longbow.lean`), a witness field `LegacyCostSky.room`. Its fields: `horizon` (6n+3 ≤ a/(3+2n)); `flare` (1−q ≤ −uV−2); `pastry` (e^l·gas² + n·H^{-2}·R_{e+1} ≤ H^{-1} ↔ second purchase); `lit`/`buys` (discrepancy-type purchases); `hikes` (step-count-type) |
| bracket on [ℓ, k] | `AllowedSky.bracket` (#374 report §2) |
| recurrence assembly | `Peak.InstanceSky` via `x_crushedSky`, `turns_XSky` in `tenderlySky` (`Equity.lean`) |

The source buys these purchases in the cost witness (`Order/Sofa.lean`, `office`), eventually in the clock scale s, per stage. The manuscript derivation above is independent and explicit. I did **not** match `Caff.hikes`, `lit` or `buys` term by term, nor `loot B x u` against (α+1)z. That matching is left for review.

## Checks actually run

- `latexmk -pdf -interaction=nonstopmode -halt-on-error existence.tex`: exit 0, 1043 pages, 0 undefined references. pp. 789–792 inspected.
- `python3 scripts/check_blueprint.py`: see the PR.
- No Lean elaboration.

## Errata after review #409 (session hairer-claude-409resp-20261114)

- `loot` is the marker weight H^{1/(8u)−U} of the upper interval (`YM.Next.Rank.Tapes.West.loot`, `cashFt`), not a remainder-price multiplier.
- In `Caff`, the field roles are: `lit` buys the leading budget H^{−4} at weight `loot`; `buys` buys the discrepancy; `hikes` bounds polynomial transport growth.
- The source counterpart of the step count (α+2)^{k−ℓ} ≤ H is `YM.Next.Rank.Tapes.Racer.log` (`Purse.race = α+2`).
- The manuscript now runs the leading interval at the smaller weight ω₋ = H^{1/(8u)−U}, as the source does (`divySky`). The step count is `lem:allarity-upper-count-power`. The block-length floor and the old step-count purchase are removed. The prescribed supports are defined with radius QB, Q ≥ a (source: `d_olmSky`, `roomTestSky.radius`).
