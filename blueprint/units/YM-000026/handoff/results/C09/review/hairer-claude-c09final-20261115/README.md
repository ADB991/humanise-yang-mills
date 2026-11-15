# C09: independent review of the eight chapters no review had yet covered

Unit YM-000026; issue [#50](https://github.com/hairer/humanise-yang-mills/issues/50),
parent [#26](https://github.com/hairer/humanise-yang-mills/issues/26).
Session `hairer-claude-c09final-20261115`
([claim](https://github.com/hairer/humanise-yang-mills/issues/50#issuecomment-6898563810)).
Contributor @hairer. Agent assistance: one Claude (Opus 5.5) session, no subagents.
Human acceptance is **not recorded**.

**Independence.** All eight chapters date from the parent checkpoint `a2353123`, and #104
audited them without changing them. This session authored none of them. The exception is
`wilson-vacuum-price.tex` rows 118–119 (the Frobenius-radius sentence and
`rem:ex-wilson-stream-use`). An earlier hairer-Claude session edited those for #188, and the
independent leakage review (`mgubi-astra-c09-leakage-review-20261113`, PR #221) covered them. They
are re-read here only as context, not certified a second time.

## Target

These are the C09 chapters that no independent review had covered at their current hashes. Reviews
#108 and #327 covered the ten other owned chapters, #407 covered the #360 change, and the leakage
review covered only rows 118–119 of the Wilson chapter.

| Chapter | SHA-256 (base `058a438`) | Prior review |
| --- | --- | --- |
| `stationary-action-prices.tex` | `6dfe9bd1…df528d` | none |
| `truncated-stationary-log.tex` | `3c31ad0a…711edf` | #327 used it as a cited interface only |
| `stationary-exterior-receipt.tex` | `c18b0046…6f3f` | none |
| `pure-action-small-field.tex` | `7eeb087a…5744` | none |
| `healthy-boundary-jets.tex` | `6dc889b5…a5c1` | none |
| `primary-calibration-producer.tex` | `7330a547…f6a` | none |
| `wilson-vacuum-price.tex` | `e4c4c9fb…1d30` | rows 118–119 only (leakage review) |
| `row-quadratic-price.tex` | `8bd3e4d3…e3fd` | as an interface only (leakage review) |

All eight are byte-identical to `results/C09/chapter-hashes.json`. Full hashes, and those of the nine
Lean files inspected, are in `reviewed-files.sha256`. The source pin is
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Verdict

- **Mathematics: favorable, conditional on each chapter's stated inputs.** No required change. There
  are six minor or optional notes (N1–N6 in `mathematics.md`): one typo, one quantifier imprecision
  that the existing margins absorb, two sketched constants and two notational points. No step was
  found false.
- **Source correspondence: textual spot checks favorable.** Each chapter's main statement, quantifier
  order and explicit constants were matched against the declarations recorded in `ledger.md`, as
  listed in `source.md`. Every compared statement agrees with the manuscript. Nothing was elaborated.
- **Not certified.** The cross-package joins in `ledger.md` remain open by design: same-graph and
  same-sector matching, the funded expansion, the Hessian identity, and selected-history
  instantiation. These chapters state them as inputs, which is correct.

## Status of #50 after this review

With #108, #327, #407 and the leakage review, every one of the 18 owned C09 chapters now has an
independent mathematics and textual source review at its current hash. The two loose ends left by
#327 and #407 are handled as follows:

1. **Review status of `wilson-vacuum-price.tex`.** The `changed: true` entry in
   `chapter-hashes.json` comes from the #188 leakage response, not from #104. The leakage review
   covered that change at hash `e4c4c9fb…`, and this review covers the rest of the chapter at the same
   hash.
2. **Stale `chapter-hashes.json` entry.** Only `heading-history-handoff.tex` has moved, through #360,
   which #407 checked. A separate record-only PR refreshes that entry, so this report stays
   report-only.

Package closure is a coordinator decision. The open cross-package edges must stay recorded as open,
and human acceptance is still unset.
