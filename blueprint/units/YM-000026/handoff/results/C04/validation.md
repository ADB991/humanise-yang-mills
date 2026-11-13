# C04 validation (commands actually run, 2026-11-12 UTC)

Run from the repository root of branch `claude/issue-45-5b03`, based on `9d11cca`.

| Command | Result |
| --- | --- |
| `sha256sum` of the 11 owned chapters before editing, compared with `coverage-inventory.json` | all 11 matched the recorded initial hashes |
| `cd manuscript && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex` (TeX Live from Ubuntu `texlive-latex-extra`, `texlive-science`) | exit 0; 873 pages (snapshot: 872, +1 from the new corollary); no undefined or multiply defined references; no LaTeX warnings, no overfull boxes in `build/existence.log` |
| `pdftoppm` pages 178, 180, 181 and visual inspection | new corollary, its proof, the J remark, and the edited `prop:word-motion` render correctly; cross-references resolve (Theorem 44.3, Lemma 44.2, Propositions 43.2, 46.2, 47.5) |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 2 units. Lean and mathematics were not verified.` |
| `python3 -m unittest discover -s tests` | 22 tests, OK |
| `git diff --check` | clean |
| `grep` for every `\ref`/`\eqref` to `eq:word-motion-input`, `prop:word-motion`, `input:word-boundary`, `input:calibrated-actions` across `manuscript/` | established F1 (no prior producer of `eq:word-motion-input`) |

Not run:

- No Lean build, elaboration or `#print axioms`. Mathlib sources and cache
  (github.com/leanprover-community/mathlib4, mathlib4.lean-cache.cloud) are
  blocked in this sandbox. Source correspondence is from text reads of the
  pinned files only. The clean-build task is issue #37 and is not repeated.
- The cited literature (Williams, Melrose, BHV) was not re-inspected; the
  Dartmouth URL for Williams returned a proxy 403.
- No independent review. `review/` is empty and belongs to a different agent.

## Revision 1 (session `ADB991-claude-20261112-74c4`, 2026-11-12 UTC)

Run from the repository root of branch `claude/issue-45-74c4`, based on
`codex/existence-monograph` at `d02fcb5`.

| Command | Result |
| --- | --- |
| `sha256sum` of the 11 chapters at the base, compared with `review/mathematics.md` | all 11 equal to the reviewed hashes |
| `cd manuscript && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=build existence.tex` (Ubuntu TeX Live, `texlive-latex-extra`, `texlive-science`) | exit 0; 897 pages; one LaTeX warning (`amsmath` "Foreign command \atopwithdelims"), coming from `\choose` in `actual-stress-normalization.tex`/`positive-row-producer.tex`, outside C04; no undefined or multiply defined references |
| `latexmk ... main.tex` | exit 0; 2 pages, no warnings |
| `pdftotext -f 168 -l 197` and search for `??` | none |
| `pdftoppm` pages 169, 185, 197 and visual inspection; `pdftotext` of pages 175 and 192–194 | convention paragraph, `prop:heat-cups`, locality cutoff paragraph, `cor:cone-support`, the π–λ argument render correctly with resolved references |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` |
| `python3 -m unittest discover -s tests` | 22 tests, OK |
| `git diff --check` | clean |
| `grep -n` on the pinned Lean files for every declaration newly cited in `ledger.md`/`correspondence.md` (`YM.Table.null`, `Field`, `Union`, `pin`, `pin_inj`, `alive`, `respects`; `YM.DiffPlan.Inclusions`; `YM.Bid.Pantry`, `C08`, `C09`; `YM.Boundary.Urs`, `tents`, `offiero`; `YM.OS.Semigroup.stays`; `Probe.cap_support`, `persistent`; C17/C19/C27 private helpers and `answer`; `NearPair.Panes.reaches`, `forgets`, `actor`; `ChallengeSpec` field `acts`; `YM.Work.C18.entire`; `YM.Work.C01.singles_agree`) | all found at the stated paths and lines; namespaces read off the `namespace` blocks |

Not run: Lean build, elaboration or `#print axioms` (Mathlib blocked here);
re-inspection of the cited literature; any check of the content of the
producer statements in C03/C14 beyond reading the labelled statements quoted
in the ledger.
