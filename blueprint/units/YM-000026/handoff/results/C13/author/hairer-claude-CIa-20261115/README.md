# (CI)(a) from the realignment (#375)

- **Session:** `hairer-claude-CIa-20261115` (Claude, on behalf of @hairer).
- **Base:** `codex/existence-monograph` at ff98ef2a, after #423. **Pin:** `3456e5e`.

## Change (`allarity-marked-propagation.tex`)

- **New `lem:allarity-common-insertion-realigned`.** At every leading rung after the first, clause (a) of (CI) holds: the entirely leading part of a cell integrates to Ã_{i,x}(exp_* D_χ^{(i)}) with the masked insertions Q_T. The proof has two steps.
  - The realignment (`subsec:allarity-realign`, now labelled) splits each mode into three parts: the prescribed source F_{c,I}, the discrepancy L_{c,I}, which goes to the remainder, and the off-healthy part, which goes to the forced alphabet. What stays leading is exactly χ_I c_I z_{(c,I)}, that is ι_c(D_χ).
  - `eq:planted-selection`–`eq:planted-integral` applied to these leading letters give the integral. The masked values are those shown after `eq:planted-selection`, and the measures are those of Ã, by the first identity of `sec:principal-gaussian-comparison`.
- **First leading rung.** There the same form of the top-level principal insertion, one masked prescribed piece per mode, is now stated as part of the terminal-source purchase (item 2 of the step-supply inputs).
- **Text updates.** The (CI) item in the step-supply input list and clause (a) itself point to the lemma.

## Second commit: bounded transport and the reference-mass inverse are proved

(CI) now has three clauses: (a), (b), and (c), the uniformity of the comparison data over base points, which was (e). The former clauses (c) and (d) are now consequences, proved in the new `lem:allarity-reference-bounds`:
1. ‖Ã_{i,x}(h)‖ ≤ K₀ sup|h|. This follows from `eq:principal-density-jets`, the cutoff jets, the product rule, and differentiation under the integral without derivatives of h, as justified in `sec:principal-gaussian-comparison`.
2. The zeroth coefficient of a_x lies in [1 − 2Ne^{−v+M/2}, 1]. At the base point T_{y₀} = id (`sec:gaussian-differentiation`), so R₆(0,z) = 1. Since χ₆ = 1 on ‖z‖ < v, the bound follows from `eq:principal-outage`.
3. ‖b_x^{−1}‖ ≤ β₀ = 2(n+1)(2K₀+3)^n. We have b₀ ≥ ½ from item 2 and ‖b−a‖ ≤ Π. Write b = b₀(1+u) with u nilpotent in the jet algebra of order n, so a finite Neumann sum gives the inverse.
4. ‖𝒢_{i,x}(h)‖ ≤ γ₀ sup|h|, with γ₀ = β₀(K₀+1).

K₀, β₀ and γ₀ are fixed polynomials in N, Q, S, so they have upper exponent 0. In the discrepancy proof the bound becomes 2β₀(1+γ₀)τ_nΠ and K = (1+γ₀)τ_n; y still has upper exponent −1/2.

## Remaining in (CI)

(b), the reference transport and the matching middle-level history; and (c), uniformity of the comparison data over healthy base points.

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- `python3 scripts/check_blueprint.py`.

## Third commit: what (CI)(c) amounts to

A paragraph after (CI) notes that in the payment paragraph of `sec:principal-gaussian-comparison`, every scale is a function of the rung coupling alone, except the primitive mean and covariance bounds J₀ and V₀ and their absolute jet bounds. So (CI)(c) is exactly the primitive comparison `eq:principal-primitive-comparison`, taken uniformly over healthy base configurations. That section already lists the primitive comparison as an input.

## Follow-up to the review of 32be344 (2026-11-15)

- **Build artefacts removed.** `existence.aux`, `.fdb_latexmk`, `.fls`, `.log`, `.out` and `.toc` had been committed by mistake in 32be344, and are now removed from the branch.
- **Measure identification is now an assumption.** The review pointed out that `eq:planted-integral` holds with its own supplied sector and tag measures, and does not by itself identify their joint loading and weights with the principal comparison integral for each partition product. I did not find a same-course bridge in the book that covers the union of read supports. That identification is now the assumption (CI)(a). The lemma assumes it and derives the integral statement from the realignment, and its proof says explicitly that the planted identity alone does not make the identification. The status item is updated to match.

Checks actually run: `latexmk -g -pdf existence.tex` (rc 0, 0 undefined references) and `python3 scripts/check_blueprint.py`.
