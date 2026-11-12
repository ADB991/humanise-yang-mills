# C02 independent review by a second contributor (agent review, no human acceptance)

- Unit: YM-000026, package C02 (`blueprint/units/YM-000026/handoff/C02.md`), issue #43.
- Role: Lean correspondence and mathematical validity, reported separately per chapter group.
- Human reviewer: `schmittj` (account under which the agent review is submitted; no human acceptance is recorded).
- Agent assistance: two Claude Opus reviewer agents, one per chapter group, each instructed to re-derive the computations and to re-check every finding before reporting it; coordinated by a Claude session. The author and the checker passes recorded on the issue used Codex agents; this is the first review by a different contributor and model family.
- Reviewed content: the twelve C02 chapters and the records `results/C02/{RESULTS,HANDOFF,SOURCE-LEDGER,VALIDATION}.md`, `manifest.json`, as merged from PR #82 (author commit `93fd865`), at `codex/existence-monograph` `1749b55`. Per-file SHA-256 values are in the two `partN-validation.md` files and agree with the author's `HANDOFF.md` and `manifest.json`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Review task and PR: issue #43, author PR #82 (merged).
- Outcome: **changes requested; no error found.** No false statement and no invalid proof step was found in the twelve chapters. Every repair made by PR #82 that was tested is correct and agrees with the source. The requests concern statements whose hypotheses or conclusions are not written out, although other packages apply them.

Files: `part1-*` (`rg-construction`, `rg-multisource`, `rg-menu-jets`, `rg-price-receipts`, `finite-menu-history-handoff`), `part2-*` (the seven `centered-*` chapters and the author's records). Each part has `-mathematics.md`, `-lean.md` and `-validation.md`. Finding numbers below refer to those files.

## The three statements that C12 consumes

- `lem:ex-centered-opened-copy` (`centered-geometry-producer.tex`): correct and re-derived; matches `YM.Work.I03.answer` with parameter 1. Its "radius hypothesis" is not used, since in the source the radius is the cover size by definition (part 2, I5).
- `\eqref{ex-centered-sail}` (`centered-construction.tex`): correct, with the small-ball and price bounds recomputed; matches `YM.MergeProof.Accent.sail`. The English statement is imprecise in four respects (part 2, I1): integrability of \(X\) is a source hypothesis that the text omits; the denominator is the integral of the evaluated activity at the scale of \(X\), equal to the partition function only through `partition_eq`; the vacuum price appears under two names; the text takes the full power set where the source allows any downward-closed census.
- `ex-centered-main-bound`: the conclusion is exactly the source's (`Wcmain`, proved by `gardena`), but the hypotheses are not listed in the statement (part 2, G1).

## Findings that need action

1. **`ex-centered-main-bound` does not state its hypotheses (gap, pre-existing; part 2, G1).** `centered-construction.tex` 5–11 never names the simple group, the factorial-columns condition, the schedule, the treasury bound, the subpower input from C05, the served inputs, or \(1\le r_i\).
2. **Budget of the fragrance ledger (gap, pre-existing; part 1, G1).** `rg-multisource.tex` 58–100: the budget \(P_0/(1-\rho)\) rests on a "selected forest estimate", a "zero-depth cluster-tail estimate" and a "connected-coefficient cover inequality", none stated or cited by label, and \(P_0\), \(\rho\) are not defined in these chapters. Likely producers are the cluster-expansion and mixed-activity chapters of C06.
3. **A proved bound missing from its theorem (gap, pre-existing; part 1, G2).** `rg-construction.tex` 244–311, `thm:ex-lattice-volant-supplier`: the shipment conversion is proved but is not part of the stated conclusion, and its hypotheses are only "stated in the proof".
4. **Conclusions not written as mathematics.** `thm:ex-selected-run-service` (part 2, I3), which C12 and C14 apply, and `ex-freight-backward` (`centered-freight-producer.tex` 171–180; part 2, G2).
5. **The treasury bound holds only at one radius (part 2, I2).** `centered-public-service.tex` 22 says "any \(s\le\min\{1,\theta\}\)"; the bound is available at \(\rho=\hat h_k\) only, and `centered-construction.tex` 105 omits the radius choice.
6. **The one-step lemma omits hypotheses (part 1, I1).** `rg-construction.tex` 378–399 needs the width hypotheses \(\sigma_i\le\omega_i\), \(2\sigma_i\le L_i\sigma_{i+1}\), \(\sigma_i>0\), \(u>0\), and assumes a property that its own proof derives.
7. **Public route (part 1, I2; part 2, I4).** On the public route the flat theorem is applied to auxiliary shadow levels and only the quadratic output reaches the run's horizon; the closing remark of `rg-construction.tex` (rewritten by PR #82) does not say so. The evidence files name a different internal route from the one `rampant` calls; no estimate changes.
8. **Introduced by PR #82.** `rg-construction.tex` 421–425: row and column factors are labelled the wrong way round (the product is correct). The mesh step is called odd without a cited producer (true by `block_odd`).
9. **Records.** `RESULTS.md` cites a label that does not exist under that name; author checkpoints `027b4de`, `84587b7`, `383e247`, `9595b79` are not in the repository; there was no `results/C02/review/` directory at `1749b55`, so the earlier interim reviews exist only as issue comments. Two evidence-file paths are wrong (part 1).

A cross-package note for C12: `selected-centered-service.tex` credits the geometry section with footprint and site-count facts that the section does not prove (part 2, E1).

## Not reviewed

No Lean elaboration and no LaTeX build. The proof bodies of several upstream inputs and the route from the public construction to the internal suppliers were not read (lists in the `-lean.md` files). One literature citation (N3) was not checked against its source. Producers and consumers in other packages were not reviewed beyond the three statements above.

## Acceptance

None recorded. This is an agent review submitted under the account `schmittj`. After the author's changes the affected files need renewed review.
