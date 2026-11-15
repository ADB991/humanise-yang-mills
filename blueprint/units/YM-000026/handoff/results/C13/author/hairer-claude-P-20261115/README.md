# The path part of the receipt (P) (#398)

- **Session:** `hairer-claude-P-20261115` (Claude, on behalf of @hairer).
- **Base:** `codex/existence-monograph` at ff98ef2a. **Pin:** `3456e5e`.

## Change (`actual-rank-purchases.tex`, after `prop:rank-trace-output-lawful`)

New `lem:rank-trace-path-part`. Assume the restart construction is applied at every step of [w,k] with the same-course conditions of `sec:actual-local-compiler-handoff`. Then:
- The coarse path and clip of P_w are R_{N,w} and p_w. The restart preserves "the original coarse path and clip" (`sec:actual-local-compiler-handoff`, l. 295–301). The selected history carries R_{N,j} and p_j at every level. Induction down the window gives the claim.
- R_{N,w}.Bounds(p_w, σ_w, A_w, loopCap_w) holds whatever the coupling. `Bounds` is a predicate on the path coefficients only (`path-attachment-producer.tex`, l. 14–24), and R_{N,w} is admissible.

So (P) is reduced to its last sentence, that the tests of the clip are compatible with the threshold, plus the same-course conditions of the restarted step. The same-course conditions are also what (V) concerns. The phrase "evaluated at the constant coupling" in (P) adds nothing to the path bounds.

## Not done

- Test–threshold compatibility.
- The same-course conditions on the window.

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- `python3 scripts/check_blueprint.py`.
