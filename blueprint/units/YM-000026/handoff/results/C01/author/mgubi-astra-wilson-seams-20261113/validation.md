# Actual validation and limits

Session `mgubi-astra-wilson-seams-20261113`; report-only audit under the posted issue287 scope correction. Worktree `/tmp/ym-astra-wilson-seams-20261113`, base69b2631. No manuscript edit was made at any point.

- `python3 scripts/check_blueprint.py`: PASS, four units; structural validity only, not Lean or mathematics.
- `git diff --check`: PASS.
- `python3 blueprint/units/YM-000026/handoff/results/C01/author/mgubi-astra-wilson-seams-20261113/verify.py`: PASS27 frozen versions. Every version is read with `git show`. The actual producer is identical to the version reviewed at165fb245460479233d9e9d3e9b9023ca10c49f54; its SHA256 is b8172d7e2c6aafb27a8ad007858e0a49159a9a4f9c00caa07addf99a29a7764f. Current source/producer and prior reviewer reports are unchanged. The consumer is frozen separately at286 head350b678d97e5ed7e30e002c1ff2e5e3a68a5121b, not substituted from the canonical worktree.
- `git diff 165fb245460479233d9e9d3e9b9023ca10c49f54 HEAD -- manuscript/existence/lattice.tex`: empty. `git diff 616632afae1a2eb625b3b310b520e6091eb37cec HEAD --` the two part1 math/source review paths: empty. This corroborates exact prior83 coverage instead of relying on a later C01 validation summary.
- `git diff --exit-code -- manuscript Lean source`: PASS. Final scope is only the six new files in the claimed audit directory. No existing author or reviewer record, consumer, shared file or source file changes.
- Live287 rechecked at start, after the scope amendment and after resuming from interruption before submission. Final read 2026-11-13 21:45 UTC contains the original claim and posted correction, with no competing scope. Consumer286 remains at the frozen head. Responses cached in `/tmp/wilson-seams287-final.json` and `/tmp/wilson-seams286-final.json`.
- Literature search performed; publisher Osterwalder–Seiler PDF returned403. The original IHES FILS preprint was opened, but no exact gauge theorem from it was certified or used. Existing self-contained manuscript proof is the authoritative result. Access limitations are preserved in source.md.

No new LaTeX build/render was needed or run after the task became report-only. Prior83's build, sample rendering and exhaustive small-model computations remain attributed to that reviewer and were not rerun. No Lean build/elaboration, axiom replay, checker test suite, new numerical experiment or global endpoint audit was run. Inspected source proofs are identified individually in source.md; no whole dependency-tree verification is claimed.

This account authored consumer286, so the audit is not independent acceptance of286. Prior83 is different-account agent evidence at the unchanged producer hash; its other findings and lack of human acceptance remain intact. Parent inspection is integration checking, not human acceptance. The intended handoff is a bounded same-law seam attachment; RG centered budgets and other downstream inputs stay separate.
