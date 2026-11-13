# Validation and limits

Session `mgubi-astra-c11-g02-running-20261113`; only the C11-to-G02-running edge. Output is four new report files. This account contributed YM-000022's repair and authored C16; no independent acceptance of either is recorded.

## Checks actually run

- Read the live issue178 claim on starting and before submission, issue136's complete cached body/comments, issue22's task and latest repair/review boundaries, G02 author138/review154, the exact C11 delta and immediate manuscript/source interfaces. The current claim owns only this report directory; C04 and the newer C14-only claim6863642561 are disjoint; G01 was released at6863641940. The live PR223 head remained `1a084088a29f0ae4e4f59d3c414344a74e0843c5` (OPEN).
- `git diff --name-only 69b2631..1a084088a29f0ae4e4f59d3c414344a74e0843c5`: four C11 files (two chapters/two records); none applies G02's shooting/assembly/pilot changes. An explicit diff for shooting, public-run-binding and the pilot is empty.
- Searched actual manuscript text for `eq:shoot-slope`, `prop:shoot-public-running`, pilot include and proposed bibliography keys: absent. Read actual shooting, pilot and family-binding text rather than substituting the proposed patch.
- Independently recomputed all **30** frozen-input SHA-256 values using `git show REV:path`: PASS. G02's four author-file hashes exactly equal those recorded by review154; no m1/m2 amendment is present in the stored patch.
- `git rev-parse HEAD:Lean` and frozen223's Lean tree both equal `328ad19b404d2db2a578319ea3e4eba4b27e34ef`. The source pin remains `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` Whitespace checks passed.

No patch was applied, even in scratch. No claim is made that the historical G02 patch still applies cleanly to every current file. No LaTeX build/render was run because this task changes only reports; the G02 scratch builds are historical evidence, not commands repeated here. No Lean elaboration, kernel/axiom replay, checker modification or checker tests. Existing elementary proofs were inspected and reused; no new theorem or literature result was developed.

## Handoff

The mathematical and source comparisons favor the conditional running implication. Actual integration remains incomplete: O1 belongs to the relevant owners/F01, O2 to the public assembly owner. Parent inspects these reports and owns the issue acknowledgement/release. No manuscript, G02 patch, prior report, shared ledger or source is edited; no formal approval, merge, closure or human acceptance.

## Citation correction after submission

Parent session `mgubi-parent-running-citation-20261113`, claim178#6864060631, corrected the Schedule namespace only. `Lean/YM/Lattice/Scale.lean` declares the structure under `namespace YM`; `open Lattice` does not nest the declaration there. The four anchors are `YM.Schedule.denominator`, `YM.Schedule.a`, `YM.Schedule.scale`, and `YM.Schedule.block_large`. Parent inspected the namespace and declarations and reran the blueprint and whitespace checks successfully. Mathematical findings, frozen input hashes and all other report content are unchanged; no fresh Lean or LaTeX run. This correction does not update any other reviewer's verdict.
