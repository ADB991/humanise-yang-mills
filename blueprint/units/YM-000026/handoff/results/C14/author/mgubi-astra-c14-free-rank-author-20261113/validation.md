# Validation and limits

Author session `mgubi-astra-c14-free-rank-author-20261113`, base `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`.

Completed checks:

- Read PR117 Part1 F1/F2 and source findings, PR177's retained requests, issue55 history and current claim, the relevant existing evidence and immediate Ward consumer. Reused the just-read repository instruction/provenance files after verifying they are byte-identical in this worktree. The live start recheck found the bounded author claim and no conflicting unreleased claim on these outputs.
- Inspected pinned radial-potential definitions, reconstruction and leg identities; derivative-plan kernels and orientation, first-insertion differentiation, divergence and free-rank adapter. Directly checked the Euler reconstruction, ordered-index antisymmetry factors, and insertion order/sign in the derivative-probe equality. No numerical experiment substitutes for these proofs.
- `python3 scripts/check_blueprint.py`: passed (“Blueprint structure OK: 4 units. Lean and mathematics were not verified.”).
- Rechecked issue55 before submission: no new comments or conflicting claims; the current bounded claim remains live. Fresh canonical fetch remains at the base above.
- `git diff --check`: passed; staged whitespace check repeated before commit.
- From `manuscript/`, ran `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/c14-free-rank-build existence.tex`, with console output in `/tmp/c14-free-rank-build.log`. Final exit 0; PDF has 983 pages. Rebuilt after the final prose changes. No undefined references/citations or multiply defined labels. Existing amsmath `atopwithdelims` warning and the existing 1.82599pt overfull box in `public-run-binding.tex` lines39–47 remain; no new layout warning.
- Rendered the final PDF with the available PyMuPDF environment `/tmp/c14-pdf-env/bin/python` and visually inspected pages785,786,787,790,791. The new radial reconstruction/leg sums, derivative-plan identity, probe formulas and conditional proposition fit with legible formulas and references. Images are `/tmp/c14-free-rank-page-<page>.png`. This is a local validation artifact, not a published manuscript PDF.
- `git diff --exit-code -- Lean source/upstream.json`: passed. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464` and imported tree `328ad19b404d2db2a578319ea3e4eba4b27e34ef` remain unchanged.
- Recorded 12 final manuscript/interface/source hashes and verified all with `shasum -a 256 -c .../final-files.sha256` (all OK). Hashes identify files whose relevant passages were read; they do not claim whole-file or transitive review.
- Generated the full PR216 patch at `44df7abe1cd6e903230d58fc7f1a73396d17ba8f` and PR227 patch at `84948b6a09300a5d397cb742b2c6e87341bfc7b9`, each relative to the canonical base. `git apply --check` succeeds for each over the final worktree. Repeated the full PR216 patch check at its updated head `4c141ec86b5cb20e7d837a343b26bbe91e57394a`: also passes. These patches were not applied; no combined build or combined mathematical acceptance is claimed. PR216's source-leakage sentence is untouched by this branch.

Not run: Lean elaboration/build, axiom replay, checker tests (checker unchanged), or renewed review of other C14 chapters. No shared files, source, existing author records or reviewer records were changed. The scope is the one chapter and four new author files. Independent review by a different account remains required. Parent's inspection is author-side integration, not independent acceptance; parent owns issue handoff and claim release.
