# C06 validation (commands actually run, 2026-11-12 UTC)

Run in a worktree of branch `claude/issue-47-8949`, based on
`codex/existence-monograph` at `01ef22c`.

| Command | Result |
| --- | --- |
| `sha256sum` of the 15 owned chapters before editing, compared with `coverage-inventory.json` | all 15 matched the recorded initial hashes |
| `grep -P` for tab, backspace, form-feed, vertical-tab and bell characters, and for a `{` at end of line, over the owned files; then over all of `manuscript/` for the R1 pattern | one instance (`leaf-transfer.tex` line 33), repaired; no other instance in `manuscript/` |
| reference scan (Python, over `\ref`/`\eqref` and `\label` in `manuscript/existence/*.tex`, mapped to packages by `coverage-inventory.json`) | produced the incoming and outgoing edge lists in `ledger.md` |
| `cd manuscript && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` (Ubuntu `latexmk`, `texlive-latex-extra`, `texlive-science`, installed with apt in this run) | exit 0; 874 pages; no undefined or multiply defined references; no overfull boxes; one LaTeX warning, `amsmath Foreign command \atopwithdelims` from `positive-row-producer.tex` line 68, which is outside C06 and not touched here. The tracked `manuscript/existence.pdf` was not modified. |
| `pdftoppm` on pages 228, 232, 237, 263 and visual inspection | the edited displays and sentences render correctly (`eq:leaf-tail-input` subscript, `eq:cluster-local-tail` with `m_0`, mixed-activity coupling-scale sentence, seed-energy `c_F` choice) |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 2 units. Lean and mathematics were not verified.` |
| `python3 -m unittest discover -s tests` | 22 tests, OK |
| `git diff --check` | clean |
| text reads of `Lean/YM/Work/E09.lean`, `Lean/YM/Work/E09/Budget.lean` | see `correspondence.md` |

Not run:

- No Lean build, elaboration or `#print axioms`. Earlier runs found that the
  sandbox blocks the Mathlib sources and cache; this run did not retry.
  Source correspondence comes from text reads of the pinned files only. The
  clean-build task is issue #37.
- The literature leads in `findings.md` (Penrose; Kotecký–Preiss;
  Fernández–Procacci) were not opened.
- No independent review. `review/` is empty and belongs to a different agent.

## Revision 2 (session `ADB991-claude-20261112-6574`, branch `claude/issue-47-6574` from `codex/existence-monograph` at `1749b55`)

| Command | Result |
| --- | --- |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` |
| `python3 -m unittest discover -s tests` | 22 tests, OK |
| `git diff --check` | clean |
| `cd manuscript && latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` (apt `latexmk`, `texlive-latex-extra`, `texlive-science`) | exit 0; 890 pages; no undefined references; one LaTeX warning, the pre-existing `amsmath Foreign command \atopwithdelims` outside C06. The tracked `manuscript/existence.pdf` was not modified. |
| `pdftoppm` pages 251–252, 257, 264–266 and visual inspection | `lem:warning-vanishes`, `def:geometry-sector-conditions` and `lem:branch-nearest-projection` with its proof render correctly |
| `grep` of `Lean/YM/Gauge/Nearest.lean`, `Lean/YM/PREC/FrameResponse.lean`, `Guards.lean`, `Eligibility.lean`, `Presented.lean`, `Seeds.lean`, `Stacks.lean`, `Merge.lean`, `Activities.lean`, `Daisy/{Solvent,Gnomon}.lean` | declarations and namespaces in `correspondence.md` (revision 2) exist as stated |
| `sha256sum` of the 15 chapters | as in `handoff.md` |

Not run: Lean build or elaboration (Mathlib sources blocked by the sandbox);
the two textbooks cited in `lem:branch-nearest-projection` were not
opened (not reachable), so their locators are unverified.

