# C03 follow-up: short check of the answers to R1–R5 (agent review, no human acceptance)

- Issue #122; parent #26. Session `hairer-claude-c03-followup-check-20261113` (Claude, under the
  `hairer` account). Claim: <https://github.com/hairer/humanise-yang-mills/issues/122#issuecomment-6858927492>.
- Checked: PR #157 (head `a1cac3c`, merged as `0659f41`; author session
  `TrishenGunaratnam-codex-c03-r1-followup-20261113`) against R1–R5 of `README.md` in this
  directory. Branch state checked: `codex/existence-monograph` at `bee45a7`, where the seven files
  below are byte-identical to the PR head. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- This account wrote the review being answered and authored no C03 file; the author is a
  different contributor (Codex agent).
- **Outcome: R1–R5 are answered correctly; no further change requested.** As announced in
  `README.md` ("Next steps"), the seven chapters reviewed there now carry a positive agent
  mathematics and Lean-correspondence review, conditional on the inputs listed in `../../ledger.md`
  (among them the outstanding merger input I-C03-merger). Human acceptance remains separate.

## Item by item

| Item | Answer in PR #157 | Verdict |
| --- | --- | --- |
| R1 lead summability (`phase-quantitative-producer.tex`) | The merger input now assumes `∑ᵢ‖Pᵢ.x‖₁ < ∞` and calls the lead the absolutely convergent sum; it says that the remainder budgets do not control the leads. A new paragraph derives lead summability in the column application from a lead-price receipt (`∑‖uᵢ‖₁ < ∞`, `‖xᵢ − uᵢ‖₁ ≤ cᵢ` with `∑cᵢ < ∞`) by the triangle inequality; `prop:ex-selected-interpolation` and the closing paragraph now list the summable lead and remainder prices and the outstanding merger. Ledger row I-C03-merger updated, with `merge_density` added. | **Correct.** In the source, `YM.Extra.Histories.merge` sets `x := ∑' i, (P i).x` (`Lean/YM/Extra/SOURCE_HISTORIES/Merge.lean` 27); neither `merge_format` nor `merge_budget` (hypotheses: positive allowance, per-item `remBound`, `Summable t`) says anything about convergence of the leads, as the docstring at 33–34 notes. Making absolute summability a hypothesis is the right repair, and the triangle-inequality derivation is valid. |
| R2 orientation budgets (`thm:ex-fullmesh-fixedbounds-producer`) | The statement now assumes paid root-test budgets for each bounded row family **and each of its finitely many signed-coordinate and conjugated orientations**, with bounds allowed to depend on the oriented family and `k`; the proof says the hypothesis supplies them and takes the maxima of the depth and mesh thresholds over the finite list. Ledger row updated. | **Correct.** The proof now uses exactly what the theorem assumes. |
| R3 B04 premises (`reflection-transport.tex`, ledger I-C03-cutoff-covariance) | The paragraph now names the construction and hierarchy hypotheses, the conjugation-fixed real basis and internal genericity of the original grid, says that signed reflection preserves genericity and that the displaced combined configurations are generic for large `t` at fixed `i<j`, and states the limit order (mesh at each selected period before period). The ledger row lists the four premises plus point limits. | **Correct**, and the author adds an accurate remark: `YM.Work.B04.answer` (`Lean/YM/Work/B04.lean` 168–177) introduces `C.Makes`, `S.Hierarchy` and `Grid.plain` as unused arguments (`intro G C S F n v x k _ _ H _ hx …`) and uses only the point limits `H` and genericity `hx`; the premises are part of the public `YM.Bid.B04` interface (`Lean/YM/Bid/Phase.lean` 62–63). Genericity for large `t` matches `eventually_pair` (same file). |
| R4 citation (`actual-slab-copy-bounds.tex`) | Cites the commutation of conjugation with signed-coordinate transformations in `ex-reflection-transport` for `R_ρ\overline{R_s v} = R_{ρs}\overline v`. | Done. |
| R5 ledger row E3 | Sentence split: the single-insertion bound with `a_v = K = 4(D+1)` is separated from the union-level dependence on E4 (2)–(3). | Done. |

## Checks actually run

- Hash identity of the seven PR files between the PR head `a1cac3c` and the branch head `bee45a7`:
  `phase-quantitative-producer.tex` `0ecef89f…98bd`, `fullmesh-fixedbounds-producer.tex`
  `b41f6252…b558`, `reflection-transport.tex` `52815c8e…7ac`, `actual-slab-copy-bounds.tex`
  `4fc86ed9…2215`, `C03/ledger.md` `7333d069…02ca`, `C03/correspondence.md` `b3de5d5a…6d98`,
  `C03/validation.md` `1a15dc12…7b87`.
- Source reading at the pin: `Merge.lean` 15–75 (`merge`, `merge_format`, `merge_budget`);
  `Bid/Phase.lean` 62–63 (`B04`); `Work/B04.lean` 1–60 and 168–177 (`eventually_pair`, `answer`).
- Full monograph build at `bee45a7`
  (`latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex`): exit 0,
  974 pages, no undefined references or multiply defined labels. Rendered and inspected pages 143
  (merger input) and 169 (reflection application); `thm:ex-fullmesh-fixedbounds-producer` is on
  page 135, `ex-ordinary-reflection` on 170.
- Not run: Lean elaboration, axiom checks, kernel replay. The correspondence and validation
  additions of PR #157 were read only in the rows touching R1–R3.

## Next

Responsible human acceptance of C03 revision 1 with this follow-up. The merger statement and
proof (I-C03-merger) and the same-history purchase clauses remain outstanding inputs under #26.
