# C07 review, part 1: validation

Commands actually run (worktree `/home/jo314/ym-wt/c07-review`, read-only except this directory):

- `git log --oneline -3` gives HEAD `e058a61`. `git -C Lean rev-parse HEAD` reports the repository HEAD `e058a615…`, because `Lean/` is a tracked directory.
- `git diff --stat 9f8fa0b~1 9f8fa0b` and `git diff 9f8fa0b~1 9f8fa0b -- manuscript/existence/{sector-gram,local-covariance,actual-global-row-prices,actual-palette-warning}.tex` were read in full.
- `git log` on `actual-local-compiler-handoff.tex` and `ledger.md`; `git show bddbedc -- manuscript/existence/actual-local-compiler-handoff.tex` (the C13 change after PR #96).
- `sha256sum manuscript/existence/{sector-gram,local-covariance,local-mean,warning-safety,actual-global-row-prices,actual-palette-warning}.tex`:

```
da86d89f4a1a2bd178b0aa4fe32fa140d62240dd424d913341b69dabbdb22fe6  sector-gram.tex
b5de687585fa37c7ac01b0e149d50d0982d7f11a55d54c393c4aea50e859edb7  local-covariance.tex
f32876889ca48172b9399bafc1ff983ae0eee0750d4d7dd4329c2211ce60f1b5  local-mean.tex
a251f7dce9e180c25dd2e81661d406e0fd9c4600078a68aec42740d4e7318c68  warning-safety.tex
fb4fb9d97a224556c4b242d0256b75c0e67ae44736d455a6537a84eaa4be7c12  actual-global-row-prices.tex
aecfb374737b47635694c893448bacfbd02ceaeae7b65fbb2a82e68fa32eead2  actual-palette-warning.tex
```

All six are identical to the values in the brief's `c07-hashes.txt` and in `review-index.md`.

- Consumer hashes (for the record): `actual-local-compiler-handoff.tex` `be1617bbc8ae8d38bc18d501cb1b71b8dcb6a2343974fbff48cbb86e728c2fff`, `actual-reader-small-window-bridge.tex` `4dae5d41962866e038b43a9bcca394bfe4b7e37ec3b47f4f3779cc750c6ddc8f`.
- Label resolution: extracted every `\ref`/`\eqref` target of the six chapters and grepped for its `\label` under `manuscript/`. All 55 targets resolve.
- Lean text inspection with `grep`/`sed`/`cat` of the declarations listed in `part1-lean.md`; `ls Lean/YM/PhysicalNext/Integration/RG05Preconstruction/` fails (no such directory), confirming C07-A3.
- WebFetch of `https://www.numdam.org/item/AIHPC_1990__7_5_461_0/`: confirmed Jaffard, Ann. IHP C Anal. Non Linéaire 7 (1990), no. 5, 461-476. The Proposition 2 / p. 464 locator was not visible and is unverified.

Not run: LaTeX build or rendering, `python3 scripts/check_blueprint.py` (no blueprint metadata changed by this review), Lean elaboration, `#print axioms`, Comparator.
