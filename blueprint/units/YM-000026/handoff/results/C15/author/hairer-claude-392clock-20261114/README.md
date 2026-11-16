# Clock-derived witness fields (author note; follow-up to #392)

- Session: `hairer-claude-392clock-20261114` (Claude, on behalf of @hairer).
- Base: stacked on #395 → #393.
- Status: **draft, unreviewed**.

## Output

`lem:ex-lattice-firesky-clock-fields` is appended to `subsec:ex-lattice-firesky-witness`. With the clock of `sec:common-scale-selection`, the monitor exp((log log β̂)²) and the cover size ⌈(log β̂)²⌉, it shows that for all large k and arcs b ≤ b̄:
1. the sets defining ℓ and w are nonempty, so the dilation and depth of (F1) hold;
2. the bracket J(k) − 1 ≤ J(j) holds on [w, k];
3. the plateau (F2) β̂_j ∈ [β̂_k/2, β̂_k] holds on [w, k].

The key inputs are:
- the stage-entry bound log L_{J(m+1)} ≤ s_m/J(m+1) (`eq:common-stage-entries`), which gives s_k ≤ C·2^k and log log β̂_k ≤ log k + C;
- the stage-length recursion A_j − A_{j−1} ≥ 4A_{j−1} + 3;
- the maximality of ℓ and w, which gives k − w = O((log k)²).

**Remaining witness inputs:** (F3) lawful history and (F5) readings. The wheel bound is immediate, since the clock factor of stage j is the block length L_j ≥ 3 (`RG/History.lean:99`, `sameFactor`). (F4) is replaced by `prop:rank-root-output-ticket`.

## Correspondence

- In the source, these are fields of `AllowedSky` (`dilation`, `depth`, `bracket`) and `CorridorSky.court`. The source produces them in `Order/Sofa.lean` (`office`: `hN.covers`, `hN.warm`) from the clock schedule `Paid W`.
- The manuscript proof here is an independent derivation from the explicit clock of `sec:common-scale-selection`. It was not matched against `Sofa.lean` line by line.

## Checks actually run

- `latexmk -g … existence.tex`: exit 0, 1043 pages, 0 undefined references. pp. 888–889 inspected.
- `python3 scripts/check_blueprint.py`: see the PR.

## Erratum after review #426

The producer of the clock fields in the source is in `Order/Graph.lean`. `Soft.office` in `Order/Sofa.lean` consumes `ShelterSky`; it does not produce it (review #426, L15). The root-depth repair `f1fbe95d` was certified independently in #426.
