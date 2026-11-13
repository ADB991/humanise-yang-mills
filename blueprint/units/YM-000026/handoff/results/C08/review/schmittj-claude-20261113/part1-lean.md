# C08 review, part 1: Lean correspondence

- Unit: work package C08 of unit YM-000026; this part covers `gaussian-reassembly.tex`, `forest-average-log.tex`, `forced-exclusion.tex`, `soft-log-fusion.tex`, `marked-block-integral.tex`, `marked-activity-jets.tex`, `leaf-expansion.tex` (hashes in `part1-validation.md`, identical to the coordinator's list).
- Role: Lean correspondence.
- Human reviewer: `schmittj` (agent review; no human acceptance recorded).
- Agent assistance: one Claude agent (Opus 5.5), session `schmittj-claude-c08-review-20261113`, issue #49.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, read at `/home/jo314/ym-wt/c08-review/Lean` (tracked tree `328ad19b404d2db2a578319ea3e4eba4b27e34ef`). No Lean was built or elaborated; all checks are textual readings of statements, definitions and proof bodies.
- Outcome: the two PR #93 edits in this part are faithful to the source. The source declarations cited by the C08 ledger for these chapters exist under the stated names and paths, and their statements support the English at the level claimed. One correspondence finding has mathematical weight: the normalization identity behind `eq:leaf-tilted-identity` is a hypothesis-laden source theorem (`Mallow.cone`), but the chapters do not name it (see F1, also part1-mathematics F1). The remaining findings are precision items. Changes requested; no human acceptance.

## Findings, ordered by severity

### L1. GAP (correspondence) — `e^{E_coarse+R_0+S_0} = 𝒪 a(0)` corresponds to the theorem `Mallow.cone`, which the chapters do not name

- Location: `marked-block-integral.tex` 200-210, `leaf-expansion.tex` 161-171. Pre-existing; not touched by PR #93. Manuscript and records (the ledger's "Tilted gas and fusion boundary" and "Marked block identity" sections do not mention it).
- Source: `YM.PhysicalNext.Repeat.Mallow.cone` (`Lean/YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mallow/Brisk.lean`): `Real.exp ((H.result x).exponent U) * Real.exp (∑' i, Tap0.logarithm i U) * Real.exp (∑' i, T'.logarithm i U) = overhead (prism …) (Q x) (Y).table * (W).homesteadPool O U`. Its proof uses `H.owns`, `cruise_EX`, `(H.core hm x hx).exponent …` and `Mallow.prom`, which in turn uses `Embrasure.click`, `Marlin.cruiseV` and `Song.creditRing`. So the output exponent is a separately constructed object, and the identity is a theorem under the section's hypotheses (`hm`, `H`, `T`, …), not a definition.
- English: stated as "Its background normalization is …" (marked-block-integral) and as one of three "identities" (leaf-expansion), with only the other two named as inputs.
- Requested change: name the identity and its producer in both chapters and in the ledger, with `Mallow.cone`/`Mallow.prom` as the source trace.

### L2. INACCURACY — gaussian-reassembly leaves the source objects behind $A_0$ and $\mu$ unidentified

- Source: `YM.ConnectedActivityE6.Coat.blank` (`…/CONNECTED_ACTIVITY_JETS_E6/Dye.lean`) is `{ X with V := 1, seeds := ⟨∅,∅,∅⟩ }`, so $A_0$ = `X.blank.plate` has every free bond active and identity completion only on tree bonds (`no_flat`, used in `TreeColor.snuggles`). `YM.ConnectedActivityE6.Coat.μ = erect G X.driftM` with `driftM = -(X.kernelA.transpose *ᵥ X.linearBill)` and `kernelA = X.shutter.pad X.plate` (the columnwise, unsymmetrized windowed inverse; `…/Shutter.lean`, `…/Windows.lean`). `Coat.μ_sleep` (zero mean on non-hot bonds) holds under the `Window.Allow` and funded-tube section hypotheses.
- English: $A_0$ is "its flat reference"; $\mu$ is used but not defined. `eq:reassembly-square-cancel` matches `YM.ConnectedActivityE6.Coat.correcting` (`…/Funnel.lean`) exactly (`ghost` $=\mathscr G$, `hatted` $=\widehat h=-g^{-1}(A\mu+\ell)$, quadratic difference `relating⁻¹ - plate`), and that statement holds for this $\mu$, so the algebra is faithful; only identification is missing. The HANDOFF sentence that the draft distinguishes "the mean operator" is not reflected in this chapter.
- Requested change: define $A_0$ and $\mu$ as above, or cite the section that does.

### L3. INACCURACY — near-set radii in `eq:reassembly-packet-log`

- Source: `YM.ConnectedActivityE6.Coat.mglows` (sum of `condensation` = $c_e$ split at `visit X.seeds (200*X.B)`) and `Coat.glowing` (sum of `gentry` = $j_e$ split at `X.plaza (X.seeds.dome (304*X.B))`), `…/Acquiesce.lean`. `Coat.speckle` there has the remote-cancel statement `eq:reassembly-remote-cancel`, with posted rows at `200*X.B`, under `Room`, `0<a`, `X.enforce a u X.tier ≠ 0`, `Seeded` and `Alive`.
- English (lines 101-106) is correct once "the two local sums" is read as $\sum c_e$ (200B) and $\sum j_e$ (304B). The display has three "near" subscripts, however, and remote-cancel's hypothesis that the mask is nonzero appears only as "protecting cutoff equals one on the smaller full mask". Requested: name the index sets explicitly.

### L4. INACCURACY — product moment bound and distinct-set criterion are not traced

- The bound $\int|\Phi|\le\prod p_v$ (gaussian-reassembly 219-224) is presumably supplied by fields of `Cash` used in `Matter.trace`/`incomeK`. Neither the chapter nor the ledger names the declaration; I did not locate it. Requested: give the source field and the manuscript producer.
- The second-expansion smallness in forced-exclusion has source `YM.ConnectedActivityE6.Target.certify` (`…/Threshold.lean`). It gives eventually `0<u`, `u ≤ v = mergeScale = 20*u` (matching $\eta=20u$), `v ≤ 1/2`, and `degreePrice B u a ≤ 1/2`, `degreePrice B v b ≤ 1/2`. I did not open `degreePrice`/`Trees.stretch`, so I have not confirmed that `degreePrice B v b` is literally $4(2B+1)^4v/b$. The distinct connected-set estimate itself is not stated in the manuscript (part1-mathematics F3).

## PR #93 changes in this part

| Change | Source checked | Verdict |
| --- | --- | --- |
| gaussian-reassembly 15-20: $A$ is the selected affine row square with identity completion on inactive coordinates; $C$ a positive finite-range approximation to its inverse; $C^{-1}-A$ retained; not asserted to be the Hessian of the full nonlinear action. | `Coat.plate := X.form.transpose * X.form + X.sleepy`, `Coat.sleepy := diagonal (if X.Hot i.1 then 0 else 1)`, `Coat.form` built from `Coat.motion` (masked oriented row of `lens x`, scaled by `Coat.scale = sqrt(1/|Signed|)`), all in `…/Gram.lean`; `Coat.relating := X.shutter.frameMean X.plate` (`…/Shutter.lean`), `Window.frameMean := (1/2)•(pad A + (pad A)ᵀ)` (`…/PressureC.lean`), `Window.pad` = columnwise principal-window inverse (`…/Windows.lean`); `Coat.correcting` keeps `relating⁻¹ - plate`. | Faithful. "Positive" is a standing hypothesis/consequence of the sector data (chapter line 9), not part of the definition, and "approximation" is not used quantitatively here; both are acceptable as worded. |
| leaf-expansion 76: summation index `\sum_{\substack{q\subset\mathbb N\;\mathrm{finite}}}` replacing a corrupted `\rm` command. | n/a (typographic) | Correct; the earlier source had a literal carriage return from `\r` in `\rm`. |

The other PR #93 chapter edits (nonlinear-singleton-inheritance, high-degree-cluster-prices) are outside this part.

## Correspondence checked by chapter

| Chapter | English claim | Declaration(s) | Match |
| --- | --- | --- | --- |
| gaussian-reassembly | Jacobian constant $b^{-(D-nq)}g^{nq}c_H^n=b^{-D}m^Ne^{-(N-n)\log m}$ | `YM.ConnectedActivityE6.Coat.payment` (`Fact.lean`), `Coat.measure_g`/`channelOne` (`Steam.lean`, `Fact.lean`), `tier`/`pens`/`tier_plus` | Matched: `bell^{-dozing}·g^{arised}·scale^{tier} = bell^{-|Tubular|}·m^{|Free|}·exp(-|pens|·log m)` |
| gaussian-reassembly | Reference density $\vartheta_C$ and overhead $\mathscr O=\mathscr L m^N(\det A_0)^{-1/2}$ | `Coat.thetaRef`, `Coat.deducted`, `Coat.levy` (`Fact.lean`); `Matter.overhead` (`Amass.lean`); `Matter.overhead_pos` (`Density.lean`) | Matched (`levy` = prefactor·exp(v·|Site f|)·`Raw.stone`) |
| gaussian-reassembly | Determinant/itinerary decomposition of $\mathscr R$ | proof body before `Coat.speckle` in `Acquiesce.lean` (HasSum with `-(1/2)(log det plate − Σ joint plate)`, `(1/2)(log det blank.plate − Σ joint blank.plate)`, `(1/2)(log det plate + log det relating)`, `Σ qlinear`, `(1/2) zᵀ(relating⁻¹−plate)z`) | Matched term by term |
| gaussian-reassembly | Completed square `eq:reassembly-square-cancel` | `Coat.correcting` (`Funnel.lean`) | Matched |
| gaussian-reassembly | Exact push with one overhead, injective component/flattening, zero off range | `YM.ConnectedActivityE6.Matter.trace`, `.render`, `.real_push` (`Density.lean`) | Matched: `HasSum (fun Z => overhead X R Q.table * ejections … Z) (S.push R.beta R.eval X.V)` for fixed coat (forest, field) under `Cash` |
| forest-average-log | $\det A^0_F=\det A^0_H$, forest-independent overhead | `YM.ConnectedActivityE6.TreeColor.blankrow`, `.strata`, `.snuggles`, `.unafraid`, `.expenses`, `.overhead_eq` (`Silhouette.lean`) | Matched: `strata` is $M_HT=M_F$ (needs `X.x=Y.x`, `P.Funds`), `snuggles` is $T^TD^0_HT=D^0_F$, `unafraid` the congruence with $\det T^2=1$; `overhead_eq` needs equal `x` and `V` |
| forest-average-log | Independent sitewise forest average gives the push; product of averages over disjoint grounds | `YM.PhysicalNext.Repeat.Greenbelt.repays`, `.organizes` (`Sward/Greenbelt.lean`) | Matched: `repays` uses `likely_product` over pairwise disjoint `ground` and `Horticulture.Travels.sails`; `organizes` combines `overhead_eq` and `Matter.real_push` |
| forced-exclusion | $\eta=20u$ and eventual smallness | `YM.ConnectedActivityE6.Target.mergeScale`, `.certify` (`Threshold.lean`) | Matched for $20u$ and the $\le1/2$ conditions; `degreePrice` not opened (L4) |
| soft-log-fusion | Fused gas = old gas × exp(sum of soft logs), new summability derived | `YM.PhysicalNext.Repeat.Mallow.Kiln`, `Mallow.Passage.gathered` (`Mallow/Passage.lean`) | Matched: `Kiln.visits` is `logarithm i U ≠ 0 → ¬Healthy … (softer i) U`, i.e. `eq:fusion-vanishing`; `Dominated` gives uniform summable majorants; `ForcedFamily` keeps original eligibility |
| soft-log-fusion | Inflated prices $e^\kappa p_i$, $2v_j$, $\Gamma=e^\kappa b+2w$; $h_B\Gamma\le1$, $e^{-\kappa}(e^\Gamma-1)\le A$; same tilt and debt | `Mallow.wallets`, `Mallow.harvest` (`Mallow/Kitchen.lean`) | Matched: `|exp ℓ − 1| ≤ 2 v`, `Payments.inflation B w κ`, `Ac.forest … he.capital`, `he.returns`; `harvest` returns a `Season` for the fused family |
| marked-block-integral | One-mark affine product; `HasSum` to push $+\theta\cdot$ marked push | `YM.PhysicalNext.Repeat.Daisy.Charity.sprained`, `.tint` (`Daisy/Berries.lean`) | Matched: `sprained` uses that two marked components would share `M.turn.badge`; `tint` combines `Greenbelt.organizes` and `Leaf.summons` |
| marked-block-integral, leaf-expansion | Joint value/derivative budget, products without degree factor, affine price $a+2b$, cluster terms, multiplicities, termwise derivative | `YM.PhysicalNext.Repeat.Daisy.Charity.Est` with `.mold`, `.summit`, `.tilted`, `.logCharge`, `.copies`, `.seqOwnUp` (`Daisy/Curtail.lean`) | Matched: `Est w ζ x f` is "differentiable at x and ∃a,b≥0, a+b≤w, |f x|≤a, |f' x|≤ζ b", i.e. `eq:leaf-joint-bound`; `seqOwnUp` needs an open preconnected set and `Est` at every point (the chapter's open interval and mean value argument are equivalent); `copies` uses multiplicity $n\ge1$ with $1/n!$ |
| marked-activity-jets | $DJ=w$ including $w=0$; block-length condition $10uC_0/L\le\varepsilon$; one new root price | `YM.PhysicalNext.Repeat.Daisy.dew`, `Daisy.foam`, `Daisy.ribbon`, `Daisy.sustains` (`Daisy/Solvent.lean`) | Matched: `foam` is `relative*(10*preCost(halo+5)/L) ≤ ε`, `ribbon` the added root price $g e^{uC_0}$ with $C_0$ = `preCost(halo+5)` |
| leaf-expansion | Tilted identity factors and normalization | `Mallow.cone`, `Mallow.prom`, `Mallow.curd`, `Mallow.cord` (`Mallow/Brisk.lean`) | `curd`/`cord` are the two `gathered` regroupings ($b=G_\theta e^{R+S}$); `cone` is the unnamed normalization identity (L1) |

## Lean declarations opened

| Fully qualified name | Path (under `Lean/YM/`) | Matched |
| --- | --- | --- |
| `YM.ConnectedActivityE6.Coat.form`, `.sleepy`, `.plate`, `.linearBill`, `.scale`, `.motion`, `.charged_for`, `.pricing` | `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Gram.lean` | yes |
| `YM.ConnectedActivityE6.Coat.kernelA`, `.driftM`, `.μ`, `.relating`, `.cold_pad`, `.uniform`, `.not_e`, `.μ_sleep` | `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Shutter.lean` | yes (statements read; `cold_pad`/`uniform` only as statements) |
| `YM.ConnectedActivityE6.Window.frameMean`, `.flawed` | `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/PressureC.lean` | yes |
| `YM.ConnectedActivityE6.Window.pad` | `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Windows.lean` | yes |
| `YM.ConnectedActivityE6.Coat.Hot`, `.view`, `.saved` | `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Coat.lean` | yes |
| `YM.ConnectedActivityE6.Coat.blank` | `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Dye.lean` | yes |
| `YM.ConnectedActivityE6.Coat.deducted`, `.levy`, `.channelOne`, `.thetaRef`, `.ribbons`, `.payment`, `.tier_plus` | `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Fact.lean` | yes |
| `YM.ConnectedActivityE6.Coat.measure_g` | `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Steam.lean` | yes |
| `YM.ConnectedActivityE6.Matter.overhead` | `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Amass.lean` | yes |
| `YM.ConnectedActivityE6.Matter.trace`, `.render`, `.real_push`, `.overhead_pos` | `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Density.lean` | yes |
| `YM.ConnectedActivityE6.Coat.speckle`, `.mglows`, `.glowing` (and the preceding determinant HasSum) | `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Acquiesce.lean` | yes (L3 wording) |
| `YM.ConnectedActivityE6.Coat.hatted`, `.qlinear`, `.ghost`, `.correcting` | `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Funnel.lean` | yes |
| `YM.ConnectedActivityE6.TreeColor.blankrow`, `.strata`, `.snuggles`, `.unafraid`, `.expenses`, `.overhead_eq` | `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Silhouette.lean` | yes |
| `YM.ConnectedActivityE6.Target.mergeScale`, `.overture`, `.certify` | `AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Threshold.lean` | partly (`degreePrice` not opened) |
| `YM.PhysicalNext.Repeat.Greenbelt.repays`, `.organizes` | `PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Sward/Greenbelt.lean` | yes |
| `YM.PhysicalNext.Repeat.Daisy.Charity.Est` and `.Est.nil`, `.mold`, `.summit`, `.tilted`, `.logCharge`, `.copies`, `.seqOwnUp` | `PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Daisy/Curtail.lean` | yes |
| `YM.PhysicalNext.Repeat.Daisy.Charity.sprained`, `.tint` | `PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Daisy/Berries.lean` | yes |
| `YM.PhysicalNext.Repeat.Daisy.foam`, `.ribbon`, `.dew`, `.sustains` | `PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Daisy/Solvent.lean` | yes |
| `YM.PhysicalNext.Repeat.Mallow.Kiln`, `Mallow.Passage.gathered` | `PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mallow/Passage.lean` | yes |
| `YM.PhysicalNext.Repeat.Mallow.wallets`, `.harvest` | `PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mallow/Kitchen.lean` | yes |
| `YM.PhysicalNext.Repeat.Mallow.prom`, `.curd`, `.cord`, `.cone` | `PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Mallow/Brisk.lean` | yes; `cone` is not cited by the chapters (L1) |

## Records checked against the source

- Ledger "Gaussian reassembly: exact push and locality", "Forest average and exclusion", "Tilted gas and fusion boundary", "Marked block identity", "Marked local jets and prices" (the parts concerning these chapters) and the paragraph on `Coat.plate`/`.relating`/`.driftM` (ledger lines 180-224): every declaration I opened exists at the stated path and says what the ledger says. The claims I could not test are noted below. Two omissions: `Mallow.cone` (L1), and the source of the product moment bound (L4).
- Interface notes: the pinned `gaussian-sector.md` (SHA-256 `f5ed7e25…07e7`, equal to the ledger's pin) concerns the SectorNext `fog`/`Rows.gram` construction. The E6 reassembly uses the distinct `Coat.plate`/`Coat.relating`; the ledger correctly does not identify them. The Hessian caution carries over and is respected by the PR paragraph.

## What I did not check

- `Coat.precip` (`Unified.lean`), `Cash.bouquetPool`/`.convoyPool` (`Cadre/Catkin.lean`, `Cadre/Aurora.lean`), `Horticulture.Travels.paths`/`.sails`, `Lotus.Leaf.*`, `Daisy.score`/`Herd`/`pistes`/`luminos`/`debtor`/`petals`, `Blaze.Flux.takeoff`: cited by the ledger for these chapters but not opened by me.
- The exact form of `degreePrice`, `Reserves.*`, `Mixed.Costs` and the compulsory mark `markSeed` versus $M=\frac\mu4\,\mathrm{fineMonitor}^2$.
- Hidden instances and coercions beyond those visible in the statements read; no elaboration was run.
