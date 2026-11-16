# C03: response to the source-leakage audit (#159), rows 47–57

Author session `ADB991-claude-20261113-0642` (Claude, running as a scheduled agent on behalf of ADB991; ADB991 had
not reviewed it before submission). Task issue #183, claim
https://github.com/hairer/humanise-yang-mills/issues/183#issuecomment-6859965987. Audit report: PR #164,
`results/source-leakage/` (base `97128ab`). This pass: base `codex/existence-monograph` @ `5d91534`. Source pin
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Lean read with `grep`/`sed` only; no Lean command was run.

Every row was located by its text at `5d91534` (line numbers below are at that base; rows 53–57 moved by
about 20 lines since `97128ab`). Content removed from the chapters is kept in `correspondence.md` (section
"Source-leakage pass"); new named inputs are in `ledger.md` (section "Inputs named in the source-leakage pass").

## Response table

| Row | File:line (at `5d91534`) | Audit class | Final class | Response |
| --- | --- | --- | --- | --- |
| 47 | `fullmesh-fixedbounds-producer.tex`:87 | B | B | Deleted "as in the source full-mesh receipts". The sentence now only says what the uniformity in `I` means. The pointer to the source structure (`YM.FullVolume.FixedBounds`) is in `correspondence.md`. No caveat was attached. |
| 48 | `fullmesh-fixedbounds-producer.tex`:114 | J | J → manuscript statement + named hypotheses | The steps that the sentence attributed to the source are already written out in the paragraph that follows. The sentence now says this is a separate closure argument given here. It also says that the primary paid trial, the exact equation with its vanishing owed cost, the bounded-coefficient receipt and the sweep for rows with zero projection are hypotheses of `thm:ex-fullmesh-fixedbounds-producer`; they are not proved in the chapter. Ledger: existing edge I-C12-primary (unchanged). No new argument. |
| 49 | `fullmesh-fixedbounds-producer.tex`:124 | ? | B | The identity `hops(F) = upper(y) + upper(x−y) − e` is proved in the next sentence (linearity of `upper` and the definition of `e`). Only the word "source" was leakage: "The source identity is" → "We have the identity". |
| 50 | `phase-quantitative-producer.tex`:96 | J | J → manuscript definition + proof + named input | "the source root test" → the centered root test of Definition `ex-centered-budget` (`centered-estimates.tex`). Of the three assumed properties, absolute homogeneity is now proved in one line from that definition: the `M` copies, original or conjugated, scale by `t` or `t̄`, so the product scales by a number of modulus `|t|^M`. The triangle inequality and invariance under complex conjugation stay assumed, and are named as input **I-C02-root-seminorm**. I did not find a proof of these in the manuscript, and I did not cite chessboard-estimate literature because I could not read it here. |
| 51 | `phase-quantitative-producer.tex`:244 | J | J → proof (new remark) + named input | The sentence was not used by the proof of `lem:ex-public-radial-choice`, whose schedule bounds are hypotheses. It is replaced by `rem:ex-public-radial-schedule`, which proves the hypotheses from schedule data. (i) The gain is now defined in the chapter opening as the calibrated `gain(j,m) = e^{(σ_j−σ_m)/8}` of `sec:actual-marked-portfolio-calibration`. Before, it was used without a definition. With this gain the decay hypothesis holds with equality, `C_m = 1`, `γ = 1/8`. (ii) `ℓ_j = o(σ_j)` and `log(1+c_j) = o(σ_j)` follow by telescoping, as in `ex-column-subpower`, from a logarithmic-cost bound `log c_{i+1} ≤ h_i^{-2} log L_i` with `h_i → ∞`, from `σ_{i+1} − σ_i = log L_i`, and from `c_i ≥ 1`. That the selected schedule has these properties is named as input **I-C03-schedule-cost**. The source derivation is `YM.Work.D01.columnLogs_le`, so the remark follows the source and adds no new argument. |
| 52 | `phase-quantitative-producer.tex`:251 | B | B | "satisfying the source plainness condition" → "tokens whose label is fixed by complex conjugation, `v_i^* = v_i`". This is the definition `YM.OS.Grid.plain v := ∀ i, star (v i).2 = (v i).2` (`Lean/YM/Phase/Approx.lean`:24), recorded in `correspondence.md`. |
| 53 | `phase-quantitative-producer.tex`:728 | J | J → named outstanding inputs | "The source status of its three purchase clauses is not uniform" → "Its three purchase clauses do not have the same status in this monograph". The forced clause stays attributed to the large-projection estimate (ledger I-C08-forced; carried-over point B-I-5 on its exact producer still not re-verified). The regular clause and the main clause are now named as outstanding inputs in the text. They are **I-C03-regular-clause** and **I-C03-main-clause** in the ledger, which already called them "open". |
| 54 | `phase-quantitative-producer.tex`:755 | J | J → manuscript proof + existing listed inputs | "The selected source route proves that (U_i(x)) is Cauchy from … receipts" → "We show that (U_i(x)) is Cauchy, conditional on the … receipts … listed at the end of this section; the same conclusion is proved in `sec:fullmesh-correlation-cauchy`". The Cauchy implication is proved in the section itself. The sentence "the upstream proof that the selected run supplies all the receipts is recorded separately below" now says that this supply is not proved here and that the receipts are the inputs listed at the end. These inputs are already ledger edges I-C02-service, I-C13-fixed-level and I-C09-fixed-rung. |
| 55 | `phase-quantitative-producer.tex`:841 | J | J → manuscript reference (input) | This sentence was inside the proof of `lem:ex-uniform-confluence-vault`, but the lemma is self-contained and its proof does not use it. The sentence is moved after the proof and reworded: in the application, the eventual uniform bound over configurations at each fixed rung is the eventual uniform boundedness supplied by the fixed-level comparison of `sec:fixed-rung-convergence`, as in `eq:fullmesh-vault`, and it is an input here (existing edge I-C09-fixed-rung). |
| 56 | `phase-quantitative-producer.tex`:1014 | B | B | Removed the paragraph "For source correspondence, …" (rows 56–57). Its content is in `correspondence.md`: branch stability gives confluence, the credit result gives the paid amounts, opened and marched weights, the pond package, and transition fields built from the history recurrence. The mathematical point it carried is already stated in the list of same-run receipts just above it. |
| 57 | `phase-quantitative-producer.tex`:1021 | B | B | The caveat "the mathematical production of them is not claimed here" is kept in the text as "The per-label transition fields used in the served-slab step are among these inputs; their construction is not proved here", and in `correspondence.md`. The sentence "The alternative detector route through trained rows and null-row sweeps is not called by this public construction" describes the formal route, so it moves to `correspondence.md`. The pointer to `ex-centered-construction` is kept. |

## Edits with mathematical content (need independent review)

- `prop:ex-public-origin`: a one-line proof of homogeneity of the root test, and a reference to Definition
  `ex-centered-budget` (row 50).
- Chapter opening: the definition of `gain(j,m)`, which was previously used without definition (row 51).
- New `rem:ex-public-radial-schedule` (row 51).
- Rows 48, 53, 54, 55: restatements of the status of inputs. No hypothesis was added to or removed from any
  theorem.

## Not done

- F4 (two treatments of the same-run Cauchy argument) is unchanged and still belongs to F01/G05.
- No literature citation was added for the triangle inequality of the root test. It may follow from
  reflection-positivity (chessboard) estimates, but I could not read a source here, so this is a lead, not a
  claim.
