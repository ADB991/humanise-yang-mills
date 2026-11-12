# C11 part-B validation (commands actually run, 2026-11-12)

Worktree `/home/jo314/ym-wt/c11`, branch `claude/c11-author`, base `1749b55`. No commit, no push, no GitHub post, no Lean build.

## Hashes (SHA-256)

| Chapter | Before (from `c11-start-hashes.txt`) | After |
| --- | --- | --- |
| `coupling-reset-selection.tex` | 45318f4fb3ba9c65926dc99c096d979bd2a9be7799b19786f7dab712bf643fe3 | 789009ee9f62a1fb41742e238ffb67988071c0bce22ba54b81943a8bf86c906d |
| `physical-reset-reorganization.tex` | 0ccb6c1fe0dc0536f8bf5655c253d80d38ab90ca489a4749fdf40a95fe96a5e2 | baa0b80d552701ccbef08baad484cede902f1eed0f7549119a98e9f8839c2627 |
| `selected-nonlinear-offering.tex` | 8de3f86d16fd386ae1d38d8a25a49b397d3b85c74701caa8637cf430143bacd3 | b11fe8ad8cba32d362d6a239b771b48129689e54cc0f30ec152b5ac13db53c9a |
| `surviving-interval-shooting.tex` | 13aab4c33c522d614f963e664dfde0f5089f8b2b5637381e098cf2bf62b0533b | 1b7f5c4e91d7a8c4c76ef066d9b25d07d79330a1c9936e18c403769d7f2492ab |
| `path-attachment-producer.tex` | 90587cfacf405b4f84e4bbf23c63ecf3b27731cf4d558f47ef4b6e69510d3f56 | dffbf8d30f23c6d56dc32a9ab95e377096a89c93056a67d26110ea9895c24786 |
| `terminal-normalization-transfer.tex` | 83ca6fe75f046c2e322b8597516d35a6e2fd6ea55142dbde681997f930af37b4 | 07c03596d8c1459fc1aa9a8cfb041c5f3bc7d4080fa3df1f11c8848da70f0082 |
| `wilson-startup-construction.tex` | d00d44fa7a020afa4683ca20b61291f115795c664f24e311edbab32cdb36015c | a28829c04f10fa255cec542c277ec3f30b24bbc279538d091a2c7ac8ac729a87 |

Line counts after: 203, 631, 493, 153, 1046, 258, 419 (before: 179, 336, 401, 141, 679, 174, 330).

## Commands and results

| Command | Result |
| --- | --- |
| Wrapper `wrap.tex` in `/tmp/claude-1000/-mnt-c-Users-jo314-Downloads-humanise-yang-mills/daa63c5b-ca30-41e4-9397-07fd86dcda87/scratchpad/c11-build-part-B/`: `\documentclass[11pt]{article}`, `\input` of `manuscript/preamble` by absolute path, `mathtools`, `mathrsfs`, the `\newtheorem` lines of `manuscript/existence.tex`, then `\input` of the seven chapters by absolute path | written |
| `latexmk -pdf -interaction=nonstopmode -halt-on-error wrap.tex` (Latexmk 4.83), final run after the last edit | exit 0; 43 pages; 0 lines starting with `!` in `wrap.log`; 0 `Overfull` |
| `grep -o "Reference \`[^']*'" wrap.log | sort -u`, then `grep -l "label{…}" manuscript/existence/*.tex` for each | 27 distinct undefined references; each label exists exactly in a chapter not included in the wrapper (`common-funded-history`, `five-period-localization`, `soft-log-fusion`, `healthy-boundary-jets`, `nonlinear-payment-selection`, `ope-grouping`, `finite-volume-parameter-continuity`, `common-scale-selection`, `selected-course-binding`, `free-horizon-convergence`, `local-splitting`, `parameter-comparison-suppliers`, `pure-action-small-field`, `selected-history-limits`, `rg-horizon-geometry`, `rg-multisource`); no undefined reference to a label that should be inside the seven chapters |
| First build (before layout fixes) | exit 0; 3 overfull boxes in the new definition and proposition of `path-attachment-producer.tex`; fixed by displaying three formulas |
| `pdftoppm -png -r 70 wrap.pdf pg` (pdftoppm 24.02.0) and visual inspection with the Read tool of pages 11–12, 22–23, 24 and 27, 28–29 (two pages per sheet) | new definition, proposition, affine-Hessian paragraph, discrepancy identity, stage-constants subsection, continuity lemma render correctly; equation numbers and internal references resolve; external references show `??` as expected |
| `pdftotext -layout` per page, grep for the new passages | all new passages present (pages 1, 3, 4, 11–13, 21, 22, 24, 27, 28, 32, 33, 37, 39, 42) |
| `git diff --check -- <the seven chapters>` | clean (exit 0) |
| `grep -c "label{L}" manuscript/existence/*.tex` for each of the 15 new labels | each defined exactly once |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` (no blueprint file was changed by this part) |
| `Write` of `blueprint/units/YM-000026/handoff/results/C11/part-B/findings.md` | refused by the harness ("Subagents should return findings as text, not write report files"); per the brief the four reports are delivered as appendices; an empty directory created beforehand was removed |
| Targeted `grep`/`sed`/`cat` reads of the Lean files listed in correspondence.md | text reads only |

## Not run / not checked

- No Lean build, elaboration or `#print axioms`.
- No build of the full `manuscript/existence.tex`; pages 1–10, 13–21, 25–26, 30–43 of the wrapper were not inspected visually (the log shows no overfull boxes or errors there).
- `python3 -m unittest` not run (checker not changed).
- No literature check.
- Chapters of part-A and of other packages were read only where cited; `five-period-localization.tex` was not re-read after part-A's concurrent edits.
- No independent review; `review/` is not mine.

## Second round (after the Codex check of the uncommitted edits)

After-hashes of all seven chapters at the end of the second round:

| Chapter | SHA-256 |
| --- | --- |
| `coupling-reset-selection.tex` | 3b442a584e76c09c9c028fbd2f693a0970ecb62dadc25233c9570b84cdeefa3a |
| `physical-reset-reorganization.tex` | 47085cc0d4645b9583c9e5ad189e1b91cad31344a4869b9d635e500bcbd19622 |
| `selected-nonlinear-offering.tex` | 3f4df156e00f860c86a8bb04ae9f8ea17311482b5e64272eb38fad79896cf243 |
| `surviving-interval-shooting.tex` | 1b7f5c4e91d7a8c4c76ef066d9b25d07d79330a1c9936e18c403769d7f2492ab (unchanged in this round) |
| `path-attachment-producer.tex` | 68ff804accb442f7fba609c60c57b1fc184c5c4d4e4c1faa0000af6589cc021d |
| `terminal-normalization-transfer.tex` | 07c03596d8c1459fc1aa9a8cfb041c5f3bc7d4080fa3df1f11c8848da70f0082 (unchanged in this round) |
| `wilson-startup-construction.tex` | 7120f4648e48b4af4dd547bf64d522b1e862f2b77b0e4a0711e9dc4a99eef787 |

| Command | Result |
| --- | --- |
| Text reads of `Progress/DIRECTED_RECIPE/Batch.lean` (`Ingredients`, `trunk`, `finish`), `Fittings.lean` (`pre_finite`), `Motion.lean` (`PreBound`, `Flow.tighter`), `Shelves.lean` (`spare`, `distinct`), `Pellets.lean` (`sleeping_out`, `never_spent`), `Padding.lean` (`Readdress.restE`, `restK`), `RN/Pane/Laud.lean` (`ligatures`), `RG/PathActions.lean` (`Clip.kink`), and of `healthy-boundary-jets.tex` l.100–175 | used for the second-round decisions |
| `latexmk -pdf -interaction=nonstopmode -halt-on-error wrap.tex` (same wrapper) | exit 0; 44 pages; 0 errors; 0 `Overfull`; 27 distinct undefined references, the same external labels as before |
| `pdftoppm -png -r 70` of pages 19 and 32 and inspection with the Read tool | rewritten boundary-estimate paragraph and recipe-compatibility paragraph render correctly |
| `git diff --check -- <the seven chapters>` | clean (exit 0) |
| No label introduced in the first round was renamed or removed | checked by leaving all `\label` lines untouched |

Not run in the second round: no Lean build; pages other than 19 and 32 not re-inspected visually; `Boulevard/Views.lean` (`rising`) not opened (the manuscript section it corresponds to was read instead).
