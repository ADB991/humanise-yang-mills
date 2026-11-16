# Validation and handoff

Session `hairer-codex-c13-completion-20261116`, 2026-11-16.

- `git diff --check`: passed.
- `python3 scripts/check_blueprint.py`: passed (4 units; structural only).
- Full build: `/Library/TeX/texbin/latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/ym54-build existence.tex`, from `manuscript/`: passed, 1204 pages. Final log contains no undefined references or multiply defined labels. Existing unrelated amsmath foreign-command warning remains.
- Rendered changed-page range with PDFKit/Swift. Inspected pages 861–862 and 875–877 for the new opening/application and auxiliary matrix/thermal proofs: formulas, references, margins and page breaks are readable. Build output and scratch page images were not committed; tracked manuscript PDF unchanged.
- Independent mathematical review passes at the three fingerprints below after two substantive first-review corrections (parameter ordering; inverse-reference-factor normalization).
- Independent source review is textual against pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`; no Lean build/elaboration performed. Its exact scope is in the adjacent report.
- Read-only all-22-chapter inventory is included. Its initial four remaining joins are addressed by the candidate; the later mathematical review is the final-hash check, not that initial inventory.

## Final manuscript fingerprints

```
442477a19d5f5cd9364a6c9977fff92ae6ab853221795f6657b19ccb7c7c9847  manuscript/existence/allarity-marked-propagation.tex
13e40ccaa51f8c916d8d3731b61cdeae1abac4aa39952ebc604ab6d2881a8349  manuscript/existence/selected-history-limits.tex
d186ab4136959f08f44d989ddf5b14cf1fa05e43aab39276257a9f0c56ddf376  manuscript/existence/three-panel-weak-comparison.tex
```

## Review participation

The parent authored the LaTeX. `/root/c13_gap_audit` audited all 22 chapters
and supplied the full-mode endpoint diagnosis; `/root/c13_large_weight_source`
and `/root/c13_limits_source` traced narrow Lean dependencies using the cheaper
Luna model. `/root/c13_completion_math_review` independently reviewed the final
mathematical candidate; `/root/c13_completion_source_review` independently
reviewed source correspondence. Reviewers did not edit the manuscript.

## Status

No further local C13 proof gap was identified after these repairs and checks.
The theorem applications explicitly retain the selected funded family and the
canonical upstream one-step path and horizon constructions. This is a draft
completion candidate for #54, requiring repository audit and acceptance; it
is not a whole-project proof certificate. Historical evidence, other packages,
shared integration files, Lean source/toolchain and tracked PDF are unchanged.
The original working checkout's pre-existing modified PDF was left untouched.
