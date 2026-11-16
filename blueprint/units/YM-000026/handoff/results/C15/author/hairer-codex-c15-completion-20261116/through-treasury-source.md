# Lean source audit: finite-height `Dart`/`Viz` supplier

Audited source files match `Lean/SOURCES.sha256`; this audit asserts the manifest hashes, not that local `HEAD` equals any imported pin.

## Exact output and quantifiers

`YM/TraceExtension/Perfect/Pallas.lean`, `treasury`, constructs for all sufficiently large fixed level `k`, every `ε>0`, and filters `F` with `N→∞` and level-side sizes tending to infinity, eventually in `w` a dart `K` with

`Viz K Z.clip Z.path (east (hatBeta k)) (fun i => reed (hatBeta k) i + 1) (fun _ => ε) ε`,

where `Z=(Issue.trail B).rep (N w) (p w) k`. The level `k` is first chosen beyond the `Vigil` threshold. The event in `w` is eventual for this fixed k and ε; it is not a simultaneous all-k event. `Zn/Setup.lean` defines `Sight x R Q` as precisely `Viz Q R.clip R.path (Perfect.east x) (fun _=>trophy x) (fun _=>shock x) (shock x) ∧ Q.March`. So treasury supplies the requested Viz part if the manuscript’s trophy/shock allowances dominate the displayed budgets; March is the Dart transition invariant.

## Construction, not a theorem-name appeal

`Perfect/Liturgy.lean`: `Vigil a := ∀ᶠ m, Nonempty (Ember a m)`. `Ember a m` is `Eon` for profile `a.params (m+1)`, patch `a.clock.op m 0`, current coupling `hatBeta m`, next coupling `hatBeta (m+1)`. `Perfect/Eon.lean`’s `post_phase` builds such Eons from actual `Carrier.priced`, `early_to`, `post_to`, `bank_buys`, and `stem_ready`; its `Vigil`-producing `vroom` binds the Eon profile/kernel/patch and coupling increment to the paid chosen schedule. Thus the producer uses the history’s actual selected paid data, not an independently rebuilt interacting family.

`Perfect/Pallas.lean` chooses an integer `i` such that `vista (i+1) β n < ε` for `n=2,3,4`, using `vista r β n=2^{-r}(log β)^n` and geometric decay. It restricts the filter to the cofinal subtype `U={w | k+(i+1)<N w}`; `N→∞` makes that restriction still tend to the original filter. Then it calls `Perfect/Flo.through` at `m=k`, depth `i`, with the same actual Ember at each required stage and same `p(w),N(w)`. `through` is induction on depth. Its base `stanch` constructs a `Dart` by `dawn` from the prescribed clip and the actual path, proves `Sound` via `ivy` from selected support/plan/link/Sworn receipts, then `loom_read`/`rain_read` plus `verdant`/`varsity` give `Saving` at error schedule `vista 0`. `through`’s successor applies `pay_step` to migrate one level down. At each induction step its strict finite-height requirement advances from `m+(n+1)<N` to the adjacent-level requirement; on the `i`-step call this is exactly the chosen `N>k+i+1`.

`Perfect/Native.lean` gives the migration mechanism. `native` packages the actual stationary field selected from `Tree.select` as `Slide` with path `A.B.kin.path N m p`, support/price/size from the chosen alloy, and differentiability from `Work.F03/F02/F04`. `pay_step` defines the coarse dart as `Dart.down` of the fine dart through this actual native slide. `Dart.Sound.balance` checks soundness using the alloy’s gap, classical part, cap and fine soundness. For its error receipts, `paid_native` supplies the adjacent coupling `LotFee` from the Eon status and schedule denominator monotonicity; the Eon’s `Bank` and `PayGrade` feed `save_step`.

## Quantitative error propagation in one `pay_step`

The exact reserve is in `Perfect/Happy.lean`’s `Saving`: `heart` (J profile), `palm` (Y), `plum` (E), `plumQ` (Q), `mint` (twist) have `Ear` costs at grades 2–4. `ox` (J) and `orb` (Y) carry Hessian `Tip` tests at orders 4 and 5; `flag` (E) is order-5 zero test. At a fixed level with coupling β, grade-2 through grade-4 budgets are `reed β(j)=(log β)^j`; E is controlled by the selected error allowance.

The Eon `Bank` inequalities are the actual one-step estimates (write `L=P.L.val`, `S=Tour.allSheaf`):

* `J`: `3 S (2^13 H^2 (W+(d₂+W)/L)) ≤ f₂`;
* `Q`: `3 S 2^13 H² d₂/L ≤ f₂`;
* `elm`: `S 2^13 H² e₂/L ≤ E₂`;
* for `j=3,4`, `tall`: `3 L^5 S ((2H/L²)^j d_j + Σ_{z≠atomic(j)} D^{length(z)} d_{length(z)}) ≤ f_j`;
* `scarf`: same polynomial with `e` bounded by `E_j` (without factor 3).

`Perfect/Atta.lean` proves the matching `wind`, `windY`, `windQ`, `windE`, `windB` conversions using `Tour.boolJ/boolY`, then `Tour.bill` for the finite sheaf. In particular the actual Taylor-majorant for order `j=3,4` is

`L^5 S [(2H/L²)^j X_j + Σ_{z≠atomic(j)} D^{length(z)} X_{length(z)}]`.

The sum is over the finite ordered partitions other than the single atomic block; it is not suppressed. `windB` bounds the descended coefficient by this expression; `Bank.tall/scarf` pay it. Lower orders use the explicit J/Q/E formulas above. The split of twist as base plus trace corrections is paid as three `Q_k/3` pieces. Consequently the migration transforms a `Saving` at the fine level with allowance `vista j (β_fine)` into one at the coarse level with allowance `vista (j+1) (β_coarse)`. Iterating exactly `i+1` transitions is why the final local allowance is `vista(i+1)` and why Pallas can make it `<ε` for the three finite grades.

The analytical origin of Bank is `Perfect/Amaze.lean` `bank_buys`. It sets `sheer(H,L)` by the explicit smallness receipts
`3 S 2^13 H²/L<1/2` and `3 L^5 S (2H/L²)^j<1/2` for j=3,4. It writes `X(x)=reed(x+u)`, `Y(x)=reed x` and uses `moor_log` to show `X_j/Y_j→1`, `C/Y₂→0`. For the non-atomic ordered partitions, each block count has length `<j`; `along_bill` proves `X_length/Y_j→0`, so the finite sum divided by `Y_j` tends to zero. Thus the majorant ratio tends to `L^5 S(2H/L²)^j`, which `sheer` makes <1/6; similarly the J/Q ratios are bounded by the corresponding half-margin. These are the concrete asymptotic estimates behind the Bank, not just its name.

## What the manuscript does and does not bind

`manuscript/existence/common-funded-history.tex` constructs a common selected schedule/path horizon and explains retained identities. `selected-course-binding.tex` says the selected run’s continuation specializes to its own bolt/schedule/transfers/doors. This is the closest manuscript binding, but the passages inspected do not identify a `Vigil`/Ember-style producer or derive the finite-height Viz receipt above. `trace-scribe-producer.tex` expressly calls the paid response/comparison/sensor receipts “producer inputs”; it combines them but does not generate this Dart. `actual-reader-dawn-selection.tex` is a separate selected-history reader covariance argument and is not the Pallas/through local-jet supplier. Thus any manuscript claim that the local finite-height Sight receipt is already supplied must cite another explicit same-history receipt; the Lean source chain alone is not a manuscript proof unless this binding is stated.

## Scope limit

Pallas’ `Viz/Estate/Saving` receipts cover derivative grades only through 4 (with a separate grade-5 Hessian Tip for Y and order-5 zero flag for E). This source does not prove arbitrary fixed derivative order q. Do not infer polynomial cost at q>4 from `treasury`.

## Base seed details (`Flo.stanch`)

The base `Saving` is not an unproved four-jet bound. It is extracted from the chosen `Ember E`’s `Stem` at `β=hatBeta(m+1)`. Unpacking `Stem.master` gives constants `C≥0`, `PayGrade G (east β) C`, and `C≤reed β 2`; `Stem.bell` gives `1≤log β`. Hence for every grade `r=2,3,4`, `C≤reed β r` by monotonicity of powers of `log β`. `PayGrade.J/Y` gives exactly

`cost (landW x) (east β) 4 0 (leaf (ballX (born x a b)) 0 r) ≤ C`

and the same with `bottom (mist x a)`. These are the weighted grade-2/3/4 `Estate` bounds in `Saving.heart`/`palm`. `Ear` is explicitly `(ContDiffAt ω at 0, earns of the cost)`; `earns` permits any positive slack ε after an eventual inequality. The analytic half is `loom_read`/`rain_read`, which prove the scalarized profiles vanish at zero with first derivative zero and are analytic.

The quadratic tests are separate, not part of the PayGrade bound. `verdant` returns `Stoke` with exact target `north(s,t,0,a,b)` at order 4. Its `fill_born` proof writes `coco` as an explicit linear combination of born-pair generators; `stately` says the finitely many fixed translated sites do not wrap once side→∞; `loom_banks` rewrites the Hessian of `ballX` as the Hessian of the underlying input polynomial, which is exactly `NB`; the finite `Pull.credit` identity recombines shifts into the `north` coefficient. `varsity` returns order-5 `Stoke` with target `missY(a)`: `rain_read` supplies the exact Hessian product rule for `bottom(mist)`, `mist_slope` identifies its first derivative, `stately` identifies `ballad`’s gauge component with `capGauge`, and `dot_watch` evaluates the pairing, giving the displayed `missY` expression. Thus the base Tip tolerances are zero in the eventual limiting test (Pallas later spends an arbitrarily small positive ε for cashing).

`dawn` sets `J=born`, `Y=mist`, `E=dust=Σ_b elm_b(born_b)-aroma(p,R)(mist)`, `Q=twist=0`. `ivy` derives `Dart.Sound`: `born_home`/`mist_home` supply local J/Y constraints; `aroma_gone` (from path Bounds, Floor, Attached and Sworn) puts the dust residual in `loom`; `aroma_diff` proves its regularity; born trace and symmetry identities give the hue/tint equations; zero profiles discharge Q/twist. `Pallas.treasury` still returns only `Viz`; apply `Dart.gull` with path Bounds for `Sight`: average all translates by `voteJ`, `singed` proves March by reindexing, `gale` preserves Sound, and `voted`/`voted_tip` retain the finite-grade cost and Hessian-test errors via the normalized finite sum and triangle inequality.
