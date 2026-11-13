# C15 part-A validation

Session `schmittj-claude-c15-20261113`, worktree `/home/jo314/ym-wt/c15`, branch `claude/c15-author`. No GitHub post, no commit, no push, no Lean build.

## Commands run and results

- Reading: `Read`, `sed -n`, `grep -n`, `cut` on the eleven chapters, their evidence files, the handoff documents, the two audit reports `final_A.md` and `final_B.md`, and the Lean files named in `correspondence.md`. No Lean file was modified.
- Edits: `python3` scripts doing exact single-occurrence string replacement (each replacement asserted to match exactly once) in the eleven assigned `.tex` files only.
- LaTeX wrapper outside the repository: `/tmp/claude-1000/-mnt-c-Users-jo314-Downloads-humanise-yang-mills/daa63c5b-ca30-41e4-9397-07fd86dcda87/scratchpad/c15-build-part-A/wrap.tex` (document class `article` 11pt, `\input` of `manuscript/preamble`, `mathtools`, `mathrsfs`, the theorem declarations of `manuscript/existence.tex`, then `\input` of the eleven chapters by absolute path). Command: `latexmk -pdf -interaction=nonstopmode -halt-on-error wrap.tex`. Result of the final run: exit 0, `Output written on wrap.pdf (38 pages)`, no line beginning with `!` in `wrap.log`, 0 `Overfull` warnings. Undefined references, all to labels in chapters not included in the wrapper: `eq:ex-trace-divergence-probes`, `eq:reference-bank`, `eq:reference-direction`, `eq:reference-gain`, `eq:reference-produced-difference`, `eq:reference-terminal`, `eq:reference-zero-transition`, `prop:ex-trace-mission-price-transfer`, `sec:ex-lattice-trace-probe-assembly`, `sec:principal-comparison-jets`, `sec:principal-gaussian-comparison`, `sec:reference-cone`, `sec:reference-difference`, `sec:regular-principal-producer`. Each of these labels was found by `grep` in `manuscript/existence/` (in `trace-free-rank.tex`, `reference-cone.tex`, `reference-difference.tex`, `trace-mission-price.tex`, `trace-probe-assembly.tex`, `principal-comparison-jets.tex`, `principal-gaussian-comparison.tex`, `regular-principal-producer.tex`). No undefined reference to a label inside the eleven chapters.
- Rendering: `pdftoppm -png -r 70 wrap.pdf pg`; pages 2, 4, 9, 20, 26 and 35 were inspected with the image reader (small-means detector, crown-buffer definitions, price-recurrence derivative identity, eve theorem, row-jet proposition and arrays paragraph, coffer Bill paragraph). No broken mathematics or overfull display seen. The pages were rendered before the last three small text edits (definition of `temp`/`fiery` in the eve chapter, two wording changes); the final build after those edits again reported no errors and no overfull boxes, but those last changes were not re-inspected visually. The other 32 pages were not inspected visually.
- `git diff --check` on the eleven files: exit 0, no output.
- `git diff --stat` on the eleven files: 11 files changed, 875 insertions, 216 deletions.

## SHA-256 of the chapters

| Chapter | Before (from `c15-start-hashes.txt`) | After |
| --- | --- | --- |
| `trace-small-means.tex` | `e435451b618251f87883e4e0272da441b3ba8c86d3015edc1aefff220ff77ef9` | `ab4d88cff18cf16daedc72ee5060b3daf5f091e32df058aff9c37767bf47b3e1` |
| `trace-crown-buffer.tex` | `9f63e0ae53b2bcf95934979708b9cc8d2555b4d1b2d925535e09ebe0377499c0` | `c20605af5cba507c600463a41a97b62884203701f87fb903c0bdcc78994ac738` |
| `trace-price-recurrence.tex` | `e2aac8a6900caee89189bc22b6f863fd0cef9c77f14a8cd1a026a8bce71c0703` | `50d2020e9459ad155feab0944ba0381e9917129507a8bb53ebdd61636628c64d` |
| `trace-local-paid-budgets.tex` | `3893ce4d5e6057eef2f651c2bb02240c397a12441df812f232b9dbaec0034c0c` | `89a8a89d18a90c5f6378cdba260900ee955b196be53216cafcca319f3619f591` |
| `trace-local-rate-selection.tex` | `3164d587306392399b0bcef006526271dc4c09db7df0075d967e170754f3df5e` | `43e48f857401e8070511485c264112791d27df8736622506c14ce5e526cdc787` |
| `trace-medal-prices.tex` | `85df16de2fbe0871bb7a44e13343aafd253793d968d560182d7646f4781a1b96` | `54df3679cc287744478c37d40e26e444ec00786055d88004256b1e1538f39d9f` |
| `trace-eve-producer.tex` | `0bc1e4da3c975b52aa666b8ea6d4ddb6e13e0d8dea382b36e6a3dfaec3866e0b` | `46834903e9210f451281234dd82f2217a3e5ba9f9e927038ac3da79e4206230e` |
| `trace-row-jet-estimates.tex` | `788a14a91a178227f266b8de544e6c4c31c16a15885fd4e7b5fe756e84e1714b` | `f2fc8a245f8ae1373db1c2e15e436437d162d7fdec5cdd3a3172b3c96c4aadf2` |
| `trace-regular-atom.tex` | `6b21bf5989d9f74356e535d3e9116d7ac32bfaff915dd0307ba9b4330ffeba0c` | `940dfbef8513a96ed9f9a90e893baa20dbe013d9dafec96075f55033a21390f4` |
| `trace-coffer-supplier.tex` | `29138d2fd53c601b292c23cc6e119f08c9ad8b6fb364f15fde77851f1fa65463` | `bf47f94eb09a47d5e4af4153e9ba32de13f8bb02c43609401d4430dc75400cc2` |
| `trace-bill-prices.tex` | `447722944badf4aeb535100b29c5101fc9603aba3d46a1ef69d8fe63ce141aee` | `8a78aad1f778fd78173a507919578eff2ad8d0c5468ab62830a0d58925ffb340` |

The "before" hashes were taken from the start-hash file and not recomputed by me before editing. The "after" hashes were computed with `sha256sum` after the last edit.

## Not run / not checked

- `python3 scripts/check_blueprint.py`: not run (no blueprint file was written; the report files could not be written by this agent and are delivered as text).
- No Lean elaboration, build, or `#print axioms`. All Lean correspondence is by reading declaration statements and, where stated, proof lines.
- The full manuscript `existence.tex` was not built.
- Live GitHub issue #56 and linked PRs were not consulted (instructed not to post; no access attempted).
- Lean declarations cited from the audit but not opened by me: `Carrier.field_cost`, `root_sup`, `majesty`, `Mercury.pop6`, `pop9`, `wickets`, `corridor`, `Glee.coin_rate`, `fGood`, `swell`, `sendsCard`, `Nick.atom_lead`, `routeB`, `ribbonW`, `Surrey.include_one`, `Nest.held`, `mosaic`, `Quince.attain`. Definitions read only through their use, not their own text: `tilesAt`, `Stock.Tabs.opens`, `Local.Attaches`, `Brush`, `Carries`, `Seal.donne`, the `factory` structure.
- Proof steps of the chapters not re-derived against the source: N3, N4, N6, N7 of `findings.md`.
- The other author's chapters were not reviewed; only `trace-mission-price.tex` lines 10–110 were read (at the state they had when I read them; that file was being edited concurrently).
- The directory `blueprint/units/YM-000026/handoff/results/C15/part-A/` was created empty; no file was written into it by this agent in the first round (the coordinating session saved the four files from the first-round appendices).

## Second round

Edited in this round: `trace-coffer-supplier.tex`, `trace-price-recurrence.tex`, `trace-eve-producer.tex`, `trace-bill-prices.tex`, `trace-local-rate-selection.tex` (five chapters; exact single-occurrence replacements by `python3`, one `sed -i` for the `guests` subscript), and `findings.md`, `validation.md`, `ledger.md`, `correspondence.md` in this directory (Edit tool).

- Lean files read: `MergeProof/Newell.lean` (`Vault`, `harvest`, `touchdown`, `steer`), `MergeProof/Accent.lean` (`Loci`, `Towed`, `Carton`, `restore`, `Served`), `Ac/Tree.lean` (`Hit`), `Extra/SOURCE_HISTORIES/Dressing.lean` (`coat`, `dressed`, `coat_budget`, `dressed_budget`, `dress_eq`, `dress_abs`), `RG/ActivityBounds.lean` (`K_total`), `Push/GRID_APPROXIMATION/Geometry.lean` (`tilesAt`), `Cells/Packing.lean` (`center`), `Source/Insertion.lean` (`TransferData`), `Overlay/Prior.lean` (`Tabs.opens`), `Push/LOCAL_SPLITTING/Atoms.lean` (`Attaches`), `Push/LOCAL_SPLITTING/Comparison.lean` (`errorPrice`).
- Reference check: for every `\ref{X}`/`\eqref{X}` in the eleven chapters, `grep -l 'label{X}' manuscript/existence/*.tex` and comparison with the 241 files `\input` by `manuscript/existence.tex`. Result: no missing label, no label defined only in a non-included file.
- `latexmk -pdf -interaction=nonstopmode -halt-on-error wrap.tex` in the same wrapper directory: exit 0, 39 pages, no `!` line, 0 `Overfull`; the same 14 external labels undefined as in the first round, none inside the eleven chapters.
- `pdftoppm -png -r 70`; pages 34 and 35 (coffer: column definition, planted-expansion input, new equation (47), exponent sentence) inspected. The changed pages of `trace-price-recurrence`, `trace-eve-producer`, `trace-bill-prices` and `trace-local-rate-selection` were not re-inspected visually in this round.
- `git diff --check` on the eleven files: exit 0.
- `grep -n 'label{prop:ex-trace-mission-price-transfer}\|label{sec:ex-lattice-trace-probe-assembly}' manuscript/existence/*.tex`: both present (`trace-mission-price.tex`, `trace-probe-assembly.tex`).
- `git diff` of the eleven files filtered for removed lines containing `\label`: one line, the reformatted display that still carries `eq:ex-trace-coffer-column`; no label removed.

SHA-256 after the second round:

| Chapter | After second round |
| --- | --- |
| `trace-small-means.tex` | `ab4d88cff18cf16daedc72ee5060b3daf5f091e32df058aff9c37767bf47b3e1` (unchanged) |
| `trace-crown-buffer.tex` | `c20605af5cba507c600463a41a97b62884203701f87fb903c0bdcc78994ac738` (unchanged) |
| `trace-price-recurrence.tex` | `d806266671058ddf52cfab24a60b97a85e9434cc357f1b5d8952585387260ab7` |
| `trace-local-paid-budgets.tex` | `89a8a89d18a90c5f6378cdba260900ee955b196be53216cafcca319f3619f591` (unchanged) |
| `trace-local-rate-selection.tex` | `46950adfb52103145d21023096690f59165ea81c08f9de42c71c0a5679de144a` |
| `trace-medal-prices.tex` | `54df3679cc287744478c37d40e26e444ec00786055d88004256b1e1538f39d9f` (unchanged) |
| `trace-eve-producer.tex` | `5bcdf4e577b71960cad20ac715d230280cdcac84868a4d7c2f958728a9eb63e6` |
| `trace-row-jet-estimates.tex` | `f2fc8a245f8ae1373db1c2e15e436437d162d7fdec5cdd3a3172b3c96c4aadf2` (unchanged) |
| `trace-regular-atom.tex` | `940dfbef8513a96ed9f9a90e893baa20dbe013d9dafec96075f55033a21390f4` (unchanged) |
| `trace-coffer-supplier.tex` | `855c25c892f03f7ca6cfd20b18553159e8c411042f4e74d9d8a8f6cb098fdd53` |
| `trace-bill-prices.tex` | `3573e9ef1c5d47b0b9d9a6ce76115c406440fc5622ce29edf7cdb151a4094a55` |

Not run in this round: `python3 scripts/check_blueprint.py`; any Lean build; the full manuscript build.
