# C14 review, part 4: Lean correspondence (stress normalization, shell nodes, annulus, trace calibration)

Reviewer: Claude (Opus 5.5), session `schmittj-claude-c14-review-20261113`, reviewer 4 of 4. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`, read directly from `Lean/` in `/home/jo314/ym-wt/c14-review` (`e058a61`). Statements were read from the source text; nothing was elaborated. Mathematical findings are in `part4-mathematics.md`; finding numbers F1-F11 and R1-R5 refer to that file.

Summary: every Lean claim made by the PR #98 changes in `actual-stress-shell-nodes.tex` and `actual-stress-annulus.tex`, and by the records for these chapters, matches the source, with the exceptions listed below. No English statement in my chapters is stronger than the corresponding Lean statement in a way that matters, except that the manuscript proposition `prop:ex-lattice-annular-field` lacks the per-family opening that the Lean proof obtains from `Aroma.opens` (F1).

## Findings, ordered by severity

### L1. GAP (manuscript `actual-stress-annulus.tex` 184-185, 376-411; made visible by PR #98)

English: lemma fixes one opened $(p_0,k)$ dominating all watch depths; proposition applies the lemma to arbitrary enlarged families. Lean: `YM.MergeProof.Acme.zone` (`Lean/YM/MergeProof/West/Ozone.lean`) chooses `Q := Finset.univ.sup (fun i => (X i).t)`, then `Stock.Tabs.mayOpen L 1 hv.opens Q` and `k := max k₀ (C.ref D)`; `YM.MergeProof.Acme.annular_fieldA` (`West/Bravo.lean`) takes `HA : Aroma C`, whose field `opens : Stock.Tabs C.path.levels` supplies this for every family. The English omits the stock receipt; with a fixed $p_0$ the proposition's step "apply the result to the union" is not covered. Same repair as F1.

### L2. INACCURACY (manuscript `actual-stress-annulus.tex` 163-167, introduced by PR #98; `actual-stress-shell-nodes.tex` 407-443)

English: "Proposition~\ref{prop:ex-lattice-actual-shell-node} supplies this shell-node input". Lean: the producer of `ShellNode` for the consumer is `YM.MergeProof.Ribbons.Economics.fees` (via `laurelE`), whose type is `∀ d D h, D+h=d+4 → ∃ t j, 1<t ∧ Tendsto j atTop atTop ∧ Tendsto (fun i => Q (j i)/Q i) atTop (𝓝 t) ∧ ∀ p k, Stock.Tabs.opens … 1 p k → C.ref D ≤ k → ∀ v T F, ∀ᶠ i in atTop, ShellNode C p (j i) i D d h v T F (2*(stakes C p k / pitts C i))`. `ShellNode.corners` includes `J ≤ N`, `Interior (chamber) (fragment)` and the root bound for every `F : Extraction.Order`. The scale note is not part of it (`YM.MergeProof.Ribbons.fugacious`, field `Aroma.notes`). The manuscript proposition's statement omits chamber membership, $p_0\le N$ and arbitrary extraction orders, and states as hypotheses the per-$(N,q)$ chamber/placement conditions that `bricks` derives on a late set (`near_center`, `faraway`) and the lightness/price gates that `laurelE` derives eventually (`pricey`, `lightness`). The source producer does deliver the definition minus the scale note; the manuscript statement should be aligned (F2).

### L3. Minor mismatch, harmless (manuscript `actual-stress-annulus.tex` 112-118)

English definition: one numeric coefficient bound $2Q^{\mathrm{quota}}_me_m$ independent of the anchor. Lean `ShellNode.corners`: `∃ z, ∃ A' : ℝ, F.late …` per anchor, so `ShellNode` itself only asserts a per-anchor bound; `bricks` proves the common bound `Q*(2*e)` (with `Q` from `quota_stop` at level `m`) but the structure forgets it. The English definition is stronger than the Lean structure and the Lean producer proves the stronger form; the consumer `stencil_pay` uses only per-anchor boundedness at fixed `m`. No action needed beyond F9.

### L4. NIT (manuscript `actual-stress-annulus.tex` 182-183, 444)

"ordered moving-label point-limit identities": `annular_fieldA`, `zone`, `stencil_pay` assume `F.PointLimits C S` and `Cells.CellHyp C F`; `F.Ordered C S` is a hypothesis of the endpoint `YM.MergeProof.Acme.readyA` (`Emanate.lean`), not of the annulus results. The moving-label limit is `YM.Next.UVStress.Watch.cost_limit` (`Lean/YM/Next/UV_STRESS/Annulus.lean`), hypotheses `hp : F.PointLimits C S`, `H : S.Hierarchy`, `Tendsto V f (𝓝 p)` for a subfilter `f ≤ F.fuse`.

### L5. NIT (manuscript `actual-stress-annulus.tex` 262-271)

English extracts one subnet for the finite tuple of corrections at all stencil points. Lean `stencil_pay` works at one grid point at a time (`he.corners x …`, `finite_extract` for that point's labels) and is applied separately to each point by `zone`. The English is correct but does not follow the source's (simpler) step.

### L6. INACCURACY (manuscript `trace-calibration-producer.tex` 116)

"Positivity and invertibility hold on a cofinal set of scales": source `YM.Trace.Shelves.aprilA` (`Lean/YM/TraceExtension/Shelves/Lore.lean`) is an `∀ᶠ i in atTop` statement, with `b := crown Z J (Stern V) 5 i`, `0 < b` from `measured … ` and `J.positive i`, and `J.U i 5` an equivalence at every `i`. English is weaker than the source and then used as if eventual (F5).

### L7. Records/evidence naming errors (not manuscript)

`actual-stress-shell-nodes-evidence.md` cites `YM.MergeProof.Ribbons.fly`; actual `YM.PhysicalNext.Repeat.Legato.Bandage.fly` in `Lean/YM/MergeProof/Stove.lean` (definition `fog G d (p.clock.hatBeta m)`), and still calls $g_q$ an engineering degree. `actual-stress-annulus-evidence.md` cites `YM.MergeProof.Acme.stencil_pay`; actual `YM.MergeProof.Ribbons.stencil_pay` (`West/Stencil.lean`, namespace `YM.MergeProof.Ribbons`). `trace-calibration-producer-evidence.md` cites `YM.Next.UVStress.finite_extract` in `Lean/YM/Next/UV_STRESS/Extract.lean`; that file does not exist, the lemma is in `Lean/YM/Next/UV_STRESS/Vary.lean`. The C14 `correspondence.md` itself has the right names and paths for the declarations it lists (checked: `YM.MergeProof.winter` in `Tender.lean`, `YM.Extra.Histories.degree` in `Extra/SOURCE_HISTORIES/Birth.lean`, `YM.MergeProof.Accent.plumR` in `Traps.lean`, `YM.Next.UVStress.quota_stop` in `UV_STRESS/Least.lean`, `YM.MergeProof.Ribbons.ShellNode`/`bricks` in `North/Brim.lean`, `YM.MergeProof.Ribbons.stencil_pay`, `YM.MergeProof.Acme.zone`, `YM.MergeProof.Acme.readyA` in `Emanate.lean`). See R4.

## Correspondence of the PR #98 repairs (all matched)

1. Factor degree (shell 92-95, 150). `YM.MergeProof.winter (G) (d) := Extra.Histories.degree ((Labels.frames G).level d) + 4`; `YM.Extra.Histories.degree (F : Labels.Frame G d) := univ.sup (fun i => (F.grades i).2)`; `YM.Labels.Frame.grades : Fin (extra+1) → ℕ × ℕ` with `pure i : basis i ∈ Grade (grades i)`, `bound i : (grades i).1 ≤ d`; `YM.Labels.Grade m` is the weighted-homogeneous submodule for `bidegree`, and `Finsupp.weight bidegree v = (height v, v.sum fun _ n => n)` (`Grading.lean`), variables weighted `(i+2,1)`. So `(grades i).2` is the number of field factors and `winter = g_D + 4` with $g_D$ the maximal factor degree. `YM.MergeProof.fog G d x := (x^winter G d)⁻¹`, `fly p d m := fog G d (p.clock.hatBeta m)`. `YM.MergeProof.Accent.plumR r i := C.S.a i ^ d * Mix.width C r (2*winter G d) i`: the mesh power is the grade `d`, the threshold power uses `winter`. Matched.

2. Quota at fixed birth level (shell 352-366; annulus 74-77, 104-119). `YM.Next.UVStress.quota_stop {k} (h : C.ref D ≤ k) : ∃ a, 0 ≤ a ∧ ∀ N p (x : C.book.Ref D), k ≤ N → ‖x‖ ≤ a * quota C D k N p x`, proved by induction on `k` with step factor `columns(k+1) * block(k)^D`; docstring of `quota`: "Use only at fixed birth time. Product here not claimed uniform". `bricks` calls `quota_stop C hh (hK.trans hk)` i.e. at level `m` (`C.ref D ≤ k ≤ m`), and `m < j < N`. So the constant depends on `m`, not on `N,p`, anchor. Matched; the pre-PR "$Q_0$ independent of birth level" was not supported by the source.

3. Reference labels and quotient (annulus 20-24, 60, 104-109, 234-236, 276-277). `ShellNode` has `z : ℕ×ℕ → C.label D` with `C.label d = (C.labels.level d).Coeff` (`YM/Source/Construction.lean`), a finite coordinate space with its sup norm; `stencil_pay` quantifies over raw `b : C.book.Ref d`, `T : C.book.Ref 4` and projects with `S.project`; `zone` takes fields `B : S.Field 4`, `T : S.Field d` and chooses `S.representative 4 B`, `S.representative d T` with `S.rep`. Matched.

4. Opening dominates watch depths (annulus 185, 274-275). `stencil_pay (q) (hp : ∀ i, (I i).t ≤ q)` calls `acorns (I i) hC hq q (hp i)`; `acorns (k) (hg : I.t ≤ k)` gives `‖moment (fun x => f x * I.plot …)‖ ≤ T.rootTest … f * B` for `f` in the chamber of `center C.S _ _ 0` at depth `k`; the same chamber appears in `ShellNode C q …`. Matched (but see L1 for the choice of `q` per family).

5. Limit order (annulus 262-283). `stencil_pay` concludes, for each `m j ε` and each `ShellNode C q j m B d h b T F ε` and grid point in `arena (fuga (m+1))` with generic watch points, `‖∑ g i * (r^h * asked …)‖ ≤ ε * A` with `A = ∑ a i * ‖g i‖` independent of `m`; the annihilator hypothesis `ht` is used at fixed `m` (`simp_rw [mul_sub, …, ht]`); `zone` then sends `2*(c/pitts C m)*A → 0`. Matched.

6. Remark on the public application (annulus 439-448). `annular_fieldA` hypotheses: `C.Makes`, `Cells.CellHyp C F`, `F.PointLimits C S`, `S.Hierarchy`, `V.Derivatives S`, `Conserved V H.spin J`, smooth Killing `U` homogeneous of degree `p`, `D+(3+p)=d+4`, `Aroma C`. The remark lists the analytic structures correctly but omits `C.Makes` and the non-shell parts of `Aroma` (stock receipt, scale note). See R1.

## Unchanged chapters: correspondence spot checks

- `actual-stress-normalization.tex`: eq. `stress-uniform-tests` is `YM.Next.UVStress.Fades.reads` (`Weak.lean`: for compact `s ⊆ conf n`, `M>0`, `ε>0`, eventually for all tests with `tsupport t ⊆ s`, `‖t x‖ ≤ M`, `‖t.applyTo (K k)‖ ≤ ε`), and `Approaches R U` is `Fades` for every tuple (`Rates.lean`). Matched. Normalizer: `labelScale X k J := transformed (X.U k 4).symm (X.r k ^ 4 • J)`, `strength X k J T := ‖labelScale X k J‖ / ‖T‖`, `balanced_J X J k := (X.xi k)⁻¹ • labelScale X k J` (`Limit.lean`) = $\xi_k^{-1}U_{k,4}^{-1}(r_k^4J)$. Matched. `produce_current` (`Limit.lean`) has inputs `FreeDiv T a p`, `Approaches (path X) (isoPanel X)`, `Stable …` and outputs nonzero conserved `J`, a refined `Scaling Y` with `Approaches`, `Stable` and `Y.meter J.val T.J`. Matched to the chapter's statement; I did not read `differential_rank` or `subsector` bodies.
- `trace-calibration-producer.tex`: `aprilA` (L6). `YM.Trace.Over.year_spec` (`TraceExtension/Chart/North.lean`) is stated for `J : Scaling S` with `Approaches (path J) (isoPanel J)`: the trace calibration uses the same kind of curve as the normalization chapter (relevant to F7). Its trace limit is written `(4*forceR G) • OScale C.book`; I did not verify that `4*forceR G` equals the manuscript's $-\kappa$ (would be decided by the definition of `forceR`, which I did not locate).

## Declarations opened

| Fully qualified name | Path | Matched to English? |
| --- | --- | --- |
| `YM.MergeProof.Ribbons.ShellNode` | `Lean/YM/MergeProof/North/Brim.lean` | yes (English def stronger, L3) |
| `YM.MergeProof.Ribbons.bricks` | same | yes |
| `YM.MergeProof.Ribbons.faraway` | same | yes |
| `YM.MergeProof.Ribbons.sales` | `Lean/YM/MergeProof/North/Siroco.lean` | yes (quota ≤ 2e not derived in English, F3) |
| `YM.MergeProof.Ribbons.Economics`, `.laurelE`, `.fugacious` | `Lean/YM/MergeProof/North/Economist.lean` | yes; English proposition statement not aligned (L2) |
| `YM.Next.UVStress.quota`, `.quota_stop` | `Lean/YM/Next/UV_STRESS/Least.lean` | yes |
| `YM.MergeProof.Ribbons.stencil_pay`, `.arena` | `Lean/YM/MergeProof/West/Stencil.lean` | yes |
| `YM.MergeProof.Ribbons.acorns` | `Lean/YM/MergeProof/West/News.lean` | yes |
| `YM.MergeProof.Acme.Aroma`, `.zone` | `Lean/YM/MergeProof/West/Ozone.lean` | yes except per-family opening (L1) |
| `YM.MergeProof.Acme.annular_fieldA`, private `obtainable` | `Lean/YM/MergeProof/West/Bravo.lean` | yes except L1; faithful family from `observes H D` (F10) |
| `YM.Next.UVStress.Watch.cost_limit` | `Lean/YM/Next/UV_STRESS/Annulus.lean` | yes |
| `YM.Next.UVStress.finite_extract` | `Lean/YM/Next/UV_STRESS/Vary.lean` | yes |
| `YM.MergeProof.winter`, `YM.MergeProof.fog` | `Lean/YM/MergeProof/Tender.lean` | yes |
| `YM.PhysicalNext.Repeat.Legato.Bandage.fly` | `Lean/YM/MergeProof/Stove.lean` | yes (English uses undefined "fly", F4) |
| `YM.Extra.Histories.degree` | `Lean/YM/Extra/SOURCE_HISTORIES/Birth.lean` | yes |
| `YM.Labels.Frame`, `YM.Labels.Frames`, `YM.Labels.frames` | `Lean/YM/Labels/Basis.lean` | yes |
| `YM.Labels.Grade`, weight lemma for `bidegree` | `Lean/YM/Labels/Grading.lean` | yes |
| `YM.Labels.Frame.scaled` (dilation by `t^(grades i).2`) | `Lean/YM/Labels/Reference.lean` | yes |
| `YM.MergeProof.Accent.plumR` | `Lean/YM/MergeProof/Traps.lean` | yes |
| `YM.Next.UVStress.Fades` | `Lean/YM/Next/UV_STRESS/Weak.lean` | yes |
| `YM.Next.UVStress.Approaches`, `.Stations.build_curve` | `Lean/YM/Next/UV_STRESS/Rates.lean` | yes |
| `YM.Next.UVStress.labelScale`, `.strength`, `.positive_strength`, `.balanced_J`, `.produce_current` (statement only) | `Lean/YM/Next/UV_STRESS/Limit.lean` | yes |
| `YM.Trace.Shelves.aprilA` | `Lean/YM/TraceExtension/Shelves/Lore.lean` | English weaker ("cofinal"), L6 |
| `YM.Trace.Over.year_spec` (statement only) | `Lean/YM/TraceExtension/Chart/North.lean` | partially (constant `forceR` not checked) |
| `YM.MergeProof.Acme.readyA` (signature line only) | `Lean/YM/MergeProof/Emanate.lean` | `F.Ordered` hypothesis confirmed |

## What I did not check

Bodies of `mutation`, `pricey`, `lightness`, `Wares`, `near_center`, `trapeze`, `mountain`, `Peak.beneath`, `mars`, `read_grid`, `tenet`, `differential_rank`, `subsector`, `Stations.equivalences`, `harvestedSky`, `boatsSky`/`wakesSky`, `formulate`, `wend`, `transferX`, `mere`, `centerEquiv`; the definition of `forceR`; whether the public route uses the same `Scaling` for `year_spec` and `produce_current`. No Lean build, no `#print axioms`.
