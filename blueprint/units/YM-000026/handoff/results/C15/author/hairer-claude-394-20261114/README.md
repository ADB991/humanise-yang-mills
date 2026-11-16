# #394: chamber interiority (G4) at the root depth (author note)

- Session: `hairer-claude-394-20261114` (Claude, on behalf of @hairer).
- Claim: https://github.com/hairer/humanise-yang-mills/issues/394#issuecomment-6879601017
- Base: stacked on #393 (`claude/issue-392-hairer` @ `67de733`).
- Pin: `3456e5e`.
- Status: **draft, unreviewed**.

## Output

`lem:ex-lattice-firesky-chamber` is appended to `subsec:ex-lattice-firesky-witness` (`trace-firesky-gallery.tex`), with the condition `eq:ex-lattice-firesky-chamber-mesh` a_N(Z_d + 2) < 3a_w/8. The lemma shows that for a fit configuration every stencil link of the insertions at z_c is strictly inside the home chamber of the depth-w centered tiling, for all large N, uniformly in p, the labels and the fit point. This is (G4) with w_i = w.

The proof follows the interiority argument of `centered-construction.tex` (odd cell side q = a_w/a_N), together with two bounds:
- |u_α| ≤ a_ℓ/(8a_N) ≤ q/8 (fitness, with w ≤ ℓ);
- q/8 + Z_d + 1 < (q−1)/2.

## Correspondence

`Next.Rank.Station.FitSky.stencils` (`Prom/Hill/Coordinates.lean:150`) is built from three pieces:
- `FitSky.margin`: the site lies in `T.margin 0 (side/8)`, via `spread_costSky` (8|w_j| ≤ q);
- `interiorsSky`: stencil coordinates < side/8, eventually in N, by the same a_N → 0 argument;
- `Extraction.Around.figure`: margin plus stencil give `Interior (T.chamber 0)`.

The consumer is `Verse/Pears.lean` (`h.stencils w.cutoff d`).

## Checks actually run

- `latexmk … existence.tex`: exit 0, 1042 pages, 0 undefined references. p. 888 inspected.
- `python3 scripts/check_blueprint.py`: see the PR.
- No Lean elaboration.
