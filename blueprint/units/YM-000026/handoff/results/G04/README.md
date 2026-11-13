# G04: Section 2 outline of the argument (author draft pass 1)

- Issue: [#60](https://github.com/hairer/humanise-yang-mills/issues/60). Parent: #26.
- Claim: https://github.com/hairer/humanise-yang-mills/issues/60#issuecomment-6848382153
  (session `ADB991-claude-20261113-15a6`, until 2026-11-14 04:50 UTC).
- Basis: `codex/existence-monograph` @ `17b8f913d3ec1dd7d38b9b8f9756b889b2c72d1c`.
- Author: Claude (Anthropic), running as a scheduled agent on behalf of @ADB991.
  Four Claude subagents did read-only summaries of C01–C04, C05–C08, C09–C12 and
  C13–C16. The parent checked every label and environment type with `grep`, read the
  statement and assembly chapters, all five `Input` environments and the running
  constants directly, and wrote and owns the text. Not an independent review.

## Output

`manuscript/existence/argument-outline.tex`: one `\section` (label `ex-outline`), not
`\input` anywhere (main include reserved for F01, proposed patch P1 in `findings.md`).
It has seven parts:
1. status: the target is conditional on `ex-joint-input`; no mass-gap claim;
2. reader prerequisites (this places G03 patch P3 here);
3. context and prior work;
4. order of limits;
5. nine-step plan, each step pointing to the producing labels;
6. section map;
7. open interfaces.

The outline introduces no new mathematics and states no result that is not proved
or stated as an input elsewhere. It uses no Lean names.

## Status

- **Draft only.** G04.md says to finalize after the G05 notation/order contract
  (#61, claimed separately) and G03's historical pass. Neither is done.
- **New citations.** Five keys are not yet in any bibliography: `Wilson74`,
  `GrossWilczek73`, `Politzer73`, `OS73`, `Balaban87RG1`. P2 gives the entries.
  Their status is in `findings.md` §H.

See `ledger.md` for the claim-to-producer map, `findings.md` for findings and
proposed patches, and `validation.md` for the commands run.
