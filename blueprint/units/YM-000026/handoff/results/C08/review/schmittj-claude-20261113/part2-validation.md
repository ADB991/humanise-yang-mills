# C08 review, part 2: commands run and results

Reviewer: Claude agent (Opus 5.5) for `schmittj`, session `schmittj-claude-c08-review-20261113`, issue #49. Worktree `/home/jo314/ym-wt/c08-review`, HEAD `81538d6dcf2e71f24cc74a4afc556dd015046691` (branch `codex/existence-monograph`, contains PR #93, author commit `48553af`). Nothing outside this output directory was modified. `git status --short` at the end showed only the untracked `blueprint/units/YM-000026/handoff/results/C08/review/`.

## Hashes

`sha256sum` of my six chapters and the C08 author records, at the start and again at the end of the review (identical both times). Each was compared line by line with the coordinator's `/tmp/claude-1000/-mnt-c-Users-jo314-Downloads-humanise-yang-mills/daa63c5b-ca30-41e4-9397-07fd86dcda87/scratchpad/c08-hashes.txt`. All match.

| File | SHA-256 | vs `c08-hashes.txt` |
| --- | --- | --- |
| `manuscript/existence/projection-payment-producer.tex` | `5637b0d8aa15de99a7153a5778f54b2054ba92688c318a017dfd244d4a2c8e83` | match |
| `manuscript/existence/principal-gaussian-comparison.tex` | `ac21f608d8f153fa88222a602629caddf8b6303c343f709f087ddf0fc211ee1c` | match |
| `manuscript/existence/principal-comparison-jets.tex` | `ff624cbd11db727d32b9c3c50cf5540d2a048efb46e3e83b6c05c8b64dd1dded` | match |
| `manuscript/existence/principal-reference-attenuation.tex` | `4c379ef574d8d7eb26dbdd9452efeafb230344732afd4a7397c5c5f25e6ab692` | match |
| `manuscript/existence/nonlinear-singleton-inheritance.tex` | `69a5302a4f4a0c3f0cb1b31105427fca4a73aea9b30d2b04c6f74d3495b5fb9b` | match |
| `manuscript/existence/high-degree-cluster-prices.tex` | `e247cf5b016a451bdc5237f325de26190840c361fa1d6bea962d1487a0c0c9f0` | match |
| `results/C08/HANDOFF.md` | `77b572e7d526b0f314fd40a85614a8cd00db37effcbaec37e0540f9241300b00` | match |
| `results/C08/edges.md` | `320939f679cfa0f503fab699411d7c059a1d30cf729e3578efe42124f52a9055` | match |
| `results/C08/fingerprints.md` | `2e7047ca0259c40a257962a5fab987c848636c8f81a20a2069568626cbc0b895` | match |
| `results/C08/ledger.md` | `6d1b37e42299bec762f332b88130c14d4ba2a0749b82a3a739a0dfbc07e4c093` | match |
| `results/C08/literature.md` | `741e1f8d62ea4b4891202fa13997ec289239e961a77f36a5d4231f2efd0a23ae` | match |
| `results/C08/outputs.md` | `937bf6785c846140d3a1c9d10eb3ee3c584f2972ffb02293f61c40a10cebc173` | match |
| `results/C08/validation.md` | `87ef9dbb631bcf12fe819e6d41653d7e7915810c121a7c98629fc55f08e95d0e` | match |
| `results/C08/manifest.json` | `d6ac6ffda23a24bcd3aff4c6d76a80a5ef23ea26c347c10867b5494883326649` | match |
| `results/C08/starting-inventory.json` | `bc6f65d33c5b575f72447c85262139adf872b6bcc895ce8e301d10b67be6b664` | match |

The current chapter hashes also agree with `fingerprints.md` and `manifest.json`.

## Git and record checks

- `git log --oneline -3` → `81538d6` (merge of PR #93), `48553af` (author), `9d055ef`.
- `git diff --stat 48553af~1 48553af` → 13 files. Among my chapters, only `high-degree-cluster-prices.tex` (14 lines) and `nonlinear-singleton-inheritance.tex` (10 lines) changed. I read the full diff of both.
- `git show <rev>:manuscript/existence/<chapter>.tex | sha256sum` for `9d11cca` (released checkpoint) and `48553af~1`: for all six chapters the released and base hashes are equal and equal `starting-inventory.json`. For the four chapters untouched by PR #93 they also equal the current hash. The author snapshot `f5e0a726…` is not present in this clone (`git cat-file -t` fails), so `validation.md`'s byte-for-byte claim about it could not be checked.
- `git rev-parse HEAD:Lean 48553af:Lean` → `328ad19b404d2db2a578319ea3e4eba4b27e34ef` for both, matching `validation.md` and `manifest.json`.
- For each released hash in `starting-inventory.json`, `grep -n <hash> blueprint/units/YM-000026/reviews/draft-review.md` returns the line given in `fingerprints.md` (1082, 1153, 1127, 748, 1149, 1160, 754, 1239, 1329, 1334, 1365, 1587, 1603). All correct.
- Interface notes: `git rev-parse 4cf1c97:blueprint/interfaces/gaussian-sector.md` → `9378ceea…` and `…/nonlinear-rg-step.md` → `50012779…`; `git show … | sha256sum` → `f5ed7e25…` and `b65c6c4e…`. These match `ledger.md` lines 65–71. `git merge-base --is-ancestor 4cf1c97 HEAD` → not an ancestor; `blueprint/interfaces/` does not exist at HEAD.
- `ls results/C08/review` at HEAD before writing → "No such file or directory". No review directory existed at this commit.
- Label and consumer search: a shell loop over `\ref`/`\eqref` targets in my six chapters, resolving each label's defining file and the package document (`handoff/C*.md`) that owns it. Then `grep -rl "ref{<label>}"` over `manuscript/` for the outgoing uses. The results are in `part2-mathematics.md`, Records.

## Checkers

- `python3 scripts/check_blueprint.py` → `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` (structure only; my output files are not blueprint units).
- `git diff --check 48553af~1 48553af` → no output (clean).

## Lean inspection

Lean was read as text only with `grep`/`sed`, at the pinned tree. The declarations are listed in `part2-lean.md`. No `lake build`, no elaboration, no `#print axioms`. To settle the operator-precedence comment in `Blush.glyph`, I read `Init/Notation.lean` of the installed `v4.32.0` toolchain (`prefix:75 "-" => Neg.neg`; the pin's `lean-toolchain` is `leanprover/lean4:v4.32.0`) together with the `change` line in `Blush.efferv`.

## Not run

- LaTeX build and inspection of rendered pages: not run, because this is an audit-only review and no prose was changed.
- Lean build, elaboration, axiom report: not run, as instructed.
- No literature source texts were fetched, so the theorem numbers in `literature.md` were not verified.
