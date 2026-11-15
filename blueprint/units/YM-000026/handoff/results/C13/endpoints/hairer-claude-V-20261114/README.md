# The variable-profile one-step interface (input (V); M8 of review #409): audit report

- **Session:** `hairer-claude-V-20261114` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/417#issuecomment-6883547356
- **Base:** `codex/existence-monograph` @ `edd3c4e`. **Pin:** `3456e5e`. All cited Lean files match `Lean/SOURCES.sha256` (`hashes.json`).
- **Status:** report-only and unreviewed. This is a textual reading.

Labels: (Q) quoted; (I) inference; (U) unchecked.

## 1. What `sec:restarted-rank-history` fixes

The section's cost estimate fixes the following before s:
- one block ratio L, a width b and a support exponent a;
- a support reserve t > 0;
- the factor C_{L,a,t} in the footprint price C_{L,a,t}(42B+1)⁴ q_n (l. 147–183).

Its one-step input and output are described through a short list of data:
- the anchored additive cost q, with the support weight M(X) (`eq:restart-anchored`);
- the forced gas with its tests;
- the coupling in the band x/2 ≤ β ≤ 3x;
- the push identity `eq:restart-push`.

The local estimates it calls are the "purchased local bounds", namely the component estimate of `sec:mixed-activity-prices` and the reassembly of `sec:gaussian-reassembly`. They are stage purchases.

(I) Inside the chart window the step at level i uses the block length L_{J(i+1)} of the fine (incoming) stage. The data handed to the next step are the coarse ones. Three things change across a stage boundary:
1. **The block ratio.** It is L_r for steps whose fine level is in stage r, and L_{r−1} below that.
2. **The stage profile of the coarse representation**: clip, row bound, column count and support exponent. These are fixed with each profile; see `common-scale-selection.tex` l. 193–199, where they are listed in λ_j.
3. **The purchased local bounds.** These are thresholds of the stage.

The numerical part of the cost estimate is the decay `eq:restart-decay` and the recurrence `eq:restart-recurrence`. It is uniform once the larger constant and the later threshold are taken, as `prop:rank-trace-chart-window` says. What is not covered is items 2 and 3 across the boundary. The output of a step whose purchases are those of the fine stage must satisfy the input hypotheses of a step whose purchases are those of the coarse stage.

## 2. How the source does it

- **`YM.PhysicalNext.InteractingRank.ShowHoursSky`** (`TraceExtension/Prom/Port/Pleas.lean:20`). For every step i of the window [w, k) it has two fields:
  - `flash i`: `PostsSky … (A.J (i+1)) (A.J i) …`. The purchases are indexed by the **pair** of stages of the fine and coarse levels (`Port/Station.lean:15`). They include `clamp` (the time band for all x, y ∈ [s/2, s] and budget points P, R with radii `walls y`, `walls x`), `wool` (the drift between the two stages' profiles) and `stamp`.
  - `adaptive i`: `Lease (factor (J (i+1))) P Q …` for budget points P (fine: radius `walls y`, support exponent of level i+1) and Q (coarse: `walls x`, support exponent of level i) with P.B ≤ 2Q.B. (Q) `Lease.upper : Towering S P Q (e+1) P.supportExponent` (`AFTERNOON…/Discs.lean:25`). That is, the fine data are taken at the fine support exponent and the output at the coarse one.
- **`warm`** requires the stronger plateau 3s/4 ≤ β̂_i on the window.
- **The support exponents are monotone in the level**: `Calendar.deepExp : Monotone (fun m => (S.params m).supportExponent)` (`RG/History.lean:106`). The fine exponent is therefore at least the coarse one, so the step's loss of exponent goes in the right direction.
- **Purchases over adjacent pairs:** `Soft.office` (`Order/Sofa.lean:53`), with `farSky`/`adjoining`/`allySky` (`Order/Porch.lean`).

## 3. Reduction of (V)

(I) Input (V) follows from:
- **(V1)** a restatement of the one-step construction for a step from a fine level with (L, a_f, B_f) to a coarse level with (a_c, B_c), assuming a_c ≤ a_f, B_f ≤ 2B_c, and local purchases for the pair of profiles. In the current text, a and the purchases belong to a single profile. (I) `sec:mixed-activity-prices` already carries a fine support exponent ν_f for an inserted label and a coarse exponent a + 2ε (l. 100, 189–193), so the component estimate itself appears to allow distinct exponents. (U) I have not checked `sec:gaussian-reassembly` or the clip and row-bound data.
- **(V2)** monotonicity of the stage support exponents (and of any other profile datum that must pass from fine to coarse), or a common bound for the two profiles of a pair. I did not find this stated in `sec:common-scale-selection`. It can be added as a choice of profiles, as in the source (`deepExp`).
- **(V3)** the purchases for each adjacent pair (r, r−1), included in the all-stage payment `eq:common-allstage-payment`. This is finitely many thresholds per stage, so it is a bookkeeping change of the same kind as the one already made for two block ratios.
- **(V4)** the band. The manuscript's joining argument needs only x/2 ≤ β ≤ 3x for x ∈ [s/2, s], which the [s/2, s] plateau gives. The source's stronger 3s/4 plateau is needed only if its supplier is used directly.

(V1) is the substantive item. (V2) and (V3) are choices in the scale selection.

## 4. Recommendation

1. Add (V2) and (V3) to `sec:common-scale-selection` (owner C13/C15 coordinator): monotone support exponents, and purchases for adjacent pairs.
2. Check whether the component and reassembly estimates are stated for distinct fine and coarse budget points. If they are, restate the one-step construction of `sec:restarted-rank-history` for a profile pair; the proof is otherwise unchanged. If they are not, (V1) is the remaining input.

## Checks actually run

- Textual reads of the files listed in `hashes.json`.
- SHA-256 of those files compared with the pin manifest.
- `python3 scripts/check_blueprint.py`.
