# Validation and frozen scope

Review session `mgubi-astra-c03-leakage-review-20261113`, agent assistance: Astra under mgubi. No human acceptance is recorded. Review date: 2026-11-13. Task #183, target PR #197 at `90f78c1067d35e1aca1bb1de50e914d2bb8173b3`; report base `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`. The target was already merged. Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Actual checks

- Read repository contributing, coordination and proof standards, source provenance, audit #159/PR #164's source-leakage report and relevant C03 inventory/response, issue #183 and #44 bodies and all comments, and PR #197 body/comments/reviews. The live issues were rechecked before submission: #183 has three comments, #44 four; no overlapping live claim appeared. Claim expires 2026-11-13 23:00 UTC.
- Read the exact target diff for both chapters and five author records. Reviewed immediate mathematical/source interfaces listed in the two role reports. PR #77's relevant mathematics/source findings and the later revision/follow-up record were consulted as historical evidence only. No whole-package re-review is claimed.
- Searched `Bots/` and `blueprint/background/` for C03, root-test, column-log and gain-related notes; `Bots/` contains its README only. No verified external literature theorem was used to discharge the root-test input. No external literature search or new proof of that open input was attempted.
- Python `subprocess.check_output(['git','show','90f78c1:'+path])` supplied every hash input. SHA-256 was calculated for seven changed files, five immediate manuscript interfaces and twelve source files. Each was compared byte-for-byte with the current worktree: all 24 agree. `shasum -a 256 -c .../reviewed-files.sha256`: all 24 OK.
- `python3 scripts/check_blueprint.py`: exit 0, “Blueprint structure OK: 4 units. Lean and mathematics were not verified.”
- `git diff --check`: clean; repeated with the staged reports before commit.
- `git rev-parse 90f78c1:Lean HEAD:Lean`: both `328ad19b404d2db2a578319ea3e4eba4b27e34ef`. `git diff --exit-code 90f78c1 HEAD -- Lean source/upstream.json`: exit 0. This establishes unchanged imported source relative to the frozen target, not a new upstream archive audit or Lean validation.
- `git fetch origin codex/existence-monograph`: succeeded; canonical base remains `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`. Final diff is limited to this session's four new review files.

Two exploratory source searches used nonexistent paths (`Lean/YM/Next/Extract*` expanded by zsh, and `Lean/YM/Cells/Seam.lean`). They failed without modifying files; the homogeneity declaration was subsequently found and read at `Lean/YM/Next/EXTRACTION/Basis.lean`. Several long combined read outputs were truncated; the relevant definitions and changed interfaces were subsequently read in focused ranges. No unseen output is treated as evidence.

## Not run

No LaTeX build or rendered-page review: this task changes reports only, and does not reproduce the author's build claims. No checker tests (checker unchanged), Lean build, elaboration, axiom extraction or kernel replay. The reports assess the conditional mathematics and textual source correspondence; they do not certify upstream analytic inputs, source consistency or human acceptance.
