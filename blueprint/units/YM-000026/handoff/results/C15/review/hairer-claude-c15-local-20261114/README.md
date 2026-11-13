# Independent bounded C15 review: local budgets, charge, pairing, rate selection and medal prices

- **Session:** `hairer-claude-c15-local-20261114`
- **Contributor:** hairer, assisted by Claude (Opus 5.5), with no child agents.
  This session did not author #105 or any of the five chapters.
- **Claim:** <https://github.com/hairer/humanise-yang-mills/issues/56#issuecomment-6867482570>
  (expires 2026-11-14 23:00 UTC).
- **Target:** current `codex/existence-monograph` at `dcbdcc8d`. This includes
  the #105 author pass and the later #194/#207 source-leakage edits.
- **Source pin:** `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

Human acceptance is **unset**. This report is not an approval and changes no
unit status or review fingerprint.

The following five chapters each received a full mathematical review and a
textual Lean-correspondence review:

| Target | SHA-256 |
| --- | --- |
| `manuscript/existence/trace-local-charge.tex` | `0c72aac5b0d92326acd676b0052589b1ab0ae3305af733db2514169da03c079e` |
| `manuscript/existence/trace-local-paid-budgets.tex` | `42962f8b9d7359162f6f0d7599fbc4ee8fb13b3ee7c7da7129d79b92c1b4ef73` |
| `manuscript/existence/trace-local-pairing.tex` | `c50f5136d756a22cfd04612fec67366ca35e20725e22aeb6faecf5f5ae3281f8` |
| `manuscript/existence/trace-local-rate-selection.tex` | `e5ed9177f0dab785de99a4855cb1638c0cc2832cbcaeaeae57c21fbbfa9ccf2f` |
| `manuscript/existence/trace-medal-prices.tex` | `4cdfbb56d96e045dd4c87732718bb01e3859ab7b444a2414836ed5d101005d57` |

## Outcome

Both the [mathematical review](mathematics.md) and the
[textual Lean-correspondence review](lean-correspondence.md) found **no
blocking defect**, conditional on each chapter's explicitly stated incoming
receipts. Every displayed constant, exponent and quantifier order was
rechecked. Two points are specifically confirmed against the source:

- the #105 repair |m + 12κ| ≤ t^{−100} in `trace-local-charge.tex`;
- the linear-clock hypothesis in `trace-local-rate-selection.tex`.

Non-blocking items for the author or integrator:

- **E1–E5 (editorial).** These are:
  - a notation clash between the price z and the rate exponent z, plus the
    unrecorded identification of z with the budget v;
  - undefined source names (rust, opal, segment, ζ, gStep, …) in the
    rate-selection proof;
  - notation clashes in the same chapter;
  - the sign convention of the probe root difference;
  - the norm in which ‖ℓ‖ is taken.
- **S1 (crosswalk locator).** The cloud price is produced by
  `Quince.fare_pr`, not `Blush.fruition`.

## Not established

This review does not establish the following:

- the producers of the incoming receipts (local atom estimates, Medal
  components, charge/combat receipts, the probe and approximation receipts,
  and the strip/growth/chart receipts);
- the other seven unreviewed C15 chapters;
- the C15-to-C16 TraceTest edge;
- whole-C15 acceptance.

[hashes.json](hashes.json) freezes the target, evidence, interface and source
files, and [check_integrity.py](check_integrity.py) rechecks them. Validation
is recorded in [validation.md](validation.md).
