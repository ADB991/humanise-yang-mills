# C15: trace calibration, weighted limits and the non-freeness test (author pass)

- Package: C15, issue [#56](https://github.com/hairer/humanise-yang-mills/issues/56); parent #26. Unit YM-000026.
- Session: `schmittj-claude-c15-20261113`, role AUTHOR. Method: four read-only Codex `gpt-6-astra` audit passes over all twenty chapters; two Claude author agents on disjoint chapter sets, who decided every audit item against the LaTeX and the Lean text and made the repairs (part A: `trace-small-means`, `trace-crown-buffer`, `trace-price-recurrence`, `trace-local-paid-budgets`, `trace-local-rate-selection`, `trace-medal-prices`, `trace-eve-producer`, `trace-row-jet-estimates`, `trace-regular-atom`, `trace-coffer-supplier`, `trace-bill-prices`; part B: `trace-probe-assembly`, `trace-mission-price`, `trace-scribe-producer`, `trace-local-pairing`, `trace-local-charge`, `trace-spectrum`, `trace-profiles`, `trace-asymptotic`, `trace-weighted-estimates`); then a second Codex pass over every edited hunk, whose findings and the authors' responses are recorded in each part's `findings.md` under "Second round". Coordinated by a Claude session. None of this is an independent review.
- Status: **author draft, not reviewed.** No approval is recorded. An independent reviewer owns `review/`.
- Base: `codex/existence-monograph` at `81538d6`, rebased onto `e1299c2`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Lean was read as text only; nothing was elaborated.

## Where things are

`part-A/` and `part-B/` each contain `findings.md`, `ledger.md`, `correspondence.md` and `validation.md`. `handoff.md` in this directory is the summary for the reviewer, for C16 and for G06.

## The non-freeness chain

This is what the final assembly (C16) consumes.

- `thm:profile-exclusion` (`trace-profiles.tex`) is proved in its chapter for the exact finite class of mass-shell Wick profiles of the public statement. Every step was rechecked; the chapter is unchanged.
- `thm:trace-asymptotic` (`trace-asymptotic.tex`) keeps its label and conclusion. The constant \(3\dim\mathfrak g/\pi^4\), the factor \(r^8\log^2(1/r)\) and the argument for all radii were recomputed and agree with `YangMills.Hierarchy.TraceTest.shortDistance`. The theorem is **conditional**: its statement now lists four hypotheses, none proved in that chapter: the Laplace representation from the spectral chapter, the radial form, the reference normalisation (`eq:trace-reference-normalization`), and the scale input (`input:trace-scales`). A new paragraph traces the scale input to C14, to `trace-scribe-producer.tex`, and to the external units YM-000033 (sensor) and YM-000034 (branch moments and washout with exponent one).
- No sentence in the four non-freeness chapters claims or suggests a mass gap, the exclusion of generalised free fields in general, or a larger excluded class. Both the author agent and the checker looked for such sentences.
- The internal clause that identifies the trace field with the stress trace in the detailed source statement is not proved in these chapters; the public `TraceTest` does not need it.

## Other repairs

1. `trace-probe-assembly.tex`: a hypothesis \(a\ge1\) was wrong for the source, where \(a=a_j\le1\); the proof now uses only \(a>0\).
2. `trace-local-charge.tex`: an identity stated as exact holds up to an error of size \(t^{-100}\).
3. `trace-scribe-producer.tex`: the field \(O\) is the curvature-square field, not the unit; codomains separated; dictionaries to the two external units; the two shell limits are derived from four explicit sub-inputs; the two-column independence is proved, following the source.
4. `trace-price-recurrence.tex`: a quantity described as a count is a real allowance; the series must be differentiated termwise, with proof; a compactness argument that did not establish its bound is replaced by a proof from two named inputs.
5. `trace-coffer-supplier.tex`: the bias estimate is computed here (it had been attributed to a chapter that assumes it); the planted-expansion input now carries all the bounds the source has.
6. Throughout part A: definitions and hypotheses that were used without being stated (a missing real structure, constants, index sets, quantifier order, standing conditions).

The second Codex pass found no error and no regression in the first-round edits, and five gaps, all addressed as recorded.

## What is not done

- Every chapter of part A remains conditional. The planted expansion, the local chart conclusions, one insertion paragraph and one matching subsection are stated as inputs and not proved.
- Open inputs without a located producer: the pointwise rounded comparison (`eq:trace-basis-error`); the four sub-inputs of the shell limits; two reference facts used by the independence proof; `C15-internal-planted-expansion`; `C15-internal-lawful-representation`; `C14-to-C15-chart-pairing-convergence`.
- Edges to C14 (vector detector, rank-one, free rank, scale selection), C05, C08, C09 and C04 were opened only at the cited passages.
- Declarations not opened are listed in the findings files.

## Note for the integrator

The external chapters `trace-prosper-sensor.tex` and `trace-branch-moments.tex` are in the repository but are not included by `manuscript/existence.tex`. To keep the full build free of undefined references, twelve references from C15 chapters to labels in those files are written as text, with the label name in typewriter type; they are listed in `part-B/findings.md` and can become real cross-references once the two files are included.

## Validation

- Full build after the rebase: `latexmk -cd -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` from `manuscript/`: exit 0, 958 pages, no undefined references, no multiply defined labels, no overfull boxes.
- Scoped wrappers for each part were built and changed pages inspected as images (lists in the part `validation.md` files; not every changed page was viewed).
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units.` `git diff --check`: clean.
- New labels are listed in the part validation files. No existing label was removed or renamed.

## Content hashes

| Chapter | SHA-256 at start (`81538d6`) | SHA-256 at handoff |
| --- | --- | --- |
| `trace-small-means.tex` | `e435451b618251f87883e4e0272da441b3ba8c86d3015edc1aefff220ff77ef9` | `ab4d88cff18cf16daedc72ee5060b3daf5f091e32df058aff9c37767bf47b3e1` |
| `trace-crown-buffer.tex` | `9f63e0ae53b2bcf95934979708b9cc8d2555b4d1b2d925535e09ebe0377499c0` | `c20605af5cba507c600463a41a97b62884203701f87fb903c0bdcc78994ac738` |
| `trace-price-recurrence.tex` | `e2aac8a6900caee89189bc22b6f863fd0cef9c77f14a8cd1a026a8bce71c0703` | `d806266671058ddf52cfab24a60b97a85e9434cc357f1b5d8952585387260ab7` |
| `trace-local-paid-budgets.tex` | `3893ce4d5e6057eef2f651c2bb02240c397a12441df812f232b9dbaec0034c0c` | `89a8a89d18a90c5f6378cdba260900ee955b196be53216cafcca319f3619f591` |
| `trace-local-rate-selection.tex` | `3164d587306392399b0bcef006526271dc4c09db7df0075d967e170754f3df5e` | `46950adfb52103145d21023096690f59165ea81c08f9de42c71c0a5679de144a` |
| `trace-medal-prices.tex` | `85df16de2fbe0871bb7a44e13343aafd253793d968d560182d7646f4781a1b96` | `54df3679cc287744478c37d40e26e444ec00786055d88004256b1e1538f39d9f` |
| `trace-eve-producer.tex` | `0bc1e4da3c975b52aa666b8ea6d4ddb6e13e0d8dea382b36e6a3dfaec3866e0b` | `5bcdf4e577b71960cad20ac715d230280cdcac84868a4d7c2f958728a9eb63e6` |
| `trace-row-jet-estimates.tex` | `788a14a91a178227f266b8de544e6c4c31c16a15885fd4e7b5fe756e84e1714b` | `f2fc8a245f8ae1373db1c2e15e436437d162d7fdec5cdd3a3172b3c96c4aadf2` |
| `trace-regular-atom.tex` | `6b21bf5989d9f74356e535d3e9116d7ac32bfaff915dd0307ba9b4330ffeba0c` | `940dfbef8513a96ed9f9a90e893baa20dbe013d9dafec96075f55033a21390f4` |
| `trace-coffer-supplier.tex` | `29138d2fd53c601b292c23cc6e119f08c9ad8b6fb364f15fde77851f1fa65463` | `855c25c892f03f7ca6cfd20b18553159e8c411042f4e74d9d8a8f6cb098fdd53` |
| `trace-bill-prices.tex` | `447722944badf4aeb535100b29c5101fc9603aba3d46a1ef69d8fe63ce141aee` | `3573e9ef1c5d47b0b9d9a6ce76115c406440fc5622ce29edf7cdb151a4094a55` |
| `trace-probe-assembly.tex` | `9893635fc18a4bc245bb743c3bacdbf626fbd1cf8de00fa8395d8f14fc46aa79` | `420072c701690d362620da6915bc3b98e9218b0a0be02e82fb78698bbed3b532` |
| `trace-mission-price.tex` | `a4c9a11b64c85525be8ef8ee0e03f5aa149d5d33b9f90a0ed8634c1edff16df1` | `e6244286399c6af819ebc538519e8008a1a8f1ab9aed57b7cce24695eb0dca5e` |
| `trace-scribe-producer.tex` | `207d6605edb7ac2041b6dee0c9ea9f356778e1481c2d56e4dcb4a577a33dc357` | `9a805ba11d8a56a2fa7892258bbb65e6730650a8b25e83eb16693440cbe5b96a` |
| `trace-spectrum.tex` | `2f2c16737f123073f07ec3e5132fd4c6df83ad8021d20fa44d2d32aaece494e7` | `30cf0d74767436eb03432d3a94e9aca29e31730b401ff4fb39debf1d702cf085` |
| `trace-profiles.tex` | `6a708c5fae0e1f07849c527dd4645f402ce753db088533972eba39ffe32c9d54` | `6a708c5fae0e1f07849c527dd4645f402ce753db088533972eba39ffe32c9d54` |
| `trace-asymptotic.tex` | `5153c8ba36230fe0bd73a286477f4121d7461939501850b821fb7265e57f0a04` | `ccb50cdba852e470937cd038c3524f2a24a02c6624cbca884b8a1753d1d167c2` |
| `trace-weighted-estimates.tex` | `dfe8ecfa80a170160a2930ab580957c9be04013d1bd84d845434de5f395d19b4` | `c1d181d871c298b83e3bc29c984c0699243f75fcc5d6f5d3edb6fbe3746b2e3f` |
| `trace-local-pairing.tex` | `307550793a75a0d40a8eb4c782817279710acfdba278ca400d5d718ad477ea4c` | `d904217ef3c520d77225c89ea058d324b8126235996f708b7195780d3e9a16e7` |
| `trace-local-charge.tex` | `e3cf960c5c1ee9ee40cf22ff75dd36c8a7007b781a36284588340f454d656d29` | `8e59a151a2d294e1b0a7f6c057d8736040abc046b15822292f57c29c6d93aeb3` |

The canonical evidence files `blueprint/units/YM-000026/*-evidence.md` were not modified and describe the text before this pass.
