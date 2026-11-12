# Finite-volume recording and drift

## Status

Draft, awaiting independent mathematical and source review. No Lean files were
changed. Upstream source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`
(`source/upstream.json`).

Owned prose: `manuscript/existence/annulus-recording-yield.tex`.

## Source declarations inspected

- `YM.Stationary.Firm`, `Firm.width_pos`, `Firm.tryout`, `fireworks`,
  `pair_firm`, `royalty`, `mesh_tend`, `Awards`, `profitable`, `profit`:
  `Lean/YM/Next/STATIONARY/Infrastructure/Jets.lean` and
  `Lean/YM/Next/STATIONARY/Loops/Fourier.lean`.
- `YM.Laurent.Vane.issues`, `YM.Laurent.Width`, `market`:
  `Lean/YM/Laurent/Art.lean`, `Lean/YM/Laurent/Eval.lean`,
  `Lean/YM/Laurent/Rune.lean`.
- `YM.Stationary.Recorded`:
  `Lean/YM/Next/STATIONARY/Lift/Pathways.lean`.
- `YM.Stationary.PoleTest`, `rankAux`, `fineMag`, `rank_positive`,
  `grenade_safe`:
  `Lean/YM/Next/STATIONARY/Spectral/AuxReferences.lean`.
- `YM.Stationary.Ticket`, `ring_award`:
  `Lean/YM/Next/STATIONARY/Loops/Syntax.lean` and
  `Lean/YM/Next/STATIONARY/Films/RankColor.lean`.
- `YM.Stationary.gemF`, `massifTabs`, `HouseWord`, `HouseWord.done`,
  `Jar.combine`, `Jar.cast_book`, `Jar.fees.live`, `Jar.sequelQ`,
  `vintageWilson`, `saunter`:
  `Lean/YM/Next/STATIONARY/OneLoop/Lattice.lean`.
- `YM.Stationary.Orion`, `Hstar`, `getReals`, `Looms`, `Rally.coin`,
  `Rally.register`, `Rally.shell`, `astronomy`:
  `Lean/YM/Next/STATIONARY/OneLoop/Bubbles.lean`.
- `YM.Stationary.Fleet.tadControl`, `bubbleControl`, `haloControl`:
  `Lean/YM/Next/STATIONARY/OneLoop/Propagators.lean`.
- `YM.Stationary.polar_clock`, `absoluteGeode`, `costZone`, `Waves1`,
  `Waves2`, `cartWeight`:
  `Lean/YM/Next/STATIONARY/OneLoop/MomentumIntegral.lean`.
- `YM.Stationary.HorizCalc`, `Fluent`, and the exact selected assembly
  `pouring`: `Lean/YM/Next/STATIONARY/Level/Transition.lean`,
  `Lean/YM/Next/STATIONARY/Level/Recurse.lean`, and
  `Lean/YM/Next/STATIONARY/FullPlanned.lean`.

## Expanded proof and exact correspondence

1. **Full mesh, no extraction.** `Firm.tryout` applies `Vane.issues` to a
   strip-bounded periodic entry at width parameter `sigma/4`. The resulting
   `Width` bound is
   `SumBudget(exp((sigma/4)*size(n))*|c_n|, A*(2*(1+sigma/4)/(sigma/4))^4)`.
   On a side-ell grid, character orthogonality gives `shop` as the sum of
   precisely the Laurent modes with frequency in `ell*Z^4`; `stock` is the
   zero mode. Every nonzero such frequency has `size(n)>=ell`, so the
   weighted mass bounds the entire alias tail by
   `royalty(sigma,A)*exp(-sigma*ell/4)`. This proves the estimate for every
   mesh size, not just a selected subsequence. The manuscript spells out the
   4D contour shift, the one-coordinate geometric sum, and character
   orthogonality.
2. **Exact local coefficient identity.** `PoleTest` is `fineMag(input...)`,
   where `fineMag=(1/2) log det(rankAux)-log det(grenade)`. The ticket for
   the combined response gives exact Taylor identities for the rank and
   reference matrices through order two. Their determinants at zero are
   nonzero by `rank_positive` and `grenade_safe`, which use the regulator,
   floor, path bounds, attachment and swornness. The ordinary first and
   second derivative formulas for `log det` produce the direct quadratic
   jet and one ordered product of first jets for the specified ordered pair. `ring_award`, followed by
   `gemF`, yields the source's `Awards` identity: nonconserving two-leg
   entries vanish, and a conserving entry is `ell^4 * shop` of the response
   entry. `profitable` is half of the response zero mode, so its mixed
   second derivative has factor `2!` and equals `stock`; no extra volume
   factor appears. These are finite-volume identities and precede the
   Fourier limit.
3. **Exchange and reality.** At each finite side the pole test is a real scalar function of real site/color variables, so its Hessian is symmetric and real. Fourier transformation gives exchange of the two external legs and conjugation at negative momentum on every allowed grid point. The Fourier-tail estimate gives uniform convergence of the normalized grid pictures to the analytic zero-mode picture. The union of a cofinal full sequence of side grids is dense, so continuity extends both identities to all torus momenta. This is why the half-scaled zero mode is a genuine real symmetric Hessian picture, not merely a formal factorial normalization.
3. **Analytic zero-mode picture.** Averaging the second momentum over
   normalized Haar measure preserves the bound and holomorphy on any
   smaller strip. The output picture is half the internal zero mode, which
   is `Firm(sigma/2,A)`. The coefficient tail is applied at fixed real
   external momentum to the internal momentum variable. This distinction
   is important: it gives both the output strip and the source-accurate
   error `ell^4*royalty(sigma,A)*exp(-sigma*ell/4)`.
4. **All-period assembly.** In `pouring`, the baseline `H` comes from
   `vintageWilson`; it has fees `(k,E)` and exact Wilson matches. For fixed
   target parameters, `saunter` produces uniform `(v,M)` and, for every
   growing side sequence plus admissible `(B,p,R,Lambda)`, a family `T`
   with soft order 3 and binding `intended-Wilson` at each mesh. Set
   `w=min(k,v)` and add the two families, preserving the exact ticket and
   fee `(w,E+M)`. At each requested odd side `L`, put `y=1/L` and
   `s=min(sigma,w,y/128)`. The positivity/floor data give `HouseWord`; its
   `massifTabs` field uses all the tickets, floors at reference and growing
   sides, attachment, metric and swornness. `HouseWord.done` uses the
   regulated interacting and free matrices and a common strip reduction to
   produce the analytic response bounds. `profit` then gives the all-mesh
   recording estimate and `e_j -> 0` for this fixed `L`.
5. **Drift chosen before L.** `astronomy` selects constants `a,b` before
   `L`; its quantifier is over every `Orion` datum, including the
   House--Word constructed at `y=1/L`. The same response then satisfies
   `Waves1(a,y)` and `Waves2(b,y)` for the full centered box and shell.
   `absoluteGeode` splits the box into the inner ball, annulus and exterior.
   The respective errors are bounded by `a*pi^2/2`, `3*pi^2*b`, and
   `a*volume(boundsEarth)`, with the exact pole integral on the annulus.
   Hence `D0=cartWeight*(a*(pi^2/2+volume(boundsEarth))+3*pi^2*b)` is
   independent of `L` and of mesh sequence. The source `pouring` sets the
   minimum odd side to one.

## Remaining producer boundary

This unit proves the Fourier alias-tail estimate and the downstream
finite-recording/drift assembly under the explicitly stated baseline,
response-service, House--Word, and all-record two-wave inputs. It does not
prove the local producer of the two-wave estimates. In particular,
`astronomy` applies `getReals` to `Hstar` and restricted `Orion` populations,
then calls `Rally.register` at scale `|x|+mu` and `Rally.shell` at scale
`|x|` only when `mu<=|x|`. `Rally.register` requires both upper bounds from
`Fleet.tadControl`; `Rally.shell` also requires the whole-lower-face bounds
from `Fleet.bubbleControl` and the lower-minus-halo remainders from
`Fleet.haloControl`. These local `Hstar`/`Orion` to `Fleet` face estimates
remain the local supplier task. The companion Fleet-face chapter now derives the same-bed floor/free identities and vacuum first-variation formula, but still keeps scale-weighted matrix prices and shell-separated halo differences as explicit quantitative inputs. The present theorem does not infer those prices from generic compactness or from the annulus conversion.

## Checks actually run

- Targeted source declarations above were inspected at the pinned upstream
  checkout; no Lean command was run.
- No TeX build was run.
- `python3 scripts/check_blueprint.py` was run; it failed because the
  parent-owned `blueprint/units/YM-000026/unit.json` is absent in this clone.
  No shared metadata has been created.
- `git diff --no-index --check /dev/null FILE` was run on the TeX and
  evidence files after the latest edits and printed no whitespace diagnostics
  (status 1 is due to comparison against `/dev/null`).
- No changes to `Lean/`.
