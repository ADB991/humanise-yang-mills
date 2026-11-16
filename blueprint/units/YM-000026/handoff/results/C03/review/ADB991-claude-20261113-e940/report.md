# Independent review of PR #265: unit insertion in the original limiting table (C03, E6)

- Reviewer session: `ADB991-claude-20261113-e940`. Claude (Anthropic), running as a scheduled agent on behalf of ADB991. ADB991 did not review the result before submission.
- Roles: mathematical validity and Lean correspondence, both independent. ADB991 did not author PR #265 or any part of `prop:ex-limits-unit`. Disclosure: ADB991 authored the C04 consumer PR #254 (issue #251), which uses E6. This review checks the producer only.
- Claim: https://github.com/hairer/humanise-yang-mills/issues/261#issuecomment-6864521183
- Reviewed: PR #265 head `4149c67bd35347d05d29b6286e8eeee666301056` (mgubi, session `mgubi-astra-c03-unit-limit-20261113`), against base `codex/existence-monograph` @ `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Content fingerprint: `manuscript/existence/limits.tex` at the head has SHA-256 `a0c96bccb7d77604fbad3d93cf4f7a31718a529f46f30f35b47f4c6393116edf` (base `a55d8e86…1624`). All inspected inputs are listed in `hashes.json`.

## Verdict

**No required change.** `prop:ex-limits-unit` and its proof are correct under the stated hypotheses. Each formal anchor in the author's correspondence exists at the pinned revision and supports the step it is cited for. The proposition supplies C04 `input:unit-insertion` (PR #254 @ `88797b1`, `boundary-detection.tex` lines 257–270) with d₀ = 0 and **1** = e₀,₀, on the same table. Both clauses match: the unit law for all raw labels of arbitrary grades at every pairwise distinct configuration, and the empty-word normalization. Two optional suggestions (N1, N2) follow. This is a conditional producer: the finite calibration, the common ordered point limits and the continuous extension to Conf all remain hypotheses, as the PR itself states.

## Mathematical review, step by step

1. **Finite unit identity.** By hypothesis, L_{r₀}(v) = X v and L_m(e₀,₀) = e₀,₀ for r₀ ≤ m ≤ N, since a_m⁰ = 1. Taking m = r₀ gives X e₀,₀ = e₀,₀, so X⁻¹e₀,₀ = e₀,₀ because X is invertible. D_{N,0} multiplies the degree-q component by τ_N^{−q}. The only nonzero component of e₀,₀ has degree 0, so D_{N,0} fixes e₀,₀. This holds even without τ_N > 0, since τ⁰ = 1. The prefactor is a_N⁰ = 1, and 𝒫₀(e₀,₀; o; A) = 1. Hence 𝒪_{N,p}(**1**; o; A) = 1 for every N ≥ r₀ and every p, o, A. Correct.
2. **Finite deletion and normalization.** The integrands agree pointwise, so the expectations agree. Integrability is not needed for the equality, but the claim is true: the sections are polynomial in matrix entries, hence continuous on a compact space. With n = 0 the right side is the empty product. The arity-zero correlation equals 1 because the Wilson law is a probability measure. Correct.
3. **Mesh limit at fixed period.** For x ∈ Gen, the tail x′ is in Gen. Once P_p exceeds every |coordinate difference| (all nonzero), both x and x′ lie in their cyclic patches. With slotwise addressing, the sample of x′ is the sample of x with slot 0 deleted. Item 1 of `prop:ex-limits-extraction` gives Ũ_j(x) → J_{p,(1,v)}(x) and Ũ_j(x′) → J_{p,v}(x′) along the common mesh subsequence. On the tail N ≥ r₀ these sequences are equal termwise, so the limits agree. The proof's compact-neighbourhood argument is more than item 1 needs, but it is also correct, and it matches the source's lattice-point form (`Meshes.onK` with `evaluated`). Correct.
4. **Period limit.** The identity holds for all large periods. Item 2 sends both sides to S along the same ρ_k, and limits are unique. The thresholds depend only on the fixed period, so no diagonal limit is used. At arity zero, both successive limits of the constant 1 equal 1. Correct.
5. **Density.** Conf ∖ Gen is a finite union of hyperplanes {x_i^μ = x_j^μ}, relatively closed with empty interior, so Gen is dense in Conf. The left side is continuous on Conf (arity n+1). The right side is S_v ∘ tail, which is continuous because tail is a continuous linear map sending Conf_{n+1} into Conf_n. Two continuous functions that agree on a dense subset agree everywhere. Correct.
6. **Scope.** The closing paragraph correctly disclaims construction, convergence, smoothness, field inclusions (E4) and a selected-phase unit law. No circularity: the proof uses only the finite calibration and the limit hypotheses, not C04.

Literature: no external result is needed beyond uniqueness of limits and the fact that continuous functions agreeing on a dense set agree. The author's statement that no background result applies is reasonable.

## Lean correspondence (textual; no elaboration)

| Manuscript step | Declaration (pinned source) | Checked |
| --- | --- | --- |
| insertion formula (eq:ex-limits-unit-insertion) | `YM.Source.initial` (`((a N)^d)⁻¹ • C.places (F.scaled (threshold N)⁻¹ v) o`), `YM.Source.TransferData.cylinder` (`initial … (T.terminal.symm v)`), `YM.Family.O` = `(C.factory d N p).cylinder (C.localSection d) v`, all in `Lean/YM/Source/Insertion.lean` and `Construction.lean` | matches: a_N^{−d} 𝒫_d(D X⁻¹ v) with D = scaled(τ⁻¹), so the degree-q component is multiplied by τ^{−q} (`YM.Labels.Frame.scaled`, `Reference.lean` l.58) |
| calibration laws | fields `reads` (l.111) and `unit_coord` (l.112) of `YM.Source.TransferData.Based`, provided by `YM.Family.Makes.calibrated` for N ≥ ref d | matches at d = 0, where `unitVec … m = (a m)^0 • e0 = e0` |
| scalar coordinate fixed by scaling | `YM.Labels.Frame.e0 = Pi.single 0 1`, `zero_degree`, `scaled_unit` | matches |
| section unit law | `YM.Source.SectionData.Sound.unit : C.evaluate F.e0 = 1`; `places` evaluates at `expandAt o U`; `Makes.sections` | matches |
| finite identity | `YM.Source.TransferData.origin_unit`, `YM.Family.constant` (every d, N ≥ ref d, p, o) | the source is stronger (all grades) |
| raw label | `YM.Family.unit_ref : C.book.scalar d = C.refUnit d` (rfl); `YM.Register.one d = ⟨d, L.scalar d⟩` | matches |
| finite correlations | `YM.Family.num` (∫ ∏ `seen` ∂`law`), `YM.Family.seen` = `O`; `YM.Wilson.law` with its `IsProbabilityMeasure` instance; `integrableR` | matches, including normalization |
| slotwise addressing | `YM.Extraction.address t x i a = ⌈x i a / t⌉`; `Order.grid` slotwise via `gridPoint` | matches: deletion commutes |
| limit transfer | `YM.Extraction.Order.limits_basic` (`Inherited.lean` l.151–193): the `trivial` clause uses `C.num` with the empty product; the `unital` clause uses `Fin.prod_univ_succ`, `C.constant`, `inPatch` on the same fused order, `denseGrid` and `equal` | the manuscript reorganizes the argument (address samples of generic points instead of fixed-level grid points and density). This is a legitimate reordering. |
| target | `YM.Table.Basic.trivial`, `.unital` (`Lean/YM/Euclid/Table.lean` l.75–78) | grade-0 specialization of `unital` plus `trivial`, as claimed |

All qualified names in the author's `correspondence.md` were found at the stated paths and namespaces (`YM.Source`, `YM.Family`, `YM.Labels.Frame`, `YM.Extraction(.Order)`, `YM.Register`, `YM.Wilson`). `denseGrid` is private, as the record says.

## Optional suggestions

- **N1 (optional).** `prop:ex-limits-extraction` describes the address map only by |Q_j(x) − x| ≤ c_n a. The new proof needs slotwise (coordinatewise) rounding. The proposition assumes this ("slotwise address samples"), but one clause defining it would make the hypothesis self-contained, e.g. Q_j(x)_i^μ = a⌈x_i^μ/a⌉ followed by wrapping, as in `YM.Extraction.address`.
- **N2 (optional).** The proof sentence "At a general grade the physical unit coordinate at level m is a_m^d e_{0,d}" refers to an object that is not in the hypotheses, which are stated for grade 0 only. It is harmless and could be dropped or marked as context.

## Evidence (commands actually run)

- `git fetch origin pull/265/head` → `4149c67…`; `git fetch origin pull/254/head` → `88797b1…`.
- `python3 -I blueprint/units/YM-000026/handoff/results/C03/author/mgubi-astra-c03-unit-limit-20261113/verify.py` in a worktree at `4149c67`: `PASS 16 before/after/frozen versions; 13 source-manifest hashes; unchanged Lean/source diff`.
- At `4149c67`: `python3 scripts/check_blueprint.py` → `Blueprint structure OK: 4 units.`; `python3 -m unittest discover -s tests` → `Ran 22 tests … OK`.
- From `manuscript/` at `4149c67`: `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` → exit 0, 984 pages, no `undefined` in the log. The proposition is Proposition 26.4 on p. 132. Pages 132–134 were rendered with `pdftoppm -r 80` and inspected: statement, displays (120)–(121), the proof, and the scope paragraph through Remark 26.6, with no clipping or overlap.
- Textual reads of the Lean declarations in the table above. Lean files are byte-identical between base and head (checked in `hashes.json` generation).
- On this report branch: `python3 scripts/check_blueprint.py`, `python3 -m unittest discover -s tests` and `git diff --check` (see the PR body).

Not performed: Lean elaboration or `#print axioms` (no Mathlib cache reachable from this environment), and no combined build with PR #254 or #257. This review does not establish that the actual public construction discharges the incoming hypotheses.
