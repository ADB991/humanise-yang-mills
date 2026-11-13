# C05 Lean correspondence (author pass)

Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, files under `Lean/` on
`codex/existence-monograph` at `01ef22c`. **Method:** source text only, read with
`sed`/`grep`. No elaboration, no `#print axioms`, and no build: Mathlib sources are
not reachable from this environment. The canonical, broader correspondence for these
chapters remains `../../../ope-evidence.md` and `../../../local-projection-evidence.md`. This
file records only what was re-read in this pass to support the repairs.

| Prose | Declaration (path) | What was checked |
| --- | --- | --- |
| `eq:ope-cone-step`, `eq:ope-triangle-numbers` | `YM.OPE.Columns.step_expand` (`YM/OPE/Columns/Cone.lean:124`) | Hypothesis `μ(x v) ≤ s μ(P(x v))` and conclusion `μ(y v) ≤ s₀ μ(P(y v)) ∧ L^{d-e} μ(P(x v)) ≤ s μ(P(y v))`. Uses `64K² ≤ s` (`room`), `s ≤ L` (`column_small`), and `2K·barunit·(1+s) ≤ 1` (`ε_small`), with the error bounded by `barunit L · μ(core a)`. This matches the prose (ε = `barunit L`, "nonconstant-coordinate part"). The Lean proof bounds `μ(core a) ≤ (1+s)Y`, the prose `μ(a) ≤ sY`; both suffice |
| `eq:ope-transverse-step` | `YM.OPE.Columns.step_transverse` (`Cone.lean:176`) | `P(x v)=0 ⇒ μ(y v) ≤ s·(L^{d-(e+1)} μ(x v))`, via `barunit ≤ 1` and `K+1 ≤ s`. Matches |
| `eq:ope-whole-distance` | `YM.OPE.Columns.whole_origin` (`YM/OPE/Columns/SectorCost.lean:67`) | `‖x‖ ≤ juice k · (a_{ref d}/a_k)^d · quota C d k N p x`; `juice` ↔ `J_k`, `ref d` ↔ `U`, `quota` ↔ `q_k` |
| `eq:ope-physical-distance` | `YM.OPE.Columns.limit_cap` (`SectorCost.lean:46`) | From `quota … (v i) ≤ z` eventually and `v → x` on a filter below `f.fuse`, there is `y` whose projection lies in the range of the physical inclusion (`X.rise`) with `‖x−y‖ ≤ fare C k d e · z`. One finite extraction for `y` only. This matches the "only `y` requires a further extraction" statement used in `prop:ope-match-assembly` |
| `ope-cutoff` rates, `eq:ope-terminal-price` | `YM.OPE.funding` (`YM/OPE/Prices/Circuit.lean:64`) | `Z' = (Σd)c + 4|I|(c−a)` (= τ); `X' = (t+1/16)(a−b) − Z'`; quota `g` with rate `Z' − ta`; price `o` with rate `≤ −X'`; `z = exp(X'T)`; `o = 2·stakes/z`; `g = 2·terminalCost`. `PriceAt C g o t d s J m j` has `J ≤ m`, `ref t ≤ m`, `m+1 ≤ j`, quota at level `m`, and root test centered at level `J`. There is no opening level in `PriceAt`; `funding` evaluates the payment conditions at the opened level `P i` with `opens (k i) (P i)` and price `2*(stakes C (k i) (P i)/z i)`. Dictionary (revision 2): centered depth `J` (root test, cells) = cutoff `k`; opening depth = cutoff `K(k)`; matching depth `m`; insertion `j`. The first version wrongly merged centered and opening |
| `eq:ope-match-pay-one`, `eq:ope-match-pay-two` | `YM.OPE.terminalAfford` (`Circuit.lean:40`) | First conjunct: `march (fun _ => w) η k m () ≤ δ m · (x/(16·X m))`, i.e. 𝓜 is the η-weight evolution from k to m (R1 definition). Second conjunct: `32(1+C_m)·w·‖alto k d‖·(e/gainChart m k) ≤ τ d k / 2`, which is `eq:reference-match-afford` in cutoff letters. The 𝓜 bound comes from `seeing` with `(a_m/a_k)^{d+1}·fly m/fly k` |
| `eq:ope-terminal-price` (E) | `YM.OPE.terminalCost` (`Circuit.lean:32`) | `4(1+C_i)·(2·(a_{i+1}^d·(bling_i·4/y)))` = `4(1+ζ_m)(2P)` with `P = a_{m+1}^q 𝓑_m 4/X` |
| `eq:reference-bank`, `eq:reference-smallness` | `YM.Work.G09.answer` (`YM/Work/G09.lean` line 224), with `YM.Work.G09.cone_cost` (line 183) and `YM.Work.G09.cost_finest` (line 210) | Constants `100000·M^6·(1+C)^2 ≤ q`, cone weight `32(1+C)^2`, `4K² ≤ 32(1+C)²`, `2C ≤ 32(1+C)²` appear exactly |


## Review-response source crosswalk (2026-11-13)

At manuscript basis `daf78a01af59c8d7a8ce429b2bad9b788f3b20b9`, source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (source text inspected; no elaboration):

| Interface | Source declaration and location | Exact correspondence and retained inputs |
| --- | --- | --- |
| Three-depth affordability and centered price | `YM.OPE.funding`, `YM.OPE.terminalAfford`, `Lean/YM/OPE/Prices/Circuit.lean:40,64–75`; `YM.MergeProof.Accent.stakes`, `Lean/YM/MergeProof/Strudel.lean:21`; `YM.MergeProof.alto_norm`, `Lean/YM/MergeProof/Cashew.lean:55` | `funding` chooses opened `P` from centered `k`, applies `terminalAfford` to `P` and matching `m`, and uses `stakes C k P` for the centered root price. Thus the gain, `alto` coefficient norm and allowance are evaluated at `P`, whereas the root test remains at centered `k`. Same run, schedule, matching data and the separate analytic inputs remain required. |
| Opening | `YM.Stock.Tabs.opens`, `Lean/YM/Overlay/Prior.lean:23`; `YM.MergeProof.bequeathed`, `Lean/YM/MergeProof/South/Merman.lean` | With parameter `s=1`, opening means `J≤m` and `coverSize(m)^2≤a_J/a_m`. It is distinct from the matching room hypothesis; neither follows automatically from the other. |
| Local trial | `YM.Push.RelayDifference.unpriced`, `.clothed`, `.RawProtected`, `Lean/YM/Push/RELAY_DIFFERENCE/RawTop.lean:24–36`; `YM.RG.BudgetPoint.Regular`, `.supBounds`, `Lean/YM/RG/Masks.lean:154–167`; `YM.Push.RelayDifference.Slow`, `Lean/YM/Push/RELAY_DIFFERENCE/Rates.lean:40,58–59` | Raw protection includes a fixed stencil containing zero, slow cutoff/period prices, every-origin bounds for the rescaled trial, and `Regular` in addition to `supBounds`. Regularity supplies a full left-increment `ContDiffAt` germ and recursive derivative existence at all healthy configurations, including threshold equality; it does not require those germs on unhealthy configurations. The comparison to labels and the common projections remain inputs. |
| Grouping symmetry (L5) | `YM.MergeProof.Ribbons.Fibers.Permutes`, `.CopyFamily`, `Lean/YM/OPE/Grouping/Family.lean:20–48`; `YM.MergeProof.Ribbons.Fibers.CopyFamily.twines`, `Lean/YM/OPE/Grouping/Care.lean:57–60` | `Permutes` preserves group membership and chosen representatives. `CopyFamily` adds focused family membership and the position, coefficient and transformed-profile conditions; `twines` applies only to a grouped mode supported in the copied family. No claim of an unconditional covariance producer is made. |

Not re-read in the earlier author pass (canonical evidence in `ope-evidence.md`): the
prescription, orbit-averaging, grouping, singleton, local-projection, grid and
estimate declarations. The nine unchanged chapters, which have independent local passes at
their unchanged start hashes (see `validation.md`) keep those records. The changed
chapters need renewed Lean-correspondence review.
