# Validation and provenance

Reviewed head: `c55c16531bbe1eb33dd3c22c289e45d86c8b5d00`. Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Worktree: `/tmp/ym-astra-g01-m4-20261113`; session `mgubi-astra-g01-m4-review-20261113`. Only this review directory is writable output for this task.

## Exact reviewed content

The following SHA-256 hashes were computed from `git show c55c16531bbe1eb33dd3c22c289e45d86c8b5d00:<path>` in Python and compared byte-for-byte with the worktree before writing. All matched. This report-only audit has no manuscript fingerprint or `unit.json` approval to update. These file hashes identify its review target, not acceptance of the enclosing unit.

| File | SHA-256 |
| --- | --- |
| `blueprint/units/YM-000026/handoff/results/G01/M4/README.md` | `c6597d4918beec3c43c4f9187efcdb11760ccb41b4adfa69252e80fca0ba3d6f` |
| `blueprint/units/YM-000026/handoff/results/G01/M4/trace_constant.py` | `6599d7b54a91f688359cce48501073c8e2426f0228dad55a997dc3ce50cfb1af` |
| `Lean/ChallengeSpec.lean` | `e48b0be2b72d16b9b87c6c1923b3ae814270387bf9312b5cb0661dfa3e243749` |
| `Lean/PublicTheory.lean` | `94111ad258b4218a263fcc0a7136446d5a6eff0e090809b72036fb3a7aecfff8` |
| `Lean/PublicWilson.lean` | `c1542c816cd42d23448b66b4cb021c7f3bdad64b64f1c643dde27147ce0c3233` |
| `Lean/TraceBridge.lean` | `b3fa347e6ab79cd69a5b0e29a3ad1a743c9cedffe727a7f13bfc6328cf125a35` |
| `Lean/YM/TraceExtension/Wick/Refute.lean` | `cb0340c14c23b700b0cc84f212578206304710e93d9b766b8224093d553024c6` |
| `Lean/YM/TraceExtension/Wick/Log.lean` | `0de49891de2fd3b57e21199c65d6a72b191360b4295c8f7acb6c5158469a1c26` |
| `Lean/YM/TraceExtension/Wick/Expansion.lean` | `4a4f8cdabd22491feb3ca2178a7efc5812629753b42c742fcf6f31572bb01f5c` |
| `Lean/YM/TraceExtension/LogScaling.lean` | `c920b4ff541c38582eba5b802ed740a075873b93f18c17b3faee39dab3d66d3c` |
| `blueprint/units/YM-000026/handoff/results/G01/formal/Adequacy.lean` | `581880ef39e48a1af37af8b67b50869a011958411be2c6fb291a5a38e43b18f3` |

## Actual checks and limits

- Read AGENTS.md, CONTRIBUTING.md, docs/coordination.md, docs/proof-standard.md, source/README.md, templates/review.md; read relevant prior G01 mathematics/source review and validation, G01 README, background README and Osterwalder–Schrader note, and Bots/README.md (no task-specific Bots notes existed in this checkout).
- Read all of M4 README and trace_constant.py; all of ChallengeSpec and PublicTheory, relevant PublicWilson definitions; Adequacy main statements and immediately surrounding proof; TraceBridge and the exclusion/expansion/limit definitions named in the source report. Did not read the entire Lean tree or audit the entire transitive dependency graph.
- `gh issue view 162 --comments` and `--json body,title`; `gh pr view 167 --comments --json title,body,comments,reviews,headRefOid,state`; `gh api repos/hairer/humanise-yang-mills/pulls/167/comments`: live claim was unexpired and disjoint, author claim released, PR head matched, PR already MERGED, no PR reviews or inline comments. First sandboxed GitHub reads failed network access; authorized escalated reads succeeded. Live issue was rechecked before publication.
- `python3 -I blueprint/units/YM-000026/handoff/results/G01/M4/trace_constant.py`: **failed before numerical work**, `ModuleNotFoundError: No module named 'numpy'`. No dependencies installed; numerical outputs in the author record were not independently reproduced. The script truncates the transformed integral at u=60 and prints rounded ratios without certified quadrature/tail error; even a successful run would not prove a limit.
- Opened primary sources with the web tool: Klein (1973) MSP full PDF, especially Theorem 2 and Proposition 3/Theorem 3; Dütsch–Rehren arXiv math-ph/0209035 v1 §2; DLMF 10.43.19, 10.30.2, 10.40.2. Klein screenshots for PDF pages 13 and 16 failed with cache-miss errors; extracted text was used, and garbled exact hypotheses were not certified. No Greenberg original text read. No OS theorem applied to discharge O1/O3.
- `python3 scripts/check_blueprint.py`: exit 0, `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` Repeated after report creation with the same result.
- `git diff --check` and staged `git diff --cached --check`: passed with no output after report creation.
- No Lean build, elaboration, `#print axioms`, independent replay, or complete GFF construction attempted. No LaTeX changed; no LaTeX build/render required or run. No checker code changed; no checker test suite run.

The SHA-256 checks establish exact reviewed bytes. The structural/whitespace checks establish neither mathematical correctness nor Lean correspondence. Both review verdicts request changes, and human acceptance remains unset.
