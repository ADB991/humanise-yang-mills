# C14 review, part 4: validation record

Reviewer: Claude (Opus 5.5), session `schmittj-claude-c14-review-20261113`. Worktree `/home/jo314/ym-wt/c14-review`, HEAD `e058a61` (author commit `bfe20e7`, parent `81538d6`). All commands were read-only, apart from creating the three `part4-*.md` files in this directory.

## Content hashes of the reviewed chapters

Command: `sha256sum manuscript/existence/{actual-stress-normalization,actual-stress-shell-nodes,actual-stress-annulus,trace-calibration-producer}.tex`

```
f4c1cebb58e543351f2b59c37a9aedbc70ce4362fb85827e2cffedc428ba1be9  manuscript/existence/actual-stress-normalization.tex
076e430a43dae3b4f90edd483908f70bf463e44ce1a1aaf47d3ba863f0f593b6  manuscript/existence/actual-stress-shell-nodes.tex
ba9210b96c59f1363250c0531f9ab0bb3f6c8a9785f494d5d73cc5b56108a1f3  manuscript/existence/actual-stress-annulus.tex
01a231111332191758b6640c16e7b3aebbe5c7d815e3b4ee07ef8fcc6ade5c01  manuscript/existence/trace-calibration-producer.tex
```

Compared with the coordinator's list `c14-hashes.txt`: all four identical. They also equal the `final_sha256` values in `results/C14/hashes.json`.

Pre-PR versions: `git show bfe20e7~1:manuscript/existence/actual-stress-shell-nodes.tex | sha256sum` gives `e4486b464c639c3811f971e7f3b9b703e5435a8343179ed755424ed6f7925cf2`, and the same for the annulus gives `796a6d135d63cf8dba55cdbdda77379c2e54fa2874f70051ad73a6a8b8e43a6b`. Both equal the `start_sha256` in `hashes.json` and the hashes named in `reviews/draft-review.md`.

## Commands run

- `git log --oneline -3`; `git diff --stat bfe20e7~1 bfe20e7`; `git diff bfe20e7~1 bfe20e7 -- manuscript/existence/actual-stress-annulus.tex manuscript/existence/actual-stress-shell-nodes.tex` (read the whole diff).
- `git cat-file -t` on `b2f59c3`, `81538d6`, `bfe20e7`: all commits; `git log --format=%P -1 bfe20e7` gives `81538d6…`.
- Read in full: the four chapters; `results/C14/{README,handoff,validation,findings,ledger,correspondence}.md`; `handoff/C14.md`; `handoff/COMMON-CONTRACT.md`; the "Two review questions" section of `docs/proof-standard.md`; `actual-stress-shell-nodes-evidence.md`, `actual-stress-annulus-evidence.md`, `actual-stress-normalization-evidence.md`, `trace-calibration-producer-evidence.md`.
- Python check of `results/C14/hashes.json`: 23 entries, 4 with `changed: true`, all `final_sha256` equal to current files.
- Python check of `results/C14/inspected-source.sha256` (21 files) against the current files and against `Lean/SOURCES.sha256`: 21 of 21 match, 0 mismatches.
- `grep -rl '\label{…}'` for every cross-reference used by my chapters (`prop:ex-lattice-actual-shell-node`, `thm:ex-selected-run-service`, `sec:finite-menu-history-handoff`, `sec:local-transfer`, `sec:ex-lattice-rg-multisource`, `subsec:ex-lattice-volant-producer`, `lem:trace-normalized-stress`, `sec:ex-lattice-trace-weighted-estimates`, `lem:ex-lattice-trace-weighted-price`, `sec:trace-spectrum`, `sec:trace-asymptotic`, `sec:ex-lattice-trace-free-rank`, `sec:ex-lattice-trace-producer`): each defined exactly once. `grep -n` of `manuscript/existence.tex`: inclusion order trace-calibration (235), normalization (237), shell nodes (238), annulus (239).
- Lean source reads (`cat`, `sed -n`, `grep -n`) of: `YM/MergeProof/North/Brim.lean` (whole), `YM/Next/UV_STRESS/Least.lean` (1-80), `YM/MergeProof/West/Stencil.lean` (whole), `YM/MergeProof/West/Ozone.lean` (whole), `YM/MergeProof/North/Economist.lean` (1-80), `YM/MergeProof/North/Siroco.lean` (`sales`), `YM/MergeProof/West/News.lean` (1-60), `YM/Next/UV_STRESS/Vary.lean` (60-100), `YM/Next/UV_STRESS/Annulus.lean` (185-215), `YM/MergeProof/West/Bravo.lean` (28-110), `YM/MergeProof/Tender.lean` (definitions), `YM/MergeProof/Stove.lean` (30-45), `YM/Labels/Basis.lean` (1-120), `YM/Labels/Reference.lean` (1-60), `YM/Labels/Grading.lean` (grep), `YM/Next/UV_STRESS/Weak.lean` (`Fades`), `YM/Next/UV_STRESS/Rates.lean` (`Approaches`, `build_curve`), `YM/Next/UV_STRESS/Limit.lean` (`labelScale`…`produce_current`), `YM/TraceExtension/Shelves/Lore.lean` (`aprilA`), `YM/TraceExtension/Chart/North.lean` (1-36), `YM/MergeProof/Emanate.lean` (grep `readyA`); namespace lines of these files; `ls YM/Next/UV_STRESS/Extract.lean` (does not exist).

## Not run

No LaTeX build and no rendered-page inspection (the author's 920-page build and page list in `results/C14/validation.md` are unverified by me). No Lean build, elaboration or axiom check. No `python3 scripts/check_blueprint.py` (I changed no blueprint metadata; the three review files are plain Markdown). No GitHub access, commit or push.
