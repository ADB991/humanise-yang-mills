# C13 independent review, part 2: validation record

Reviewer: Claude (Opus 5.5), session `schmittj-claude-c13-review-20261113`. Worktree `/home/jo314/ym-wt/c13-review`, `HEAD` = `be0e87db8c520491d25145d3c61f61b97f0ff42d`. `Lean/` is part of the same repository tree. The source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464` is the one stated by the package and was not re-verified against `source/upstream.json`.

## Hashes

Command: `sha256sum manuscript/existence/<chapter>.tex` for each chapter. Each hash was compared by script with the line for the same file in the coordinator's `c13-hashes.txt`.

| Chapter | SHA-256 | Coordinator list |
| --- | --- | --- |
| actual-reader-tree-covariance.tex | f66794f9bd1a9964d13fbf363a1bc8f335e4fcc18742412e4f8f773113b66991 | match |
| actual-reader-short-covariance.tex | 3482d873b406659f9cd5686eccdb76ef280c7f77007980c7193bbc472c364664 | match |
| actual-reader-small-window-bridge.tex | 4dae5d41962866e038b43a9bcca394bfe4b7e37ec3b47f4f3779cc750c6ddc8f | match |
| actual-reader-guarded-curvature.tex | c740f410f6ee0fd463b9b0dd3346642d4db392181c93df104eb0e2a586fe4912 | match |
| actual-reader-dawn-selection.tex | 61cca9790b3323122d09a3e55945c9a5bf78843d13ce193aac160c53afc5c5ee | match |
| actual-covariance-fourier-window.tex | 53246acadbabbd52ff5c4c1ad4fd6a6cf61e9b7a9ba973d52b2752167291cf68 | match |
| actual-covariance-transport.tex | f2ae933a34234272f8e5288d6cfd8228cd3f3b87ec328b625eff571ccab6a7b6 | match |

## Commands run (read-only)

- `git log -1 --oneline` gave `be0e87d Merge pull request #105 …`.
- `git diff --stat bddbedc~1 bddbedc`: among my chapters, only `actual-reader-small-window-bridge.tex` changed (17 lines).
- `git diff bddbedc~1 bddbedc -- manuscript/existence/actual-reader-small-window-bridge.tex` was read in full. There are three hunks: the radius quantifier at lines 74–78, the threshold remark at 92–93, and the uniformity clause at 103–104.
- Read in full: the seven chapters; `C13.md`; `HANDOFF.md`, `review-context.md`, `validation.md` and `coverage.md`; `ledger.md` lines 90–260, 440–560, 640–780 and 1005–1119; `common-tuple.md` lines 1–20 and 140–167; `actual-reader-small-window-bridge-evidence.md`; the declaration lists of the tree-covariance and guarded-curvature evidence files; `actual-reader-local-gaussian-prices.tex` lines 30–80 (consumer edge).
- `grep`/`sed` inspection of the Lean declarations listed in `part2-lean.md`.
- `grep -rn` for the labels `prop:ex-lattice-actual-reader-panel`, `eq:ex-lattice-reader-mean` and `eq:ex-lattice-reader-column` across `manuscript/` to find consumers. The only consumer found is `actual-reader-local-gaussian-prices.tex:48`.

## Not run

- No LaTeX build, so the rendered pages were not inspected.
- No `python3 scripts/check_blueprint.py`, since this review changes no blueprint metadata.
- No Lean build, elaboration, kernel replay or axiom check.
- No GitHub access, posting, commits or pushes.
