# G03: bibliography and historical attribution audit (author pass 1)

- Package: G03, live issue [#59](https://github.com/hairer/humanise-yang-mills/issues/59); parent #26.
- Role: AUTHOR. Session `ADB991-claude-20261113-20f1`
  ([claim](https://github.com/hairer/humanise-yang-mills/issues/59#issuecomment-6841662484)).
  Prepared by Claude (Anthropic) running as a scheduled agent on behalf of @ADB991;
  ADB991 had not reviewed it before submission.
- Basis: `codex/existence-monograph` at `d3c7a1901390f4821d4b91f6f639bb5c60c63604`
  (241 included chapters). Lean revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (not read; no
  citation in the manuscript points into Lean).
- Owned outputs: this directory and the proposed
  `manuscript/existence/verified-references.tex` (not `\input` anywhere; F01 decides integration).

## Files

| File | Content |
| --- | --- |
| [ledger.md](ledger.md) | Citation/obligation ledger: every external literature invocation, its use, load-bearing status, source-check provenance and verdict |
| [findings.md](findings.md) | Defects and gaps found (locators, incomplete references, unverified sources, prerequisites, attribution) |
| [proposed-patches.md](proposed-patches.md) | Exact text patches for files owned by other packages / F01; not applied |
| [validation.md](validation.md) | Commands actually run, hashes, access failures |
| [handoff.md](handoff.md) | What is established, what remains, next steps |

## Scope note

At this basis the monograph has **no Section 2 outline and no historical claims**: the outline is G04's
(#60, blocked). G03's historical-attribution part therefore reduces to the attribution gaps in F5
and must be re-run against G04's outline when it exists. The canonical running-coupling pilot
(`manuscript/pilots/running-coupling.tex`, `manuscript/references.bib`) belongs to #22/G02 and is
out of scope except as noted in F8.
