# C15 author handoff

Session `schmittj-claude-c15-20261113`. Author draft; needs independent review of mathematics and of Lean correspondence at the hashes in `README.md`. Nothing here closes a cross-package edge.

## For the reviewer

1. `thm:trace-asymptotic` and `thm:profile-exclusion` against `YangMills.Hierarchy.TraceTest` (`Lean/ChallengeSpec.lean`), `Lean/TraceBridge.lean` and the detailed source statements. The claim to test: the exclusion theorem is proved in its chapter for the exact finite class; the asymptotic theorem is correct given its four listed hypotheses and those hypotheses are exactly what its proof uses.
2. The new proof of the two-column independence and the derivation of the two shell limits from the sub-inputs 4a–4d in `trace-scribe-producer.tex`; the sub-inputs were paraphrased from how the source uses them, and five underlying declarations were not opened.
3. The repairs listed as errors in the two findings files, and the tables "Audit items and decisions".
4. The dictionaries to the external units YM-000033 and YM-000034 in `trace-scribe-producer.tex` and `trace-weighted-estimates.tex`.
5. Part A consists largely of added definitions and hypotheses; check that each added hypothesis is one the source has.

## For C16, G06 and neighbouring packages

- For C16: `C15-to-C16-TraceTest` is a conditional asymptotic plus a proved exclusion. The assembly should cite the four hypotheses of `thm:trace-asymptotic` or the edges behind them.
- External units #33 and #34: matched at statement level; C15 uses the sensor proposition, the branch moments and the washout with exponent one.
- For C14: edges for the vector detector, rank-one, free rank and scale selection are conditional; `C14-to-C15-chart-pairing-convergence` has no located producer. A sentence of C14's `trace-firesky-gallery.tex` (about lines 222–231) describes the gallery limit as a multiple of the unit, which does not agree with the scribe chapter after correction.
- Not produced anywhere located: `eq:trace-basis-error`; the shell sub-inputs; `C15-internal-planted-expansion`; `C15-internal-lawful-representation`.
- For the integrator: twelve textual references to labels of the two external trace chapters (list in `part-B/findings.md`).

## Not done

No Lean elaboration or axiom query. No change to evidence files, the external units, the main include file, the bibliography or shared metadata.
