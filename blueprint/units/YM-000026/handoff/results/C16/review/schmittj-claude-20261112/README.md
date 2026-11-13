# C16 independent review (agent review, no human acceptance)

- Unit: work package C16 "Schedule purchases and final same-witness public assembly" of unit YM-000026.
- Role: mathematical validity (`mathematics.md`) and Lean correspondence (`lean.md`); commands in `validation.md`.
- Human reviewer: `schmittj` (account under which this agent review is submitted; no human acceptance is recorded).
- Agent assistance: one Claude Opus reviewer agent, coordinated by a Claude session (session `schmittj-claude-c16-review-20261112`). The author pass used OpenAI Codex agents; this reviewer is from a different model family.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Review task and PR: issue #57 (review claim posted by the coordinator); author PR #86 merged (author commit `3c2ed3b`), reviewed in the worktree at `81538d6`.

Content SHA-256 of the files reviewed (identical to the author's `hashes.json` final values and to the coordinator's `c16-hashes.txt`; rechecked at the end):

| File | SHA-256 | Outcome |
| --- | --- | --- |
| `manuscript/existence/statement.tex` | `127906c20579e173f17e715a27069d2b519bcbd0370b8c2e4e6e04f06331301d` | accepted locally; optional nits M8, M9 |
| `manuscript/existence/nonlinear-payment-selection.tex` | `a67843bb5636f4e79bea08cff7b6c00a6a060b19afccdebb910eb79bb9f62b5e` | accepted locally, conditional on its inputs |
| `manuscript/existence/common-scale-selection.tex` | `ca52894602cabccee2b7ef55148f8e08709f79cdb1fca37fca451305c13cd195` | accepted locally, conditional; nit M6; drift floor of M2 to be added |
| `manuscript/existence/ope-scale-purchases.tex` | `33aa599c8b458420aeebf0fad62381940f03ccddd79e698a42ff476fbf5e53e0` | accepted locally, conditional; nits M6, M7 |
| `manuscript/existence/ope-history-service.tex` | `d74bdfe47f4ab4201e5841c6f1fdbf71049d5c5868954085d2de07012b4f9bbe` | changes requested (M1 = L1) |
| `manuscript/existence/public-run-binding.tex` | `576679e640793af7ee1f6f2d8973d0e42884adf3b94d18b1e460d99423b3439d` | changes requested (M2; nit M5) |
| `manuscript/existence/assembly.tex` | `a82c6985751b1688e246597d6199ed6cec20b968a0ef97bdf5e9eab155d0dcc7` | changes requested, minor (M3, M4); correct as a conditional assembly |
| `results/C16/README.md` | `2a5f370c0537e4cb86231e3824063b55d4b4006350f80f08fe068642567f3115` | — |
| `results/C16/correspondence.md` | `c95bfd198a7f2f9dd497865f0b752e8815007dbf25aa773c4cf98ba2a7daa3a6` | nit L3 |
| `results/C16/findings.md` | `8f1593a886e696f6c84133aae616afbbdbbaff3cbc26c5838d31ccfa2dc984b5` | nit R4 |
| `results/C16/handoff.md` | `c685d64b1193da749491d93e4fbcd5c31bc716133bc866c80368f5ce2b6de2a5` | update with M2 (R1) |
| `results/C16/hashes.json` | `228e111cae6c6922bd1c439c0adc978f3965c15592d3e69268fcf7df7519135f` | matches the chapters |
| `results/C16/inspected-source.sha256` | `258d437ad7636e84e7f825a9857f000f52dffea3740ed8779d7cd0b1f0c8eeff` | not re-verified against `Lean/SOURCES.sha256` |
| `results/C16/ledger.md` | `c8264caa292e51f12b51ad844b3126b083887509dac44f933bd71a36789761a0` | R1, R2 = L4 |
| `results/C16/validation.md` | `441bc70852ebb47ab7a7f2467cb39c74dae209eb4436351bf0e297003862fbd6` | — |

Overall outcome: changes requested. No ERROR found. The author's commit added no false sentence; its first-stage payment repair (`common-scale-selection.tex`) and grouped-cell repair (`ope-history-service.tex`) fix real defects, and the new public regularity and boundary clauses (`statement.tex`) are exactly faithful to `YangMills.WilsonRegularity` and `YangMills.Hierarchy.Reconstructed.boundary` (operator order, sign of the shift, product tests, Bochner convention, no integrability field). The assembly is explicitly conditional on `ex-joint-input`, which is open.

Top findings:

1. M1/L1 (GAP, pre-existing): `ope-history-service.tex` 131–152 applies the many-slot estimate to every finite cell-by-slot marker set without the hypotheses of `YM.MergeProof.Ribbons.ManyCopies.Unites`: total parent occupancy at most the purchased \(N\) (undefined at line 134) and the offer bound on the full product set. Confirms note (b) on #57. Note (a) is resolved by the author's commit.
2. M2 (GAP, pre-existing, incoming edges posted after the author's commit): C12's `C16-to-C12-selected-run` obligations (a) pre-schedule portfolio sections and regradings, (b) `paper` thresholds at most the floor lengths, (c) `dusk` for the run's delay are not stated; (d) \(d+3\le J(t_d)\) is stated (`ope-history-service.tex` 191–192); the fee delay and C11's entry thresholds only generically (`common-scale-selection.tex` 189–192); C11's drift ratio and loop capacities are not stated.
3. M3, M4 (INACCURACY, pre-existing): `ex-full-mesh` omits the hypotheses "at every suitable \(p\)" and "eventually suitable along \(p\circ q\)" used in its proof; `ex-joint-input` refers to Definition `ex-reconstructed` but not to the graded-field and phase-data conditions of `statement.tex` 63–73.
4. G01 P1, P3, P4, P5 adopted faithfully; P6 partly (no false sentence results; the observation that the lattice measure enters only through the mixed correlations is not stated, M9); P2 and P7 not adopted (the existing text is exact; P7's content is in `assembly.tex` 125).

Not reviewed: producers outside C16 beyond their cited statements; the Lean counterparts of (O1)–(O9) and of the nonlinear payments; LaTeX build and rendering; Lean elaboration and axioms.

## Acceptance

No human acceptance is recorded. Material edits answering this review invalidate it and require renewed review.
