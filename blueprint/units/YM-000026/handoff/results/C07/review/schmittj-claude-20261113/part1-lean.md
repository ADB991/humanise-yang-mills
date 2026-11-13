# C07 review, part 1 (reviewer 1 of 3): Lean correspondence

Source: `Lean/` in worktree `/home/jo314/ym-wt/c07-review` (`e058a61`), the pinned revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464` per `validation.md`. Text inspection only. I ran no Lean elaboration and no axiom queries. Scope: the six chapters `sector-gram`, `local-covariance`, `local-mean`, `warning-safety`, `actual-global-row-prices`, `actual-palette-warning`, the C07 records' claims about them (C07-A1, A2, A3, A4, A6, `actual-gap-correspondence.md`, ledger), and the C13 edges.

Summary: every correspondence claim I tested holds. The PR #96 repair of `prop:actual-global-row-prices` follows `YM.Next.SectorChange.Gap.not_flat` closely: `energy_canonical`, `prices`, `arn` and `LocalJet.sponsorship` map one to one onto the manuscript's energy bound, squared tree inequality, absorption and per-bond gauge, and the manuscript constant $\eta_0$ is the source's `min c k/(4(m+q+1))`. The proposition's statement matches `credit_post`/`kernel_post`, `move_bound` and `source_bound` (hypotheses, quantifier order, conclusions). No finding of a wrong declaration or mismatched type. The findings below are minor.

## Findings, by severity

### L1. INACCURACY (records). Stale evidence and ledger statements. Pre-existing or became stale after a later merge.

(a) `blueprint/units/YM-000026/actual-global-row-prices-evidence.md` still says sector-gram supplies the selected-row coercivity. In the source, the coercivity of `Rows.gram` comes from `Gap.not_flat`, and `Coat.plate` (built from `SliceRows.orientedRow`, a transported "straightened" row) is a different matrix. (b) `actual-palette-warning-evidence.md` claims the parent global unit "has passed independent review"; that is not true at the current hash. It also gives the nonexistent paths `Lean/YM/PhysicalNext/Integration/RG05Preconstruction/{PeriodConstruction,Fares}.lean`. I confirmed that the directory does not exist and that `selectRunWithTreasuryPeriod_preselected_quote_orders_postnumeric_of_prediction` is in `Lean/YM/Integration/NativePreselectedPostnumericPeriodRun.lean` (C07-A3 is correct). (c) `handoff/results/C07/ledger.md` line 43 is stale after C13 commit `bddbedc` (see the mathematics file, F9). Requested: the integrator corrects (a), (b) and the ledger.

### L2. INACCURACY (manuscript). The positive-rate Q price is in the source statement but not in the proposition.

`YM.Next.SectorChange.opaqueCost` (`Chosen.lean`) gives `Pours U (front A F) (front A F) v K` with `0<v`, but `credit`/`kernelPrices` (`Ground.lean`) record only rate-0 prices. `prop:actual-global-row-prices` follows the latter. The C13 handoff needs a positive-rate bound (see the mathematics file, F3). Requested: state $\|Q\|_{\sigma/2}\le L_0^2$, citing `opaqueCost` or the product of `move_bound`.

### L3. NIT. Selector arithmetic exists in the source but not in the text.

`YM.Next.SectorChange.small_span` (span = till x + 5 + predReach ≤ radiusB x/50 eventually) and `guarded` (selected root outside `dome (9b+9b/10)`, stencil endpoints outside `dome (9b+8b/10)`) are the source of the clearance that the manuscript asserts (mathematics file, F1). `Pressure.till x = radiusB x/100000` is the $R$ defined but unused at `actual-global-row-prices.tex` line 16.

## Checks of PR #96 changes against the source

| Manuscript change | Source | Result |
| --- | --- | --- |
| sector-gram: seed store's flag component equals actual flags, other components allowed | `Coat.manifest := X.seeds.flags = RG.flags (temp X.x) X.V` (`Currents.lean`); `Stores.place = costs ∪ aisles ∪ flags` (`Pressure/Seeds.lean`) | Matched (C07-A6 correct) |
| sector-gram: $A^V$ is the transported flat cut row, not the derivative | `Coat.motion` uses `SliceRows.orientedRow = straightened T R (pull s 0 V) (displacement …)` (`Gram.lean`, `Carrier.lean`); `Coat.plate = formᵀ form + sleepy` | Matched |
| sector-gram selection rule (anchor outside 6B) and active rule (10B) | `Coat.selected` = `¬ Inside (X.addr s p) X.seeds (6*X.B)` (`Assignment.lean`); `SectorChange.chill`/`Active` with `dome (10*radiusB x)` (`Shell.lean`) | Matched |
| local-covariance: existential windows between $B$ and $B+2$ | `Coat.frames` (`Windows.lean`): `∃ x∈ends i, ∃ y∈ends j, separation x y ≤ B`; fields `low`, `high` (B+2), `center_end` | Matched |
| local-covariance: all-pairs panels, $R=\lfloor\operatorname{radiusB}/20\rfloor$, inclusions $R-2$, $R$, conservative $\lfloor\operatorname{radiusB}/60\rfloor$ on tail | `SectorChange.points`, `meeting` (∀ y z, `separation y z ≤ radiusB x / 20`), `panels`, `meetings`, `boards` (`h : 120 ≤ radiusB x`, `Bars … (radiusB x / 60)`) (`Chosen.lean`); `radiusB x = ⌈(log x)^2⌉` (`Pressure/Seeds.lean`) | Matched (C07-A1 correct) |
| global: anchors (input at the parent; row at the signed action on its root), stencil selector | `SectorChange.roots`, `shots` (`separation (s.act (roots S i)) (parent e.1) ≤ span`), `curb`, `Rows.keep` (`Stencils.lean`, `Affine.lean`) | Matched |
| global: actual derivatives, recentered predictor, fixed transports, $\lambda$ | `plaquetteJet`, `predictorTurn` (= predict(a)·predict(0)⁻¹), `blockJet`, `Rows.faceKick` (path row via `barrel` at `facade S s V 0`, direct row `√direct •`), `noiseKick`, `slip = |Signed|^{-1/2}` (`Affine.lean`) | Matched |
| global: coercivity proof | `Gap.energy_canonical` (identity channel, direct and block rows, `selected_all`); `Gap.prices` (tree inequality `link_bound` with per-bond gauge from `LocalJet.Sponsored`, `debit_sum`, `buys`); `Gap.arn` (ε=(2n)⁻¹, η=min c k/(4(m+q+1))); `Gap.not_flat` (∃η>0, ∀ᶠx, ∀ S T, `S.patch=P`, `100*(1+radiusB x) ≤ c`, `Pt.Funds`, ∀ A F k V, `A.flags=RG.flags (temp x) V`); `LocalJet.sponsorship` (gauge from `trim (allot P) (remote i)`; `face_comparison`, `Block.block_comparison`) | Matched; English constants $K_f,K_p,H_f,H_p$ are `curlFactor`, `probeFactor`, `fineCap 1`, `sideCap predReach` |
| global: selection does not lose derivatives | `bump_dep`, `skip_bump`, `selected_all` (`Stencils.lean`) | Matched |
| global: proposition conclusions | `credit` (Pours Q,C,N rate 0 K; Q,C PosDef; Gapped Q,C η; Pours (per W Q − Q⁻¹) rate 0 (u·exp(−v·⌊radiusB/60⌋))), `credit_post` (any W with `Bars … (radiusB/60)`), `kernel_post` (`Ground.lean`); `move_bound` (rate width/2, no width hypothesis), `source_bound` (fix `r≥0`, then constant, then ∀ᶠx, …, `0<d ≤ r*fiery`, ∀ q Y i), constant `slip*(C+B*(2r))` (`Source.lean`); `Background.base_post`, `bump_post` (on `Rows.keep` rows) | Matched, including $Z=\lambda(C_b+2rC_a)$; the English omits the chart choice `q` (harmless) |
| global: $N-Q^{-1}=Q^{-1}E$ and windows | `per_approx`, `per_check`, `per`, `clouded` (`Ground.lean`, `Windows.lean`); `per` column $i$ is zero unless `i ∈ W i` (panels contain their centre once $B\ge20$; the PR wording "each containing its own coordinate" in the palette chapter reflects this) | Matched |
| palette: rate zero and positive constant; socket clause | `Pump.Grid.Pupil` fields `floor : 0<vK`, `credit : … Pours (palette … .endpoint) … 0 vK`, `dust : … Toned (2*radiusB x) (toes S i) p.y.2 q → sock = 0` (`Opacity/Acreage.lean`); `Q_endpoint : fog … = palette … .endpoint` (`Images.lean`); `fog = clouded (panels A F) (Rows.gram …)` (`Chosen.lean`) | Matched (C07-A4 correct) |
| palette: response arithmetic | `MarginalMultiplier3b1d.SourceBounds.signal_bound` (`Force.lean`): mean bound K(LB), direct row L(K(LB))+B, auxiliary (coupling β)⁻¹·K·u·rate(−v)(radiusB/60)·LB | Matched exactly with the manuscript bounds |
| warning-safety choice order (unchanged chapter, ledger claim) | `Coat.scopes` (τ=√direct/32, L > A/τ, W > (2/√penalty)(A+τ)) (`Peak.lean`) | Matched |
| sector-gram floor $\kappa=\min\{\lambda^2/a_*,1\}$ (unchanged argument) | `Coat.energized`: `k := min (scale^2/a) 1` (`Coercion.lean`); used in `Coat.shoots` → `Rotator` (`Shutter.lean`) | Matched in form; internal proof of `raised` not opened |

## C13 edge checks

`actual-local-compiler-handoff.tex` lines 54-66 use the curved `Rows.gram` completed by the identity, with gap and screened covariance from `prop:actual-global-row-prices`. This matches `kernelPrices`, and `kernelPrices.margins` specializes to `O=∅`, `V=1` exactly as the handoff's lines 270-277 do. The positive-rate input of lines 67-80 needs L2. `actual-reader-small-window-bridge.tex` uses the algebraic identity \eqref{eq:mean-error-identity} as stated, and its radius $p=\lfloor(B+80)/20\rfloor$ is `LocalGaussianLaws.Remote.boxCharge`. That is an outer containment radius consistent with `meeting` (per its evidence file; I did not open `ChipHeal.lean`).

## Declarations opened

| Fully qualified name | Path | Matched |
| --- | --- | --- |
| `YM.Pressure.radiusB`, `YM.Pressure.temp`, `YM.Pressure.fiery`, `YM.Pressure.till` | `Lean/YM/Pressure/Seeds.lean` | yes |
| `YM.Pressure.Stores`, `.place`, `.dome` | `Lean/YM/Pressure/Seeds.lean` | yes |
| `YM.Next.SectorChange.points`, `meeting`, `panels`, `meetings`, `boards`, `meeting_comm`, `fog`, `meanLog`, `fog_zero`, `opaqueCost` | `Lean/YM/SectorNext/GAUSSIAN_SECTOR_CHANGE/Chosen.lean` | yes |
| `YM.Next.SectorChange.span`, `roots`, `shots`, `bump_dep`, `skip_bump`, `selected_all`, `small_span`, `guarded` | `.../GAUSSIAN_SECTOR_CHANGE/Stencils.lean` | yes |
| `YM.Next.SectorChange.curb`, `facade`, `plaquetteJet`, `predictGroup`, `predictorTurn`, `blockJet`, `barrel`, `Rows.faceFixed`, `noiseFixed`, `faceKick`, `noiseKick`, `bump`, `base`, `keep`, `slip`, `restrict`, `selected`, `fresh`, `input` | `.../GAUSSIAN_SECTOR_CHANGE/Affine.lean` | yes |
| `YM.Next.SectorChange.Gap.energy_canonical`, `prices` (private), `arn` (private), `armed` (private), `not_flat`, `stood`, `solvent` | `.../GAUSSIAN_SECTOR_CHANGE/Gap.lean` | yes |
| `YM.Next.SectorChange.LocalJet.trim`, `allot`, `permit`, `Sponsored`, `sponsorship` | `.../GAUSSIAN_SECTOR_CHANGE/Patch.lean` | yes |
| `YM.Next.SectorChange.chill`, `Frozen`, `Active`, `remote` | `.../GAUSSIAN_SECTOR_CHANGE/Shell.lean` | yes |
| `YM.Next.SectorChange.Schur.Pours`, `pure`, `Gapped` | `.../GAUSSIAN_SECTOR_CHANGE/Schur.lean` | yes |
| `Bars`, `per`, `clouded`, `per_read`, `per_zero`, `per_check`, `provides` (statement) | `.../GAUSSIAN_SECTOR_CHANGE/Windows.lean` | yes |
| `YM.AnalyticBridge.MarginalMultiplier3b1d.local_gap`, `local_column`, `gap_price`, `per_approx`, `credit`, `kernelPrices`, `credit_post`, `kernel_post`, `kernelPrices.margins` | `Lean/YM/AnalyticBridge/MARGINAL_MULTIPLIER_3B1D/Ground.lean` | yes |
| `...SourceBounds.bump_post`, `source_bound`, `move_bound` | `.../MARGINAL_MULTIPLIER_3B1D/Source.lean` | yes |
| `...Background.base_post` (statement) | `.../MARGINAL_MULTIPLIER_3B1D/Background.lean` | yes |
| `...SourceBounds.signal_bound` (statement and first lines) | `.../MARGINAL_MULTIPLIER_3B1D/Force.lean` | yes |
| `YM.ConnectedActivityE6.Coat.frames`, `in_frame` | `Lean/YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Windows.lean` | yes |
| `YM.ConnectedActivityE6.ends` | `.../CONNECTED_ACTIVITY_JETS_E6/Shell.lean` | yes |
| `Coat.manifest` | `.../Currents.lean` | yes |
| `Coat.motion`, `priced`, `form`, `sleepy`, `plate`, `stand` | `.../Gram.lean` | yes |
| `SliceRows.orientedRow` | `.../Carrier.lean` | yes |
| `Coat.selected` | `.../Assignment.lean` | yes |
| `Coat.Rotator`, `Coat.shoots` | `.../Shutter.lean` | yes |
| `Coat.energized` (statement and first lines) | `.../Coercion.lean` | yes |
| `Coat.scopes`, `ready` (statement head) | `.../Peak.lean` | yes |
| `Allow` (fields) | `.../Resolvent.lean` | yes |
| `YM.PhysicalNext.InteractingRank.Pump.Grid.Pupil` | `Lean/YM/PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Opacity/Acreage.lean` | yes |
| `YM.PhysicalNext.InteractingRank.Q_endpoint`, `mean_endpoint` | `.../AFTERNOON_INTERACTING_RANK_COMPARISON/Images.lean` | yes |
| `...RG05Joint.selectRunWithTreasuryPeriod_preselected_quote_orders_postnumeric_of_prediction` (location only) | `Lean/YM/Integration/NativePreselectedPostnumericPeriodRun.lean` | location confirmed; canonical evidence path wrong |

## Not checked

`Wisps.written`, `Wisps.front`/`down` (anchor definitions were checked only through their uses in `Stencils.lean` and the records); `Work.E02.answer` and `link_bound` internals; `face_comparison` and `block_comparison` internals; `Coat.raised`; `Coat.pressure_mean` and the `local-mean` source chain; `Barge.dredge`, `putAway`, `ballot`, the CAB declarations (`Aff.takes_sub`, `Milk.*`); `inverse_tilt`; any transitive axiom audit or fresh elaboration.
