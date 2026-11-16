# #376: transport of the marked density to the output torus (author note)

- Session: `hairer-claude-376-20261114` (Claude, on behalf of @hairer).
- Claim: https://github.com/hairer/humanise-yang-mills/issues/376#issuecomment-6879350077
- Base: stacked on #387 (`claude/issue-375-hairer` @ `cd807af`), over `codex/existence-monograph` @ `3166276`.
- Pin: `3456e5e`.
- Status: **draft, unreviewed**. It needs an independent review by an account other than `hairer`.

## Output

New `subsec:allarity-output-transport`, appended at the end of `manuscript/existence/allarity-marked-propagation.tex`. It contains:
- **The invoice** 𝓘 = exp_*(−D)(1+f₀z₀)(1+f₁z₁), where exp_* D is the reference moment polynomial, so D = j₀z₀ + j₁z₁ + κz₀z₁.
- **`lem:allarity-invoice-parts`:** 𝓘_s = Φ_s, by direct expansion. This closes the identification left open (N-item) in review #383 at the manuscript level.
- **Cells and sites:** the cells of the depth-w centered tiling are indexed by the level-w sites, so q₀ = the output site count.
- **`lem:allarity-lower-propagation`:** the iteration z ↦ αz + H^{1/2}z² of the lower mixed-compiler calculation on [w, ℓ). Under the count (α+1)^{ℓ−w} ≤ H^{q−3/2} (`eq:allarity-lower-count`), prices stay ≤ H^{−1/2} ≤ 1. A sufficient condition is given via the cover size c_k and the block-length floor.
- **`prop:allarity-output-price`:** the coefficient price a^{q₀|s|} with X ≤ 1+n ≤ 1+M at the output, then the root bound 𝓜_k^{−1/(16M)} via `prop:rank-root-output-ticket` (#386).
- **Status list of five inputs:**
  1. the leading-interval inputs (#387);
  2. the plateau on [w, ℓ];
  3. the admissible forced inputs of the lower rungs (needs a lower bound on the attenuations ω_j);
  4. the lower count, via c_k against H;
  5. the lawful representation at w.

## Source correspondence (textual, at the pin)

| Manuscript | Source |
|---|---|
| invoice, its parts | `Ship.invoiceSky B t hx N p = Read.cylinder (targetsSky …) (clients …)` (`Prom/Hill/Allowance.lean:40`). `Read.cylinder D a x = Poly.pass (−D) * bareP a x` (`Next/RANK/Finite.lean:99`). `Poly.pass` is the truncated exp_* (`Marker/Truncated.lean:29`). `cumulants` satisfies `Expands D (maxProfile …)`, i.e. D has zero quiet part and exp_* D = the profile (`Finite.lean:226`, `Exponential.lean:126`). `parts_word`: (bareP a x).part T = ∏_{i∈T} a_i x |
| cells = sites | in `couponSky`, `Fintype.card T.Cell = Z` by `rfl`, with T = `yardSky` (`Port/Soft/Denarii.lean`) |
| lower step | `ExhibitsSky` (`Prom/Hill/Stepped.lean:29`): Notice at j+1 with (z, z·w(u)) ⇒ Notice at j with (q.α·z + bill(1/2,s)·z², gas(u)), where bill(1/2,s) = H^{1/2} |
| output estimate (L = ℓ = 1) | `v_conditionedSky … : estimateSky (P widthSky) … e 1 1 (allowance m k)` (`Port/Soft/Supra.lean:29`). Its hypotheses: `Path_Sky` (Novice at every level of [w, k]), `Tally`, `assured` plateau (`ChargeSky.assured`: β̂_u ∈ [β̂_k/2, β̂_k] on [w, ℓ]), `InstanceSky` |
| lawful output | `Ferm` = `c.Uses` and `∃ … Station.Meets … ∧ Tissue …` (`AFTERNOON…/Soft/Coupons.lean`); `NylonSky.use_ widthSky` → `.chand` |
| final bound | `Soft.couponSky` with `estimateSky … e c d`, c = d = 1: X = d + n·c ≤ 1+M |

## Uncertainties

- The source chooses the lower sequence via `spouse s q (ℓ−j)`. I did not match it against the manuscript's (α+1)^t bound, nor its forced bookkeeping z·w(u) against item 3.
- I took the "cover size" c_k and the definition of w as `widthSky` = gain at coverSize^{10} from the source (#374 §2). The manuscript does not define them.

## Checks actually run

- `latexmk -pdf -interaction=nonstopmode -halt-on-error existence.tex` (on top of #387): exit 0, 1046 pages, 0 undefined references. pp. 793–795 inspected.
- `python3 scripts/check_blueprint.py`: see the PR.
- No Lean elaboration.

## Errata after review #409 (session hairer-claude-409resp-20261114)

- `Path_Sky` quantifies over [w, ℓ], not [w, k].
- `Ferm` supplies `Tissue` (lawfulness after removing the additive remainder, plus value control of that remainder), not full `Rep.Lawful` of the genuine representation.
- `prop:allarity-output-price` now takes its middle-level input from `prop:allarity-launch` (total regular budget H^{−3/4}, source `Peak.Meter`/`launchedSky`). It states the root conclusion for u = M.
