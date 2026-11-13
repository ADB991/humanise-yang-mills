# C09: independent review of the seven remaining #104 chapters

Unit YM-000026; issue [#50](https://github.com/hairer/humanise-yang-mills/issues/50),
parent [#26](https://github.com/hairer/humanise-yang-mills/issues/26).
Session `hairer-claude-20261114-c09rev`
([claim](https://github.com/hairer/humanise-yang-mills/issues/50#issuecomment-6867156335)).
Contributor @hairer; agent assistance: one Claude session, no subagents.
The account hairer did not author PR #104 or any C09 chapter.
Human acceptance is **not recorded**.

## Target

The author pass PR #104 (head `10d5d565ec2c4c1ea85fa0abb3b78cc726733f20`,
author TrishenGunaratnam) changed nine chapters. Review #108
(`mgubi-astra-c09-parameter-20261113`) covered `finite-volume-parameter-continuity.tex`
and `parameter-comparison-suppliers.tex`. This review covers the other seven:

| Chapter | SHA-256 (base `13f52dd`) |
| --- | --- |
| `fixed-rung-convergence.tex` | `e0060f9b036e754f32c87768e7e9080e59d4d1011336ba7dd3c537e95eb82497` |
| `heading-history-handoff.tex` | `4f6b5107a96bfb33116c62a6cf7859f830772c7cac54e5ada260caf976abfc1a` |
| `local-source-stability.tex` | `1813d41d385adfd6fff4bb1c0d3b8601a77bacec551c6b4f9bda1be1886c706b` |
| `marked-kernel-convergence.tex` | `f80adacc7d528ba9a6f978778e2eac6a2aa6ed7412e282afea20c85aa691cdca` |
| `regular-principal-producer.tex` | `1eb440bf99bd45c6e49577f603ccdccc9f92ba21fbbe32f0cab0100391db46e6` |
| `small-field-budget-selection.tex` | `f46733221a52386cb60eb05e4f64b49779cb250bdc034df68f2e8b6ebe7241ae` |
| `uniform-stationary-chart.tex` | `f116e65667e75c79b9ae718be3868f5d564b99be0125403850cd05b1d0c0453e` |

All seven are byte-identical to PR #104's head and to
`results/C09/chapter-hashes.json`. The source pin is
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Scope

- The scope is every hunk that #104 changed in these chapters, together with the argument each hunk sits in. That surrounding argument was checked line by line where the hunk changes a hypothesis or a constant.
- It also covers all the points listed for these chapters in `results/C09/review-focus.md`.
- For each claim the edits make about another chapter or the source, I read the consumer or producer statement in the manuscript and the cited Lean definitions.
- Unchanged parts of these chapters were read only as context. They are not certified here.
- Cross-package joins stay open, as the author records them: the C07 nonflat Gram, C08 graded component majorants, C10/C11 Hessian identity, C11/C13 histories and weighted tails, and the C03/C12 wording.

## Verdicts

- **Mathematics: one minor required change (M1).** Everything else passes under the stated hypotheses. M1 is in `heading-history-handoff.tex`. Since #104, C03 has listed the hypotheses of `prop:ex-selected-interpolation` explicitly as (H1)–(H6), plus profile hypotheses. The chapter's "provided …" clause names only part of that list. See `mathematics.md`.
- **Textual Lean correspondence: no discrepancy.** Every source claim attached to the edits matches the pinned definitions I read; see `source.md`. This was a reading of the source text only. Nothing was elaborated, replayed in the kernel or audited for axioms.

## Out of scope, flagged

- `wilson-vacuum-price.tex` is marked `changed: true` in `results/C09/chapter-hashes.json`, but PR #104's diff does not touch it.
  - Neither #108 nor this review covers it.
  - The source-leakage reviews (#221, #295) cover only their audit rows.
  - Someone should establish which earlier commit changed it and whether that change was reviewed.
- The other C09 chapters that #104 did not change are not reviewed here.
