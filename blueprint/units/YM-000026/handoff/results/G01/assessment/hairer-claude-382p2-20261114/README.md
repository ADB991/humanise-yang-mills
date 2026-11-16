# #382 item 2: selection of the distinguished phase (audit report)

- **Session:** `hairer-claude-382p2-20261114` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/382#issuecomment-6880701314
- **Base:** `codex/existence-monograph` @ `e91c050`.
- **Pin:** `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. All 16 Lean files cited here match `Lean/SOURCES.sha256`. The SHA-256 of every cited file is in `hashes.json`.
- **Status:** report-only and unreviewed. This is a **textual** reading of the source. No Lean was elaborated, and there was no build. Where I say a declaration is "used" or "not used", the evidence is `grep` over `Lean/YM` and a reading of the proof terms, not a dependency graph from Lean.
- **Question (#381 report, item 7):** the assessment describes the selected phase by two conditions:
  1. a one-dimensional ground space;
  2. a vanishing short-distance limit `r^8 S^ξ(τ_e(0) τ_e(r e_0)) → 0` for every shift `e`, along one common subsequence `r_{n_k}`.

  The monograph states only the first. Does the source's selection use the second?

Labels: (Q) quoted source or text; (I) my inference; (U) not checked.

## Answer in one paragraph

The source contains **two** selection constructions:

- **Headline route.** This route builds the `Spec.Final` used by the public existence theorem. It selects a phase by condition 1 only.
- **Echo route.** A second construction, `YM.Trace.echo_tab`, selects by conditions 1 and 2 together. This is the assessment's set E, word for word.

As far as `grep` shows, `echo_tab` does not feed the headline. On the headline route, the trace short-distance law is not a selection condition. It is proved afterwards for **every** `Spec.Final` (`R2IGoals.Broad.trace` is quantified over all `F`).

The monograph's C15 argument has the same shape as the headline route. The rounded comparison (`trace-rounded-comparison.tex`, Step 2) gives its bound for every character χ ∈ Ξ, not just almost every one. So no second selection condition is needed.

Verdict: the monograph's one-condition selection (`ex-pure-ground`, outline Step 6) matches the source's headline construction. The assessment's description matches the source's Echo construction. There is no contradiction, but a sentence in the monograph would forestall the question (see Recommendations).

## 1. The source's headline selection (condition 1 only)

The chain below was traced from the public theorem down. Each step names the declaration and file.

1. **Headline theorem.** `YM.Nonperturbative.existence` (`Nonperturbative/Headlines.lean` 19–37) takes `F` from `continuum_with_position_tests`. Its trace clauses are `core.trace.centered`, `core.trace.shortDistance`, and so on.
2. **Continuum.** `continuum_with_position_tests` (`Nonperturbative/Continuum.lean` 28–50) obtains `F` from `(R2IGoals.fromFunded W hG funded).refine p`.
3. **Campaign.** `R2IGoals.fromFunded` (`R2I/Campaign/Accepted.lean` 150–167) obtains `F` from `R.extractible17 h he.toPackage (f.refine g)`.
   - (Q) The same structure `Broad` has a field `trace : ∀ (f:Extraction.Order) (S : Table R.family.book) (F:Spec.Final R.family f S), Trace.Target.Result.{u} F h` (l. 135).
   - It is filled by `Trace.Target.assembled F h (…)` for an *arbitrary* `F` (l. 153–154).
4. **Extraction.** `Run.extractible17` (`RG17/Joint.lean` 61–90) obtains `F` from `Pert.withFinal hc p.uv c U J H hK'`.
5. **Final.** `Pert.withFinal` (`Pert/Construction.lean`) obtains `⟨α, hα⟩ := he.cleanse T.locality` and packs `α` into the `Final`.
6. **Selection.** `Org.Phase.Loom.cleanse` (`Org/Phase.lean`):
   - It builds the resolution `R` of the ground space (the character space with its measure `R.μ`).
   - It builds the phase chambers `D i`.
   - It builds a countable family `q` of positive words via `ht.horizon B D`, which is dense in every phase.
   - It then takes `⟨i,hi⟩ := Cluster.selects A D q hq …`.
7. **What `Cluster.selects` gives.** In `Phase/Unique.lean` 111–114, `Cluster.selects` is `(lifts …).exists`. Here `Cluster.lifts` (l. 91–110) proves `∀ᵐ i ∂R.μ, (D i).UniqueHeat`.
   - (Q) `UniqueHeat` is `∀ v : C.D, ∃ z : ℂ, z • C.omega0 = v` (`Phase/Mixture.lean` 35). That is, the ground space is spanned by the vacuum.
8. **Recording the choice.** `OS.Selection` (`Phase/Mixture.lean` 127–134) records the chosen point as `atPoint`. `Selection.Certificate.heat : C.leaps.UniqueHeat` (l. 147) is the only selection property in the certificate.

(I) So the selected point on the headline route is *any* point of the full-measure set where the ground space is one-dimensional. No trace or two-point condition enters the choice.

The older conditional route `Next.BOUNDARY.at_order` (`Next/BOUNDARY/Assembly.lean` 113–141) uses the same `cleanse`.

**Comparison with the monograph.**
- `ex-pure-ground` (`phase-selection.tex` 129–180) is the same argument as `Cluster.lifts`.
- `ex-phase-horizon` (l. 98–127) is the source's `horizon`: a countable collection of words, dense in every phase.

(I) This is a faithful transcription of the source.

## 2. Where the trace law enters on the headline route

`TraceExclusions.shortDistance` (`Nonperturbative/HeadlineSpec.lean` 92–94) states the following for the `Final` `F` of the headline:

```
Tendsto (fun s : ℝ => ((s^8 * (Real.log s⁻¹)^2) : ℝ) • euclidean F s) (𝓝[>] 0) (𝓝 (Trace.Verse.award G : ℂ))
```

Here `euclidean F s` is the selected-phase two-point function of the centred trace at `(0,s e_0)` (`TraceExtension/WilsonTrace.lean`, with `selected F := F.α.ensemble F.α.atPoint`).

Its producer is `Trace.Target.Result.shortDistance : EuclideanAsymptotic F (award G)` (`TraceExtension/Endpoint.lean` 99–121). It is proved by `Trace.Target.assembled` from an `Arena F h`, for any `F`.

(I) The limit is a full limit `s ↓ 0`, not a subsequential one, and the log-squared factor is present. It is a *conclusion* about whatever phase `cleanse` chose. It is not a criterion used to choose it.

(U) I did not trace how `Arena F h` controls an arbitrary phase. In particular I did not unfold the ultrafilter in `Result.stress`. Whether that step is uniform over phases, or uses the specific `atPoint`, is not checked here.

## 3. The Echo route (both conditions, as in the assessment)

`YM.Trace.echo_tab` (`Trace/Revel.lean` 95–152) is introduced by the comment:

> (Q) "adapt Loom.cleanse. One common choice can be made for the heat law AND the trace along a further sequence, not a claim on every pure phase or upgrading by interchanging limits."

It repeats `cleanse` up to the ground resolution, then does the following.

- `hHeat := Cluster.lifts K q hq …` gives a.e. `UniqueHeat`.
- `⟨n,hn,hE⟩ := submits …` gives the second condition. (Q) `Trace.submits` (`Trace/Estate.lean` 171–177) concludes `∃ q : ℕ → ℕ, StrictMono q ∧ ∀ᵐ x ∂ R.μ, ∀ e : ℝ, Tendsto (fun i => frontCount (p x) (X.r (q i)) (energyLine J.energy (X.r (q i)) e)) atTop (𝓝 0)`. This is a single strictly increasing subsequence, an a.e. set of phases, and every shift `e`.
- `⟨w,hi,hW⟩ := (hHeat.and hE).exists` chooses a point in the intersection.
- The `Echo` structure records the result as `retreats : ∀ e : ℝ, Tendsto (fun i => (path.r (along i):ℂ)^8 * restTrace final e (path.r (along i))) atTop (𝓝 0)` (l. 87–88). It also records the subsequence `along` with `rate : StrictMono along`.

(I) This is exactly the assessment's set E (#381 report, item 7): `dim G_ξ = 1` and, for all `e ∈ ℝ`, `r_{n_k}^8 S^ξ(τ_e(0) τ_e(r_{n_k} e_0)) → 0`, with `ν(E) = 1` and `ξ_* ∈ E`. The garbled formula in the #381 report is confirmed: the exponent is 8, there is **no** log factor, and the limit is **zero**.

The output of `echo_tab` reaches only these two places:

- `graduated_echo` and `actual_echo` (`Trace/Revel.lean` 157–185);
- `Trace.echo_with_services` (`Trace2/Transfer.lean` 17–26).

A `grep` for `Echo C`, `echo_tab`, `graduated_echo`, `actual_echo`, `echo_with_services` and `LogAgreement` over `Lean/YM` finds no other use.

(I) The modules are imported by the headline (`YM.Trace.Revel` and `YM.Trace2.Transfer` are in the import closure of `YM.Nonperturbative.Headlines`, by a script over `import` lines). However, the headline's `Final` does not come from `echo_tab`.

(U) Whether the assessment's committee read the Echo route as the selection, or whether some other file of the source routes `Echo` into a public statement, is not checked. A Lean dependency query (`#print axioms`, or a used-constants walk) would settle the second point.

## 4. The monograph's side

- **Selection.** Outline Step 6 (`argument-outline.tex` 266–278) and `phase-selection.tex` describe condition 1 only. This matches section 1.
- **Use in C15.** The trace input (`input:trace-scales`, `trace-asymptotic.tex` 204–) concerns `T(r)` for the selected character χ_* (`assembly.tex` 47–57). Its pointwise clause is derived in `trace-rounded-comparison.tex`. There, Step 2 (l. 252–262) proves `|S_χ(w) − (κ + j_0 j_1)| ≤ ε_i(1 + |j_0| + |j_1|)` for **every** χ ∈ Ξ. It does this from the moment bounds at Ω and the full-support representation (Ph1), via `ex-character-moments`.

  (I) That is a sup bound over characters, so it holds at whichever χ_* was selected. No intersection with a further a.e. set is needed, and no subsequence depends on χ. The subsequences in `input:trace-scales` are fixed by the comparison data before any character enters.
- **One place where "the selected character" is singled out.** (Ph3) asks for the null relations "for the selected character χ" (`trace-rounded-comparison.tex` 153–158). By Proposition `ex-no-new-null` and the outline, these hold for every character. (U) I did not check that proposition's detector hypotheses against the C15 use.

(I) The monograph follows the source's *headline* design: select by condition 1, then apply the trace argument at the selected character. Step 2 gives character-uniform bounds under the comparison hypotheses. Step 3 identifies the correlations at any character where the null-relation clause of (Ph3) holds, in particular at the selected character under that assumption.

The monograph's limit `r^8 log²(r^{-1}) T(r) → 3 dim g/π^4` is a full limit. It is strictly stronger than the Echo condition. The Echo condition follows from it for every fixed real shift `e`. (I) Write `μ` for the vacuum value of `τ` at χ_*. Then `τ_e = Θ + (μ − e)·1`, so

`S(τ_e(0)τ_e(r e_0)) = T(r) + (μ − e)² + 2(μ − e)·S(Θ)`.

- The last term is zero, because the one-point function of Θ vanishes (`assembly.tex` 52).
- The constant term satisfies `r^8 (μ − e)² → 0`.
- By the trace law, `r^8 T(r) = O(log^{-2} r^{-1}) → 0`.

Hence condition 2 holds for every `e`, along every sequence. It is a *consequence* of the monograph's conclusion at χ_*, not an extra requirement.

(U) This assumes that the assessment's τ is the source's uncentred trace, with Θ its centring at χ_*. I did not unfold `restTrace` to confirm this.

## 5. Recommendations (for C04/C15 and the statement section; nothing is changed here)

1. **Add one sentence after `ex-pure-ground` or in outline Step 6.** For example: "The selection uses only the one-dimensional ground space. The trace asymptotic of Section … is then proved at the selected character; the bounds of Step 2 in `subsec:trace-rounded-comparison` are uniform over χ ∈ Ξ, and Step 3 identifies the correlations using the null relations at the selected character." This answers the assessment's description directly.
2. **Optionally, add a remark for readers of the assessment.** The source also contains a variant (the Echo route) that selects by an additional vanishing condition `r_{n_k}^8 S^χ(τ_eτ_e) → 0` along one subsequence for all shifts `e`. This condition follows from the trace law of `ex-trace-limit` at the selected character (section 4 above), so no change to the target is implied. AGENTS.md forbids Lean names in the main text, so the remark should describe the condition mathematically.
3. **Correct the #381 report's item 7 reconstruction (G01, author's call).** The formula for E has exponent 8, no logarithm, limit 0, and quantifies over all shifts e ∈ ℝ, as reconstructed. The new information is that this is the Echo construction, not the one behind the headline `Final`.
4. **For (U) in section 3, if wanted:** a used-constants query on `YM.Nonperturbative.existence` at the pin, run by someone who can build, would confirm that `echo_tab` is not in the proof. Expected outcome: absent.

## Checks actually run

- `grep`/`sed` reads of the 16 Lean files and 5 manuscript files and the #381 report listed in `hashes.json`.
- SHA-256 of the cited Lean files compared with `Lean/SOURCES.sha256` (16/16 match).
- An import-closure script over `import` lines from `YM.Nonperturbative.Headlines` (9456 modules reached; `YM.Trace.Revel` and `YM.Trace2.Transfer` are in it).
- No Lean elaboration, no build, and no LaTeX build (no `.tex` file changed).
