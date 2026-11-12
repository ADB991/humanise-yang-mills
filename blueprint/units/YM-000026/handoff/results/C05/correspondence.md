# C05 Lean correspondence (author pass)

Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, files under `Lean/` on
`codex/existence-monograph` at `01ef22c`. **Method:** source text only, read with
`sed`/`grep`. No elaboration, no `#print axioms`, and no build: Mathlib sources are
not reachable from this environment. The canonical, broader correspondence for these
chapters remains `../../ope-evidence.md` and `../../local-projection-evidence.md`. This
file records only what was re-read in this pass to support the repairs.

| Prose | Declaration (path) | What was checked |
| --- | --- | --- |
| `eq:ope-cone-step`, `eq:ope-triangle-numbers` | `YM.OPE.Columns.step_expand` (`YM/OPE/Columns/Cone.lean:124`) | Hypothesis `μ(x v) ≤ s μ(P(x v))` and conclusion `μ(y v) ≤ s₀ μ(P(y v)) ∧ L^{d-e} μ(P(x v)) ≤ s μ(P(y v))`. Uses `64K² ≤ s` (`room`), `s ≤ L` (`column_small`), and `2K·barunit·(1+s) ≤ 1` (`ε_small`), with the error bounded by `barunit L · μ(core a)`. This matches the prose (ε = `barunit L`, "nonconstant-coordinate part"). The Lean proof bounds `μ(core a) ≤ (1+s)Y`, the prose `μ(a) ≤ sY`; both suffice |
| `eq:ope-transverse-step` | `YM.OPE.Columns.step_transverse` (`Cone.lean:176`) | `P(x v)=0 ⇒ μ(y v) ≤ s·(L^{d-(e+1)} μ(x v))`, via `barunit ≤ 1` and `K+1 ≤ s`. Matches |
| `eq:ope-whole-distance` | `YM.OPE.Columns.whole_origin` (`YM/OPE/Columns/SectorCost.lean:67`) | `‖x‖ ≤ juice k · (a_{ref d}/a_k)^d · quota C d k N p x`; `juice` ↔ `J_k`, `ref d` ↔ `U`, `quota` ↔ `q_k` |
| `eq:ope-physical-distance` | `YM.OPE.Columns.limit_cap` (`SectorCost.lean:46`) | From `quota … (v i) ≤ z` eventually and `v → x` on a filter below `f.fuse`, there is `y` whose projection lies in the range of the physical inclusion (`X.rise`) with `‖x−y‖ ≤ fare C k d e · z`. One finite extraction for `y` only. This matches the "only `y` requires a further extraction" statement used in `prop:ope-match-assembly` |
| `ope-cutoff` rates, `eq:ope-terminal-price` | `YM.OPE.funding` (`YM/OPE/Prices/Circuit.lean:64`) | `Z' = (Σd)c + 4|I|(c−a)` (= τ); `X' = (t+1/16)(a−b) − Z'`; quota `g` with rate `Z' − ta`; price `o` with rate `≤ −X'`; `z = exp(X'T)`; `o = 2·stakes/z`; `g = 2·terminalCost`. `PriceAt C g o t d s J m j` has `J ≤ m`, `ref t ≤ m`, `m+1 ≤ j`, quota at level `m`, and root test centered at level `J`. This confirms the dictionary (J = centered/opening, m = matching, j = insertion) |
| `eq:ope-match-pay-one`, `eq:ope-match-pay-two` | `YM.OPE.terminalAfford` (`Circuit.lean:40`) | First conjunct: `march (fun _ => w) η k m () ≤ δ m · (x/(16·X m))`, i.e. 𝓜 is the η-weight evolution from k to m (R1 definition). Second conjunct: `32(1+C_m)·w·‖alto k d‖·(e/gainChart m k) ≤ τ d k / 2`, which is `eq:reference-match-afford` in cutoff letters. The 𝓜 bound comes from `seeing` with `(a_m/a_k)^{d+1}·fly m/fly k` |
| `eq:ope-terminal-price` (E) | `YM.OPE.terminalCost` (`Circuit.lean:32`) | `4(1+C_i)·(2·(a_{i+1}^d·(bling_i·4/y)))` = `4(1+ζ_m)(2P)` with `P = a_{m+1}^q 𝓑_m 4/X` |
| `eq:reference-bank`, `eq:reference-smallness` | `YM.Work.G09` (`YM/Work/G09.lean`, lines 83–224, `theorem answer`) | Constants `100000·M^6·(1+C)^2 ≤ q`, cone weight `32(1+C)^2`, `4K² ≤ 32(1+C)²`, `2C ≤ 32(1+C)²` appear exactly |

Not re-read in this pass (canonical evidence in `ope-evidence.md`): the
prescription, orbit-averaging, grouping, singleton, local-projection, grid and
estimate declarations. The nine unchanged chapters, which have independent local passes at
their unchanged start hashes (see `validation.md`) keep those records. The changed
chapters need renewed Lean-correspondence review.
