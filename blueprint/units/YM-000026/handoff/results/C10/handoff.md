# C10 author handoff

Session `schmittj-claude-c10-20261112`. Author draft; needs independent review of mathematics and of Lean correspondence at the hashes in `README.md`. Nothing here closes a cross-package edge.

## For the reviewer

1. The repairs listed as errors in `part-A/findings.md` and `part-B/findings.md`, and the second-round sections, where a checker found one regression and two errors in our own first-round edits. The old text is `git show 80be46a:manuscript/existence/<chapter>.tex`.
2. New statements, to be checked against the cited declarations for strength and for completeness of their proofs: `lem:ex-soft-quadratic-hessian` (`Work.F03`), `lem:ex-soft-wilson-pictures`, `prop:ex-classical-stationary-pictures`, the new hypothesis and proof for the denominator bound in `annulus-fleet-face-estimates.tex`, `lem:ex-annulus-common-strip`, `prop:ex-annulus-estimate` (`HorizCalc`), `prop:stationary-output-path`, `prop:inherited-loop-picture`, `prop:ex-pole-coefficient-transport`.
3. The contraction formula in `classical-stationary-vertices.tex`: the claim is that the source inverts the gauge completion of the internal Hessian and that the final formulas are unchanged.
4. The tables "Audit items and decisions" record the authors' decision on each item of the prior audit.
5. Declarations that were not opened are listed in the findings files; the face prices were checked through three of their proof scripts only.

## For G06 and neighbouring packages

- For C11: `prop:ex-annulus-estimate` is the producer of the annulus input, conditional on (W), (S). The one-step theorem and the forest-chart Hessian identity are not produced by C10; C11's ledger rows for these should stay open and name the missing statements given in `part-B/ledger.md` and `part-A/ledger.md`.
- Not produced anywhere located: inputs (W), (S); `unassigned-to-C10-film-tickets`; the uniform gap over all periods; same-history path and bed data.
- Incoming from C01, C06, C07, C09, C11: listed with the cited passages; none was audited on the producer side.

## Not done

No Lean elaboration or axiom query. No change to evidence files, the main include file, the bibliography or shared metadata. Source identifiers used as words were not renamed (G05).
