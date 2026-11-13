# C08 review, part 1: validation record

Session `schmittj-claude-c08-review-20261113` (Claude agent, Opus 5.5). All commands were run in the read-only worktree `/home/jo314/ym-wt/c08-review` unless stated otherwise. Nothing was committed, pushed or posted, and only files in this directory were written.

## Tree and source pin

- `git rev-parse HEAD` → `81538d6dcf2e71f24cc74a4afc556dd015046691` (merge of PR #93; author commit `48553af`).
- `git ls-tree HEAD Lean` → `040000 tree 328ad19b404d2db2a578319ea3e4eba4b27e34ef Lean`, the Lean tree recorded for pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464` in the C08 validation record.
- `git status --short` → only this untracked review directory.
- `git diff --stat 48553af~1 48553af` → 13 files, 1262 insertions, 10 deletions. Restricted to this part's chapters (`git diff 48553af~1 48553af -- manuscript/existence/{gaussian-reassembly,forest-average-log,forced-exclusion,soft-log-fusion,marked-block-integral,marked-activity-jets,leaf-expansion}.tex`), only `gaussian-reassembly.tex` (lines 15-20, the precision/covariance/Hessian paragraph) and `leaf-expansion.tex` (line 76, summation index) changed.

## Chapter hashes

`sha256sum manuscript/existence/<chapter>.tex`, run at the start and again at the end of the review:

```
e8ee9564be2ec180f34c60fbbbe58968b92053f8cba156d6d4ea9bd67266c4ec  manuscript/existence/gaussian-reassembly.tex
931cc2d9703fc30d5adddd69e93897a6842595a5e56452d506399d1e5dba7cec  manuscript/existence/forest-average-log.tex
1132e7c0dc9c1a3a6fb049710979fd37e6e815f97e544122db5887077046d368  manuscript/existence/forced-exclusion.tex
a8caa20893e55269853ba6e26d08b60c6f09b3f3572a00c7e7aff8d20f5c43db  manuscript/existence/soft-log-fusion.tex
7e65f60671d59310d69bc2053c0854d96e783ff9c1da5f9540e083c92fd018e1  manuscript/existence/marked-block-integral.tex
aa69899d7ac9756bdd5993828a6b18c2e852f2a347bdfbe1e3de7c4fc6e01a87  manuscript/existence/marked-activity-jets.tex
98ca0d7aec7cfa94a5ef22ca69ebb924c293401bab5ff93e54416b33e22a55d3  manuscript/existence/leaf-expansion.tex
```

Comparison with the coordinator's `c08-hashes.txt` (`grep -F -f <current hashes> c08-hashes.txt | wc -l` → `7`): all seven lines match exactly. The C08 record hashes for `HANDOFF.md`, `ledger.md`, `edges.md`, `outputs.md`, `literature.md` and `validation.md` were not recomputed separately; those files were read as claims.

## Other commands run

- Label check: for every `\ref`/`\eqref` target in the seven chapters, `grep -rl "label{<target>}" manuscript | wc -l` gave exactly 1 for every target, so all cross-references resolve to a unique label (output: no exceptions printed).
- `grep -n cite` in the seven chapters: no citations.
- Interface notes (not present in the worktree): `sha256sum` in the main checkout `/mnt/c/Users/jo314/Downloads/humanise-yang-mills` gave `f5ed7e2503e4a2935fc033b34c6fd835359ad904de86622748c014f7fa5d07e7 blueprint/interfaces/gaussian-sector.md` and `b65c6c4e3970355ba90ee2e741f4f85b7019aec0c421d97c6073fd9f0fffce82 blueprint/interfaces/nonlinear-rg-step.md`, equal to the pins in the C08 ledger.
- Lean source: read with `grep`/`sed` only (declarations listed in `part1-lean.md`).

## Not run

- No LaTeX build: no chapter was changed by this review, and the rendered pages were not inspected.
- No Lean build, elaboration, `#print axioms` or kernel check.
- `python3 scripts/check_blueprint.py` and `git diff --check` were not run: this review adds only Markdown report files in its own directory and changes no blueprint metadata.
- No literature sources were fetched.
