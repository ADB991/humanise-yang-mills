# Validation and review limits

Session `mgubi-astra-c09-leakage-review-20261113`, 2026-11-13. Frozen PR #200 head `43f847d80dd9373f40f929bf479fc4df3fdde51b`; report base `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`. Claim: https://github.com/hairer/humanise-yang-mills/issues/188#issuecomment-6861868757, valid until 23:00 UTC. Prepared by an Astra agent under mgubi; no formal approval or human acceptance.

## Actual checks

- Read issue #188 and package issue #50, including all comments, and PR #200 body/state/comments/reviews. PR200 is merged. Live submission recheck found identical comment histories: three comments on #188, four on #50, no new overlapping claim. Parent owns target findings/comment and claim release.
- Verified AGENTS, CONTRIBUTING, coordination/proof standards, source README, Bots README and shared-background README are byte-identical to those read in the immediately preceding C03 session. Reused those instructions. Read C09 scope and the source-leakage audit rows. Searched shared literature/Bots for Wilson, plaquette, Frobenius and countable assembly; no external theorem was adopted for these elementary delta checks. No external literature search.
- Read the complete target chapter, exact three-file PR diff, new response record and changed hash entry. Inspected the immediate consumer passages and source definitions identified in the two reports. Earlier C09 parameter review is outside renewed scope.
- `reviewed-files.sha256` contains SHA-256 hashes of 13 files obtained using `git show 43f847d:<path>`: three target files, four immediate manuscript interfaces and six source files. A Python verification recomputed all 13 hashes from that same immutable commit: all pass. The author's changed `wilson-vacuum-price.tex` hash also agrees (`e4c4c9fb610b97ccef8aa7734f0b77f67272c109958ca3d9c3f88856dfba1d30`).
- Eleven frozen files are byte-identical to the current worktree. Two immediate interfaces differ: `soft-curvature-receipts.tex` and `annulus-same-data-binding.tex`. An initial all-files equality assertion correctly stopped on the former, before writing the hash file. The full target-to-base diffs were then inspected: the first changes only the arbitrary-array summation convention paragraph; the second rewrites source-routing prose around the same Wilson-response reference and its closing summary. The relevant soft-Wilson lemma, t=2,3 uses, row-action branch, and degree-two/three/four consumer distinction are unchanged. The manifest intentionally freezes the target versions, so verify it with `git show`, not a blanket worktree `shasum -c`.
- `python3 scripts/check_blueprint.py`: exit 0, “Blueprint structure OK: 4 units. Lean and mathematics were not verified.”
- `git diff --check` and staged `git diff --cached --check`: clean.
- `git rev-parse 43f847d:Lean HEAD:Lean`: both `328ad19b404d2db2a578319ea3e4eba4b27e34ef`. `git diff --exit-code 43f847d HEAD -- Lean source/upstream.json`: exit 0. This checks unchanged imported source relative to target; it is not a new upstream import audit.
- `git fetch origin codex/existence-monograph` succeeded; canonical base remains `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`. Final diff is restricted to this session's four new report files.

Some long combined reads were truncated; decisive definitions, consumer calls and the countable-row proof were inspected in focused ranges. Search hits alone were not treated as proof.

## Not performed

No LaTeX build or rendered inspection for this report-only task; the author's build claims are not re-certified. No checker tests because the checker is unchanged. No Lean execution, elaboration, axiom extraction or kernel replay. No full C09, C10, generic countable-atom, Ward/ray, or selected-path review. The conditional mathematical verdict and two narrow source-record corrections are distinct from acceptance of the whole construction.
