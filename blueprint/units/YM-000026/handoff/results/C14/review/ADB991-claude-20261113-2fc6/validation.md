# Validation record (session ADB991-claude-20261113-2fc6)

Commands actually run, with outcomes. Checker and tests ran on the report branch `claude/issue-276-2fc6`, cut from `codex/existence-monograph` @ `7a1a748`, which contains `35ed1c6` (`git merge-base --is-ancestor` succeeded). The LaTeX build ran on a `git archive` export of the PR head `35ed1c6`.

| Command | Outcome |
| --- | --- |
| `git diff --stat 35ed1c6~1 35ed1c6` | 2 files, +31 −3 (relay chapter, new response note) |
| `git diff --check 35ed1c6~1 35ed1c6` | clean |
| `git diff 35ed1c6~1 35ed1c6 -- Lean source \| wc -l` | `0` |
| `git rev-parse 35ed1c6:Lean HEAD:Lean` | both `328ad19b404d2db2a578319ea3e4eba4b27e34ef` |
| SHA-256 of the five files in `README.md`, via `git show 35ed1c6:<path> \| sha256sum` and `sha256sum <path>` at `7a1a748` | identical at both revisions, as listed |
| From the exported `manuscript/`: `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` (TeX Live from Ubuntu apt) | exit 0; 1010 pages; 0 `undefined` in the log; 16 overfull-box warnings, all in files the PR does not touch |
| `pdftoppm -r 70 -f 850 -l 851` and visual inspection | p. 850–851 (Lemma 206.1 and its proof): the new M1 and M2 text renders without overlap or clipping; references resolve to Sections 159, 161 and 240 |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` |
| `python3 -m unittest discover -s tests` | `Ran 22 tests … OK` |
| `grep`/`sed` reads of `Lean/YM/MergeProof/Apres.lean`, `Lean/YM/RG/History.lean`, `Lean/YM/Gauge/Casimir.lean`, `Lean/YM/Push/RELAY_DIFFERENCE/Rates.lean`, `Lean/YM/Extension/UV/CouplingScales.lean` | textual correspondence as in `README.md` |

Not run: Lean elaboration, build or axiom audit (Mathlib hosts are blocked here; correspondence is textual).
