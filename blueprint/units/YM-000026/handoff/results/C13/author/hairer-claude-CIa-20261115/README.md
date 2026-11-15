# (CI)(a) from the realignment (#375)

- **Session:** `hairer-claude-CIa-20261115` (Claude, on behalf of @hairer).
- **Base:** `codex/existence-monograph` at ff98ef2a, after #423. **Pin:** `3456e5e`.

## Change (`allarity-marked-propagation.tex`)

- **New `lem:allarity-common-insertion-realigned`.** At every leading rung after the first, clause (a) of (CI) holds: the entirely leading part of a cell integrates to Ã_{i,x}(exp_* D_χ^{(i)}) with the masked insertions Q_T. The proof has two steps.
  - The realignment (`subsec:allarity-realign`, now labelled) splits each mode into three parts: the prescribed source F_{c,I}, the discrepancy L_{c,I}, which goes to the remainder, and the off-healthy part, which goes to the forced alphabet. What stays leading is exactly χ_I c_I z_{(c,I)}, that is ι_c(D_χ).
  - `eq:planted-selection`–`eq:planted-integral` applied to these leading letters give the integral. The masked values are those shown after `eq:planted-selection`, and the measures are those of Ã, by the first identity of `sec:principal-gaussian-comparison`.
- **First leading rung.** There the same form of the top-level principal insertion, one masked prescribed piece per mode, is now stated as part of the terminal-source purchase (item 2 of the step-supply inputs).
- **Text updates.** The (CI) item in the step-supply input list and clause (a) itself point to the lemma.

## Remaining in (CI)

(b), the transport and the matching middle-level history; (c), bounded transport; (d), the reference-mass inverse; (e), uniformity over base points.

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- `python3 scripts/check_blueprint.py`.
