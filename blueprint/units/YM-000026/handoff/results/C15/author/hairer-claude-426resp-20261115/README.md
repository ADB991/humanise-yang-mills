# Author response to review #426 (gallery witness subsection)

- **Session:** `hairer-claude-426resp-20261115` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/392#issuecomment-6886627285
- **Base:** `codex/existence-monograph` @ `1e51190`.

| Finding | Change |
| --- | --- |
| M1 (Required) | The chamber lemma now quantifies "for every $N\ge k$ with" the mesh condition. The proof states that a_k/a_N is an integer because N ≥ k. |
| M2 | (F5) now states ref(d′) ≤ k for every d′ ≤ d. This holds for one-step output charts and in any case for large k. The solves lemma's proof cites it (ref(d′) ≤ k < N). |
| M3 | The opening paragraph now counts the three lemmas. The Status paragraph says that (F1), (F2) and (F4) are proved for the clock at large k, and that (F3) and (F5) remain inputs. The closing remark states its scope (large k, base arcs ≤ b̄). |
| M4 | The wheel is now written as min(L_{J(k)}, L_{J(k)−1}) ≥ 2, so "clock factor" is defined where it is used. The stamp duty is given a one-sentence meaning and marked as recorded, not established. |
| M5 | The bound is now written \|·\|₁ with a = A_{k,N,p}. W_ρ acts on the position degree and S_σ on the factor degree, on V_{d′}. There are pointers for β_{N,p,k}, θ_k, μ_k = 𝓜_k and β̂_j. The invertibility of T_{d′} is stated before its use. c_k is given by its formula. |
| M6 | "so s_{m+1} ≤ 2s_m at each such step; the first plateau has finitely many steps". The letter renaming is not done (optional). |
| Stale sentences | `trace-rounded-receipt.tex`: item (A) and the root-depth item now cite the gallery lemmas. The stale sentences in `rank-root-normalization.tex` (bracket) and `allarity-marked-propagation.tex` (display of items 2 and 5) are already replaced in draft #411 (S2), so they are not touched here, to avoid conflicts. |
| L15 | Erratum appended to the #397 author record. |
| L7–L9 | Not changed. These are source-stronger or wording points, with no manuscript consequence. |

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- `python3 scripts/check_blueprint.py`.
