# Reflection invariance of the finite Wilson law (issue #304)

Session `hairer-claude-20261113-reflinv`. Comes from M1 of review #303 (#287).
Author draft; independent review by a different account is required.

## Change

Added `prop:ex-lattice-reflection-invariance` and the pullback formula
`eq:ex-lattice-reflection-pullback` to `subsec:ex-lattice-finite-reflection`
of `manuscript/existence/lattice.tex`, before
`prop:ex-lattice-finite-reflection`.

For any side `ℓ`, axis `a`, centre `c` and kind `κ∈{0,1}`, the
reflection pullback `Θ` is a measurable involution. The proposition shows
that `S_ℓ∘Θ=S_ℓ` and that `ρ_ℓ` and `μ_{ℓ,β}` are `Θ`-invariant. The
proof writes out:
- the coordinate permutation with inversion;
- the three plaquette cases. For `a∈{i,j}` the reflected holonomy is
  `U_a(z)^{-1}U_{··}(z)^{-1}U_a(z)`, with `z=rx−e_a`;
- `Re tr V^{-1}=Re tr V` on `U(r_G)`.

A closing sentence identifies the seam reflection `R_{p,a}` of
`prop:ex-centered-planted` as `c=b_a+ℓp_a`, `κ=δ`. This discharges that
proposition's reflection-invariance hypothesis for the Wilson law.

## Source

Textual: the Wilson law and its reflection invariance as used by
`YM.Slice.reflected_positive` and `YM.Wilson.moment_pull` (review #290 O1 notes
that the invariance is `moment_pull`). Not re-elaborated.

## Checks

- The full monograph builds with no undefined references. The only
  overfull boxes are the existing table-of-contents page-number ones.
- The rendered proposition was read in the PDF (page 25).
- `python3 scripts/check_blueprint.py`: OK.
- The C01 `HANDOFF.md` hash for `lattice.tex` was updated.
