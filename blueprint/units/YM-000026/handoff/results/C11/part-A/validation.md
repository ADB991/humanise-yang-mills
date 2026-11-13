# C11 part-A validation (commands actually run, 2026-11-12)

Worktree `/home/jo314/ym-wt/c11`, branch `claude/c11-author`, base `1749b55`. Another author agent (part-B) was editing its own chapters in the same worktree during this pass.

## SHA-256 of the nine chapters

| Chapter | Before (`c11-start-hashes.txt`) | After |
| --- | --- | --- |
| `free-horizon-convergence.tex` | `ce467cda16c7ddbc41f118596ec61aeadcbe8df7767be5c66c9b5563c8770e7c` | `b18ec3280bf190c184122d7f2e4bd53874906d4acea0dfe0885fb7b8a9efc754` |
| `background-path-convergence.tex` | `a1ad1cb45ca9154c1758d788af61e0e3ce4a110fe1accc12c5d48fd3a38d80df` | `fdba3c4e601d308eeeb6affa7b2a161d09d22d6f8ca272a529855d5d911fa07c` |
| `coupled-background-convergence.tex` | `a06efa35b5a7d76f5fe9ee3220aff5813114bfb38b84b3996ed74760ec4c100d` | `005d3440da6cc087219659b175209249f7cfbc26cdc7f93ada7bc8e5d3aa6413` |
| `background-ray-estimates.tex` | `f78dd6cd65aa62147bb5d8fab043564ce855a62a91300be9b5eb1ff59a4d0212` | `3e62814da26f396922cca1a253b2a5e872601acdd83da78deae8262139accdea` |
| `background-test-prices.tex` | `0d4274dd682023e0dce5f5ff01c2046c7299ee0ee487283c17480e3621d0c468` | `b3c3463d36abfcda66742d7ccba5d5e18d50e67de444fba57abdccac95814087` |
| `projected-parameter-prices.tex` | `d870cd896bd640223134014fc3a4ab9dae4e31b8f858594b46bfef66a461c254` | `047e06b483169653cebb6f53e314991f5a752bc0934cf5944572a1502c4ff5a9` |
| `sector-analytic-prices.tex` | `af27aea208c8ed80d25737eed1e1450b6565de3c9b4c516bdf5e669bbb72659f` | `93d6607de8bee24c1f96e217ca7bf8d49d5a11c011719953ecce936f34be0a51` |
| `real-coupling-interpolation.tex` | `d956958055a2acb0596fbfc29c8c2f1de26210c5b2fcaa6b365024481c3a805d` | `75a4926195a59e6d80fc5a0feae08db567057436e41f3609745d7835de20ed1a` |
| `five-period-localization.tex` | `9c3622d6fa3adfe3ff3b34aecb22d124bf7e82dd5e7807425518d88937473d36` | `e49662c03954ffefbee715576fa78f161e96dd7c1affc1e324fbeaafc441b35f` |

`git diff --numstat` for the nine files after the main edits (before the last reflow and wording touches): free-horizon 16/0, background-path 171/27, coupled 36/10, ray 28/10, test-prices 72/8, projected 45/23, sector 52/10, interpolation 16/5, five-period 36/23 (added/deleted lines).

## Commands and results

| Command | Result |
| --- | --- |
| `sha256sum` of the nine chapters (after) | values in the table above |
| Wrapper `/tmp/claude-1000/-mnt-c-Users-jo314-Downloads-humanise-yang-mills/daa63c5b-ca30-41e4-9397-07fd86dcda87/scratchpad/c11-build-part-A/wrap.tex`: `\documentclass[11pt]{article}`, `\input` of `manuscript/preamble` by absolute path, the `mathtools`, `mathrsfs` and theorem declarations copied from `manuscript/existence.tex`, then `\input` of the nine chapters by absolute path | — |
| `latexmk -pdf -interaction=nonstopmode -halt-on-error wrap.tex` (Latexmk 4.83), run three times, last after the final edit | exit 0; 36 pages; `grep -c "^!" wrap.log` = 0; `Overfull` = 0; `Undefined control` = 0; `multiply defined` = 0 |
| Undefined references in `wrap.log` | 38 distinct labels. For each, `grep "\label{<label>}" manuscript/existence/*.tex` finds it in a chapter not included in the wrapper (28 files, among them `physical-reset-reorganization.tex`, `selected-nonlinear-offering.tex`, `path-attachment-producer.tex`, `wilson-startup-construction.tex` of part-B, `mixed-activity-prices.tex`, `soft-log-fusion.tex`, `ope-grouping.tex`, `nonlinear-payment-selection.tex`, `common-observable-purchases.tex`, `selected-history-limits.tex`). No label is missing from the manuscript. No undefined reference to a label of the nine chapters. |
| `pdftoppm -png -r 70` (and `-r 60`) of pages 6, 8, 19, 24, 29 and inspection with the Read tool | page 6: new hypotheses list of the path chapter; page 8: decomposition, detection statement and proof; page 19: remainder identification and reset price; page 24: corrected payment display and its use; page 29: seed-mark paragraph. All render correctly, no broken math, no overlong displays. Pages 11, 15, 26, 34 were rendered but not opened. |
| `pdftotext -layout` searches for the new passages | all thirteen searched passages present on the expected pages |
| `git diff --check -- manuscript/existence/<each of the nine>.tex` | no output (clean) |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` (I changed no blueprint file; the report files could not be written) |
| `grep` across `manuscript/existence/*.tex` for every `\label` cited in my edits | all exist, including `eq:reset-stage-constants` and `eq:reset-clip-conditions`, which are in part-B's uncommitted working copy of `physical-reset-reorganization.tex` |
| `Write` of `blueprint/units/YM-000026/handoff/results/C11/part-A/findings.md` | refused by the harness ("Subagents should return findings as text, not write report files"); per the brief no script workaround was used; the four reports are delivered in the final message. An empty directory created for them was removed. |

## Second round (2026-11-12, after the checker report `c11check/final_A.md`)

Edited in this round: `background-path-convergence.tex`, `coupled-background-convergence.tex`, `background-test-prices.tex`, `projected-parameter-prices.tex`. The other five chapters are unchanged since round one. The "After" column of the table above is superseded by:

| Chapter | SHA-256 after round two |
| --- | --- |
| `free-horizon-convergence.tex` | `b18ec3280bf190c184122d7f2e4bd53874906d4acea0dfe0885fb7b8a9efc754` |
| `background-path-convergence.tex` | `bd618520853a2cf14f99e10bd04b56dc3667129b95357c982fb73018aef6e3c4` |
| `coupled-background-convergence.tex` | `ab2a661082b3466ddc8425bc7141da76bcaf8a6f3c9a85d8553a83813a8082ea` |
| `background-ray-estimates.tex` | `3e62814da26f396922cca1a253b2a5e872601acdd83da78deae8262139accdea` |
| `background-test-prices.tex` | `b2d1ac1c59746637fdab532367dce5a37515cf59182442e04dde8afbf6a13567` |
| `projected-parameter-prices.tex` | `21fc47db5ef0804fe5905b0724d0b7fa2c5d8fc082314f9d91ac33f222407d23` |
| `sector-analytic-prices.tex` | `93d6607de8bee24c1f96e217ca7bf8d49d5a11c011719953ecce936f34be0a51` |
| `real-coupling-interpolation.tex` | `75a4926195a59e6d80fc5a0feae08db567057436e41f3609745d7835de20ed1a` |
| `five-period-localization.tex` | `e49662c03954ffefbee715576fa78f161e96dd7c1affc1e324fbeaafc441b35f` |

| Command | Result |
| --- | --- |
| `latexmk -pdf -interaction=nonstopmode -halt-on-error wrap.tex` (same wrapper), run twice, last after the final edit | exit 0; 37 pages; 0 errors, 0 overfull boxes, 0 undefined control sequences, 0 multiply defined labels |
| Undefined references in `wrap.log`, each checked by `grep "\label{…}" manuscript/existence/*.tex` | 38 distinct labels after the final build, none missing from the manuscript |
| `grep -n 'label{…}'` for the part-B labels cited from my chapters | all present: `prop:wilson-startup-family`, `sec:wilson-startup-construction`, `eq:reset-stage-constants`, `eq:reset-clip-conditions`, `sec:physical-reset-reorganization`, `eq:selected-offer-truncation`, `sec:selected-nonlinear-offering`, `subsec:path-vow-representatives`, `subsec:path-factor64-envelope`, `sec:path-attachment-producer` |
| `pdftotext` search for the five changed passages | found on pages 6, 8, 11, 19, 24 |
| `pdftoppm -png -r 70 -f 24 -l 24` and inspection | page 24 (new `eq:projected-forecast-inputs` and derivation) renders correctly. Pages 6, 8, 11, 19 were located but not re-inspected as images in this round. |
| `git diff --check` on the nine chapters | clean |
| `Edit` of the four report files in `results/C11/part-A/` | accepted |

`python3 scripts/check_blueprint.py` after the report edits: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`

Not done in round two: no Lean build; `Payments.Pairing.currency`, `kGoal`, `Tent.columns`, `Cash.armK` not opened.

## Not run, not checked

- No Lean build, elaboration or `#print axioms`. All source statements are text reads; hidden instances and coercions were not inspected by elaboration.
- No full build of `manuscript/existence.tex`; cross-references into other chapters were checked by `grep` only.
- No GitHub access was used (not permitted in this pass); the live issue was not rechecked.
- Lean declarations cited from the audit reports but not opened by me are flagged "not opened" in `correspondence.md` and in the decision table of `findings.md`.
- Producers in other packages (C01, C06, C07, C08, C09, C16) were opened only where the ledger says "statement opened".
- The chapters of part-B were read only at the passages cited (`path-attachment-producer.tex` l.520–700, `physical-reset-reorganization.tex` cost subsections, `selected-nonlinear-offering.tex` l.8–215, l.276–400, `wilson-startup-construction.tex` l.236–335); they changed during the pass.
- No independent review; the review directory belongs to a different agent.
