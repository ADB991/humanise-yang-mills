# Validation: C04-to-C16-reconstruction endpoint check

Session `ADB991-claude-20261113-a112`. Report-only change: this directory is the only new content. No manuscript, ledger, review record, shared file or `Lean/` file is modified.

## Frozen inputs

Base `codex/existence-monograph` at `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (the `Lean/` tree at that base). SHA-256 of every file read for the comparison, as computed by `sha256sum` at that commit:

```
f8ad9d3fdb405e40e9e6cff6b69cbad94ed166687b26125010cb7588d5e715f4  manuscript/existence/statement.tex
c1309142138e42f057b6533197d2c770d45b9db16ca91643ddc2f10a800deaaf  manuscript/existence/assembly.tex
f22685be41a0255a1441ad4d98ddef46666e32f293ed4979ffebf7ee98b46ad0  manuscript/existence/complex-heat.tex
348f849f1581db7c5d6d0fecce8d1eec2ec151a237b5ebae20df46fab9db793b  manuscript/existence/analytic-boundary.tex
4abab76e83388d42f59b778bddeca1519e6a5790a8667347fc2055745f0420e0  manuscript/existence/reconstruction.tex
d3207f915e5d6a535ec0a3f40981c7e8555e3d272daebdadc3672e75ab0b41a9  manuscript/existence/boundary-detection.tex
9de3ba7c3ea0d2839424e260aebd31bac261363812b0079c3591b23af8970c9a  manuscript/existence/spectral-measure.tex
82bafd2588b64f09957e1a681169b4f182b3d3ea851945d6458ce303f3fb5893  manuscript/existence/locality.tex
894d899b2dc2b222c1fe52b850131c92bcb3657264fffe5a919322099fb6cb69  manuscript/existence/label-descent.tex
60bec1c9d639e17e08ad455c9dc9cf596fc9704ea1acc0698459192c1e990b47  manuscript/existence/argument-outline.tex
d8a8f06e0c124aabdcc25c482b5384c069649ff75edaf117211a25ff2af56167  blueprint/units/YM-000026/handoff/results/C04/ledger.md
bb19f03427b8582dbf1668a5f44ffc31e693938514cd262c11873c4984b60faf  blueprint/units/YM-000026/handoff/results/C16/ledger.md
1fce31e98dad38d2b4ecba1879f3e067285c1de3a59c0aa9d195310da8f5d1b5  blueprint/units/YM-000026/handoff/results/C04/review/rereview-revision1.md
e48b0be2b72d16b9b87c6c1923b3ae814270387bf9312b5cb0661dfa3e243749  Lean/ChallengeSpec.lean
82c27a4ecb393c65566a09addd97d70aea7cc62b990d383293adde53d0fc423a  Lean/HierarchyBridge.lean
287f1914a69c27519036b9d51395aa0fe1f0899b9d7b0e8699cbfbd5110bfa1a  Lean/YM/Euclid/Null.lean
4aa0a8c1b530b627c005ee629ff0a40c96d0169e27102bffc2dc14378fc6bc3e  Lean/YM/Euclid/Table.lean
```

Open PR #203 (head `9e7326b832…`) changes one clause of `complex-heat.tex` l.106 ("as does the formal source" removed). That clause is not used in this report. Its diff was read with `git diff`.

## Commands run

- `python3 scripts/check_blueprint.py`: exit 0, "Blueprint structure OK: 4 units. Lean and mathematics were not verified."
- `python3 -m unittest discover -s tests`: exit 0, "Ran 22 tests … OK".
- `git diff --check` on the commit: clean (see PR).

## Not run

- No LaTeX build: no `.tex` file was changed.
- No Lean elaboration or `#print axioms`: Mathlib sources are not reachable from this environment (see earlier ADB991 setup notes). Lean declarations were read as source text only. Qualified names were read from the namespace blocks of the cited files.
