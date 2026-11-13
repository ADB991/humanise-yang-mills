# C08 review, part 2: Lean correspondence

- Unit and scope: work package C08 of unit YM-000026. Six chapters: `projection-payment-producer.tex`, `principal-gaussian-comparison.tex`, `principal-comparison-jets.tex`, `principal-reference-attenuation.tex`, `nonlinear-singleton-inheritance.tex`, `high-degree-cluster-prices.tex` (hashes in `part2-mathematics.md`). Also the source claims in the author records `ledger.md`, `outputs.md`, `edges.md`, `HANDOFF.md` that concern these chapters.
- Role: Lean correspondence. Reviewer: Claude agent (Opus 5.5) for `schmittj`, session `schmittj-claude-c08-review-20261113`, issue #49. No human acceptance.
- Source: `Lean/` at pinned revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, tree `328ad19b404d2db2a578319ea3e4eba4b27e34ef`, read as text. Nothing was elaborated, built or axiom-checked. All paths below are relative to `Lean/`. `RG_NEXT` abbreviates `YM/PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP`, `E6` abbreviates `YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6`, and `HEIR` abbreviates `YM/PhysicalNext/V9_JOINT_ENDPOINT_LOAD/Heir`.
- Method: I read the exact statement and the meaning-determining definitions of each declaration in the table, and read the proof bodies where a numerical choice or quantifier order was at issue (`inherit_multi`, `Highway.lean`, `Height.completed`, `Utopia.twinkles`, `Blush.efferv`/`fruition`, `Graces.compass`, `Brim.pressings`/`landing`, `Brim.spicules`/`sweaters` (opening part), `Release.spread`). Chapters in this scope contain no source citations in the prose. The correspondence is with the source declarations named in `outputs.md` and `ledger.md`.
- Outcome: no case where the manuscript claims more than the source in a way that matters, with one exception (L1, the manuscript omits a source hypothesis). All four PR #93 hunks in scope match the source.

## Findings (ordered by severity)

### L1. GAP (manuscript, pre-existing) — `high-degree-cluster-prices.tex` lines 28, 249–270 omit the source hypothesis that makes the root price exponent smaller than −3/8

Source. `YM.PhysicalNext.Repeat.Height.cruising` (`RG_NEXT/Height/Highway.lean`) has hypothesis `he : T'.wanting < -(3/8:ℝ)`. Its first smallness conclusion `degreePrice (radiusB s) (D*(Q.costs L μ 1 s 0).rootHit) Q.δ ≤ 1/2` is obtained from `pressureYoung … (Q.rate_root …) (by linarith only [he,T'.reach])`. Here `YM.ConnectedActivityE6.Target.rate_root` (`E6/SalesRoot.lean`) gives the root price the rate `Q.rate`, and `Target.Expense.reach : Q.rate < wanting` (`E6/IssuePlan.lean`). `Target` itself (`E6/OptionCost.lean`) only has `start : -(1/2) < rate` and `stop : rate < 0`. So the source needs `rate < wanting < -3/8`. The manuscript has $-1/2<t<0$ (= `start`, `stop`) and $\varphi<-3/8$ (= `he`, with $\varphi$ = `wanting`), but it never states $t<\varphi$ (= `reach`). It simply asserts "the strictly smaller than $-3/8$ exponent of $r_0$". The English is therefore weaker in hypotheses than the source, and its claim does not follow without `reach`. Requested change: as in M1 of `part2-mathematics.md`, state $r_0$ has exponent $t$ and $t<\varphi<-3/8$.

### L2. NIT (records, PR #93) — `ledger.md` lines 118–126 misdescribe the source route of the warning price

Quoted: "with exponent `-5` the resulting upper exponent is `-7/4`". In `YM.ConnectedActivityE6.Blaze.Silica.Utopia.twinkles` (`RG_NEXT/Census/Horns.lean`) the call is `Coat.alarm_bills … (-5) …`. The proof then uses `hY (-4)`, the eventual bound $E\le\beta^{-4}$, and writes the joint probability bound as $(g\,x)^{2|v|}$ with `g x = betaF^(-2)`. The retained per-warning price is therefore $u\beta^{-2}$, and `grow^2 * g` has rate $-5/4$ (`exponent_fee … (Rate.power 3/8).pow 2 .mul (Rate.power (-2)) .weaken`). The manuscript's example ($-5\to-5/2\to-7/4$) is valid mathematics, and `alarm_bills` does allow any rate $k$, so the manuscript's PR #93 sentence is correct. Only the ledger's attribution of $-7/4$ to the source is inaccurate. Requested change: say that the source retains $\beta^{-2}$ per warning (rate $-5/4$ after `grow²`).

### L3. NIT (records) — `ledger.md` line 135 calls `numP` "`Cash.numP`"; the definition is `YM.ConnectedActivityE6.Cash.numP` in `E6/Expenses.lean` (`def numP (s : Molecule S) := ∑ i∈s, Mixed.shares S i`). The meaning recorded is correct. The fully qualified name is not given, contrary to the project rule.

## PR #93 hunks in scope, checked against the source

1. `high-degree-cluster-prices.tex` lines 69–75 (grades and warning purchase). `Silica.horn` is `Sum.elim (fun _=>0) (Sum.elim (teeth c f) (fun _=>2))` on `Alphabet c f := ℕ ⊕ LogIndex c f ⊕ WarningAt c f`. The first summand is the forced family: its extra charge in `Heavy` is `Raw.forcedExtra R`. So forced letters have grade 0 and warnings grade 2, as stated. `Coat.alarm_bills` (`E6/ResponsePrice.lean`): for every real `k` there is `E` with `Rate G L k E`, and eventually, under `Rotator` and `Intake`, `X.dice.real (X.catastrophe ξ R.beta v) ≤ (E x)^v.card` for every finite warning set `v`. This is a joint bound, with no independence, as the manuscript says. Matched.
2. `high-degree-cluster-prices.tex` lines 156–160 (seed count). `Height.overlap t = ∑ i, Cash.numP (t.2 i).val` (`RG_NEXT/Height/Span.lean`), `numP` sums `Mixed.shares` over the molecule, `Mixed.shares = Sum.elim Stores.shares (fun _ => 0)` (`YM/Push/ABSOLUTE_SUMS/Mixed.lean`), and `Stores.shares = costs.card + aisles.card + flags.card`, where `costs : Finset (Cell f)`, `aisles : Finset (Bond c)`, `flags : Support c` (`YM/Pressure/Seeds.lean`). "Fine-cell, coarse-bond and flagged-site seeds", counted per cluster occurrence. Matched.
3. `nonlinear-singleton-inheritance.tex` lines 121–125 ($n\ge6$). `YM.RG.BudgetPoint` has field `order_ge : 6 ≤ order` (`YM/RG/Masks.lean`). `YM.PhysicalNext.JointLoad.Heir.Rehearsed` has field `test : P.order=n` (`HEIR/Sonata.lean`). `YM.PhysicalNext.JointLoad.Heir.motif` (`HEIR/Motif.lean`) assumes `hk : 5 ≤ n` and `hK : n ≤ B.order` in its $L^{-5}$ branch. `Brim.pressings` uses `hV.rehearsed.test.le.trans hJ` to get `B.order ≤ j`. So the purchased order equals the budget order, at least six, and five suffices for the attenuation. Matched. (`Brim.pressings` also carries a separate `hn : 2 ≤ n` on the `Libretto` index, made redundant by `test` and `order_ge`.)
4. `nonlinear-singleton-inheritance.tex` line 179 ("$L^4$ fine sites above it"). `YM.PhysicalNext.JointLoad.Heir.Release.spread` (`HEIR/Choirs.lean`) groups by `q.parent (a i) = y`, sums over the `q.count`-residues `z` in `q.assemble (y,z)`, and uses `site_card` to get `L^4`. From a per-occurrence bound `u i ≤ E * (q.count⁻¹)^5 * b i` it gives `E/q.count * τ`. Coarse site is the parent. Matched, including the $L^{-5}\cdot L^4=L^{-1}$ arithmetic of \eqref{eq:singleton-reference-anchored}.

## Correspondence by chapter

| Chapter | Source declarations compared | Result |
| --- | --- | --- |
| `projection-payment-producer.tex` | `Blush.glyph`: the source comment questions precedence, but the proof's `change` line shows `-(u^(1/5))*(1/2)`, so $\kappa=e^{-P^{1/5}/2}$ as in the manuscript (prefix `-` has precedence 75 in the pinned toolchain). `Mallow.straw = 2*lauge L (μ/4) x (1/4) G` with `lauge = exp(-v*C*fineMonitor^2)`, hence $s=2e^{-\mu P_f^2/16}$ with $P_f$ = `fineMonitor` = $P(\beta_F)$. `Blush.efferv` uses exactly $P_f\ge64/\mu$ and $u^{1/5}\le u\le V$. `Blush.fruition` gives the tail bound (poster rate `Q.rate/4`) and the forced bound with `g = Q.goal` (`= betaF^Q.rate`) and no division by mass. `Graces.Comply`/`compass`: tail and forced bills $\le$ `coinFee = rate(L)/host` times $m$, plus `hitWidth * glyph ≤ 1`, for all `StepStages j i` and `d ≤ i`, with a coordinatewise larger entry delay. `radiusB x = ⌈(log x)^2⌉`, `betaF = x + c log L`. The profile/hook identity (`Mallow.sandboxK`, `Graces.cloudDrop`) and the principal payment (`Mercury.haze`/`shelves`) were not opened by me (ledger claims only). | Matched for all inspected parts. The quantifier order is stagewise, not uniform over stages or degrees, as the chapter says. |
| `principal-gaussian-comparison.tex` | `Mercury.trove` (statement): a rate $-1/2$ function `B` chosen first, then eventually, for the same `Cash`, `Coat`, `Plays`, healthy field, `coverNumber ≤ radiusB` and the actual masked regular insertion, `Brush n (M.weight*(2*|B s|)) 1 (g - u∘V) 0` along permitted directions. `Brim.spicules`: covariance difference `EdgePay (lamp9 - lamp6) n |f|` with `f` of rate $-1/2$, mean `J` of rate $-1$, inverse entries of `lamp9` bounded by an exponent-zero quantity, i.e. normalised order-one covariances. `Brim.sweaters`: `δ = |v| + burst*|J|`, rate $-1/2$. This matches $\delta=|V_0|+g^{-1}|J_0|$ and the exponents in \eqref{eq:principal-primitive-comparison}. It also confirms that $V_0$ is a difference of normalised covariances, so no extra $g^{-2}$ arises. `Mercury.pop6`/`pop9` not opened. | Matched (statement level; proof of `trove` not traced). |
| `principal-comparison-jets.tex` | `Malachite.angle`: derivative of `forecast - study` equals `(U - looks X 0)ᵀ *ᵥ meter (page X) v` with `U` the restricted actual window inverse = \eqref{eq:comparison-mean-first}. `Malachite.darkness`: unweighted `Price` of `L - looks X 0` via `U - H⁻¹` and `L - H⁻¹`, with `H` the restricted blank plate (uses `same_probe`), bounded by `missPay … X.B`. `Malachite.night`: symmetrised version. This matches \eqref{eq:comparison-flat-window-error} and the use of $(A^{-1})_{UU}=A_{UU}^{-1}$. | Matched. The reference coupling derivatives through $n+1$, the halo radius $45(1+B)$ and the $17B$ reads were not traced (ledger claims `Relume`/`Poles`). |
| `principal-reference-attenuation.tex` | `Peak.creek` (hypotheses `i+1 ≤ n`, `Short S B X`, `lit` cancellation, `glider`), `Peak.tinyBill` (factor `((S.patch.L.val)⁻¹)^(b+1)` under `b+1 ≤ n`), `Peak.huge` (`¬ Short`, `Lute.decay = 1`, no $L$-gain). These match the short/long dichotomy and $n\ge d+1$. `Heir.dissent`, `.recital`, `Heir.Museum.exchange` not opened. | Matched for the inspected statements. |
| `nonlinear-singleton-inheritance.tex` | `Brim.Houses`: `principal` anchored at price `c` with `Regular` and `supBounds`; `remains` anchored at `c'`, with `supBounds` only under `coverNumber ≤ B.B`. `Brim.pressings`: rate $-1/2$ function `e` chosen first, then `Houses … (C'/L.val*incomingE) (|e s|*incomingE)`. `Brim.landing`: `expatriate L t n = L^5 exp(base t n)` and the anchored price `(g*expatriate)/L*e`. `Release.spread` and the PR #93 items as above. `incomingE` has rate $-11/10$ (`trove` weakens it to $-1/2$). | Matched: $(C'/L)E_{\rm in}$ for the reference, an exponent $-1/2$ coefficient times $E_{\rm in}$ for the remainder, and the remainder derivative bound restricted to $q'\le B$. The source of the degree-four cancellation (`Heir.Seed.*`) was not opened (see M2). |
| `high-degree-cluster-prices.tex` | `Raw.extraA` = 1,0,1,1,2,2 on `LogLetter = ℕ ⊕ Trans f ⊕ Trans f ⊕ Trans f ⊕ Pairs f ⊕ Pairs c`. `Raw.inherit_multi`: block floor `n` before `L`, then for `r > -1/2` and any `r'`, eventually, graded prices `grow^extraA * z` with `Sales … (betaF^r)` and forced `Sales … (betaF^r')`. The proof uses `f = -15/16` for regular, quartic and loop, rate `s` for the cubic, `-2` for both tails, `grow*β^{-15/16} ≤ β^s`, `grow²β^{-2} ≤ β^s`, `6β^s ≤ β^r`. `Clutch.teeth` = `extraA`, then 0, then 2. `Height.grow = betaF^(3/8)`. `Height.degree = acme + breadth`, `depth = ∑ shapeW`, `beacon = grow^degree * exp(mark*overlap) * exp(ε*depth)`, `tired = 3≤degree ∨ 1≤overlap ∨ till≤depth`. `Height.completed`: under `grow^3 ≤ exp mark`, `grow^3 ≤ exp(ε*till)` and both `degreePrice … ≤ 1/2`, the tired clusters have site price `(grow^3)⁻¹*collars*(grow*salary*(1-1/2)⁻¹)`. `Height.highPay` (`δE z = z^(-11/10)`, `x ≤ betaF`) and `Height.cruising` (see L1). | Matched, except L1. The block-before-coupling order and the stagewise collection (`Height.season`, not opened) are as the chapter states. |

## Lean declarations opened

| Fully qualified name | Path (under `Lean/`) | Matched |
| --- | --- | --- |
| `YM.ConnectedActivityE6.Raw.extraA` | `RG_NEXT/Census/Typhos.lean` | yes |
| `YM.ConnectedActivityE6.Raw.inherit_multi` | `RG_NEXT/Census/Typhos.lean` | yes |
| `YM.ConnectedActivityE6.Raw.LogLetter` | `E6/Inherited.lean` | yes (species order) |
| `YM.ConnectedActivityE6.LogIndex` (abbrev) | `E6/Depot.lean` | yes |
| `YM.ConnectedActivityE6.Alphabet`, `footprints`, `lengths`, `rates` | `E6/OptionCost.lean` | yes |
| `YM.ConnectedActivityE6.Target` (fields `rate`, `start`, `stop`) | `E6/OptionCost.lean` | yes |
| `YM.ConnectedActivityE6.Target.Expense` (`reach`, `arrives`) | `E6/IssuePlan.lean` | yes; `reach` not stated in manuscript (L1) |
| `YM.ConnectedActivityE6.Target.rate_root` | `E6/SalesRoot.lean` | yes |
| `YM.PhysicalNext.Repeat.Height.grow`, `.pressureYoung`, `.probed`, `.highPay`, `.cruising` | `RG_NEXT/Height/Highway.lean` | yes, except L1 |
| `YM.PhysicalNext.Repeat.Height.acme`, `.degree`, `.depth`, `.beacon`, `.tired`, `.wield`, `.completed` | `RG_NEXT/Census/Revenue.lean` | yes |
| `YM.PhysicalNext.Repeat.Height.breadth`, `.overlap`, `.veteran` | `RG_NEXT/Height/Span.lean` | yes |
| `YM.ConnectedActivityE6.Blaze.Silica.horn`, `.Heavy`, `.Utopia.twinkles` | `RG_NEXT/Census/Horns.lean` | yes (PR #93 grades); ledger route NIT (L2) |
| `YM.ConnectedActivityE6.Blaze.Silica.Clutch.teeth` | `RG_NEXT/Census/Rush.lean` | yes |
| `YM.ConnectedActivityE6.Coat.alarm_bills` | `E6/ResponsePrice.lean` | yes |
| `YM.ConnectedActivityE6.Cash.numP` | `E6/Expenses.lean` | yes |
| `YM.Push.AbsoluteSums.Mixed.shares` | `YM/Push/ABSOLUTE_SUMS/Mixed.lean` | yes |
| `YM.Pressure.Stores`, `YM.Pressure.Stores.shares`, `YM.Pressure.radiusB`, `YM.Pressure.betaF` | `YM/Pressure/Seeds.lean` | yes |
| `YM.Push.AbsoluteSums.Delay.fineMonitor`; `degreePrice` (outer factor only) | `YM/Push/ABSOLUTE_SUMS/Delay.lean`, `YM/Push/ABSOLUTE_SUMS/Weigh.lean` | yes (as used) |
| `YM.PhysicalNext.Repeat.Blush.glyph`, `.efferv`, `.fruition` | `RG_NEXT/Blush/Little.lean` | yes |
| `YM.PhysicalNext.Repeat.Mallow.stems`, `.straw` | `RG_NEXT/Mallow/Eco.lean` | yes |
| `YM.PhysicalNext.Repeat.Mallow.lauge`, `.infuso` (statement) | `RG_NEXT/Mallow/Stove.lean` | yes |
| `YM.PhysicalNext.Repeat.Graces.coinFee`, `.Comply`, `.compass` | `RG_NEXT/Graces/Aspire.lean` | yes |
| `YM.PhysicalNext.Repeat.Mercury.trove` (statement) | `RG_NEXT/Mercury/Radio.lean` | yes |
| `YM.PhysicalNext.Repeat.Brim.spicules` | `RG_NEXT/Brim/Heights.lean` | yes |
| `YM.PhysicalNext.Repeat.Brim.sweaters` (statement and definitions of `δ`) | `RG_NEXT/Brim/Sun.lean` | yes |
| `YM.PhysicalNext.Repeat.Brim.expatriate`, `.landing`, `.Houses`, `.pressings` | `RG_NEXT/Brim/Level.lean` | yes |
| `YM.PhysicalNext.JointLoad.Heir.Release.spread` | `HEIR/Choirs.lean` | yes |
| `YM.PhysicalNext.JointLoad.Heir.Rehearsed` (field `test`) | `HEIR/Sonata.lean` | yes |
| `YM.PhysicalNext.JointLoad.Heir.motif` (hypotheses and conclusion) | `HEIR/Motif.lean` | yes |
| `YM.RG.BudgetPoint` (field `order_ge`) | `YM/RG/Masks.lean` | yes |
| `YM.PhysicalNext.Repeat.Malachite.angle` | `RG_NEXT/Malachite/Taps.lean` | yes |
| `YM.PhysicalNext.Repeat.Malachite.darkness`, `.night` | `RG_NEXT/Malachite/Aperture.lean` | yes |
| `YM.PhysicalNext.Repeat.Peak.creek` | `RG_NEXT/Peak/Drums.lean` | yes |
| `YM.PhysicalNext.Repeat.Peak.huge`, `.tinyBill` (statements) | `RG_NEXT/Peak/Tansy.lean` | yes |

## Not checked

- I did not open these declarations named by the records: `Mallow.sandboxK`, `Graces.cloudDrop`/`.thunder`, `Mercury.haze`/`.shelves`/`.pop6`/`.pop9`, `Malachite.same_probe`/`.ringD`/`.mute`/`.scores`/`.matchesP`/`.treasure`, `Heir.dissent`/`.orchestra`/`.recital`/`Museum.exchange`, `Heir.Seed.family`/`.four`/`.ghost`, `Heir.Release.quoting`, `Height.season`, `Census.Mettle`, `Clutch.hearthGrades`, `Window.Allow.*`. For these I rely on nothing in my verdicts beyond what the manuscript itself proves.
- No hidden instances or coercions were inspected beyond those visible in the statements above. No `#print axioms` was run, and no elaboration was performed.
