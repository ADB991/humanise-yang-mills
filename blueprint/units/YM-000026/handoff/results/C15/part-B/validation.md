# C15 part-B validation (commands actually run, 2026-11-13)

Worktree `/home/jo314/ym-wt/c15`, branch `claude/c15-author`, base `81538d6`. The part-A author was editing other chapters of the same worktree at the same time; I touched only the nine part-B chapters.

## Hashes (SHA-256)

| File | Before (`c15-start-hashes.txt`, confirmed by `sha256sum` before my first edit) | After |
| --- | --- | --- |
| `manuscript/existence/trace-probe-assembly.tex` | 9893635fc18a4bc245bb743c3bacdbf626fbd1cf8de00fa8395d8f14fc46aa79 | 420072c701690d362620da6915bc3b98e9218b0a0be02e82fb78698bbed3b532 |
| `manuscript/existence/trace-mission-price.tex` | a4c9a11b64c85525be8ef8ee0e03f5aa149d5d33b9f90a0ed8634c1edff16df1 | e6244286399c6af819ebc538519e8008a1a8f1ab9aed57b7cce24695eb0dca5e |
| `manuscript/existence/trace-scribe-producer.tex` | 207d6605edb7ac2041b6dee0c9ea9f356778e1481c2d56e4dcb4a577a33dc357 | fa7d6c372ac06840f9a82b8b4898ad0d14d8897c618a6d74749fcf37295ed442 |
| `manuscript/existence/trace-local-pairing.tex` | 307550793a75a0d40a8eb4c782817279710acfdba278ca400d5d718ad477ea4c | d904217ef3c520d77225c89ea058d324b8126235996f708b7195780d3e9a16e7 |
| `manuscript/existence/trace-local-charge.tex` | e3cf960c5c1ee9ee40cf22ff75dd36c8a7007b781a36284588340f454d656d29 | 8e59a151a2d294e1b0a7f6c057d8736040abc046b15822292f57c29c6d93aeb3 |
| `manuscript/existence/trace-spectrum.tex` | 2f2c16737f123073f07ec3e5132fd4c6df83ad8021d20fa44d2d32aaece494e7 | 30cf0d74767436eb03432d3a94e9aca29e31730b401ff4fb39debf1d702cf085 |
| `manuscript/existence/trace-profiles.tex` | 6a708c5fae0e1f07849c527dd4645f402ce753db088533972eba39ffe32c9d54 | 6a708c5fae0e1f07849c527dd4645f402ce753db088533972eba39ffe32c9d54 (unchanged) |
| `manuscript/existence/trace-asymptotic.tex` | 5153c8ba36230fe0bd73a286477f4121d7461939501850b821fb7265e57f0a04 | 4b4196a3b760478518c44949e775ae932cb628dce7632e66473bfdc407d6975d |
| `manuscript/existence/trace-weighted-estimates.tex` | dfe8ecfa80a170160a2930ab580957c9be04013d1bd84d845434de5f395d19b4 | a78b334d089ad72e97122a0cbcb96a6c3a34789923ac5746e344a8a470d3c40e |

## Commands and results

| Command | Result |
| --- | --- |
| `sha256sum` of the nine chapters before editing | all nine equal to the start-hash file |
| Edits applied with small Python `str.replace` scripts, each asserting exactly one occurrence of the replaced text | all assertions passed |
| Wrapper build in `/tmp/claude-1000/-mnt-c-Users-jo314-Downloads-humanise-yang-mills/daa63c5b-ca30-41e4-9397-07fd86dcda87/scratchpad/c15-build-part-B/`: `wrapper.tex` with the document class, a copy of `manuscript/preamble.tex`, `mathtools`, `mathrsfs` and the theorem declarations of `manuscript/existence.tex`, `\input` (absolute paths) of the nine part-B chapters and of `trace-prosper-sensor.tex` and `trace-branch-moments.tex` (the latter two only so that the new references resolve; they were not modified); `latexmk -pdf -interaction=nonstopmode -halt-on-error wrapper.tex` (latexmk 4.83, pdfTeX 1.40.25, TeX Live 2023/Debian) | exit 0; 54 pages; no LaTeX error, no undefined control sequence, no multiply defined label. 28 distinct undefined references, all to labels in chapters not included; each was checked with `grep -lF '\label{…}' manuscript/existence/*.tex` and exists (C04 chapters, C14 chapters, part-A chapters). No undefined reference to a label of the included chapters. One `Overfull \hbox (5.3389pt too wide)` at `trace-weighted-estimates.tex` l.14–18 (lemma heading), present before my edits |
| `pdftoppm -png -r 70 -f 1 -l 34 wrapper.pdf pg` and visual inspection with the Read tool of pages 6, 10, 11, 12, 24 (scribe: definitions and optical identity, shell-comparison inputs, comparison tables and clock, scalar representation and record; asymptotic: status paragraph, lemma and theorem) | displays and enumerations render correctly; no broken math or overfull display seen. Other changed pages were checked by `pdftotext` search for the new passages (pages 1, 4, 7, 9, 13, 16, 21, 23, 25, 27–29, 31, 32), not visually |
| `git diff --check -- <nine chapters>` | clean (exit 0) |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` (no blueprint file was changed by me; the report files could not be written) |
| `grep -lF` for every part-A label I cite, at the end of the session | all present (`prop:ex-trace-bill-root-price`, `prop:ex-trace-crown-buffer`, `lem:ex-trace-small-means`, `eq:ex-trace-medium-core`, `eq:ex-trace-small-means-detector`, `eq:ex-trace-small-means-rate`) |
| Text reads (`sed`, `grep`) of the Lean files listed in correspondence.md | as recorded there |
| Write of `findings.md` into `results/C15/part-B/` | refused by the harness ("Subagents should return findings as text"); per the brief the four reports are delivered as appendices of the final message; the directory `blueprint/units/YM-000026/handoff/results/C15/part-B/` was created and is empty |

## Not done

- No Lean build, elaboration or `#print axioms`. All Lean correspondence is from reading source text at the pinned revision.
- The full `manuscript/existence.tex` was not built (the other author was editing chapters concurrently). In the full build the new references to the two external chapters will be undefined until those chapters are `\input` (findings P3).
- Not opened: `Lean/YM/OS/Heat/Duration.lean` (`Semigroup.damp`), `Link/Identity.lean` beyond its declaration list, `StressLaws`, `comparison_jets`, `pay_jet`/`drape` proofs, `Duo.receipt`, `Gondola` fields, `Spec.Locals`, the files defining `mack`, `Merch`, `Craft`, `Combat`, `orbitCost`, `ellZ`.
- The producers behind the C04, C03 and C14 edges were read at statement level only (C04, parts of C14) or not at all (C03); see the ledger.
- The cited literature was not re-inspected; no new literature citation was added.
- No GitHub post, no commit, no push.
- No independent review; nothing here is an approval.

## Second round (2026-11-13, after the independent checker report `c15check/final_B.md`)

| Command | Result |
| --- | --- |
| Read of the checker report in full; text reads of `Chart/Earl.lean` l.8–47 (`reaches_mutable`, `drape`, `pay_jet`), `Lean/YM/Next/UV_STRESS/Focus.lean` l.40–110 (`head_tilt`, `bend_limit`), `Chart/Limits.lean` l.58–82 (`vega`, `Waft`, `steppes`, `quill`), `Margin/Mallet.lean` l.14 (`azure`), `Slate/April.lean` l.26–29, 43 (`tribe`, `BornZ`, `Vivid`, `Vivid_z`), `Terrace/Vector.lean` l.52–58 (`Vbase`, `Stem5`, `Stem5_kernel`), `Lean/YM/Euclid/Stress.lean` l.88–98 (`StressLaws`), `Lean/YM/Push/STRESS_FLUX/Counts.lean` l.28–45 and `Lift.lean` l.21–22 (`tensors`, `vectors`, `TableTwo`, `TableOne`), `trace-free-rank.tex` l.225–262 | as used in findings, second-round section |
| Edits with Python `str.replace` scripts asserting exactly one occurrence, in `trace-scribe-producer.tex`, `trace-asymptotic.tex`, `trace-weighted-estimates.tex` | all assertions passed |
| Reference check: for every `\ref{X}`/`\eqref{X}` in the nine chapters, `grep -lF '\label{X}' manuscript/existence/*.tex` and comparison with `grep -o 'input{existence/[^}]*}' manuscript/existence.tex` | every target is defined in a file included by `existence.tex`; no reference to `trace-prosper-sensor.tex` or `trace-branch-moments.tex` remains |
| Part-A labels cited (`prop:ex-trace-bill-root-price`, `prop:ex-trace-crown-buffer`, `lem:ex-trace-small-means`, `eq:ex-trace-medium-core`, `eq:ex-trace-small-means-detector`, `eq:ex-trace-small-means-rate`) and `prop:ex-trace-mission-price-transfer` | all present |
| `latexmk -pdf -interaction=nonstopmode -halt-on-error wrapper2.tex` in the same scratch directory; `wrapper2.tex` is the first-round wrapper without the two external chapters | exit 0; 34 pages; no error; 28 distinct undefined references, all to labels of included-by-`existence.tex` chapters outside the wrapper; a new overfull box (18pt, caused by a `\texttt` label) was found and removed by rewording; remaining: the pre-existing 5.3pt box in `trace-weighted-estimates.tex` l.14–18 |
| `pdftoppm -png -r 70 -f 10 -l 12 wrapper2.pdf q`, visual inspection of page 11 (inputs (4c), (4d), observer notation, start of the first-limit argument); pages 7, 10, 12 located by `pdftotext` only | renders correctly |
| `git diff --check` on the nine chapters | clean |

Final SHA-256 after the second round:

| File | SHA-256 |
| --- | --- |
| `trace-probe-assembly.tex` | 420072c701690d362620da6915bc3b98e9218b0a0be02e82fb78698bbed3b532 (unchanged in round 2) |
| `trace-mission-price.tex` | e6244286399c6af819ebc538519e8008a1a8f1ab9aed57b7cce24695eb0dca5e (unchanged in round 2) |
| `trace-scribe-producer.tex` | 9a805ba11d8a56a2fa7892258bbb65e6730650a8b25e83eb16693440cbe5b96a |
| `trace-local-pairing.tex` | d904217ef3c520d77225c89ea058d324b8126235996f708b7195780d3e9a16e7 (unchanged in round 2) |
| `trace-local-charge.tex` | 8e59a151a2d294e1b0a7f6c057d8736040abc046b15822292f57c29c6d93aeb3 (unchanged in round 2) |
| `trace-spectrum.tex` | 30cf0d74767436eb03432d3a94e9aca29e31730b401ff4fb39debf1d702cf085 (unchanged in round 2) |
| `trace-profiles.tex` | 6a708c5fae0e1f07849c527dd4645f402ce753db088533972eba39ffe32c9d54 (never changed) |
| `trace-asymptotic.tex` | ccb50cdba852e470937cd038c3524f2a24a02c6624cbca884b8a1753d1d167c2 |
| `trace-weighted-estimates.tex` | c1d181d871c298b83e3bc29c984c0699243f75fcc5d6f5d3edb6fbe3746b2e3f |

Not done in the second round: no Lean build; the full `existence.tex` was not built; `detects`, `reads_limit`, `Observer.reads_converge`, `tendsto_sheet`, `scaled_identity`, `comparison_jets`, `Vbase_sure`, `bareCoordinates` were not opened (their content is stated as inputs (4a)–(4d) and as the two remaining free-reference inputs, from the way `bend_limit`, `pay_jet`, `reaches_mutable` and `quill` use them); the C03 producer named by the checker was not matched.
