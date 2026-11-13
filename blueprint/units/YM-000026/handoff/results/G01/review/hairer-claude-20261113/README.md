# G01 independent review (agent review, no human acceptance)

- Package: G01 (`blueprint/units/YM-000026/handoff/G01.md`), issue [#58](https://github.com/hairer/humanise-yang-mills/issues/58); parent #26.
- Role: independent reviewer of the G01 author audit (PR #68, session `schmittj-claude-g01-20261112`) and its formalisation (PR #74, session `schmittj-claude-g01-formal-20261112`). Mathematics and Lean correspondence are reported separately (`mathematics.md`, `lean.md`).
- Session: `hairer-claude-g01-review-20261113`. Claim: comment on #58 by `hairer`, 13 November 2026, until 2026-11-14 09:00 UTC.
- Account and agent: submitted under `hairer`. The work was done by a Claude (Anthropic) agent session. The reviewer did not author any G01 file. **Independence caveat:** the author sessions also used Claude agents, and a Codex agent only as a cross-check. This review is by a different session and account, not by a different model family.
- Reviewed content: `blueprint/units/YM-000026/handoff/results/G01/` at `codex/existence-monograph` `69c254b58e98c4bc82d7554c87a651f947934db0`, with the hashes in `validation.md`. These are the files as merged from PRs #68 and #74, plus commit `39fc9ca` (source-trust update).
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- **Outcome: the mathematics of the audit is confirmed; minor changes requested; one strengthening finding (M3) and one open question (M4).** No error was found in `adequacy.md` (b) or (c), in the statement ledger (Part A, spot-checked in full against the three public files), or in the source-trust record. The formal statements say exactly what the note claims. The formal proofs were not re-run here.

## Findings

1. **Adequacy proposition confirmed (mathematics.md M1, M2; lean.md L1, L2).** I re-derived (b) and both versions of (c) step by step against `ChallengeSpec.lean` and `PublicWilson.lean`, and found no gap. The hypotheses hold for the constructed witness by multilinearity of `classMoment`, and I checked the anchors. The Lean statements of `constant_insertion_witness`, `jointExistence_body_constant_insertions` and `jointExistence_with_constant_insertions` are faithful to the note and to `JointExistence`. The formal file contains no construct that could change the meaning of the public types.
2. **New, stronger consequence: the public statement does not distinguish gauge groups (mathematics.md M3; paper argument by the reviewer, not formalised, not reviewed).** Combine (c) with a rescaling of the grade-four field, using multilinearity, and a re-homing of the hierarchy to a family over another group. Then the witness of `YangMills.constructed` for a single simple group yields the body of `JointExistence` for every simple group, with constant insertions. The gauge group, its representation and the Wilson action enter the public statement only through the lattice clause.
3. **Open question (mathematics.md M4).** Whether an explicit generalised free field satisfies (H1) and the vanishing hypothesis. If it does, `JointExistence` is provable with no Yang–Mills content. I give a sketch with the points still to check and claim nothing. Until it is settled, the sentence in `adequacy.md` (d)(3) that the non-lattice properties are "as hard as before" is unsupported.
4. **The audited text of `statement.tex` has moved (mathematics.md M6, below).** After the audit (SHA-256 `43ca…5378`), C16 (PR #86, commit `3c2ed3b`) revised `statement.tex` to `1279…301d`. It applied P1, P3, P4 option (i), and the first part of P5 and of P6. I checked the new text against the Lean clauses and it is faithful. The ledger's line numbers refer to the old hash, which the ledger records, so they remain traceable.
5. **Source trust confirmed.** The summary of the #2 and #37 records in `source-trust.md` agrees with `source/evidence/axioms-3456e5e.md` on this branch, and with `clean-build-3456e5e.md` and `comparator-3456e5e.md` on `main`. Note that the last two are on `main` and not on `codex/existence-monograph`, and both are labelled unreviewed author evidence. I reproduced the manifest observation myself: `sha256sum -c SOURCES.sha256` in `Lean/` gives 9,497 `OK` and 10 absent, all `verification/*.log`.

## Requests to the author (G01)

- **Q1.** In `README.md`, finding 1, and `adequacy.md` (d), record the group-independence of M3 as a reviewer finding, pending its own check, or explicitly decline it with reasons.
- **Q2.** Reword `adequacy.md` (d)(3) as suggested in `mathematics.md` M6, and point to the open question M4.
- **Q3.** In `proposed-patches.md`, add a status line per patch recording what C16 applied in `3c2ed3b` (list below). Re-base the remaining patches' line numbers on `statement.tex` `1279…301d`, or state that they refer to `43ca…5378`.

## Verdicts on the proposed patches

| Patch | Verdict | Status on `69c254b` |
| --- | --- | --- |
| P1 "regular" | correct | applied by C16 (`statement.tex` 35–41), faithful to `WilsonRegularity` |
| P2 group hypotheses | correct; recommended | not applied |
| P3 locality | correct | applied with P1 ("both endpoints in \(x+\Sigma_v\)") |
| P4 boundary values | correct; option (i) is the faithful one | applied, option (i), with display `eq:public-selected-boundary`; operator order and sign of shift agree with `Reconstructed.boundary` |
| P5 phases | correct | first part applied (only the selected point carries a theory; multilinearity not required). The sentence about characters of a commutative algebra was not applied; it rests on an anchor neither G01 nor I opened, so leaving it out is right |
| P6 scope | correct; the remaining sentences are recommended | partly applied (no lattice formula, no stress-tensor identification). Not applied: no spectral gap asserted; reading of the trace test (finite profiles only; continuous superpositions and higher truncated functions not addressed); slope not prescribed |
| P7 pointer to detailed theorem | correct; optional | not applied |
| P8 `source/build.md` | correct; recommended | not applied; `source/build.md` unchanged (`db88…8e87`). Counts independently reproduced |
| P9 #11 additions | correct (9.1 and 9.2 checked against source, 9.3 consistent with `Contour.lean` as cited) | for the #11 owner |

**Proposed text for finding 1, for C16 and the coordinator.** This is a proposal only; G01 does not own `statement.tex`. Something like: "This target ties the lattice measure only to the mixed correlations. In particular it is satisfied by families whose insertions do not depend on the link configuration, and it does not distinguish between gauge groups (blueprint G01, adequacy note and review). The construction proves more; see Theorem~\ref{…} for the detailed statement." Whether to say this, and where, is the coordinator's decision. M3 should be formalised first.

## Checked and not checked

Checked by reading: the three public Lean files in full; the formal files in full where their statements and definitions are concerned (not every proof line); the bridge and source anchors listed in `lean.md` L3; all six G01 Markdown records; the C16 diff of `statement.tex` since `b2f59c3`; the #37 evidence files on `main`.

Not checked: no Lean elaboration, build, axiom print or kernel replay (toolchain unreachable here); proofs inside `Adequacy.lean` line by line (the paper proof was checked instead); the internal anchors behind phase positivity and `C.seen` (`lean.md` L3); Mathlib's definitions of `TestFunction`, `charFun` and the `MeasureSpace` on `Points n` (taken as the ledger reads them); M3 and M4, which are new and unreviewed.

## Next steps

1. The author answers Q1–Q3. Material edits to `adequacy.md` need renewed review of the changed text only.
2. Someone with a working Lean setup re-runs `formal/README.md`'s commands, closing `lean.md` L4, and formalises M3.
3. The coordinator decides on a bounded task for M4, and on the manuscript wording of finding 1 with C16.
4. P2, the rest of P6, P7 and P8 go to their owners (C16; #2/#37).

This review records no human acceptance and changes no machine-readable review status.
