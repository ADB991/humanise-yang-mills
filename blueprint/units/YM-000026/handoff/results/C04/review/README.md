# C04 independent review (agent review, no human acceptance)

Scope: the eleven C04 chapters in `manuscript/existence/` (complex-heat, analytic-boundary, fourier-support, label-descent, lorentz-covariance, full-tube, heat-vectors, reconstruction, boundary-detection, spectral-measure, locality; 2,094 lines) and the author reports in `results/C04/`, at branch commit `18d0327`, source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Issue #45, author PR #66 (merged), review session `schmittj-codex-c04-review-20261112`.

Method: four read-only Codex `gpt-6-astra` passes by chapter group, each for mathematical validity and Lean correspondence; a Claude agent then re-checked every finding labelled ERROR or GAP and every INACCURACY and NIT against the LaTeX lines and the Lean text, re-derived five chapters in full, and checked the author's gap repair against `Lean/YM/Work/C28.lean`. No Lean command and no LaTeX build was run.

Files: [mathematics.md](mathematics.md) (mathematical validity), [lean.md](lean.md) (Lean correspondence), [validation.md](validation.md) (commands run, reviewer findings rejected or downgraded).

Outcome: changes requested, all textual. No false theorem statement, no invalid proof step and no manuscript statement contradicting the pinned source was confirmed. The author's repair `cor:word-motion-inputs` is valid and matches `YM.Work.C28.answer`; the involution-identity requirement F2 is real. All results remain conditional on the ledger's incoming edges. This is an agent review submitted under the account `schmittj`; it is not human acceptance and does not certify the chapters.

Top findings:

1. `locality.tex` 199–204: the cutoff sentence is false as literally written (cutoffs do not converge to one in the Schwartz topology); the intended statement about the products \(\chi(X/R)f\) is correct. Reword (M1).
2. `ledger.md` E4: the named producer `limits.tex` explicitly excludes field quotients; no producing statement is identified (M2).
3. The C04 chapters write coordinates time-first, against "time last" in `statement.tex`; declare the convention (M4).
4. `reconstruction.tex` 180–186 and `heat-vectors.tex` 107–112: make the quantifiers and range of the translation identity explicit (M5, M6).
5. `correspondence.md`: `YM.Bid.C08` is defined in `Lean/YM/Bid/Corners.lean` (not `Grow.lean`) and is a conjunction; `Urs W K` is the conclusion, not the hypotheses, of `thm:lorentz-covariance` (L1, L2). `reconstruction-evidence.md`: private helpers and `YM.Boundary.NearPair.actor` (L3).
6. Ledger: producers of E3, E5 and null equality, the split of the C14 outgoing edge, and the nonzero-label requirement on the C16 edge (M3, M7).

Not reviewed: any producer of the incoming edges (C03, C14) beyond the existence of the named labels; the C05 consumer; Lean elaboration and axioms; rendered pages; the SNAG reference (Bekka–de la Harpe–Valette, Theorem D.3.1) against its PDF. Six chapters and `lem:imaginary-boost-path` rest on a single agent reviewer's line-by-line report and were only spot-checked in synthesis (table in `mathematics.md`).
