# G05 R1 revision validation at ddc3c90

- Rechecked live #61 and comments, including the author renewal through 2026-11-14 12:00 UTC and the released #141 reviewer claim; #136 has a separate active review. Base `ddc3c90f7fcc4e10048b173e58d41f25f0107730`; Lean pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Live upstream advanced from `ddc3c90` to `cea08717b1d2894e705628636b400e0d359bd4cf` during the revision; GitHub compare reports only two added YM-000033 review reports, no chapter, include or G05 changes. The recorded build and inventory remain at `ddc3c90`.
- All 241 included-chapter SHA-256 hashes matched `chapter-hashes.sha256`; the proposed order is a duplicate-free permutation of the current include. All 28 numbered insertion anchors match their stated chapter paths; 59 restricted exception rows remain forward under the revised order.
- Ran the independent #141 `forward_scan.py` on current and revised orders: 1,874 labels, 3,249 references, zero missing and duplicate labels; 331 versus 318 cross-file forward references, 22 same-file references each. The revised order adds 15 and removes 28 compared with current. The added 15 are classified in `r1-revision.md` and `r1-added-forward-references.tsv`; this is not a proof of a complete DAG.
- Ran G05 `scan.py`: 16,118 lexical candidates, 3,249 literal ref/eqref references, zero unresolved and duplicate labels. Ran `python3 scripts/check_blueprint.py`: structure OK, 4 units; it does not verify mathematics or Lean. `git diff --check` passed.
- From `manuscript/`, ran `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/private/tmp/g05-revision-build /private/tmp/g05-revision-build/wrapper.tex`. The external wrapper adds only `\\input{existence/symbolic-index}` before the bibliography; exit 0, 969 pages, no matching undefined-reference, undefined-citation, duplicate-reference or overfull warnings. Rendered pages 968–969 with `pdftoppm` and visually inspected them, including the two-section drive/response pointer. An attempted `pdftotext` page-location check could not run because that command was unavailable; rendering and inspection succeeded.
- No Lean elaboration or axiom replay was run. The unchanged checker did not require a test-suite run. No independent review of this revision is claimed here.

The following earlier validation entries are historical; their counts and bases describe earlier candidates.

# G05 validation record

Session `TrishenGunaratnam-terra-g05-20261113`. Base
`d3c7a1901390f4821d4b91f6f639bb5c60c63604`, Lean subtree
`328ad19b404d2db2a578319ea3e4eba4b27e34ef`, pinned upstream source
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Claim was confirmed by the
human on resumption; the live issue was rechecked after the self-claim and
showed the sole claim until 2026-11-13 23:00 UTC.

* Fetched upstream `codex/existence-monograph` and exact pull heads #103 and
  #104; recorded their head SHAs and merge bases. The first attempt at direct
  network access without escalation failed DNS; the authorized fetch succeeded.
* Generated hashes, headings and labels for all 241 included chapters.
  The two draft PRs' 17 changed chapter files have distinct target and proposed
  SHA-256 values in `proposed-versions.json`.
* `python3 /private/tmp/g05-work/results/scan.py`, from repository root,
  generated 15,569 approximate lexical first-occurrence candidates and 2,868
  literal reference uses; 0 missing targets and 0 duplicated labels in its
  restricted chapter scan. `cmp` confirmed the regenerated scans equal the
  saved copies. It is a lexical scan with false positives, not semantic review.
* `python3 scripts/check_blueprint.py` passed: `Blueprint structure OK: 4
  units. Lean and mathematics were not verified.`
* `git diff --check` passed but does not inspect untracked files. A separate
  `git diff --no-index --check /dev/null FILE` was run on each of the nine
  draft files: the first attempt found CRLF as trailing whitespace in the
  generated TSV. After changing the CSV writer and normalizing the generated
  file, all nine produced no diagnostics. An exit status of 1 from a no-index
  comparison can indicate the existence of a difference; diagnostics are
  checked separately. Repeat for files added after this record.
* A temporary wrapper inserted the exact draft index before the bibliography
  without editing the main include. From `manuscript/`, ran
  `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/private/tmp/g05-build /private/tmp/g05-build/g05-wrapper.tex`.
  It exited 0, produced 923 pages, and the final log had no matches for
  undefined/multiply-defined references or Overfull/Underfull boxes. Rendered
  and viewed index pages 922–923 with `pdftoppm`; both were legible. An earlier
  wrapper placed the index after the bibliography and yielded 922 pages; the
  final wrapper supersedes it. `pdftotext` was unavailable; it was not needed
  for the image inspection.
* `git diff HEAD upstream/g05-pr-103` and the equivalent #104 command initially
  included unrelated target advances. Later PR scope comparisons used each
  actual merge base `9d11cca4644bad07126bfa372cc85fb120dee7ba`; only those
  merge-base-relative paths were used for the version inventory.
* Targeted read-only Lean source inspection covered `PublicWilson.lean`,
  `Extraction/Orders.lean`, and `Next/FREE_KERNELS/Feed.lean`. No Lean build,
  kernel replay, new axiom audit, independent mathematics review or complete
  theorem dependency audit was performed. Existing reviewer findings are
  identified as such and are not G05 approvals.

## Refreshed basis and current checks

* 2026-11-13 resumption: fetched and fast-forwarded the isolated branch to
  `84a6a9371caddd2f9967b9d6924e156ec097610e`. Rechecked #61 and the renewed
  self-claim through 2026-11-14 12:00 UTC. The prior base is retained in
  `baseline-comparison.json`; 64 of 241 included files changed. #103 and #104
  merged; #119 merged G04's draft outline, which is not yet in the main include.
* Refreshed 241 file SHA-256s, 1,866 labels and the lexical/ref scans using
  `python3 blueprint/units/YM-000026/handoff/results/G05/scan.py`: 16,022
  candidate occurrences, 3,179 literal references, zero missing or duplicate
  labels within its restricted scan. G04's 33 ledger rows and 82 located anchors
  are recorded separately with its evidence categories and original statuses.
  A text scan is not a semantic audit or proof of missing mathematical edges.
* Read local context for 56 forward theorem/lemma/proposition/input/definition
  uses in the concrete candidate order, including five specially selected
  nonstandard label names. The classifications and conditional moves are in
  `order-exceptions.md`; cross-reference-free premises and section/equation
  references were not exhaustively classified. Checked the #33/#34 receiver
  split with their unit metadata and `trace-weighted-estimates.tex:13–173`.
* `python3 scripts/check_blueprint.py` returned `Blueprint structure OK: 4
  units. Lean and mathematics were not verified.` `git diff --check` passed;
  the separate no-index checks cover untracked files as noted below.
* Built a temporary full-manuscript wrapper from `manuscript/` with
  `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/private/tmp/g05-current-build /private/tmp/g05-current-build/wrapper.tex`.
  The wrapper adds only this index before the bibliography; G04 and external
  #33/#34 remain excluded as in the current main. It exited 0, produced 962
  pages, and its final log has no matching undefined/multiply-defined,
  Overfull or Underfull messages. Rendered pages 961–962 with `pdftoppm` and
  visually checked the index; the final revised page 962 was rendered again.
* No fresh Lean build, axiom audit or source elaboration was performed. No
  independent review has been claimed by this author. Current G04 ledger
  statuses remain its historical statements and require fresh review before
  being used as present approvals.
* At the refreshed checkpoint, a no-index whitespace check initially flagged
  an extra blank line at the end of `proposed-total-order.md`. After removing
  it, the same check over all 18 current untracked files produced no diagnostics.
  These files remain untracked; `git diff --check` alone does not inspect them.

## C14 revision 1b basis refresh

* During final recheck the upstream head advanced to
  `ce1b3a4592b7ace11d7a9cbd7352063f39aa2dd6` (#129). Fetched and
  fast-forwarded; four included C14 chapter hashes changed, recorded in
  `latest-update.json`. The refreshed 241 chapters have 1,873 labels;
  the restricted scan reports 16,090 lexical candidates, 3,224 literal
  references, zero missing targets and zero duplicate labels. Two new forward
  references to `def:ex-lattice-shell-receipt` were inspected and added to
  the exception list, bringing it to 58. Revision 1b is an author draft
  requiring renewed independent review; chamber and scale inputs remain open.
* Re-ran `python3 scripts/check_blueprint.py` and `git diff --check`, both
  passed. Rebuilt the same temporary index wrapper with `latexmk`; it exited 0
  and produced 967 pages, with no matching undefined/multiply-defined,
  Overfull or Underfull log messages. Rendered and visually inspected pages
  966–967. This build does not add G04 or external #33/#34 to the main text.
* Checker alpha's early ordering feedback identified the receiver needed before
  C14 item 194 and the priced-mission block needed before #33. The proposed
  the then-current total order gave both placements and enumerated 31 early
  statement-block interfaces. These are editorial proposals, not a reviewed
  proof of all assumptions. This report-only change did not alter the index
  or require repeating the preceding LaTeX build.
* Checker alpha's further pre-freeze feedback corrected the C01 `π` entry:
  it is a row functional with `πx=1`, while `xπ` is the projection. The
  contract and semantic register now state that distinction. These are report
  edits only; the previously rendered index remains byte-identical.
* Checker alpha subsequently identified exception 49 as a comparison link,
  rather than a consumption of `lem:trace-normalized-stress`. Direct reading
  of `trace-calibration-producer.tex:313–338` confirms the local normalization
  proof; its flux and one-dimensionality inputs remain. Reclassification
  removes that lemma from the early-move list, leaving 30 target blocks.
* Checker alpha's subsequent pre-freeze reading reclassified the two references
  in the final Scope paragraph of `annulus-recording-yield.tex` as previews,
  and distinguished the terminal birth-cost estimate (T6) and delay block from
  the proposition that assumes its fee. The exception and placement records
  then reflected those directions; 29 early target blocks remained. No manuscript
  text was changed by these report corrections.
* Further pre-freeze feedback separated four roles: the periodic-distance
  definition (not its enclosing theorem), deferred uniqueness application,
  Lorentz group-generation proof (not the covariance theorem), and the
  shell-receipt definition with no proof to defer. The current list has 28
  target blocks and retains theorem definitions/hypotheses and later proofs.
* Checker alpha's latest role corrections distinguish the periodic-distance
  definition from the full fixed-bounds theorem, defer the uniqueness application
  until the field intertwiner, move the Lorentz group-generation proof rather
  than its theorem, and move the shell receipt as a definition with no proof.
  Direct reading also supports moving the full nearest-point subsection,
  finite-frame recovery lemma and full-mesh uniqueness lemma with their proofs.
  Remaining deferred-proof dependencies are explicitly open for review.
* Direct inspection of `phase-quantitative-producer.tex` and `reflection.tex`
  supports moving the finite word-replacement, radial-choice and point-RP bump
  lemmas with their proofs, provided the recorded price and reflection-form
  definitions and hypotheses are carried. This changes the report only.

## Delta refresh to b13f2ef

* The target advanced from `ce1b3a4` to `ba4528f`, changing 13 included
  manuscript chapters; exact old/new SHA-256s are in `latest-update.json`.
  Updated the 241 chapter hashes and label locations. The focused semantic
  effects and retained C10/C14 review boundaries are in `delta-ba4528f.md`.
* Regenerated the restricted lexical and reference scans: 16,118 candidate
  occurrences, 3,249 literal references, no missing or duplicate labels.
  One new forward receiver reference was classified, for 59 locally inspected
  forward-statement uses. Added the two same-file scale-note/chart interfaces,
  which the cross-file scan cannot detect. As before this is not a proof of
  complete mathematical dependency coverage.
* C10 revision 2 makes the displayed Casimir normalizations identical at this
  basis, and the index now states `λ_G=2b_0`; the shooting slope match remains
  open. The C14 delta distinguishes the arbitrary finite coefficient bound
  `A_m` from the root-test bound `A'_m`, and records the revised chart,
  normalized tensor, flux, orientation and relay conventions.
* Target `b13f2ef` merges external #33 sensor revision; it changes no included
  chapter relative to `ba4528f`. Its supplemental file SHA-256 and six key
  section/lemma/proposition labels are in `supplemental-external-hashes.json`.
  The receiver → conditional sensor → trace application order is unchanged.
* From `manuscript/`, ran `latexmk -g -pdf -interaction=nonstopmode
  -halt-on-error -outdir=/private/tmp/g05-current-build
  /private/tmp/g05-current-build/wrapper.tex` at the current target. It
  exited 0 and produced 969 pages; the final log had no matching undefined or
  multiply-defined references or Overfull/Underfull boxes. The wrapper inserts
  the index into the 241-chapter main but does not include G04 or external
  #33/#34. Rendered and inspected index pages 968–969.
