# G01-to-C16 statement endpoint comparison

Session `mgubi-astra-g01-c16-statement-20261113`; [claim](https://github.com/hairer/humanise-yang-mills/issues/178#issuecomment-6863520798), expiry 2026-11-14 05:00 UTC. One Astra agent under mgubi; no subagents. This account authored the initial C16 text: the C16 comparison is author-side evidence, **not independent C16 approval**. Human acceptance is unset.

Only `G01-to-C16-statement` is checked. Outcome: **matched at the frozen versions, no required endpoint correction identified**. See [mathematics](mathematics.md) and [source correspondence](source.md). No whole-G01/C16 renewal, supplier completion or global cycle audit is asserted.

| Endpoint/evidence | Exact revision |
| --- | --- |
| C16 canonical consumer | `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2` |
| C16 response PR165 | `aab25d77f03fca5fbb850748d313f93010e93861` |
| C16 renewed review PR174 | `e6dac696e432514182a0db3fc3b92da6786f6291` |
| G01 response PR132 | `135bb960004989c97a330ed13cf6311600f65939` |
| G01 renewed review PR153 | `88e5ead6bddd6ba8bc4e5b0be84218c5c0ddd7b3` |
| Imported Lean revision | `3456e5e75cf8d4cd558955a5c7638fba2d68f464` |

The consumer `statement.tex` and `assembly.tex` are byte-identical between PR165 and the canonical consumer. The frozen G01 records and reviews are also identical to their copies here. Every inspected input version and SHA-256 is in [frozen-inputs.json](frozen-inputs.json); `python3 <this-directory>/verify.py` checks the immutable Git objects and worktree bytes.

## Proposed acknowledgement

`G01-to-C16-statement`: acknowledge G01 `adequacy.md` (c)–(d) and `proposed-patches.md` P1–P7 at PR132, with the review boundaries of PR153, against C16 `ex-statement`, `eq:public-selected-boundary`, `rem:ex-target-adequacy` and `ex-conditional-existence` at the canonical version above. Regularity/locality, group and normalization conditions, selected/mixed distinction, totalized boundary integral, public scope limits and the conditional penalty-one projection match. The constant-insertion explanation retains its extra homogeneity premise and preserves the selected theory; it does not construct a new one. M3 group transfer is not asserted in the manuscript; M4 remains separate under issue162. The same-data analytic assembly remains open with its existing suppliers. This is a bounded endpoint acknowledgement, not independent approval of C16 or global acceptance.

## Actual validation and limits

Read current contribution/coordination/proof instructions, live issue178 body and all comments, cached complete issue58/57 histories and PR132/153/165/174 metadata, G01 paper argument, patch list and bounded reviews, the two consumer chapters and immediate source definitions/calls listed in the reports. Read shared literature guidance and searched the existing G01 evidence before checking the already-reviewed argument; no new external result or proof is supplied. `Bots/` contains only its guidance README at this base.

Commands actually run: read-only `rg`, `sed`, `cat`, `git show` and SHA-256 comparisons; the frozen verifier; `python3 scripts/check_blueprint.py`; `git diff --check`. Results: verifier PASS (27 frozen versions), blueprint PASS (four units), whitespace PASS. All 11 inspected Lean files also match the imported `Lean/SOURCES.sha256`; this is integrity evidence, not authentication or proof checking. Manuscript, source, formal files, old reviews and shared ledgers remain unchanged. No new Lean elaboration, axiom audit, kernel replay or LaTeX build/render was run for this report-only task. The earlier build/elaboration evidence is attributed to its authors, not rerun here. Source definitions and the elementary witness calculations were checked; full formal proof bodies, Mathlib conventions and the full transitive analytic construction were not re-audited. M4/PR236 is neither reviewed nor imported as a proved supplier.
