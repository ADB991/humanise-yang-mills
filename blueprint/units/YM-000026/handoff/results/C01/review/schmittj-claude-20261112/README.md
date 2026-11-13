# C01 independent review by a second contributor (agent review, no human acceptance)

- Unit: YM-000026, package C01 (`blueprint/units/YM-000026/handoff/C01.md`), issue #42.
- Role: Lean correspondence and mathematical validity, reported separately per chapter group.
- Human reviewer: `schmittj` (account under which the agent review is submitted; no human acceptance is recorded).
- Agent assistance: three Claude Opus reviewer agents, one per chapter group, each instructed to re-derive the computations and to re-check every finding before reporting it; coordinated by a Claude session. The author and the checker passes recorded on the issue used Codex agents; this is the first review by a different contributor and model family.
- Reviewed content: the eleven C01 chapters and the records `results/C01/{RESULTS,HANDOFF,VALIDATION}.md`, `manifest.json` at the head of draft PR #81, commit `165fb24`. Per-file SHA-256 values are in the three `partN-validation.md` files and agree with the author's `HANDOFF.md` and `manifest.json`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Review task and PR: issue #42, author draft PR #81.
- Outcome: **changes requested; no error found.** No false statement and no invalid proof step was found in the eleven chapters. Every repair made by PR #81 that was checked is mathematically correct and agrees with the source. One substantive gap concerns an estimate that is used but proved nowhere (item 1).

Files: `part1-*` (`lattice`, `quadratic-lattice-symmetry`, `flat-estimate`, `flat-step`, `positive-row-producer`), `part2-*` (`free-kernel-estimates`, `free-kernel-components`, `kernel-transport-identities`), `part3-*` (`atlas-estimates`, `rg-horizon-geometry`, `curvature-horizon-producer`, and the author's records). Each part has `-mathematics.md`, `-lean.md` and `-validation.md`. Finding numbers below refer to those files.

## Findings that need action

1. **Missing estimate for the one-form column (gap, pre-existing; part 2, finding 1).** The weighted analytic bound for the one-form column \(A_0\) (source: `Flight.pilot_cost`) is proved in no C01 chapter. `kernel-transport-identities.tex` 136–137 and 187–193 call it "already estimated", `rg-horizon-geometry.tex` 290–296 uses the resulting \(L^{-(1+r)}\) receipts, and PR #81 adds one dependent sentence at `free-kernel-estimates.tex` 624–633. Either the proof must be written (following the source) or the bound must be stated as a named input.
2. **Records overstate the review status (part 3, L1).** `HANDOFF.md` and `RESULTS.md` describe the text as independently reviewed with reference to commits `292c535` and `ebdeb57`, which are not in the repository, and there is no `results/C01/review/` directory at `165fb24`. The earlier checker reports should be added to the repository or the status wording changed.
3. **Attachment and path bounds for the literal run (part 3, L2).** The bounds are stated correctly, but no cited declaration proves them for that run. The reviewer located the chain in the source (`Bolt.sticks` → `Competes.prices`/`Lives.path` → `Directed.bases` → `Kin.Planned.links`/`cap`); the record should cite it or mark the edge open.
4. **Symmetry of the level responses (gap, minor, pre-existing; part 1, M1).** `quadratic-lattice-symmetry.tex` 51–57 gives one sentence for \(D_{s(c)}(sq)=D_c(q)\); the argument needs divisor symmetry, two-sided drive symmetry and alias reindexing, as in `Train.D_signed`.
5. **From symbol identities to finite-torus matrices (gap, minor, pre-existing; part 2, finding 2).** `kernel-transport-identities.tex` 254–277: state the Fourier convention and the periodisation step and cite the reality law. The installed display omits the primal identity, while `RESULTS.md` says it gives "primal, curl and dual" (part 2, finding 4).
6. **Statements to complete (pre-existing unless marked).** `rg-horizon-geometry.tex` 206–212 needs \(Wd_1=Hd_1\) as well; 220–222 the common width must include the curvature-factor width; 213–215 the factorisation needs the square root retained in the source. `positive-row-producer.tex` 38–43 should state that the symbol is Hermitian. `atlas-estimates.tex` 251–256 (PR #81): group the fine intermediate coordinate modulo \(Ln\), not \(n\); 214–217 (PR #81): define "fixed admissible stages". `flat-step.tex` 448–460 (PR #81): define "admissible", "Schur hypotheses above", "blocking mean".
7. **Presentation.** `free-kernel-estimates.tex` 339–605 uses source names that are never defined in the text (the identities are correct). Several notation clashes and one evidence-file name (`YM.Towers.Diagonal` for `YM.Precision.Towers.Diagonal`) are listed in the part files.

## What was verified

Reflection positivity on the finite grid was re-derived by hand for both cuts and checked exhaustively on small \(\mathbb Z_2\) and \(\mathbb Z_3\) models; the curl-rotation identity was computed for all 384 signed permutations on tori of side 2 and 3; the contour shift, geometric and alias sums, the residue bound, the branch algebra, the gain formulas and the block identities with the cost table were recomputed and compared with the cited Lean statements. Details and scripts are referenced in the part files.

## Not reviewed

No Lean elaboration or axiom check. The proofs of several helper declarations and of the run-selection theorem were not read (lists in the `-lean.md` files). Producers and consumers in other packages (C02, C03, C12, C16) were not reviewed. Only a scoped LaTeX wrapper and the author's full build were reproduced; rendered pages were inspected only in samples.

## Acceptance

None recorded. This is an agent review submitted under the account `schmittj`. After the author's changes the affected files need renewed review.
