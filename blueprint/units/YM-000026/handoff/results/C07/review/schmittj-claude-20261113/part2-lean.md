# C07 review, part 2 (reviewer 2 of 3): Lean correspondence

- Scope: `haar-chart`, `normalization-jets`, `compensated-variation` (PR #96), `mean-action-jets`, `remote-action-jets`, `gaussian-differentiation` (PR #96), `gaussian-moment-prices`; the correspondence entries for them in `blueprint/units/YM-000026/correspondence.md` lines 435–505; and C07 `findings.md` (C07-A5, C07-A7), `ledger.md` (lines 13, 83, 87, 97), `HANDOFF.md`.
- Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Statements were read in the source files. Nothing was elaborated: no `lake build`, no axiom replay.
- Outcome: every declaration I opened exists under the cited name and path (after resolving the namespace abbreviations used in the records), and its statement supports the English as used. The two PR #96 repairs are correctly anchored. No correspondence error found. One record inaccuracy and one strength difference are noted.

## Findings

### L1. INACCURACY (minor), manuscript, made load-bearing by PR #96: the group-only quantifier in `Canary.right` is dropped

- `compensated-variation.tex` lines 27–29 vs `YM.ConnectedActivityE6.Blaze.Eider.Canary.right` (`Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Eider.lean` lines 32–38). Lean: `right : ∀ x:G.Color, ‖x‖ ≤ d → ∀ g:G.El, ‖G.mat g - 1‖ ≤ A → G.lieExp (G.plog (G.mat (G.lieExp x * g))) = G.lieExp x * g`. The manuscript omits `g : G.El`. With the colour-valued $\operatorname{Log}_*$, the identity is false for non-group arguments. Same item as mathematics F2. `Canary.around` (ambient $p$, smoothness) and `Canary.closed` are rendered correctly. Requested change: add "$g\in G$".

### L2. INACCURACY, manuscript, introduced by PR #96: the step corresponding to `YM.Gauge.isolates` is not acknowledged

- `compensated-variation.tex` lines 17–19 vs `YM.Gauge.plog_right` (`Lean/YM/Gauge/Chart.lean` lines 164–175). The Lean proof needs `YM.Gauge.isolates` (line 71: for normal vectors $x$ near $0$, $\exp x\in G\Rightarrow x=0$), which is proved with a sequence/one-parameter-subgroup argument (file docstring lines 4–13). The manuscript's "write the element as $\exp(u)$" assumes this. The English is correct but omits this main step of the Lean proof. Requested change: as mathematics F3.

### L3. Strength difference (not an error), records: the haar chart is stronger than its Lean anchor

- `YM.Precision.LocalRatio` (`Lean/YM/PCalc/Loop.lean` lines 28–38) asserts the existence of an analytic positive $J$ with $J(0)=1$, a positive scale and the pushforward identity `actual`. The manuscript constructs $J$ explicitly as $\det H$ and normalizes by $c_{\rm chart}=h(U)/\nu(G)$. This is consistent and stronger. `YM.LocalH.actual : ∃ X : ChartRatio G, LocalRatio X` (`Lean/YM/LocalH/Haar.lean` line 97) is existential. The record (`correspondence.md` line 437) could say that the explicit formula is the manuscript's own construction.

### L4. NIT, records: the haar scale attribution

- The Lean scale is `YM.ConnectedActivityE6.Coat.t := Pressure.fiery G X.x S.patch.L` (`Coat.lean` line 61), with `fiery = temp ∘ betaF` and `temp h = (√h)⁻¹·exp((log log h)²)` (`Lean/YM/Pressure/Seeds.lean` lines 23–26), i.e. $P(h)/\sqrt h$ with $h=x+c_L$. This is $\tau$ of `eq:warning-scales`, not its $t$. `YM.ConnectedActivityE6.Blaze.inverse_mist` (cited in the records as `Hallmark.inverse_mist`, i.e. by file name) `: Rate G L (1/2) (fun x => (fiery G x L)⁻¹)` matches the manuscript's "reciprocal has upper exponent $1/2$". Record and manuscript should say $\tau$ (mathematics F4).

## PR #96 repairs: verification

- C07-A5 (colour-valued ambient logarithm). Verified. `YM.Gauge.plog X = (coord.symm X).1`, where `coord` is the local inverse of `splitNormal (a,n) = mat(lieExp a) * exp n` on `Color × Normal`, with `Normal = G.lieᗮ` (Frobenius real inner product, `frobInner`). Its derivative at $0$ is `addNormal (a,n) = colorMat a + n` (`splitDeriv`). `plog_diff`: analytic at $1$. `plog_left`: $\operatorname{plog}(\exp a)=a$ near $0$. `plog_right`: inverse on group elements near $1$. `Blaze.Eider.plume G χ d p a = χ.innerShare d ‖a‖ • (plog (mat(lieExp a) * p) − a)`, `fleece = a + plume`. Both have the same shape as the manuscript's $\psi$ and $F_M$, with $M=p$ on the right. `Chi.innerShare d r = χ((r/d)^2)` (`Lean/YM/Push/SECTOR_MEASURE/Profile.lean` line 106), with `chosen_lt` (nonzero ⇒ $r<2d$) and `to_one`: the cutoff matches. `Eider.weave : ∃ d A, Canary G d A` holds independently of χ: the order of constants matches. `Eider.sheen` (smooth in $(M,a)$ for $\|M-1\|\le A$), `retreats`, `cooler`, `nothing` and `limn` (`∀ᶠ M in 𝓝 1, ∀ x, ‖plume M x‖ < d/2 ∧ ‖fderiv plume M x‖ < 1/2`) match `eq:compensator-small`. `Eider.sustaining` (with `g : G.El`) matches `eq:compensator-exact`. `Eider.vies` (`Pommel.lean` line 100: bijective, $\|\psi\|<d/2$, positive determinant `palm`) matches lines 46–70. `Eider.thorax` and `Eider.cozies` (`Pommel.lean` lines 109–140: given `M x = 1` and `Brush j (royalty G) (V s) M x`, the conclusion `Brush j (S s) 1` for plume with `Rate (-1/2) S`, and `Brush j 1 (Z s)` for palm with `Rate 0 Z`) match `eq:compensator-jets` and the order "constants before threshold". The manuscript says $D$ has upper exponent zero, which matches the weakened `Rate 0`.
- C07-A7 (stock extension). Verified for the sentences in my chapters. `YM.ConnectedActivityE6.Coat.existSeeds A O := A.place ⊆ X.seeds.place ∧ ∀ i ∈ A.dome (O*X.B), i ∈ A.flags ↔ i ∈ RG.flags (temp X.x) X.V` (`Steam.lean` line 27). `Blaze.Polar.stock` (`Polar.lean` line 78) uses `A.place ⊆ X.seeds.place ∧ A.flags = ∅` and `U := X.input u`. `Blaze.Polar.sectorPass` (line 118, under `Room`, `X.manifest`, `500 ≤ l` and `Healthy (temp X.x) (A.dome (l*X.B)) X.V`) proves `X.Pack R Ñ k W a A u = stock …` together with the log identities. The proof shows `existSeeds A 300 ↔ A.place ⊆ X.seeds.place ∧ A.flags = ∅` from health. The `gaussian-differentiation` lines 161–165 statement "its value at the base field equals the physical packet" matches exactly (a value identity at the base sector field `X.V`). The indicator depends only on `A` and `X.seeds`.

## Ledger and cross-package edges touching these chapters

- `ledger.md` line 97 (compensated variation produces a bondwise diffeomorphism with positive product Jacobian; held fine field; no global smallness). Consistent with the manuscript and with `Blaze.Flux.across` (`Plise.lean` line 74: `Bijective (pitch P X d β V)` under `Canary` and `Drivable`) and `Blaze.Flux.almanac`/`jac_pos`/`gyre` (`Jac.lean` lines 34–44). I read the `across`/`almanac` statements only, not their proofs. The C08 consumer match is listed as open in the ledger, and I did not check it.
- `ledger.md` line 83 (normalization $m=c_H(\sqrt{2\pi}\beta^{-1/2})^q$). Matches `measure_g Ñ β = Ñ.scale*(√(2π)*gStep β)^card ColorIndex` (`Steam.lean` line 25) with $c_H=$ `Ñ.scale` $=c_{\rm chart}$. The C08 side was not checked.
- `ledger.md` line 87 (inputs of `mean-action-jets`, including $0<\beta\le2\beta_F$). The manuscript states $0<\beta\le2h$ (line 235), which is consistent. I did not open `Blaze.Shadow.transfers`, `Blaze.Frond.*`, `Blaze.Gate.certifiedBranch` or `Blaze.vines`.
- Interpolation lemma shared by `mean-action-jets` and `remote-action-jets`: `Blaze.ascend` (`Interpolate.lean` line 144: `3 ≤ k`, `0<d≤1`, `3d ≤ B`, `Brush k v 1 f` on `closedBall 0 B`, `‖f‖ ≤ u` on `closedBall 0 (3d)`; conclusion `Brush k (paidHull d B u v) d⁻¹ f x`) and `paidHull` (line 142). The constants $W=1000(u/d^2+vB)$, $Y=1000u/d+3WB$ and $H=u+YB+Yd+Wd^2+vd^3$ are exactly the manuscript's `eq:action-interpolation`. `Blaze.recover_price` (line 172: `Rate a u'` with `-3/2 ≤ a`, `Rate (-1/2)` for $d,B$, `Rate 0` for $v$, `Rate (1/2)` for $d^{-1}$; conclusion `Rate a` for `paidHull`) matches the exponent bookkeeping in both chapters.
- `normalization-jets` transported row. `Blaze.Gate.kernelGrowth B G v = 4B(v·royalty G) + (v+v) + 4B(v·royalty G)` (`Rainbowline.lean` line 26) with `royalty G = √repDim` (`Impasto.lean` line 70) is exactly $z=8BR_Gv+2v$. `Blaze.Gate.whirl` gives the replica displacement amplitude $R_G^2$ and scale $v+v$, which justifies "replica adjoint ... derivative scale $2v$" with fixed amplitude. `Blaze.Gate.plates` (`Castro.lean` line 31) gives the precision envelope `(f*f+1, u+u)`, matching $f=C_\gamma^2+1$, $v_A=2z$. `Blaze.Gate.jet_growth` preserves `Rate`. `Blaze.Mode` (`Tint.lean` line 21: `atLink : ∀ i, Brush k (royalty G) d (G.mat (U j i))`) matches the link premise $\|D^rU_e\|_F\le R_Gv^r$.
- `gaussian-differentiation` envelope: `Blaze.Flux.protect` (`Afresh.lean` line 24: integrability of $e^{-b\|z\|^2}/\text{lens}_0$ against `sweep A`), `Blaze.Flux.squarePulse` (line 40: entry perturbation $\le t/(2(1+|\iota|))$ preserves `Bottom` at $t/2$) and `Blaze.Flux.winglet` (line 73: integrable measurable $M$, eventually in $y$, `Brush j (M (Z a)) 1` for `lens₀ (A y) (V a y) / lens₀ (A x) (Z a)`, with internal constants $X=t/8$, $D=(t/4)B^2$). These match lines 104–158, with Lean's `A` being the manuscript's covariance $C$ and `Bottom (A x)⁻¹ t` being $C_0^{-1}\ge\lambda$. `Blaze.Meristem.slopes`/`legs`/`points` (`Orin.lean` lines 22–62: measurability of derivatives from difference quotients, and the integral derivative identity under an integrable `Brush` envelope) match lines 240–258. I read the statements only.
- `gaussian-moment-prices`: `Blaze.Flux.facescale I w = 1 + |I| + |lensS I G| + Σ|w_i|` and `expenses` (`Brushhold.lean` lines 43–45) match $F_I$ and the domination $1,n,N,|z_i|\le F_I$. `Blaze.Flux.meager` (line 74: `Brush j ((gStep β)⁻¹*(p+(b+b)) + facescale I w) 1` for the transformed coordinate, with `gStep β = β^{-1/2}`) matches the coordinate bound $\sqrt\beta\{u+2m\}+F_I(z)$.
- `haar-chart` doubled cutoff: `YM.ConnectedActivityE6.Coat.cone a u i = X.χ.innerShare (a*X.t) ‖u i‖` and `Coat.gentry Ñ a U i = X.cone (2*a) U i * log (Ñ.J (U i))` (`Caps.lean` lines 23, 29) match $\gamma_a$ and $j_i$. I read the `Coat.doorway` statement head only.

## Declarations opened

| Fully qualified name | Path | Matched |
|---|---|---|
| `YM.Gauge.Normal`, `YM.Gauge.addNormal`, `YM.Gauge.splitNormal`, `YM.Gauge.splitDeriv` | `Lean/YM/Gauge/Chart.lean` | yes (normal chart of PR #96 text) |
| `YM.Gauge.plog`, `YM.Gauge.plog_one`, `YM.Gauge.plog_diff`, `YM.Gauge.plog_left`, `YM.Gauge.plog_right` | `Lean/YM/Gauge/Chart.lean` | yes; `plog_right` uses `isolates` (L2) |
| `YM.Gauge.isolates` (statement) | `Lean/YM/Gauge/Chart.lean` | used implicitly by the manuscript (L2) |
| `YM.ConnectedActivityE6.Blaze.Eider.plume`, `.fleece` | `Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Eider.lean` | yes |
| `YM.ConnectedActivityE6.Blaze.Eider.Canary` (fields `warm side closed right around`) | same | yes, except that the `g : G.El` quantifier in `right` is omitted (L1) |
| `YM.ConnectedActivityE6.Blaze.Eider.weave`, `.cooler`, `.nothing`, `.nothing_f`, `.sustaining`, `.sheen`, `.retreats`, `.limn` | same | yes |
| `YM.ConnectedActivityE6.Blaze.Eider.vies`, `.thorax`, `.cozies` (`palm`, `pax`, `above` by name) | `.../Pommel.lean` | yes |
| `YM.Push.SectorMeasure.Chi.innerShare`, `.chosen_lt` (namespace as in file) | `Lean/YM/Push/SECTOR_MEASURE/Profile.lean` | yes (cutoff convention) |
| `YM.ConnectedActivityE6.Blaze.Polar.stock`, `.plumeLog`, `.sectorPass` | `.../Polar.lean` | yes |
| `YM.ConnectedActivityE6.Coat.existSeeds`, `YM.ConnectedActivityE6.Coat.measure_g` | `.../Steam.lean` | yes |
| `YM.ConnectedActivityE6.Blaze.Flux.across` (statement), `.almanac`, `.jac_pos`, `.gyre` (statements) | `.../Plise.lean`, `.../Jac.lean` | yes (statement level) |
| `YM.ConnectedActivityE6.Blaze.Flux.protect`, `.squarePulse`, `.winglet` | `.../Afresh.lean` | yes |
| `YM.ConnectedActivityE6.Blaze.Meristem.slopes`, `.legs`, `.points` (statements) | `.../Orin.lean` | yes (statement level) |
| `YM.ConnectedActivityE6.Blaze.Flux.facescale`, `.expenses`, `.meager` | `.../Brushhold.lean` | yes |
| `YM.ConnectedActivityE6.Blaze.paidHull`, `.ascend`, `.recover_price` | `.../Interpolate.lean` | yes, constants identical |
| `YM.ConnectedActivityE6.Blaze.Gate.kernelGrowth`, `.whirl` | `.../Rainbowline.lean` | yes |
| `YM.ConnectedActivityE6.Blaze.Gate.replicaM`, `.plates`, `.jet_growth` | `.../Castro.lean` | yes |
| `YM.ConnectedActivityE6.Blaze.Mode`, `YM.ConnectedActivityE6.Blaze.royalty` | `.../Tint.lean`, `.../Impasto.lean` | yes |
| `YM.ConnectedActivityE6.Blaze.inverse_mist` (statement; the records write `Hallmark.inverse_mist`, but the file `Hallmark.lean` has no `Hallmark` namespace) | `.../Hallmark.lean` | yes |
| `YM.ConnectedActivityE6.Coat.cone`, `.gentry`, `.doorway` (head) | `.../Caps.lean` | yes |
| `YM.ConnectedActivityE6.Coat.t` | `.../Coat.lean` | yes; it is $\tau$ (L4) |
| `YM.Pressure.temp`, `YM.Pressure.betaF`, `YM.Pressure.fiery` | `Lean/YM/Pressure/Seeds.lean` | yes |
| `YM.Precision.ChartRatio`, `YM.Precision.LocalRatio` | `Lean/YM/PCalc/Loop.lean` | yes (manuscript stronger, L3) |
| `YM.LocalH.actual` (statement) | `Lean/YM/LocalH/Haar.lean` | yes |

## Not checked

- I did not open the proofs of the declarations above, beyond `plog_right`, `weave`, `sustaining`, `limn`, `vies`, `thorax`, `cozies` (beginning), `sectorPass`, `winglet` (beginning), `ascend` (head) and `whirl`.
- Declarations cited in `correspondence.md` for these chapters that I did not open: `Blaze.Silica.*`, `Blaze.Flux.stereo/chore/pitch/has_chore`, `Blaze.Vine.*` (strain, bar, leanB, well, voltage, worldZ, luster, mistropy, joyful, plotsB, glacier*), `Blaze.Scroll.canopy/frameCost`, `Tint.fromLogL/expCost`, `Blaze.Shadow.transfers`, `Blaze.Frond.*`, `Blaze.Gate.beam/certifiedBranch/base_ray`, `Blaze.vines/shiver`, `Blaze.measures/enCanvas/wild/hearthLift/cabinet/centralSum`, `Blaze.Silica.Clutch.*`, the Rewards/Dye/Tablet/Terminal/Arcade/Gust/Impasto (other than `royalty`)/Engrave/Arcus/Osmote/StreamsA files, the Levan/Pendant/Mesoglea/Tropolis/Duster/Thistle/Paisley/Ether/Pinene/Fairum/Ambit/Glass/Mercury files (`Mercury.lean` names only), Lagoon/Outer/Erosion/Lakeside/Serene/Periscope/Plover/Clods/Palmate, Spheres/Cirrus/LogosG/Splay/March/Lambent, `YM.LocalH.Chart` and the `YM.LocalH.actual` proof.
- No Lean elaboration or axiom check was run.
