# Body linebreaking pass

Basis: parent manuscript copied 16 November 2026. Changes are exclusively math
mode placement (inline to unnumbered display), aligned/gathered display rows,
linebreak opportunities and removal of selected nonbreaking spaces. No formula,
quantifier, reference, hypothesis or proof argument changed. No font reduction,
margin change or warning suppression. Master, assembly, headline and fullmesh
chapters untouched.

Exact files and before/after SHA256: `/tmp/ym-whole-layout-hashes.json`.
Exact patch: `/tmp/ym-whole-layout.patch`. Author files are in
`/tmp/ym-whole-assessment/manuscript/existence/`.

Original body excesses addressed (pt):
- phase-selection: 16.28, vacuum projection formula.
- sector-gram: 4.08, final prose paragraph (log misleadingly reports next input).
- gaussian-differentiation: 55.96 and 35.04, derivative formulas.
- selected-centered-service: 63.70, 19.01, 4.79, 37.22, 27.87, 40.88;
  softNeed formula, lemma pointer, input tuples, decomposition, price tuple.
- restarted-rank-history: 49.18, six definitions split over two rows.
- allarity-marked-propagation: 8.21, 26.85, 10.06;
  root-price bound, lemma pointer and exponential identity.
- rank-root-normalization: 19.39 and 21.66, bound and three quantities.
- trace-scribe-producer: 45.15, breakable literal source label.
- trace-asymptotic: 18.74 and 5.52, pointer and recentering formula.
- trace-rounded-comparison: 4.23, configuration formula.
- public-run-binding: 1.83, nested exponential.
- actual-marked-portfolio-calibration: new 2.62 warning after parent pointer
  integration; made three proposition references breakable.

Validation: local integrated tree `/tmp/ym-layout-tree/manuscript`, build
`/tmp/ym-layout-build/existence.pdf`, log in same directory. Three pdflatex
passes completed successfully. Last pass has **zero body overfull hboxes**.
Two 3.87465pt TOC subsection-number boxes remain (lines 720–721); master is
parent-owned. Parent's already-installed wider page-number box removed the
large batch of 4.89952pt TOC warnings. `git diff --check` passes.

After the last successful compile, source-only newline placement before math
periods was tidied; it does not change TeX tokens or rendered layout. Integrated
parent pagination and final visual review remain parent tasks.
