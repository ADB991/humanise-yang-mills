# C01 review, part 1: commands actually run

Reviewer session `schmittj-claude-c01-review-20261112` (Claude Opus 5.5 agent). Worktree `/home/jo314/ym-wt/c01-review`, `git rev-parse HEAD` = `165fb245460479233d9e9d3e9b9023ca10c49f54` at start and end. Nothing was edited outside this directory; `git status --short` at the end shows only `?? blueprint/units/YM-000026/handoff/results/C01/review/`. Nothing was committed, pushed or posted.

## Content hashes

Command (at start and again at end): `sha256sum manuscript/existence/{lattice,quadratic-lattice-symmetry,flat-estimate,flat-step,positive-row-producer}.tex`

| File | SHA-256 | vs. coordinator's `c01-hashes.txt` |
| --- | --- | --- |
| `manuscript/existence/lattice.tex` | `b8172d7e2c6aafb27a8ad007858e0a49159a9a4f9c00caa07addf99a29a7764f` | match |
| `manuscript/existence/quadratic-lattice-symmetry.tex` | `7da68a885c2400c811579fba518273a05b2bc28eb0fc78aa41d72034b91d6a37` | match |
| `manuscript/existence/flat-estimate.tex` | `0b7f7e9eb6cc6c5a8b4f7b626fce6e504a4060b26ca0e940967a38287a656929` | match |
| `manuscript/existence/flat-step.tex` | `43835467704b694804e06cf9e9770b65cf64776cb6ca902bb3d89133f78dc0b1` | match |
| `manuscript/existence/positive-row-producer.tex` | `8b25239bc9105b32ebced52ab14d729abbc8c1e64ba076df3fa0a27862ac26e1` | match |

The same five values appear in the author's `HANDOFF.md` inventory.

## Repository reads

- `git log --oneline -1`; `git diff --stat 18d0327 HEAD`; `git diff 18d0327 HEAD -- manuscript/existence/lattice.tex manuscript/existence/flat-step.tex` (PR #81 delta for this part; the other three chapters are unchanged by PR #81).
- Read in full: the five chapters; `docs/proof-standard.md`; `blueprint/units/YM-000026/handoff/{C01.md,COMMON-CONTRACT.md}`; `handoff/results/C01/{RESULTS,HANDOFF,VALIDATION}.md`; `blueprint/units/YM-000026/flat-step-evidence.md`. Read in part: `correspondence.md` (lines 1–80, 620–680, 775–800), `free-kernel-estimates.tex` lines 330–419 (level responses and pulse formula), `curvature-horizon-producer.tex` (grep for the amendment), the C05 review files (format only).
- Lean (read only, by `cat`/`sed -n`/`grep -n`, no build): `PublicWilson.lean`, `WilsonBridge.lean`, `ChallengeSpec.lean` (lines 12–22), `YM/Wilson/Law.lean`, `YM/Cells/Cut.lean`, `YM/Slice/Reflection.lean`, `YM/Lattice/Path.lean` (lines 125–205), `YM/Cells/Certificate.lean`, `YM/Cells/Packing.lean` (lines 70–90), `YM/Lattice/Scale.lean` (lines 25–45), `YM/RG/History.lean` (lines 95–110, 200–252), `YM/Source/Construction.lean` (lines 20–60), `YM/Extraction/Pairs.lean` (lines 1–60, 100–125), `YM/Extraction/Banks.lean` (lines 85–110), `YM/RG08/Packets/FlatStep.lean`, `YM/PREC/TreeMatch.lean` (lines 60–105), `YM/PREC/Stacks.lean` (lines 50–110), `YM/Pert/Bulk/Atlas.lean` (lines 1–60), `YM/Pert/Bulk/Sites.lean` (lines 1–30), `YM/RG08/Packets/Torus.lean` (lines 1–20, 77–85), `YM/RG08/Packets/Lines.lean` (lines 80–90), `YM/RG08/Packets/Pushed.lean` (lines 73–124), `YM/Pert/Bulk/Projected.lean` (lines 11–18), `YM/Pert/Bulk/Inherit.lean` (line 24 ff.), `YM/RG08/Flat/Shadow.lean` (lines 30–76), `YM/RG08/Flat/Agreement.lean` (lines 19–25), `YM/RG08/Rate/Ascent.lean` (lines 56–132), `YM/RG08/Rate/Stair.lean` (lines 91–105), `YM/Next/FREE_KERNELS/Pulled.lean` (lines 38–100), `YM/Next/FREE_KERNELS/Signed.lean` (lines 1–71), `YM/Next/FREE_KERNELS/Feed.lean` (lines 172–193), `YM/Next/FREE_KERNELS/Amend.lean` (lines 95–103), `YM/Bid/Station.lean` (lines 31–55), `YM/Bid/Craft.lean` (lines 38–44, 87–91), `YM/Work/F07.lean` (lines 34–60, 137–202), and `grep` for the remaining declaration names listed in `part1-lean.md`.

## Numerical checks (scripts in the session scratchpad `/tmp/claude-1000/-mnt-c-Users-jo314-Downloads-humanise-yang-mills/daa63c5b-ca30-41e4-9397-07fd86dcda87/scratchpad/c01rev/`)

1. `python3 curl_check.py`: for every one of the 384 signed permutations $s$ of four axes, on 4D tori of sides 2 and 3, with a random real one-cochain $a$, compares $(dR_sa)(x,p)$ with $\epsilon_s(p)(da)(r_s(x,p))$ using the chapter's definitions of $R_s$ (reversed bond = minus the link at the shifted base), $\epsilon_s$ and the lower-vertex shift. Output: `2 0`, `3 0` (number of mismatches). Establishes `eq:quadratic-curl-rotation` including the seam and even period, for these sizes.
2. `python3 rp_check.py`: exhaustive $\mathbb Z_2$ Wilson model on a 2D torus (time period $T\in\{2,4\}$, space period 2), action with $r_G=1$, site and link cuts as in the chapter, $\Theta$ as the chapter's pullback; computes the matrix $M_{ab}=\mathbb E_{\mu}[\chi_a\,\chi_b\circ\Theta]$ over all characters $\chi$ of the links in the strict positive sector (no gauge-invariance restriction, which tests a stronger claim). Output: minimum eigenvalue $\ge -2\cdot10^{-15}$ and asymmetry $\le 6\cdot10^{-15}$ for $\beta\in\{0,0.7,2\}$ in all cases (sector sizes 0, 2, 2, 6 links).
3. `python3 rp_z3.py`: exhaustive $\mathbb Z_3$ model, link cut, $T=2$ ($h=1$, coinciding boundary slices), space period 3, $M_{ab}=\mathbb E[\chi_a\overline{\chi_b\circ\Theta}]$ for the 27 characters of the three sector links. Output: $\beta=1$: minimum eigenvalue $-4\cdot10^{-16}$ (PSD); $\beta=-1$: $-0.0832$; $\beta=-3$: $-0.2175$. The negative-$\beta$ failure shows the test can detect a violation (the $\mathbb Z_2$ model cannot, by its sign symmetry, which is why $\mathbb Z_3$ was added).

These are diagnostics for small abelian models, not proofs of the four-dimensional statement; the proof itself was checked by hand (`part1-mathematics.md`).

## Not run

- No Lean build, `lake env lean`, `#print axioms`, or kernel replay (forbidden by the brief and unnecessary for reading statements).
- No LaTeX build or rendered-page inspection of these chapters.
- `python3 scripts/check_blueprint.py` was not run: this review changes no blueprint unit record.
