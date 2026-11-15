# The unweighted principal bound H^A on the leading interval

- **Session:** `hairer-claude-HA-20261114` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/375#issuecomment-6883633594
- **Base:** #414's branch. **Pin:** `3456e5e`.

## Established

`lem:allarity-principal-power`: at every leading rung the prescribed connected polynomials have unweighted marker budget ≤ H^A, with A = D_* + (nz+1) deg Q_n + 1. It is proved from the bounds of `sec:marked-healthy-cumulant-launch`:
- the transported moment norm R = H^{nz+1};
- the partition bound Q_n(R) and the degree D_*;
- evaluation with coordinates ≤ H on the healthy stencil.

The transport count A_{nK}^{k−i} ≤ H follows from the maximality of ℓ and the bracket, with the transport purchase at L_{J(k)−1}.

The input list now asks for that section's hypotheses at every leading rung, in place of the bare H^A bound. Those hypotheses are the calibrated incoming polynomials, the transport purchase, and the healthy-field bounds, which hold uniformly for couplings in [s/2, s].

Source counterpart: `Caff.lit` and `proDue = rentQ·loot·sheen`, where `sheen` is the power-of-H bound (`MergeProof/West/Longbow.lean`).

## Uncertain

The healthy-field construction is written at "the selected middle scale". I use it at every rung on the strength of its stated uniformity for couplings in [s/2, s]. The reviewer should confirm that nothing else in it is specific to the middle level.

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- `python3 scripts/check_blueprint.py`: OK.

## Addendum: per-rung amplitude

`cor:allarity-rung-amplitude`: the masked principal insertion is bounded by H^A everywhere, so τ has upper exponent 0 and `lem:allarity-step-discrepancy` holds with κ_τ = 0 at every leading rung. The per-rung amplitude is no longer a separate input. (U) This identifies the insertion h of `sec:principal-gaussian-comparison` with the masked principal piece.
