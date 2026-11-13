# G01 validation record

Session `schmittj-claude-g01-20261112`, 12 November 2026 (final checks at about 14:05 UTC). All commands were run in the worktree `/home/jo314/ym-wt/g01`. Only read-only commands were used outside `blueprint/units/YM-000026/handoff/results/G01/`.

**No Lean was built, elaborated or replayed.** No `lake`, `lean` or axiom command was run. No LaTeX was built (audit-only report; no manuscript file was changed). Nothing was committed, pushed or posted to GitHub.

## Repository state

| Command | Result |
| --- | --- |
| `git rev-parse HEAD` | `b2f59c320ec41ad3485b495d4c4fe2b9af17957d` |
| `git branch --show-current` | `claude/g01-statement-audit` |
| `git status --short` (start) | empty |
| `git status --short` (end) | `?? blueprint/units/YM-000026/handoff/results/` only |
| `git log -1 --format=%H -- Lean` | `9865613ffe2fe681f01f213ccdfac3c6ea1fd082` (last commit touching `Lean/` on this branch) |

## Content hashes (`sha256sum`)

Manuscript and records relied on:

| File | SHA-256 |
| --- | --- |
| `manuscript/existence/statement.tex` | `43ca06106e2190e81f617d3fc7f668df06909d9a747309eff5e7045ba92f5378` |
| `manuscript/existence/assembly.tex` | `0dbc2ab862922fdea4455970a5771a53793b58021084fa27f7a8235e6f4b3d11` |
| `manuscript/existence/lattice.tex` | `b33b481db46d1bd5c1858dde30b146eca4d084b5ee1a7c415d58a6498a3f02b3` |
| `manuscript/existence/trace-profiles.tex` | `6a708c5fae0e1f07849c527dd4645f402ce753db088533972eba39ffe32c9d54` |
| `source/build.md` | `db88d5133ad97584c5f424e68f272aad2fe9f3a2da5270bf675f6eda09958e87` |
| `source/audit.md` | `03c477b4059f0f4acafc42d4d21e9838ff886252539102e2a20dfb9341584e2d` |
| `source/evidence/axioms-3456e5e.md` | `47f586191151d0fd329dd5f5c180741af0a2dc4927fba966463ade20d8f0a80d` |
| `blueprint/public-statement.md` | `aa9bec2efeae9ac18f8627ed38c978b74607cbd2a7b07c9946c441dba9e79df2` |

Lean files relied on (paths relative to `Lean/`):

| File | SHA-256 |
| --- | --- |
| `ChallengeSpec.lean` | `e48b0be2b72d16b9b87c6c1923b3ae814270387bf9312b5cb0661dfa3e243749` |
| `Challenge.lean` | `d31b227db6e6e1f2aa5eaa66d3b004609fe7470dc2ac3825e0dce882a5fa4fe9` |
| `Solution.lean` | `1838214ba7159a2babe703000cfd9c43905fb909c1f27b73c46aae48c11ece24` |
| `Construction.lean` | `86286ed17925b3e729cd2f721347e27054ea935f2653ceaa35b3b49fc25c343c` |
| `HierarchyBridge.lean` | `82c27a4ecb393c65566a09addd97d70aea7cc62b990d383293adde53d0fc423a` |
| `TraceBridge.lean` | `b3fa347e6ab79cd69a5b0e29a3ad1a743c9cedffe727a7f13bfc6328cf125a35` |
| `PublicTheory.lean` | `94111ad258b4218a263fcc0a7136446d5a6eff0e090809b72036fb3a7aecfff8` |
| `PublicWilson.lean` | `c1542c816cd42d23448b66b4cb021c7f3bdad64b64f1c643dde27147ce0c3233` |
| `PublicView.lean` | `60a64851daa541558e1c05997b19488dff27eab44f4f0ef17072e388b1e8530b` |
| `WilsonBridge.lean` | `e927fd2762c57175faa74f26bbf6cbc9999c20f2bbe4e7bce326b17092814298` |
| `ContactSpec.lean` | `60b995a8e78f601ec7fcd8f02b66de9dfec3c60480a538fa01d6619227e040a6` |
| `ContactBridge.lean` | `91276437a70e22d61a6c155b46482f47fa24ca308dc138fcda729f50f8dfb7c9` |
| `ConcreteSU2.lean` | `646bc0cbc0b3bd8ea3dac779f8a9dc587c5b95e8d933fcefe566178374ec4114` |
| `README.md` | `5477aa6f388153d48125efa8810733fc4a2d05c9b685c7a19acd734436c28126` |
| `VerifyJoint.lean` | `f84e8b30a0dca3de42615ccca2e01f84037370f77799c77f77d206a8a54d3ec6` |
| `YM/Nonperturbative/HeadlineSpec.lean` | `df0eb870b2ece0a17c96816e265558cb8cbd713c47b5214aca375602571ac1fc` |
| `YM/Extraction/Orders.lean` | `4d7f6f2f3fc092219d817344e9a0bd9f82cc81ccea9f11a7f4ce92060314f9c7` |
| `YM/Extraction/Limits.lean` | `19263f592cd454b1e51bf0e078fc34b825288bc76bb802d6343b955dba595450` |
| `YM/Gauge/MatrixGroup.lean` | `6f711c96a30764ead7e4ceced4fd76a18c3ee307879945699b5059f3361a59d8` |
| `YM/Gauge/Lie.lean` | `800d00fc9afb8f5bd4591a55dd3664454074802f183dffbc7002169672dd54c4` |
| `YM/Gauge/Colors.lean` | `b908d8de3831e5bc9ba719d85304463c6c7387fba188c35b395944d487e5ab9c` |
| `YM/Next/FOUNDATIONS/SU2.lean` | `9d2808c000b76ed1c47943e0d09cc832b0bb4b4d537055aae885cc826079192b` |
| `YM/Examples/SU2.lean` | `3d9e140a0d1741287d742ecf5d85639c5ad5cb7b98bb294b3a7ccd6ed211a63c` |
| `YM/TraceExtension/Wick/Refute.lean` | `cb0340c14c23b700b0cc84f212578206304710e93d9b766b8224093d553024c6` |
| `YM/TraceExtension/LogScaling.lean` | `c920b4ff541c38582eba5b802ed740a075873b93f18c17b3faee39dab3d66d3c` |
| `YM/Pert/Asymptotics/RawAxis.lean` | `e14d64967d4bf633852c0f73bd8a1484f8d7ba4ab6da466e99cd88107c8f44dd` |
| `YM/Boundary/Contour.lean` | `0d14a4c2ab9bbaa8f0ce74ddbc0ad9345561a2f0623510458a2c984b80680ab7` |

G01 output files at the end of the first draft (superseded by the table in "Revision pass" below):

| File | SHA-256 |
| --- | --- |
| `README.md` | `9290d8bda6a453b689cea9050c4f45860da7c945f10e44fffc1cd2ee3fcd13f3` |
| `statement-ledger.md` | `14fdd7c6126bebb84bc1fa9c611271a34cb7b5e6844c2124c60fbb84e2e8bc0f` |
| `source-trust.md` | `82a9a594bc0ae33e26005f2b6be78fd04c5a4d2a371a93424c23a0d5dad8eb91` |
| `proposed-patches.md` | `3046a37761cefb90cccb2c3c74fc14f5638c254a60ad90206a872700ecb4f193` |

## Manifest checks (partial)

| Command | Result |
| --- | --- |
| From `Lean/`: extract from `SOURCES.sha256` the lines for the thirteen top-level public files (`ChallengeSpec`, `Challenge`, `Solution`, `Construction`, `HierarchyBridge`, `TraceBridge`, `PublicTheory`, `PublicWilson`, `PublicView`, `WilsonBridge`, `ContactSpec`, `ContactBridge`, `ConcreteSU2`) and `YM/Nonperturbative/HeadlineSpec.lean` with `grep -E`, then `sha256sum -c` on those 14 lines | 14 of 14 `OK` |
| `wc -l Lean/SOURCES.sha256` | 9507 |
| `grep -c "verification/.*\.log" Lean/SOURCES.sha256` | 10 |
| `git ls-files Lean/verification` | 10 tracked files, none ending in `.log` |
| `cat Lean/verification/challenge.sha256` compared by eye with the hashes above | the entries for `PublicTheory.lean`, `PublicWilson.lean`, `ChallengeSpec.lean`, `Challenge.lean` equal the current files |
| Full `sha256sum -c SOURCES.sha256` | **not run** by G01; the figures 9,497 OK and 10 absent are the #37 observation relayed in the task |

## Reading and search commands

- `cat -n` of the thirteen public Lean files, `Lean/README.md`, `Lean/YM/Nonperturbative/HeadlineSpec.lean`, `manuscript/existence/statement.tex`, `assembly.tex`; `sed -n` ranges of `lattice.tex` (1–125), `trace-profiles.tex` (1–50, 212–240), `trace-asymptotic.tex` (240–290), `existence.tex` (1–80), and of the partial Lean files listed in `README.md`.
- `grep -rn` for the definitions `structure Sequence`, `structure Order`, `def refine`, `structure Ordered` in `Lean/YM/Extraction`; `structure Gauge`, `def Simple`, `def lie`, `def probHaar`, `def casimir` in `Lean/YM/Gauge`; `def SUtwo`, `theorem simple`, `euclidean_excludes`, `def EuclideanAsymptotic`, `def b0`, `profile` in `YM/Boundary/Contour.lean`. Each located the declaration cited in the ledger.
- `grep -n "external\|replay\|Replay\|allowed\|TYPE_MATCH\|isYM\|isProject\|importModules\|Challenge" Lean/VerifyJoint.lean`: 29 matching lines read; the file was not read in full.
- `grep -rn -i "mass gap\|mass-gap\|spectral gap\|massive\|confinement\|non-Gaussian\|nonGaussian\|interacting\|non-trivial\|nontrivial theory\|not free\|non-free\|nonfree\|generalized free\|generalised free\|asymptotic freedom\|asymptotically free\|Clay\|Millennium" manuscript/existence.tex manuscript/existence/*.tex manuscript/main.tex manuscript/README.md`: 47 lines, all for "interacting" or "massive" in internal technical senses; the same search without those two words returns 0 lines.
- `grep -rn` in `manuscript` for the labels of `statement.tex` (`ex-statement`, `ex-running-input`, `ex-smearing`, `ex-mixture`, `ex-reconstructed`, `ex-row-target`, `ex-volume-target`) and for `ex-assembly`, `ex-lattice`: uses only in `statement.tex`, `assembly.tex`, `lattice.tex`.
- `grep -rln "public theorem\|public endpoint\|public statement\|public projection\|public target\|existence target"` in the existence manuscript: `assembly.tex`, `original-history-portfolio-attachment.tex`, `phase-quantitative-producer.tex`, `statement.tex`; the two middle files mention the public theorem without restating it (lines 5, 302, 312 read).
- `grep -n -i "SU(2)\|SU(N)\|connected"` in `statement.tex`, `lattice.tex`, `assembly.tex`: no line.
- Handoff and evidence files read with `cat`/`sed`: `AGENTS.md` (as supplied), `docs/proof-standard.md`, `handoff/G01.md`, `COMMON-CONTRACT.md`, `known-open-edges.md`, `upstream-evidence.md`, `external-claims.md`, `C16.md`, `source/build.md`, `source/evidence/axioms-3456e5e.md`, `source/upstream.json`, `blueprint/public-statement.md`, `endpoint-closure-ledger.md` (first 1,500 characters of each line), `source/audit.md` (lines 1–120 and 296–366 and a keyword search; lines 121–295, the printed types of the other roots, were not read), `public-binding-package-audit.md` (lines 1–60 only), `public-run-binding-evidence.md` (first 30 lines only: it concerns the internal run binding, which does not enter the statement audit).

## GitHub (read-only)

| Command | Result |
| --- | --- |
| `gh pr view 18 --repo hairer/humanise-yang-mills --comments` | failed with a GraphQL deprecation error (`repository.pullRequest.projectCards`) |
| `gh api repos/hairer/humanise-yang-mills/issues/18/comments` | one comment, id 6818538839, by `mgubi`, 2026-11-12T08:21:45Z, read in full |
| `gh api repos/hairer/humanise-yang-mills/pulls/18/reviews` | no output (no formal review objects) |
| `gh pr view 18 … --json state,mergedAt,headRefOid,title` | open, not merged, head `713f97749cf837b1773e9fcd6b8cab2ca70f40c5` |
| `gh pr view 63 … --json title,state,author,body,headRefName,files` | open; description read; the review file itself was **not** read |
| `git show origin/codex/issue-11-continuum-interfaces:blueprint/interfaces/continuum-reconstruction.md` | 65 lines, read (local remote-tracking ref; no `git fetch` was run, so it may be behind the PR head) |

Issue #58, issue #37 and issue #11 pages were not read by this session; the claim was posted by the parent.

## Final structural checks

| Command | Result |
| --- | --- |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 2 units. Lean and mathematics were not verified.` exit 0 |
| `git diff --check` | no output, exit 0 (the new files are untracked, so this does not examine them) |
| `grep -nP "[ \t]+$"` on the G01 output files | no trailing whitespace after correction of two lines |
| `python3 -m unittest discover -s tests` | not run (the checker was not changed) |
| LaTeX build | not run (no LaTeX changed; the proposed LaTeX in `proposed-patches.md` has not been compiled) |
| Any Lean command | not run |

## Revision pass (12 November 2026, after the first handoff)

An author-side cross-check of the first draft was made by the parent session with Codex `gpt-6-astra`, read-only. Its report was supplied to this session as `/tmp/claude-1000/-mnt-c-Users-jo314-Downloads-humanise-yang-mills/daa63c5b-ca30-41e4-9397-07fd86dcda87/scratchpad/reviewg01/final.md` (SHA-256 `ebd619cf1c2ba4a29058b50a3911367076b4074babc2dc02bddab1fbb9854620`; a session-local file, not in the repository). This is a cross-check commissioned by the author side, **not an independent review**; it does not count towards `reviewed` status. I read it in full and checked each of its twelve findings against the Lean source before changing anything. Its own report states that it ran no Lean command.

| Finding | My check | Outcome |
| --- | --- | --- |
| 1. `Order.refine` composes both components; mesh of `p.refine q` is `p.mesh ∘ q.mesh` | `Lean/YM/Extraction/Orders.lean` 25, 40 re-read; `Lean/Solution.lean` 8 supplies `Sequence.full` | Confirmed, my error. Ledger A11, patch P9.1, README corrected |
| 2. A constant-insertion witness exists; public `correlation` is not multilinear | Every clause re-derived in `adequacy.md` (c); `useAt`, `classMoment`, `spectator`, `unit`, `alive`, `Basic`, `Seed.kernel` opened | Confirmed; no violated clause found. Ledger C3 replaced, A6 (c) added, new file `adequacy.md` |
| 3. C1 overstated the rescaling argument | `traceTwo` (`Lean/ChallengeSpec.lean` 149) is not quadratic by definition; `shortDistance` fixes the coefficient | Confirmed. C1 rewritten with the corrected wording; README finding 6(b) |
| 4. P4's fallback added integrability as if public | `Reconstructed.boundary` has no integrability field | Confirmed. P4 rewritten with two faithful options; C6 now says "not stated and not derived here" |
| 5. P6 understated constraints; vacuum uniqueness is up to scalar | `TraceTest` fields; `W0.uniqueVacuum` (`Lean/PublicTheory.lean` 276–278) | Confirmed. P6 text and ledger A8 summary corrected |
| 6. "centered" is an explicit clause, not a name | `TraceTest.centered` | Confirmed. A10 corrected |
| 7. Label action is a representation of the whole Poincaré group; no trivial action of translations required | `PoincareAction.onLabels`, `W2` (`Lean/PublicTheory.lean` 225, 287–293); `Lean/PublicView.lean` 56–57 | Confirmed. A8 row extended; README finding 6(d) |
| 8. Involutivity of the label adjoint follows from the adjoint identity and faithfulness | Derived by hand: the identity applied twice gives \(\langle\eta,\Phi(A-A^{**},f)\psi\rangle=0\) on a dense domain, then `Faithful` | Confirmed. A8 row corrected |
| 9. Mass-shell integrability needs \(r>0\) | `Mode.kernel` at \(r=0\), \(m=0\) | Confirmed. C6 qualified |
| 10. P7 asserted non-canonicity without proof | Nothing in `constructed` compares public projections for different \(b\) | Confirmed. P7 reworded |
| 11. `VerifyJoint.lean` also compares type, universe parameters and body of reached shared public declarations and checks axioms at external-boundary constants; deliberate `sorry` in `Challenge.lean` | `Lean/VerifyJoint.lean` 9–64 read (46–52, 55–59); `Lean/Challenge.lean` 5 | Confirmed. `source-trust.md` corrected, including the "short time" remark |
| 12. Absence from the statement is not independence of the proof | `Lean/Solution.lean` 6 | Confirmed. README paragraph on PR #63 corrected |

No finding was rejected. Two points where I go beyond or differ from the cross-check: (i) `adequacy.md` states the proposition with explicit hypotheses (H1), (H2), notes that the `wilson` clause of the starting witness is not used, and adds a variant with the zero vector that needs no non-zero element of `Field 0`; (ii) the cross-check's remarks on a one-point character space and on a one-dimensional Hilbert space were not verified and are not reproduced.

Additional reading in this pass (`sed -n`, `grep -n`): `Lean/YM/Euclid/Lift.lean` 40–80, `Null.lean` 90–106, `Table.lean` 53–79, `Words.lean` 123–149, `Lean/YM/OPE/Eye/Views.lean` 25–26, `Lean/YM/Spec/Closed.lean` 20–32 and 64–76, `Lean/YM/Source/Construction.lean` 1–75 and the location of `linearO`, `Lean/YM/Extraction/LatticeFamily.lean` 15–30 and 60–75, `Lean/YM/Space/Configurations.lean` 145–150, `Lean/YM/Wilson/Law.lean` (instance lines 56, 89), `Lean/YM/Phase/Mixture.lean` 141, `Lean/YM/Fields/Star.lean` 99, `Lean/VerifyJoint.lean` 9–64.

| File (relative to `Lean/`) | SHA-256 |
| --- | --- |
| `YM/Euclid/Lift.lean` | `64eaa79b9e7b4b0180384f9af8504916a822b6bae0998eab35f5eef008c2a1de` |
| `YM/Euclid/Null.lean` | `287f1914a69c27519036b9d51395aa0fe1f0899b9d7b0e8699cbfbd5110bfa1a` |
| `YM/Euclid/Table.lean` | `4aa0a8c1b530b627c005ee629ff0a40c96d0169e27102bffc2dc14378fc6bc3e` |
| `YM/Euclid/Words.lean` | `91d0f6b00a2a5272da45c204376e6a830916a58f57f138ec4aa5b3fcd7fd9bd9` |
| `YM/OPE/Eye/Views.lean` | `e507342ca79650bdae9f51cde4ca7acf79cc3259c90ade7fdcaf814ecd3c870a` |
| `YM/Spec/Closed.lean` | `07e85b6dd3719a7cc595bf711ca1e4cb86db30ee39aff3188a95fc8621f15b5a` |
| `YM/Source/Construction.lean` | `bb1295924e7ddf502d1b7a04b8eec3d86de3a347eba813e5b0535a88353ae353` |
| `YM/Extraction/LatticeFamily.lean` | `7cca0c72e03884345285b2b2ed7dc200625cb4f2a3007f8120c17faa45bee697` |
| `YM/Space/Configurations.lean` | `fe1c94f9ae1c5f5b41a6551bb258c4f7dff03579fe089c1c3c55233fc1b1a8e0` |
| `YM/Wilson/Law.lean` | `8ed074914398a6fe8202cd4bf6ed72e1d8d5263375269c67dc7da1df91bd365c` |
| `YM/Phase/Mixture.lean` | `6f0f1e1465f5365231fe7f7749df7ae7c8c7357dfa971c554cf43794fd379c5e` |

G01 output files after the revision (this file excluded):

| File | SHA-256 |
| --- | --- |
| `README.md` | `ed78a586b996597078a081ec4b84cd724fb5949f47c1bdf90c9a4b750319e5d8` |
| `statement-ledger.md` | `2c76bee7546081668bfdbd240ee96e847a45a5d696380c501ed83df6e5854352` |
| `adequacy.md` | `13008c819f673ba968773dd0b7b7a9680d2943b46966f97b9940220860647778` |
| `source-trust.md` | `548dd306d8e09bbdc52b0c8ac9bca0774d8eff22cdf2a2d754221ae9a01eeb0c` |
| `proposed-patches.md` | `91d9d867dcd93fabb3718f6e409e8d4fb8b2f7ea1106b88bdace3eda63fd3043` |

Checks re-run after the revision:

| Command | Result |
| --- | --- |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 2 units. Lean and mathematics were not verified.` exit 0 |
| `git diff --check` | no output, exit 0 (new files are untracked and not examined by it) |
| `git status --short` | `?? blueprint/units/YM-000026/handoff/results/` only |
| `grep -nP "[ \t]+$"` on the G01 output files | no line |
| Any Lean command, LaTeX build, unit tests | not run |

The argument of `adequacy.md` (c) has not been formalised and has not been independently reviewed. The #37 section of `source-trust.md` was afterwards filled in by the parent session from the #37 record (draft PR #67).

## Later author-side checks of `adequacy.md` (parent session, 12 November 2026)

- A fresh Claude Opus agent and a fresh Codex `gpt-6-astra` run (`codex exec --model gpt-6-astra --sandbox read-only`), each given only the instruction to refute the Proposition of `adequacy.md` (c) against the literal text of `Lean/ChallengeSpec.lean`, `Lean/PublicWilson.lean`, `Lean/PublicTheory.lean`, with ten listed lines of attack (skipped fields, universe levels, the coefficient bound in edge cases, the remainder for all three states and all truncation degrees, `Converges` including arity zero and evaluation of separated tests at lattice points, `running`, the two-point phase space, hidden couplings, hypothesis (H2) for the constructed witness, the zero-vector variant). Both returned "correct as stated"; neither found a violated clause. Neither elaborated Lean.
- Corrections adopted from the Opus pass: the arity of `YangMills.constructed` (`g hg 1 one_pos`); an explicit hypothesis for the Variant; conditional wording of (d); and a note that the cited revision is the upstream one.
- These passes are author-side. They do not replace the independent review required by the common contract, and the argument remains unformalised.
- Final commands after these edits: `python3 scripts/check_blueprint.py`, `git diff --check`, `git status --short`; results in the pull request description.

## Lean formalisation of `adequacy.md` (c) (session `schmittj-claude-g01-formal-20261112`, 12 November 2026)

- `formal/Adequacy.lean` (SHA-256 `581880ef39e48a1af37af8b67b50869a011958411be2c6fb291a5a38e43b18f3`): built locally in a Lake project containing unchanged copies of `Lean/PublicTheory.lean`, `Lean/PublicWilson.lean`, `Lean/ChallengeSpec.lean` (SHA-256 prefixes `94111ad2…`, `c1542c81…`, `e48b0be2…`, equal to the worktree copies) with Mathlib at `81a5d257c8e410db227a6665ed08f64fea08e997` from `lake exe cache get` and toolchain `leanprover/lean4:v4.32.0`. `lake build`: `Build completed successfully (8660 jobs).` `#print axioms` for `YangMills.constant_insertion_witness`, `YangMills.jointExistence_body_constant_insertions`, `YangMills.Adequacy.vanishes_of_homogeneous`: each `[propext, Classical.choice, Quot.sound]`. `grep -n "sorry\|^axiom\|native_decide\|admit" Adequacy.lean`: no output. The parent session repeated the build and the axiom queries after the authoring agent finished.
- `formal/AdequacyFull.lean` (SHA-256 `a4f05230225a73c36155f1159bda5cb83979333b4a4e7d9f6c97f09cc1c9706e`): compiled with the same toolchain against the project objects of the #37 clean rebuild (not rebuilt, not modified; `git status --porcelain` in that tree: 0 lines afterwards), by `lean -DmaxHeartbeats=0 -DmaxRecDepth=4096` with `LEAN_PATH` set to the project's and packages' `lib/lean` directories. Exit status 0. `#print axioms YangMills.jointExistence_with_constant_insertions`: `[propext, Classical.choice, Quot.sound]`. A further file elaborated `example : YangMills.JointExistence` from the first conjunct of that theorem, confirming that the conjunct is the body of `JointExistence`.
- Not done: no independent checker (`lean4checker`, Comparator) was run on these files; no independent review.
