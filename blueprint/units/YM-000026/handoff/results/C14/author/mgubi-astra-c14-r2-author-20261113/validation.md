# Validation: C14 PR177 requests 2–4

Author session `mgubi-astra-c14-r2-author-20261113`, Astra under mgubi, 2026-11-13. Base `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`, source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. No independent approval or human acceptance is recorded.

## Inputs and coordination

Read PR177's body and its complete renewed-review report, issue55 body and comments, and issue193's claim/release and pending PR216 diff. The inherited contributing, coordination and proof-standard files were confirmed byte-identical to the instructions read in the preceding bounded review session. Existing C14 author/review records were read only. Relevant source definitions and the immediate scribe and annulus consumers are identified in `response.md`.

Live rechecks of issues55 and193 before submission found identical histories to the starting snapshots (14 and2 comments respectively), with this claim valid until 2026-11-14 00:00UTC and the PR216 author claim released. Fetching canonical `codex/existence-monograph` confirmed the same base. The only manuscript writes are the four assigned passages/consistency edits. No existing author record or review, shared file or Lean file is changed.

## Commands actually run

- From `manuscript/`, `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/c14-r2-build existence.tex`, adapting the documented manuscript latexmk command to the existence-monograph entry point and scratch output directory: exit0, 982pages. Log `/tmp/c14-r2-build.log`; final TeX log `/tmp/c14-r2-build/existence.log`; PDF `/tmp/c14-r2-build/existence.pdf`. No undefined references or multiply defined labels. The only overfull box is the unchanged1.82599pt box in `public-run-binding.tex:39–47`, outside scope.
- Rendered PDF pages843,851,852,853,855,856,874 with PyMuPDF in `/tmp/c14-pdf-env`; **visually inspected pages843,852,853,856,874**, containing every changed passage. The scalar-trace display, uniform chamber hypothesis and proof, annulus input, and translation calculation are clear without clipping or overflow. Extra rendered context pages851/855 are not claimed as visually inspected. PNGs are in `/tmp/c14-r2-render/`.
- `python3 scripts/check_blueprint.py`: exit0, “Blueprint structure OK: 4 units. Lean and mathematics were not verified.”
- `git diff --check` and staged `git diff --cached --check`: clean.
- SHA-256 final fingerprints in `final-files.sha256`: four changed chapters, one read-only manuscript interface and seven inspected source files. `shasum -a 256 -c .../final-files.sha256`: all12 pass. These freeze authored content and inspected inputs, not review approvals.
- `git diff --exit-code HEAD -- Lean source/upstream.json`: exit0. Base Lean tree is `328ad19b404d2db2a578319ea3e4eba4b27e34ef`; no source or manifest change. No new upstream archive audit is claimed.
- `git show --format= 44df7abe > /tmp/c14-r2-216.patch`, then `git apply --check /tmp/c14-r2-216.patch` against the edited worktree: exit0, repeated before submission. The disjoint changed passages were inspected for compatible hypotheses. PR216 was not applied, committed, or included in this PR; no combined216 build is claimed.

Two exploratory source locators (`TraceExtension/Over/Scribe.lean` and `Euclid/Hierarchy.lean`) did not exist; searches located and then read the actual declarations in `TraceExtension/Chart/Time.lean` and `Euclid/Words.lean`. An initial literal replacement of the firesky paragraph did not match because of Python string escaping; inspection showed no change to that file, and the intended replacements were then made with raw strings and checked in the diff before the successful build. Some long read outputs were truncated; decisive source definitions and changed passages were read in focused ranges.

## Limits and handoff

No Lean build, elaboration, axiom extraction or kernel replay. No checker tests because the checker is unchanged. No new external literature result is used: the translation calculation uses the hierarchy's existing translation/derivative laws, while the other repairs correct a conditional hypothesis and the type of the traced field. The whole shell supplier, gallery, Ward propagation and C14 package are not re-proved.

The submission consists of four chapter edits and three new author records. The strengthened chamber premise, centered-scalar correction and translation calculation need independent mathematical and source review by a different account. Parent integration inspection is author-side only. PR216 and its request1 repair remain separately pending independent review; free-rank F1/F2 and all other unclaimed findings remain open/out of scope.
