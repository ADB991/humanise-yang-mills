# C11 author handoff

Session `schmittj-claude-c11-20261112`. Author draft; needs independent review of mathematics and of Lean correspondence at the hashes in `README.md`. Nothing here closes a cross-package edge.

## For the reviewer

1. The repairs listed as errors in `part-A/findings.md` and `part-B/findings.md` (section A in each), and the second-round sections, where a checker found one regression and three errors in our own first-round edits. The old text is `git show 1749b55:manuscript/existence/<chapter>.tex`. For each repair the claim to test is that the old text was wrong and the new text is what the source says.
2. New statements, to be checked against the cited declarations for strength and for completeness of their proofs: `prop:path-retained-plan` (source `verdant`, `florentine`, `settled`, `mastering`), `def:path-admissible`, `def:path-plan`, `lem:reset-absorption-continuity`, `eq:reset-stage-constants`, `eq:reset-clip-conditions`, `prop:wilson-startup-family` (reserved labels: `distinct`, `sleeping_out`, `never_spent`), `prop:terminal-replacement`, the detection principle in `background-path-convergence.tex`, `eq:projected-forecast-inputs` with the derivation that follows it, `eq:background-forced-payment`, `eq:background-ray-admissible`, `eq:selected-offer-budgets`.
3. The tables "Audit items and decisions" record, for each item of the prior audit, whether the author adopted, refined or rejected it and why. Rejections deserve a second look.
4. Declarations that were not opened are listed in the findings files; statements resting on them are marked.

## For G06 and neighbouring packages

Open edges with exact statements are in `part-A/ledger.md` and `part-B/ledger.md`. Those most relevant for closure:

- Produced here for C12: reset allocation, Wilson startup family with reserved labels at the terminal level, terminal replacement. C12's ledger rows `C11-to-C12-reset`, `C11-to-C12-startup`, `C11-to-C12-reserved-addresses` can now cite `eq:reset-stage-constants` and `prop:wilson-startup-family`; whether "terminal level" is all that C12's `prop:terminal-marked-voice` needs should be checked by the C12 reviewer.
- Not produced anywhere located: `eq:projected-forecast-inputs`; the constant in the forced payments; the strengthened startup bound used by `coupled-background-convergence.tex`; `unassigned-to-C11-auxiliary-service`; `unassigned-to-C11-forced-purchase`.
- Incoming from C10, C01, C12, C16, C09, C08, C06: listed with the cited passages; none was audited on the producer side.
- For C06: `physical-reset-reorganization.tex` no longer calls the singleton-masked variant a specialisation of the C06 result.

## Not done

No Lean elaboration or axiom query. No change to evidence files, the main include file, the bibliography or shared metadata.
