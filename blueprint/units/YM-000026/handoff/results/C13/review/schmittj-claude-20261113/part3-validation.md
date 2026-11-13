# C13 review, part 3: validation record

Commands actually run on 2026-11-13 in `/home/jo314/ym-wt/c13-review` (HEAD `be0e87db8c520491d25145d3c61f61b97f0ff42d`) by the part-3 Claude agent. Nothing was posted, committed or pushed. No Lean or LaTeX build was run. Files were created only in this directory: `part3-mathematics.md`, `part3-lean.md`, `part3-validation.md`. A scratch script was written outside the repository, at `/tmp/claude-1000/-mnt-c-Users-jo314-Downloads-humanise-yang-mills/daa63c5b-ca30-41e4-9397-07fd86dcda87/scratchpad/c13r3/axial.py`.

| Command | Result |
| --- | --- |
| `git log --oneline -3`; `git rev-parse HEAD` | `be0e87d` (merge of PR #105) on top of the PR #103 content; HEAD as above |
| `git diff --stat bddbedc~1 bddbedc` | 15 files, 1647 insertions, 57 deletions; my changed chapters: coordinate-calibration (4), marked-propagation (5), selected-history-limits (18), three-panel (56) lines |
| `git diff bddbedc~1 bddbedc -- manuscript/existence/{allarity-coordinate-calibration,allarity-marked-propagation,three-panel-weak-comparison,selected-history-limits}.tex` | read in full; every added line checked (see `part3-mathematics.md`) |
| `sha256sum manuscript/existence/<chapter>.tex` for the eight chapters, compared with `/tmp/claude-1000/-mnt-c-Users-jo314-Downloads-humanise-yang-mills/daa63c5b-ca30-41e4-9397-07fd86dcda87/scratchpad/c13-hashes.txt` | 8 of 8 identical (hashes below) |
| `sha256sum` of 13 opened Lean files, each searched for in `Lean/SOURCES.sha256` | 13 of 13 present (`Prayer.lean`, `ArcEstimate.lean`, `ParticleGate.lean`, `Common.lean`, `Value.lean`, `StationMeter.lean`, `Guard.lean`, `West/Cabaret.lean`, `West/Prince.lean`, `East/Largo.lean`, `UV_STRESS/Granular.lean`, `UV_STRESS/Fringe.lean`, `AFTERNOON_INTERACTING_RANK_COMPARISON/Compass.lean`) |
| `grep`/`sed` on the Lean files named in `part3-lean.md`, and on `soft-log-fusion.tex`, `coupled-background-convergence.tex`, `background-path-convergence.tex`, `fixed-rung-convergence.tex`, `selected-centered-service.tex`, `common-funded-history.tex`, `fullmesh-correlation-cauchy.tex`, `path-attachment-producer.tex` | read as cited in the findings |
| `grep -rn "sec:selected-history-limits\|eq:selected-…"` over `manuscript/` | six consuming chapters found; `selected-centered-service.tex` lines 52–58 relevant to M2 |
| `python3 -I axial.py` (periodic axial tree and plaquette elimination of `rank-root-normalization.tex`; asserts tree links $V-1$, wrap links free, chosen plaquette contains the link with four distinct edges, every other free link on it including the retained wrap links has strictly smaller priority, chosen plaquettes distinct) | all assertions pass; free links / chosen plaquettes: L=2: 49/45; L=3: 244/240; L=4: 769/765 (agrees with the author's `validation.md`) |

Chapter hashes (SHA-256), all equal to the coordinator's list:

- `allarity-coordinate-calibration.tex` `490dee743bb6ff3d6c7dda652a1c5c2e3470270a02077f9eb9e303b25b115f9a`
- `all-arity-reader-gaussian-model.tex` `e9d9307a55a022a86798b38957fc6340fc5b767c52d37f8d5c8cf8689c766e59`
- `allarity-cumulant-comparison.tex` `58282923ecd09853704aa63a2a28505de2827668dd3f3bd17d25a61ff2305da1`
- `marked-healthy-cumulant-launch.tex` `c460f7153e31f2aec7193ca5b83328d07ac090979af231f98d1d87101067d572`
- `allarity-marked-propagation.tex` `f0f19b2534faa91a1c067b74fb2be77c3338d954ba7370caf5b7346882b570f6`
- `rank-root-normalization.tex` `b1a2fe47dc069382e53b6f7565af582adb4b5044a95aefb8d61fcf7d743e6b3d`
- `three-panel-weak-comparison.tex` `d7cf1fe358c4e0942545965e0ef27ec2034379453b0ffd3c4f3f6fc3b406d3d3`
- `selected-history-limits.tex` `a80147ecbbc0a285ad774f9028658790abb7ab0a1e4af829033c1b6921227b12`

Not run: LaTeX build and rendered-page check, `python3 scripts/check_blueprint.py` (no blueprint metadata was changed), any Lean command.
