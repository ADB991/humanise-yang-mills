# C16 review: validation record

Commands run by the reviewer agent on 2026-11-13 in the worktree `/home/jo314/ym-wt/c16-review` (`git rev-parse HEAD` = `81538d6dcf2e71f24cc74a4afc556dd015046691`). Nothing was posted to GitHub, committed or pushed. No Lean command and no LaTeX build was run. Files were created only in `blueprint/units/YM-000026/handoff/results/C16/review/schmittj-claude-20261112/`.

## Commands and results

| Command | Result |
| --- | --- |
| `git log --oneline -3`; `git rev-parse HEAD` | head `81538d6` (merge of PR #93); `81538d6dcf2e71f24cc74a4afc556dd015046691` |
| `git status --short` (start) | empty for tracked files |
| `git diff --stat 3c2ed3b~1 3c2ed3b` | 13 files changed, 399 insertions(+), 19 deletions(-): eight report files and `assembly.tex`, `common-scale-selection.tex`, `ope-history-service.tex`, `public-run-binding.tex`, `statement.tex` |
| `git diff 3c2ed3b~1 3c2ed3b -- manuscript/` | read in full; every added line checked (see `mathematics.md`) |
| `git diff --stat 3c2ed3b 81538d6 -- <seven chapters>` | empty: the chapters are unchanged since the author's commit |
| `sha256sum` of the seven chapters | values equal to the `final_sha256` entries of the author's `hashes.json` |
| `sha256sum -c .../scratchpad/c16-hashes.txt` (coordinator's list: seven chapters and eight author report files), run after writing the review files | 15 of 15 `OK` |
| `wc -l` of the seven chapters | 161, 175, 210, 131, 211, 104, 152 (1,144 in total) |
| Read tool on the seven chapters | each read in full |
| `wc -l` and `cat` of `Lean/{PublicWilson,PublicTheory,Solution,Construction,WilsonBridge,HierarchyBridge,TraceBridge}.lean`; Read of `Lean/ChallengeSpec.lean` | all read in full |
| `grep -rn '\\label{L}'` for `thm:ope-quantitative`, `thm:profile-exclusion`, `sec:trace-profiles`, `thm:trace-asymptotic`, `thm:joint-boundary`, `ex-lattice`, `ex-reflection`, `sec:ope-grouping-algebra`, `sec:ope-scale-purchases`, `lem:tested-cr`, `sec:analytic-boundary` in `manuscript/` | all found: `ope-estimates.tex` 178, `trace-profiles.tex` 219 and 2, `trace-asymptotic.tex` 247, `analytic-boundary.tex` 166, `lattice.tex` 4, `reflection.tex` 2, `ope-grouping-algebra.tex` 2, `ope-scale-purchases.tex` 2, `analytic-boundary.tex` 116 and 2 |
| `grep -n -i -E "mass gap|gap|non-?free|free field|generalized free"` over the seven chapters | no match |
| `grep -n -i -E "drift|loop|capacit|portfolio|regrad|paper|dusk|fee|delay"` over the seven chapters | only `ope-scale-purchases.tex` 14 ("floors and delays"), 89 ("entrance delay"), `public-run-binding.tex` 53 ("flat-step delay"), 64 (section name containing "portfolio") |
| `sed -n` reads: `ope-estimates.tex` 150–240, `trace-profiles.tex` 1–60 and 205–260, `trace-asymptotic.tex` 225–300, `analytic-boundary.tex` 1–215, `grep` in `ope-grouping-algebra.tex` and `trace-asymptotic.tex` | quoted statements as printed |
| `grep -rn` for `Unites`, `sewedN`, `reap`, `plena` under `Lean/YM`; `sed -n` of `YM/OPE/Replicas/Price.lean` 1–40, `YM/OPE/Replicas/Sponsor.lean` 40–60 and its namespace heads, `YM/OPE/Grouping/Fibers.lean` 1–60, `YM/MergeProof/North/Price.lean` 21–24 | basis of M1/L1, L3 and the check of note (a) |
| `sed -n 1,128p Lean/YM/Price/Length.lean`; `sed -n 100,240p Lean/YM/Price/Waits.lean` | basis of the F2 confirmation |
| `grep -n` and `sed -n` of `YM/Integration/NativeDiagonalClockRequest.lean` and `NativePostLengthPayment.lean` | `envelope` (line 14), `eventuallyPaid` (52, 24) as described in `lean.md` |
| `grep -n` of `YM/Nonperturbative/HeadlineSpec.lean` for `TraceExclusions` | lines 84–106 read |
| `grep -rln -E "(def|lemma|theorem|structure|abbrev) NAME\b"` for 19 author anchors | all found in the named files (`envelope` found by a separate `grep`, since its head is `def envelope (F ...`) |
| `python3` read of `handoff/package-plan.json` (owning packages) | C02 index 1, C03 2, C04 3 (`analytic-boundary`), C05 4 (`ope-estimates`, `ope-grouping`, `ope-local-projection`), C08 7, C12 11, C15 14 (`trace-profiles`, `trace-asymptotic`) |
| `git log --format='%h %ad %s' -1 -- results/C12/handoff.md` and `-- results/C11/README.md`; `git merge-base --is-ancestor` with `3c2ed3b` | `0f9f7ca` (C12) and `05112f0` (C11), both later than `3c2ed3b` |
| `python3 scripts/check_blueprint.py` (start and after writing) | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` exit 0 both times |
| `git diff --check` | no output, exit 0 |
| `git status --short` (end) | `?? blueprint/units/YM-000026/handoff/results/C16/review/` only |

## Hand computations (no tool)

All inequalities of `nonlinear-payment-selection.tex`; the recursion, plateau, bracket, window, period and payment arguments of `common-scale-selection.tex` and the order of choices; (O1)–(O9) of `ope-scale-purchases.tex`; the compression price and the \(6L\) bound and the two-slot exponential example of `ope-history-service.tex`; `ex-full-mesh` and `ex-conditional-existence` of `assembly.tex`.

## Findings downgraded or rejected during verification

- Possible ERROR "first-plateau scale entry not paid" (`common-scale-selection.tex` 94–97): rejected. The text says it is imposed only after the first plateau, and the source does the same (`Wait.ready` proves the scale entry only under `p.first < A.J (m+1)`).
- Possible ERROR "\(1\le1+\log\log\widehat\beta_m\) false for \(\beta_*<e\)" (`public-run-binding.tex` 34): downgraded to NIT (M5); on the public run \(\beta_*\ge e^e\) because of the countable purchase.
- Possible INACCURACY "the grouped-cell example is wrong": rejected; it is correct in the algebra \(e_Ae_B=e_{A\cup B}\) (disjoint) of `ope-grouping-algebra.tex` 12.
- Possible INACCURACY "`statement.tex` 160–161 claims the construction supplies a stress-tensor identification without support": downgraded to an unverified remark; `Headline.TraceExclusions.identified` is a conjunct of `constructed`, but I did not check the meaning of `stressTrace`.

## Not run

Lean build, elaboration, axiom checks; LaTeX build and rendering; checker unit tests (checker unchanged); comparison of `Lean/` with `Lean/SOURCES.sha256`.
