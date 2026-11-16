# YM-54 final source-correspondence review

Read-only review of `/tmp/ym54-completion-20261116` at Lean source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (checkout base `076e9841e1489f9a5605be947413ff5f7eab5128`). Scope: final added/changed text in the three manuscript files and the new C13 correspondence ledger. This is a textual source-correspondence review, not a Lean build, LaTeX build, or independent mathematical approval.

Final SHA-256 fingerprints:

- `manuscript/existence/allarity-marked-propagation.tex`: `442477a19d5f5cd9364a6c9977fff92ae6ab853221795f6657b19ccb7c7c9847`
- `manuscript/existence/selected-history-limits.tex`: `13e40ccaa51f8c916d8d3731b61cdeae1abac4aa39952ebc604ab6d2881a8349`
- `manuscript/existence/three-panel-weak-comparison.tex`: `d186ab4136959f08f44d989ddf5b14cf1fa05e43aab39276257a9f0c56ddf376`

## Verdict

The final edits address the source-correspondence qualifications identified in the earlier review. I found no remaining required source-citation or declaration-name corrections. The new `r` / `j=J_{m+1}` auxiliary setup and its room restrictions align with the actual `Larger` hypotheses; the degree-independent principal-power estimate and final scalar reference factor `J` are described consistently with their manuscript constructions. The three-panel text now cites the two adjacent-stage width bounds and rounding at the threshold indices; I did not re-review its independent mathematical derivation.

## Checked correspondence

### Auxiliary service and exact source inputs

The final auxiliary subsection fixes derivative order `r`, writes `j=J_{m+1}`, and restricts the auxiliary coarse side by `c≥2` and fine side `Lc≥100(j+7)L`. The source `YM.Bid.Larger` (defined at `Lean/YM/Bid/Station.lean`) requires branch compatibility, `100*macroR patch ≤ fine side`, and `1 < coarse side`; `Lean/YM/MergeProof/Snow.lean` computes this patch radius as `(j+7)*blockSide`. Thus the stated restrictions supply the numerical “larger” premises for the fixed adjacent step. The manuscript also fixes paths, clips, kernel, block side, and local-ratio chart before taking the auxiliary period, matching the source interfaces.

The source producer chain is accurately described:

- `YM.PhysicalNext.Repeat.Pane.ligatures`, `Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Pane/Laud.lean`, consumes the selected `K.Planned`, local-ratio chart, divisibility schedule, auxiliary `Larger`, and `Paintings.Supply`; it gives service, classical match, positive sights, and the combined finite bound.
- `YM.PhysicalNext.Repeat.Pane.surge`, in `Pane/Spectrum.lean`, combines the auxiliary/scheduled determinant comparison with the retained plan’s finite thermal estimate, and keeps the loop cap and minimum decay rate.
- `YM.Further.PhysicalPeriodLimitF933.Mural.atlas` constructs `Paintings.Supply` via `YM.Push.Uniform.pre_order`. `pre_order` in `Lean/YM/Push/STATIONARY_UNIFORM/Paths.lean` builds its `Before` data from `exp_receipt`, `paint_supply`, `square_pay`, `focus_receipt`, `log_receipt`, and `link_charge`. `Before.receipt` / `Before.full_pack`, followed by `Paintings.Supply.stationed`, yield the uniform graph, scatter, gap, sealed Hessian and inverse on the actual path bounds.
- The manuscript’s proof supplies its own mathematical account of the path derivative decay, uniform chart, graph derivative bounds, finite-fibre trace identity and determinant-Hessian comparison. The exact price correspondence is `Q.allowance` and `min Q.sights (P.c j)`, combined with `M.retains` and the loop factor, as in `Laud.ligatures`.

The earlier concern that `Q` was an unconstructed standalone premise is resolved by `Mural.atlas` / `pre_order`; I do not identify a missing source field in the final text.

### All-mode marked polynomial and scalar factor

The source correspondence ledger correctly treats the opening polynomial as an exposition assembled from the retained finite-menu push and endpoint component construction, not as a conclusion of the Lean middle-launch theorem. The manuscript identifies the terminal polynomial `q_N`, actual Wilson pushes `q_i`, the retained stored doors and service record, terminal-birth identity, and the coefficientwise planted recombination. It then changes weights on the resulting entire `q_k` alphabet, preserving higher ordinary and forced modes, and attaches failed-mask pieces to endpoint flag components. This is an all-mode construction; it does not infer the modes from singleton equalities.

The final application’s correction is also right at the source/correspondence level: it multiplies `q_k` by the scalar reference factor `J=exp_*(-Σ_c D_c^{ref})`, not by the whole invoice, which already includes insertions. `J` is gauge-field independent and commutes through the linear coefficientwise transitions, so the text records the pushed identity `J q_N → J q_k`; the unit empty coefficient preserves the original unmarked density/partition denominator.

The degree-independent exponent claim in `lem:allarity-principal-power` uses the explicit bound `M=H^{o(1)}`: for each fixed Taylor degree `D_*`, `M^{D_*}≤H` eventually, while the displayed exponent `A=n(nz+1)+2` is independent of `D_*`. The later ordering `U`, then `q`, then Taylor order `D`, with transport/covariance constants fixed before the block side, is reflected in the revised application proof and ledger.

### Fully qualified Lean names

`YM.Next.Rank.Peak.Instance` in the correspondence file is correct; it is defined inside `namespace YM.Next.Rank.Peak` in `Lean/YM/Next/RANK/Incoming.lean`. For clarity, all related names qualify as follows:

| Declaration | Fully qualified name | Source |
| --- | --- | --- |
| Middle instance | `YM.Next.Rank.Peak.Instance` | `Lean/YM/Next/RANK/Incoming.lean` |
| Middle warming | `YM.Next.Rank.Peak.warming` | `Lean/YM/Next/RANK/TableGate.lean` |
| Launch | `YM.Next.Rank.Peak.launched` | `Lean/YM/Next/RANK/Memorandum.lean` |
| Lower propagation | `YM.Next.Rank.Perch.covers` | `Lean/YM/Next/RANK/Stepped.lean` |
| Crushed arrangement | `YM.Next.Rank.Tapes.West.x_crushed` | `Lean/YM/MergeProof/West/Equity.lean` |
| Exhibition | `YM.Next.Rank.Tapes.West.turns_X` | same |
| Cumulative supplier | `YM.PhysicalNext.InteractingRank.Soft.v_culminates` | `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Soft/Supra.lean` |

These middle-launch declarations are correctly distinguished from the all-mode terminal polynomial producer.

## Evidence limits

Inspected the named declarations, their containing namespaces and immediate interfaces, the final changed manuscript passages, and the correspondence ledger. No Lean or LaTeX command was run. This review does not certify mathematical validity, whole-project completion, axiom status, or compilation; the project’s independent mathematics review is reported separately.
