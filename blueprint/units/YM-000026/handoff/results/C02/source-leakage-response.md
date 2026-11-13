# C02: response to the source-leakage audit (#159), rows 18–22 and 32–45

Author session `ADB991-claude-20261113-b6b4` (Claude, running as a scheduled agent on behalf of ADB991; ADB991 had
not reviewed it before submission). Task issue #182, claim
https://github.com/hairer/humanise-yang-mills/issues/182#issuecomment-6860393894. Audit report: PR #164,
`results/source-leakage/` (base `97128ab`). This pass: base `codex/existence-monograph` @ `69b2631`. Source pin
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Lean read with `grep`/`sed` only; no Lean command was run.

Every row was located by its text at `69b2631`. Rows in `rg-construction.tex`, `rg-multisource.tex` and
`centered-public-service.tex` have moved by up to 12 lines since `97128ab`. Content removed from the chapters is kept
in `SOURCE-LEDGER.md` (section "Source-leakage pass (#182)"). New named inputs are in `RESULTS.md` (section "Inputs
named in the source-leakage pass (#182)"). `manifest.json` still records the chapter hashes of the earlier author
snapshot; it was not refreshed, since a hash refresh is not an author statement about the new text.

## Response table

| Row | File (line at `69b2631`) | Audit class | Final class | Response |
| --- | --- | --- | --- | --- |
| 18 | `rg-construction.tex`:106 | B | B | "These are the source's entrance ticket and two adjacent row prices" → "We call `E_X(j)` the entrance ticket at stage `j`; its last two summands are the two adjacent row prices." Names only; no caveat. |
| 19 | `rg-construction.tex`:479 | ? | N | "zero interior source, source decay exponent `c_0=θ`" names the inhomogeneous term and decay exponent of the scalar recurrence of `sec:ex-lattice-flat-rate`. Mathematical use; no change. |
| 20 | `rg-multisource.tex`:92 | B | B | "This is the source's nonempty-support counting argument" → "This counts each fee once, at a site of its nonempty support." The sentence that follows (the finite-volume factor is needed for summability and is not absorbed into the rooted budget) is kept. |
| 21 | `rg-multisource.tex`:166 | J | J → manuscript reference + existing inputs | The paid gas response is obtained in `subsec:ex-lattice-rg-crowd` of the same chapter: the hard and soft budgets are combined into the rate price `eq:ex-lattice-multi-capital`–`eq:ex-lattice-multi-rate`, and the hard/soft fusion lemma of `sec:soft-log-fusion` (C08), applied through finite-product harvesting, gives the gas payment. The sentence now says this, and says that the arrival certificates returning the rate price are inputs there (existing edge `C08-to-C02-soft-log-fusion` / `C16-to-C02-nonlinear-payment`). No new argument. |
| 22 | `rg-multisource.tex`:226 | J | B | The claim is visible in the definitions just displayed: both `F(H)` and `Q` have exponent argument `a=e+2`. "In the source both footprint prices use the base budget's support exponent plus two" → "In both footprint prices the exponent argument is `e+2`, the base budget's support exponent plus two". Nothing is deferred. |
| 32 | `centered-construction.tex`:258 | ? | J → named input | The paragraph said the run selector, same-history section supplier and terminal supplier "provide" the one-step inputs and pointed to "the source trace and exact upstream declaration chain". It now says that producing these inputs uniformly on one selected history is not proved in the chapter, lists the inputs, and names them **I-C02-funded-record** (the same record that is the hypothesis of `thm:ex-selected-run-service`). The caveat "uniform bounded-label inequalities are not derived from earlier data" is kept in the text. The supplier names are in `SOURCE-LEDGER.md`. |
| 33 | `centered-freight-producer.tex`:33 | J | J → named input | "the source's finite interpolation lemma has this conditional interface" → "we use the following finite interpolation statement, named as input **I-C02-finite-interpolation**". The last sentence now says that the statement and its three analytic coupon estimates are inputs, and names the candidate producer `sec:heading-history-handoff` (C09; existing provisional edge `C09-to-C02-heading-and-tickets`, not accepted). |
| 34 | `centered-freight-producer.tex`:55 | ? | B | "The source's remnant and exponential envelopes" → "The keeper's remainder bound and the exponential-entry envelope, which are hypotheses of the local rack map above". The two-line-earlier sentence already says the keeper supplies the forced-profile and remainder bounds; the edit only names where the envelopes come from. |
| 35 | `centered-freight-producer.tex`:57 | ? | B | "In the normalization used by the source, the response allowances … are" → "By the one-column theorem above, the response allowances … are". The allowances `c=C+ηs`, `ε=η(1+s)`, `t+2s` are the ones derived two paragraphs earlier. |
| 36 | `centered-freight-producer.tex`:65 | ? | B | "the finite source motion set" → "the finite motion set". The set is defined in the same sentence (signed coordinate permutations × conjugation flag). |
| 37 | `centered-freight-producer.tex`:199 | ? | J → named inputs | "The selected public construction supplies it through the field interpolation, mode-slot, and shipment records … The evidence file records the exact source chain" → the production of the ticket's nonlinear coefficient estimates is not proved in the chapter; it is **I-C02-finite-interpolation** plus the mode-slot and shipment estimates of **I-C02-funded-record**. Uniformity over a bounded grade ball is part of I-C02-funded-record. The caveat "the centered theorem remains conditional until this is supplied" stays in the text. |
| 38 | `centered-birth-receipt.tex`:109 | ? | B | Deleted "Their source correspondence and the exact producer boundary are recorded in the evidence ledger"; the four explicit inputs (service certificate, local coefficient envelope, origin-counting response, finite-volume vacuum lower bound) are kept and now said to be part of I-C02-funded-record. |
| 39 | `centered-geyser-scale-estimates.tex`:119 | ? | B | "because the source relation is `i≤j≤i+1`" → "because `Step(j,i)` means `i≤j≤i+1`" (definition at line 22 of the same file). |
| 40 | `centered-geyser-scale-estimates.tex`:126 | ? | J → manuscript reference | "In the source these are combined with … in the service construction" → "In Theorem `thm:ex-selected-run-service` these are combined, as its hypothesis (ii), with …". Hypothesis (ii) of that theorem does cite `prop:ex-geyser-service-fields`. The following caveat (this section does not prove the nonlinear menu response or the paid purchase) is kept unchanged. |
| 41 | `centered-public-service.tex`:6 | ? | B (undefined name) | "a calibrated finite music with source ledgers" used the name of a formal predicate that the manuscript does not define (`YM.Extra.Histories.Ledger`, `Lean/YM/Extra/SOURCE_HISTORIES/Pencil.lean`:83). It is replaced by its meaning: the coordinate, regular and forced parts of each voice depend complex-linearly on the coefficient, and the marked support does not depend on the coefficient. This is a change inside a theorem statement, so it needs review (see below). |
| 42 | `centered-public-service.tex`:30 | ? | B (undefined name) | Same name, in the proof: "earns the source ledger at the grade reference" → "has this linearity at the grade reference". |
| 43 | `centered-public-service.tex`:40 | J | J → manuscript reference | "this is the source fine-price formula with `x=3a`, `y=a`, `f=1`" → "this is the pointwise price bound `ex-centered-steer` of `ex-centered-construction`, with `s=\|Λ_k\|` sites, `x=3a`, `y=a`, `f=1`, combined there with the lawfulness bound `E(U)≤scalar(A)+\|Λ_k\| exCost(A)`". The displayed inequality is exactly that bound with these values (`x+y+2f=x+y+2`). The hypotheses of `ex-centered-steer` (served representation, vault budgets, towed support budgets, rooted vacuum bound) are the ones the proof states just before. |
| 44 | `centered-public-service.tex`:79 | J | J → theorem hypotheses | "The group of source fields … is the actual selected funded package" → "The service record, the same-history propagation and the finite local price all come from the one funded record assumed in (i)–(v)". The proof already uses only these hypotheses; nothing is deferred. |
| 45 | `centered-public-service.tex`:82 | J | J → named input | "The upstream source boundary remains the construction of the funded record itself …" → "The construction of the funded record itself is not proved in this chapter. It is input **I-C02-funded-record** …", with the same list of ingredients. "The ordinary proof unit records the exact public caller chain" moves to `SOURCE-LEDGER.md`. |

## Edits with mathematical content (need independent review)

- Row 41: the hypothesis (iv) of `thm:ex-selected-run-service` now spells out linearity of the voices in place of
  the undefined "source ledgers". I read the meaning off `YM.Extra.Histories.Ledger` (fields `x`, `reg`, `f`:
  `IsLinearMap ℂ`; `tags`: support of `P v` equals support of `P 0`) and `YM.Extra.Histories.Heard.book`
  (`Lean/YM/Extra/SOURCE_HISTORIES/Replay.lean`:33). A reviewer should check that this is the meaning intended at
  the grade reference.
- Rows 21, 40, 43: new references to manuscript results. A reviewer should check that the cited result has the
  hypotheses claimed. For row 43 I checked that `ex-centered-steer` with `s=|Λ_k|`, `x=3a`, `y=a`, `f=1` and the
  lawfulness bound gives the displayed numerator.
- Rows 32, 33, 37, 38, 45: restatements of the status of inputs, and two new named inputs. No hypothesis was added
  to or removed from a theorem.

## Unflagged leakage seen, not edited (outside the flagged passages)

- `centered-construction.tex`:84: "This is the representation supplied by the source's served-slab receipt."
- `centered-construction.tex`:202: "the source path and its current review status are recorded in the evidence file"
  and "their producer is identified in the evidence file"; also line 256: "are named explicitly in the evidence file".
- `centered-public-service.tex`:22 (proof, first paragraph): "The public route applies the global Geyser service
  producer to exactly this tuple; its per-period Pond is a derived, weaker interface." These are formal names
  (`YM.MergeProof.Accent.tent` uses `Geyser`; `YM.MergeProof.Accent.tentF` uses `Ponds`; see `SOURCE-LEDGER.md`).
- `centered-construction.tex`:27 and the theorem title of `ex-centered-main-bound` ("single-source receipts").

A follow-up pass, or a renewed audit, could treat these.
