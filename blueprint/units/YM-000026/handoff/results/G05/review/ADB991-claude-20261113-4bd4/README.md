# G05 revision: renewed independent review (agent review, not human acceptance)

- Package: G05 (`blueprint/units/YM-000026/handoff/G05.md`), issue [#61](https://github.com/hairer/humanise-yang-mills/issues/61); parent #26.
- Reviewed: the G05 revision of PR [#152](https://github.com/hairer/humanise-yang-mills/pull/152) (head `f290271`, merged as `a2c6c2b`), which answers R1 and M1–M4 of the earlier review [#141](https://github.com/hairer/humanise-yang-mills/pull/141) (`results/G05/review/ADB991-claude-20261113-eeb9/`). Author session `TrishenGunaratnam-terra-g05-20261113`.
  - `manuscript/existence/symbolic-index.tex`, SHA-256 `ab0d7e8799d73bb9980bdbd0d1041824ac8272e1705512dec1fe716fbceff119` (matches the PR body);
  - the 12 changed records in `blueprint/units/YM-000026/handoff/results/G05/` (`r1-revision.md`, `r1-added-forward-references.tsv`, `proposed-total-order.md`, `order-exceptions.md`, `statement-block-insertions.md`, `order.md`, `handoff.md`, `validation.md`, `g04-crosswalk.md`, `forward-statement-references.json`, `chapter-inventory.json`).
- Chapters: at the revision's stated basis `ddc3c90`. The records are identical at `codex/existence-monograph` `97128ab`, where this review branch starts.
- Reviewer session: `ADB991-claude-20261113-4bd4`, account `ADB991`. Claim: https://github.com/hairer/humanise-yang-mills/issues/61#issuecomment-6858412202 (until 2026-11-14 10:00 UTC).
- Agent: Claude (Anthropic), running as a scheduled agent. ADB991 did not review this report before submission.
- Independence: this account wrote no G05 file. It wrote the review that this revision answers (#141). It also wrote G04 pass 1 (#119) and G02 (#138), which `g04-crosswalk.md` and M4 discuss; those two items were checked only for status, not for content.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. No Lean declaration is newly cited by the revision.

## Outcome

**No change required. R1 is resolved, and M1–M4 are answered.** The revised order puts all three producer groups of R1 before their consumers. Literally, it now removes more forward references than it adds (331 → 318 cross-file). The 15 references that it adds are exactly the ones the author lists, and they are classified correctly. Three nonblocking notes follow (N1–N3). Two of them concern changes made after the revision's basis.

## What was checked

1. **Hashes and coverage (confirmed).** At `ddc3c90`, `sha256sum -c chapter-hashes.sha256` passes for all 241 files. The 241 entries of the revised `proposed-total-order.md` (extracted to `proposed-order.txt` here) are a duplicate-free permutation of the `\input` list of `manuscript/existence.tex`. That list is the same at `ddc3c90` and at `97128ab`.
2. **Independent scan reproduces the author's counts.** `forward_scan.py` from #141 was run unchanged at `ddc3c90`. It finds 1,874 labels and 3,249 references, with 0 unresolved and 0 duplicate labels. Cross-file forward references number 331 in the current order and 318 in the revised one; same-file forward references number 22 in each, and the two same-file sets are identical. Relative to the current order, the revision removes 28 forward references and adds 15. The 15 added (`added-forward-references.tsv`) agree row for row with the author's `r1-added-forward-references.tsv`.
3. **R1 (resolved).** Positions are revised / current include.

   | Producer | Position | First listed consumer | Position |
   | --- | --- | --- | --- |
   | `ope-grouping`, `ope-grouping-algebra`, `ope-singletons` | 13–15 / 53–55 | `local-transfer` | 16 |
   | | | `cluster-expansion`, `soft-log-fusion`, `projected-parameter-prices`, `wilson-startup-construction` | 21, 52, 115, 124 |
   | `rg-price-receipts` | 54 / 16 | `marked-activity-jets`, `projection-payment-producer` | 55, 57 |
   | `fullmesh-correlation-cauchy`, `limits`, `smooth-limits`, `fullmesh-fixedbounds-producer` | 137–140 / 25–28 | `selected-centered-service` | 141 |

   Under the revised order, no consumer outside these groups refers forward to any of them. The forward references remaining inside the groups (`ope-grouping.tex:3,196,203,208`; `fullmesh-correlation-cauchy.tex:37,290,310,321`; `limits.tex:278,307,311,315,319,324`) are all present in the current order too. The ones that are premise uses are covered by exception rows 3–4 and insertions 16–19. Moving `limits.tex` together with the full-mesh files, as `r1-revision.md` explains, introduces no new forward reference.
4. **The 15 added references (classification confirmed).** I reread the source lines at `ddc3c90`.
   - `actual-phase-grid-approximants.tex:283,309,379,405` are premise uses. Each is covered by an exception row (its label appears in `order-exceptions.md`) and by insertions 12–15, placed before item 142.
   - The four `ex-column-subpower` uses (`actual-equation-kernel-relay.tex:345,350`, `actual-insertion-derivative-relay.tex:62`, `finite-rank-kernel-transport.tex:94`) sit at positions 194–196. Insertion 2 at item 68 precedes them, so the block placed there serves them too, as `r1-revision.md` says.
   - `heading-history-handoff.tex:367,369` (item 86) is covered by insertion 3, which carries `eq:ex-interpolation-buy` and `prop:ex-selected-interpolation`.
   - `fixed-rung-convergence.tex:3` ("compares the final observable with one at a fixed intermediate scale. We now prove…"), `:67` (the cost $C_{\rm orb}$ "exactly as in" Section `ex-selected-linear-interpolation`) and `:181` ("the positive weight choice used in the fixed-rung vault of Section…") are pointers to a later consumer or comparisons. $C_{\rm orb}$ is introduced in `heading-history-handoff.tex:223`, at item 86, before item 89. `finite-rank-kernel-transport.tex:202` ("This supplies the kernel hypothesis in … Section `sec:ope-filtration`") and `public-run-binding.tex:87` ("the finite transition witnesses enter the service of Section…") point to consumers. None of the five is a premise use.
5. **Exception list and insertions (consistent with the revised order).** All 59 rows of `order-exceptions.md` were checked by script at `ddc3c90`. In each, the stated consumer line contains the label, the stated target line carries `\label{…}` for it, and under the revised order the target lies after the consumer. Every forward reference under the revised order whose label is statement-prefixed (`thm:`, `lem:`, `prop:`, `cor:`, `def:`, assumption) and whose target sits in a statement environment appears in the list. All 28 "Before item **n** (`file`)" anchors of `statement-block-insertions.md` name the file at position n of the revised order. The opening paragraph of `order-exceptions.md` now says that the list covers statement-prefixed labels only, as #141 asked.
6. **M1 (resolved).** The `D_{v,a}`/`𝒟_{v,a}` entry now cites `sec:ex-lattice-free-kernel-components` and `sec:ex-lattice-free-kernel-estimates`. The second label is at `free-kernel-estimates.tex:3`, and that section defines the response at line 342 (checked in #141). That one line is the only change to the index.
7. **M2 (resolved).** The current totals are 59 exception rows and 28 insertions, consistently in `order-exceptions.md`, `statement-block-insertions.md`, `order.md:183,187,250`, `handoff.md:37,56` and the top block of `validation.md`. The older figures (58; "30 target blocks") remain only in entries that `validation.md:11` and `handoff.md` now mark as historical.
8. **M3 (resolved).** `r1-revision.md` lists all four same-file cases from #141 as owner actions. Their line numbers and labels are correct at `ddc3c90`: `path-attachment-producer.tex:743–744` (labels at 783, 879), `stationary-output-construction.tex:146`, `marked-campaign-producer.tex:76` and `physical-ward-propagation.tex:141`. The revision proposes owner edits and does not claim to classify the other same-file references, which is acceptable.
9. **M4 (resolved, see N2).** The index and `g04-crosswalk.md` keep the shooting slope and the same-public-family estimate as open joins. They do not cite the proposed G02 labels, which are still not in the manuscript at `97128ab`.

## Nonblocking notes

- **N1 (drift after the basis: one new forward reference).** C10 revision 3 (PR #156, now in `97128ab`) changed five chapters, so 5 of the 241 hashes in `chapter-hashes.sha256` no longer match at `97128ab`: `weighted-frame-penalty`, `annulus-recording-yield`, `stationary-germ-symmetry`, `inherited-loop-transport` and `quadratic-pole-transport`. Under the revised order, the scan at `97128ab` finds 320 cross-file forward references. One label pair is new (`drift-97128ab-forward-references.tsv`). `weighted-frame-penalty.tex:101` (position 94) uses "the block side $L$ is odd (Section `sec:common-scale-selection`)", and that section sits at position 126, or 237 in the current include. Oddness is a premise of the residue-system argument there. It is a convention fixed by the selection (`common-scale-selection.tex:41`: "the selected nondecreasing odd block lengths"), so it can be stated with the block-length notation before item 94, but the G05 records should list it when they are refreshed for F01. The other new occurrence, `annulus-recording-yield.tex:351,354` → `prop:ex-annulus-estimate`, repeats an existing pair that points to the adjacent next file. It names the resulting statement and is not a premise use.
- **N2 (G02 status is out of date).** `g04-crosswalk.md` ("G02 status at ddc3c90") and M4 in `r1-revision.md` say that the G02 review is in progress. It has since been delivered (PR #154: "confirmed; minor changes m1–m4 recommended, none required"), but the proposed slope and public-running statements are still not applied to the manuscript. The index sentence stays correct until F01 or the owners apply them. Then the index and the crosswalk row should be refreshed, as M4 already plans.
- **N3 (scope of the literal check, as the author also states).** The scan confirms only the order of labelled references. It does not establish that unlabelled premises, such as constants or conventions used by name, come before their uses. N1 is an example that a label happened to expose. The one unlabelled use I traced, $C_{\rm orb}$ in `fixed-rung-convergence.tex`, is in order. The roughly 240 equation and section forward references shared by both orders remain unclassified, as recorded in `r1-revision.md`. That work belongs to F01/G06.

## Commands run

From the repository root, chapters at `ddc3c90` (detached worktree) and records at `97128ab`:

- `sha256sum -c --quiet …/G05/chapter-hashes.sha256` at `ddc3c90`: all OK. At `97128ab`: 5 FAILED (N1).
- `python3 -I forward_scan.py <ddc3c90 tree> <current include> cur.json` and the same with `proposed-order.txt`: 1,874 labels, 3,249 references, 0/0; 331 → 318 cross-file, 22/22 same-file. At `97128ab` with `proposed-order.txt`: 3,251 references, 320 cross-file.
- A short Python check of the 59 exception rows, the 28 insertion anchors, the completeness of the statement-prefixed set and the position table above. Its inline logic is described in items 3 and 5.
- `sha256sum manuscript/existence/symbolic-index.tex` at `97128ab`: `ab0d7e87…f119`.
- LaTeX at `97128ab`: a temporary wrapper equal to `manuscript/existence.tex` with `\input{existence/symbolic-index}` inserted before the bibliography. From `manuscript/`, `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> g05r-wrapper.tex` gave exit 0 and 971 pages, with no undefined or multiply defined references, no Overfull boxes, and only the existing amsmath `\atopwithdelims` warning. The wrapper was deleted afterwards. Pages 970–971 were rendered (`pdftoppm -r 60`) and inspected. The changed entry reads "(Sections 7 and 6)", which are the free-kernel components and the free-kernel estimates.
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- `python3 -m unittest discover -s tests`: 22 tests OK.
- `git diff --cached --check`: clean.

## Not checked

- `semantic-register.md`, `lexical-first-occurrences.tsv`, `reference-scan.json` and the C06–C07 renaming proposals were not touched by the revision and were not re-derived.
- The mathematical soundness of each proposed statement-block split was not checked, beyond confirming that no deferred proof cites its consumer (#141 item 5; the split list has not changed in substance).
- No Lean elaboration or axiom audit. None is needed: the revision cites no new Lean anchor.

## Acceptance

This is an agent review. A human must take responsibility for accepting G05. Applying the order is F01's job, and it should first refresh the records for N1 and N2.
