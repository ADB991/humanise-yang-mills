# C04: renewed review of revision 1 (agent review, no human acceptance)

- Unit: YM-000026, package C04, issue #45.
- Role: Lean correspondence and mathematical validity of the author's revision 1.
- Human reviewer: `schmittj` (account under which the agent review is submitted; no human acceptance is recorded).
- Agent assistance: one read-only Codex `gpt-6-astra` pass over every hunk of the revision, with the first review's findings as checklist; a Claude session then checked the residual points against the Lean text and the revised chapters (see "Verification by the coordinating session").
- Reviewed content: commit `7d396d2` (author PR #88, merged), i.e. `git diff 7d396d2~1 7d396d2`: ten chapters and the author's records. The eleven chapter hashes agree with the author's revision handoff, and the parent hashes with those of the first review.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Review task and PR: issue #45; first review in this directory (PR #76); author PRs #66 and #88.
- Outcome: **the revision resolves the first review; three small wording points remain.** The false cutoff sentence in `locality.tex` is corrected, the quantifiers of `prop:word-motion` now match `YM.Boundary.Cups.time`, the translation identity is part of the statement of `prop:heat-cups`, and the ledger no longer names producers that do not produce. No error was introduced. The cross-package inputs stay open and are recorded as such: the construction of the inclusions between field levels (E4), the production of a nonzero field on the actual hierarchy, and the identification of the C05 consumer.

## Still requested

1. **`complex-heat.tex` 105–116: the new coordinate paragraph.** The permutation \(C(t,\mathbf x)=(\mathbf x,t)\) does not carry the Minkowski form, the forward cone and the Lorentz group "to themselves"; it carries the time-first realisations to the time-last ones (\(\eta_{\rm last}=C\eta_{\rm first}C^{T}\), \(\Lambda_{\rm last}=C\Lambda C^{-1}\)), and statements transfer under these substitutions, not "verbatim". The paragraph should also say that Euclidean insertion points keep the notation \((x,y)\) with the time coordinate last in `analytic-boundary.tex`, `heat-vectors.tex` and `lorentz-covariance.tex`. Proposed wording is in new issue 1 below.
2. **`results/C04/correspondence.md` line 67.** `YM.Boundary.tents` needs half-space support for every label tuple in addition to `Urs W K`; the manuscript and the ledger have this right, the new correspondence row does not.
3. **`full-tube.tex` 225–226.** "does not preserve" should be "need not preserve": for arity one the multiplier is the identity.

For other owners: the theorem-specific locator in the shared bibliography entry for Williams (M9) and the canonical `reconstruction-evidence.md` rows (L3, L4) are outside the C04 author's scope and unchanged.

## Verification by the coordinating session

- `Lean/YM/Shift/Closing.lean`: `lemma tents (W : Surface S) (K : Spins S) (h : Urs W K) (hv : ∀ (v : Fin n → S.Union), dsupport (Distn.fourier (W.W n v)) ⊆ half n) (p : Fin n → S.Union) : dsupport (Distn.fourier (W.W n p)) ⊆ coneM n`. The hypothesis `hv` is the half-space support of request 2.
- `Lean/YM/Space/Index.lean`: `abbrev timeAxis : Axis := Fin.last 3`, so the source is time-last, as the new paragraph says.
- `manuscript/existence/complex-heat.tex` 105–116 was read at the revision: the sentence "carries the Minkowski form \(t^2-|\mathbf x|^2\), the forward cone and the Lorentz group to themselves ... transfers verbatim" is as quoted in new issue 1.

The remaining rows of the table are the agent pass's verdicts with its evidence; they were read and found consistent with the diff, but not each re-derived.

## Finding-by-finding table and new issues (agent pass)

| finding | verdict | evidence (file:line) | what remains |
|---|---|---|---|
| M1 — locality cutoff | RESOLVED | `locality.tex:202–211`: “\(f_R=\chi(X/R)f\)” and “compact support contained in \(\operatorname{supp}f\subset O_{ij}\)”. Leibniz’s rule and one additional decay weight give convergence in every Schwartz seminorm, as stated at `lorentz-covariance.tex:95–99`. This matches `YM.Boundary.Probe.cap_support`, `finite_cap`, `persistent` (`Lean/YM/Shift/Cut.lean:44–45,83`). | None. Continuity of the two distributions, including the fixed permutation pullback, gives exactly the required limit. |
| M2 — E4 producer | RESOLVED **as a ledger correction** | `ledger.md:45`: “**input; producer statement not identified**.” `limits.tex:285–287` disclaims the construction; `ope-prescription.tex:9–20` assumes the inclusions and quotient; `physical-angular-actions.tex:225–228` assumes the original inclusion identity. | The mathematical construction remains missing. Lean distinguishes `DiffPlan.rise` (`Differential.lean:20–22`), its correlation compatibility (`:58–60`), injectivity/composition/identity (`:78–92`), and coverage/common levels (`Union.lean:37–53`). `Table.pin_inj` alone does not construct the inter-level inclusions. |
| M3 — existence of a nonzero field | RESOLVED **as a ledger correction** | `ledger.md:66`: “also needs a nonzero union label”. `YM.Table.alive` (`Null.lean:102`) supplies a nonzero unit class under `S.Basic`; `pin_inj` preserves nonvanishing. `ChallengeSpec.lean:121` separately requires `acts`. | Instantiate this producer on the actual hierarchy and connect it to the reconstructed label space. C04’s conditional detection theorem does not supply that instantiation. |
| M4 — coordinate convention | PARTLY RESOLVED | `complex-heat.tex:104–116`: “with time first” and “carries … the forward cone and the Lorentz group to themselves”. | The intended change of coordinates is valid, but the preservation wording and blanket scope need correction. Euclidean tuples remain time-last in several C04 passages. See new issue 1. |
| M5 — translation quantifiers | RESOLVED | `reconstruction.tex:180–187`: “for every translation \(a\) and every word \(b\) there is \(\varepsilon=\varepsilon(a,b)>0\)” with equality for \(0<t<\varepsilon\). `YM.Boundary.Cups.time` (`Lo.lean:41`) is eventual equality for each fixed word and translation, with `till = 𝓝[>] 0` (`:17`). | None. Taking the limit separately for each word is sufficient; boundedness extends the resulting intertwining identity to the completion. No uniform threshold is needed. |
| M6 — translation clause of heat cups | RESOLVED | `heat-vectors.tex:110–116`: “for every \(a\in\mathbb R^4\), every word \(b\) and every \(t>0\)” followed by \(h_t(\tau_ab)=T_E(a)h_t(b)\). The proof at `:138–151` establishes precisely this identity. `YM.Bid.Roof.time` (`Grow.lean:27`) and `YM.Work.C23.heatCup_shift` (`C23.lean:207–216`) have this range. | None. The sign \(f(\cdot-a)\), the definition \(T_E(a)=V(a^0)U(\mathbf a)\), and the use at `boundary-detection.tex:166–168` agree. |
| M7 — E3 | RESOLVED | `ledger.md:44` now cites “selected-phase slab bound `ex-phase-slab-bounds`” and “padding/semigroup laws `ex-slab-laws`”. `phase-regularity.tex:162–201` transfers the operator bound with unchanged constants; `phases.tex:104–116` supplies both padding laws. `actual-slab-copy-bounds.tex:219–234` supplies the unselected bound. | These are conditional producers. Applying the bound to one insertion with buffer \(p\), and padding on both sides, gives the two required formulas. Their underlying construction inputs remain open. |
| M7 — E5a/E5b | RESOLVED | `ledger.md:47–48` separates the Euclidean axioms from “\(O(4)\) covariance … with the calibrated compatible representation \(R\)”. `phase-regularity.tex:117–130`, through `ex-phase-caps` at `:12–30`, supplies the first group. `reflection-transport.tex:127–179` supplies character covariance using the action constructed at `physical-angular-actions.tex:195–239`. | The hypotheses of reflection transport and calibration still require integration. The ledger correctly no longer treats `phases.tex:119–122`, which assumes covariance, as its producer. |
| M7 — null equality | RESOLVED | `ledger.md:52`: “`ex-no-new-null` … applied with C14’s finite detectors”. `phase-fields.tex:58–99` proves equality under eventual surjectivity and convergence to an injective detector; `:102–119` identifies the intended application. | Verify those detector inputs on the same hierarchy. Renaming the exposition edge to C03 does not remove its C14 prerequisites; the revised row retains them. |
| M7 — outgoing C14 edges | RESOLVED | `ledger.md:64–65`: “Euclidean application only” versus “after the calibrated action … is fixed”. These match `physical-ward-packet-prices.tex:29–38` and `phase-ward-inheritance.tex:172–202`. | The two applications still need their respective same-data checks. The early spectral application uses neither Lorentz covariance nor vacuum uniqueness. |
| M8 — entire label extension | RESOLVED | `ledger.md:36`: “compatible real action”; “entire one-parameter extension … is proved in `locality.tex`”. The argument is at `locality.tex:86–102`, matching `YM.Work.C18.entire` (`C18.lean:46–54`). | None. |
| M9 — Williams bibliography locator | NOT ADDRESSED; deferral acceptable | `findings.md:118`: “shared bibliography, left to G03”. `manuscript/existence.tex:279` still says “Theorem 2.13, pp. 29--31”. The chapter correctly cites [Williams, Theorem 2.19, printed p.34](https://math.dartmouth.edu/~dana/bookspapers/cstar.pdf). | Remove the theorem-specific locator from the shared bibliography. Editing it is excluded by `handoff/C04.md:28–32`. |
| M10.1 — frequency cutoff (B-I-2) | RESOLVED | `boundary-detection.tex:29–38`: “\(\eta_R=\eta(\cdot/R)\)” and “\(\eta_R\widehat f\to\widehat f\) in Schwartz space”. The cited cutoff argument applies in frequency space. Fourier inversion has the stated normalization and continuity in [Melrose, §1.7, Theorem 1.3](https://math.mit.edu/~rbm/iml/Chapter1.pdf). | None. Multiplication by fixed \(\chi\) is continuous by Leibniz’s rule. |
| M10.2 — exponential multiplier (C-I-4) | PARTLY RESOLVED | `full-tube.tex:225–230`: “extends the equality of the outer expressions”. This is the correct density argument and matches `YM.Work.C15.partialD_psi` (`C15.lean:83–99`). | The categorical claim that the bare multiplier “does not preserve” Schwartz space has a degenerate exception. Replace it by “need not preserve”; see new issue 3. |
| M10.3 — topology in the boundary theorem (A-I-3) | RESOLVED | `analytic-boundary.tex:167–170`: “for each fixed \(f\)” and “weak-\(*\) continuous”. The dominated-convergence proof at `:196–215` proves exactly this. `YM.Boundary.Waves.maintains` (`Breath.lean:78–80`) likewise states continuity for each fixed test on weakly ordered heights. | None. No stronger topology on the distribution space is asserted. |
| M10.4 — measure uniqueness (B-I-3) | RESOLVED | `spectral-measure.tex:130–137`: “compact sets form a \(\pi\)-system generating the Borel \(\sigma\)-algebra”. For positive integers \(k\), the displayed functions are compactly supported and decrease to \(1_K\). Finite measure permits dominated convergence; compact exhaustion gives equal total masses. | None. Dynkin’s theorem applies, adjoining the whole space to the compact-set \(\pi\)-system if desired. The measures used here are positive and finite (`:24–25`). |
| M10.5 — finite-level representation (B-II-1) | RESOLVED | `fourier-support.tex:103–107`: “preserves every finite-dimensional field level and is continuous there; only the covariance identity is used below”. This matches the action specified at `lorentz-covariance.tex:26–28` and the levelwise `Spins.Descends.spin` (`Star.lean:30`). | None in the manuscript. The associated new correspondence sentence needs the correction in issue 2. |
| M10.6 — reuse of affine-continuity proof | RESOLVED | `lorentz-covariance.tex:115–119` now states continuity “from the group of invertible affine maps”. `boundary-detection.tex:160–163` cites that statement. The proof at `lorentz-covariance.tex:129–141` uses only bounded affine coefficients, bounded inverses and Schwartz tail estimates. | None. This is a valid extension beyond the Poincaré-only statement of `YM.Bid.C08`; its proof supplies the extension without additional hypotheses. |
| L1 — definition and content of C08 | RESOLVED | `correspondence.md:18`: “first conjunct of `YM.Bid.C08`”; the second conjunct is separately identified. `Corners.lean:99–101` contains precisely continuity and the boost derivative. `C28.lean:43` uses `H.1`. | None. |
| L2 — meaning of Urs | RESOLVED | `correspondence.md:28–37`: “pair of **conclusions**”. `Closing.lean:83–85` gives translation invariance and Lorentz covariance, with the same pullback direction; `Corners.lean:103–106` makes `Urs W K` the conclusion of C09. | None. The corollary legitimately combines C09’s conclusion with C28. `Probe.along_at` and `Joint.gpush_at` were opened; they confirm the pullback convention. |
| L3 — private helpers and namespace | PARTLY RESOLVED; canonical-file deferral acceptable | `correspondence.md:83–92`: helpers “are `private`”; the public name is “`YM.Boundary.NearPair.actor`”. The cited declarations and visibility match the pinned files. | `reconstruction-evidence.md:154–159` remains unchanged. Integrate this correct supplement into the canonical evidence when its owner revises it. C04’s instructions explicitly require evidence revisions in its report directory. |
| L4 — complex-heat strengthenings | PARTLY RESOLVED; canonical-file deferral acceptable | `correspondence.md:70–81`: “The manuscript statement generalises the source”; “The converse is proved in the manuscript”. `Rows.lean:133` concerns supplied spatial translations; `Spectrum.lean:64` gives time-fixed ⇒ heat-fixed. The manuscript’s extra arguments are at `complex-heat.tex:95–101,139–145`. | The canonical evidence rows at `reconstruction-evidence.md:11–14` still need these annotations. The supplement accurately records both differences. |
| L5 — original-to-selected null inclusion | RESOLVED | `ledger.md:46`: “Distinct from, and weaker than, the null equality edge”. `phase-regularity.tex:68–106` proves the all-exterior inclusion for every character. It matches `Table.respects` (`Lift.lean:20`) and its use in `C01.singles_agree` (`:82–89`). | The union-level construction additionally uses E4’s inclusion compatibility, which remains separately open. |
| L6 — levelwise actions | RESOLVED | `fourier-support.tex:103–107`: “preserves every finite-dimensional field level”. No finite-dimensionality or topology of the entire union is asserted. | Same result as M10.5. The proof requires covariance and the already established half-space support; see issue 2 for the record’s omission. |
| L7 — C05 edge | RESOLVED **as a ledger correction** | `ledger.md:62` restores “compact Ward identity” and “mixed and selected continuations remain distinct”, and says the consumer declaration is not named. `YM.Bid.C03` (`Corners.lean:56–57`) is indeed existential in \(F\). | Identify the actual C05 consumer and bind its reader to the continuation produced here. The edge correctly remains open. |
| L8 — Cups.time quantifiers | RESOLVED | `reconstruction.tex:180–184`: “every … \(a\) and every word \(b\)” with \(\varepsilon(a,b)\). `Cups.out.volume` (`Lo.lean:59–60`) takes precisely the corresponding eventual-equality limit. | None; see M5 and M6. |
| L9 — continuity route | RESOLVED | `correspondence.md:39–47`: “letter by letter” versus “pulls back the joint test by the affine map”. `C28.lean:31–43,67–78` confirms the source route; the expanded affine lemma supplies the manuscript route. | None. |

1. **INACCURACY — the coordinate paragraph conflates passive re-expression with preservation of fixed coordinate objects.**

   Location: `complex-heat.tex:107–116`.

   > “This permutation … carries the Minkowski form … the forward cone and the Lorentz group to themselves … every statement … transfers verbatim.”

   Let \(C(t,x_1,x_2,x_3)=(x_1,x_2,x_3,t)\). The correct relation is
   \[
   \eta_{\mathrm{last}}=C\eta_{\mathrm{first}}C^{T},
   \qquad
   L_{\mathrm{last}}=CL_{\mathrm{first}}C^{-1}.
   \]
   These are different coordinate realizations. With the time-first matrix held fixed, \(C\) does not preserve its form or cone: \(e_0\) is timelike, whereas \(Ce_0=e_3\) is spacelike. The intended passive interpretation is valid, but “to themselves” and “verbatim” obscure the required substitutions.

   The blanket convention also fails to identify an existing exception: Euclidean insertions remain \((x_i,y_i)\) at `analytic-boundary.tex:60` and `heat-vectors.tex:51,57`, and \(S(v;(x,Y))\) at `lorentz-covariance.tex:74,84`. Minkowski coordinates elsewhere in C04 consistently use time first.

   Lean evidence: `YM.timeAxis = Fin.last 3` (`Space/Index.lean:20`); `YM.Mink.divide` returns `(spatial x,time x)` (`Mink/Geometry.lean:39–48`); the form and cone use that distinguished time coordinate (`:77–79`). The Lorentz subgroup is defined by preserving those objects (`Mink/Lorentz.lean:32–33`).

   Proposed wording:

   > In these sections Minkowski coordinates are written \((t,\mathbf x)\), with time indexed by \(0\). Euclidean insertion points retain the notation \((\mathbf x,y)\). The coordinate change \(C(t,\mathbf x)=(\mathbf x,t)\) identifies the Minkowski convention with that of Section …: \(\eta_{\mathrm{last}}=C\eta_{\mathrm{first}}C^T\), \(a_{\mathrm{last}}=Ca\), and \(\Lambda_{\mathrm{last}}=C\Lambda C^{-1}\). It maps the corresponding forward cones onto one another and preserves Lebesgue measure and the Euclidean Fourier pairing. Statements transfer under these substitutions.

2. **INACCURACY — the new correspondence row omits a substantive hypothesis of `tents`.**

   Location: `correspondence.md:67`.

   > “`YM.Boundary.tents` … needs only `Urs W K`”

   Its declaration at `Lean/YM/Shift/Closing.lean:106–107` also requires
   ```lean
   hv : ∀ (v : Fin n → S.Union),
     dsupport (Distn.fourier (W.W n v)) ⊆ half n
   ```
   Covariance alone does not imply forward-cone support. The manuscript correctly invokes the missing input at `fourier-support.tex:119–120`, and `ledger.md:26` correctly lists `prop:half-support`; this is a new error confined to the correspondence summary.

   Proposed wording:

   > `YM.Boundary.tents` requires `Urs W K` and half-space support for every label tuple, supplied here by `prop:half-support`. It requires no continuity or finite-dimensionality assumption on the label action.

3. **NIT — the bare exponential multiplier does preserve Schwartz space when the shift is zero.**

   Location: `full-tube.tex:225–226`.

   > “multiplication by \(e^{-d(y)\cdot p}\) does not preserve \(\mathscr S\)”

   This is generally true for nonzero real \(d(y)\), but the chapter explicitly includes arities zero and one (`:20–21`). For \(n=1\), the tuple \(y=(0)\) is strictly ordered vacuously, and the multiplier is the identity. The density repair remains valid in this case.

   Lean likewise permits arbitrary `n : ℕ` and only assumes `y ∈ east n` in `YM.Work.C15.partialD_psi` (`C15.lean:17,83–86`); it does not exclude this case.

   Proposed wording:

   > “…since multiplication by the bare exponential need not preserve \(\mathscr S\).”

All hunks in the ten chapters and six record files were inspected. All six reference targets occurring in added lines exist uniquely; all 54 C04 reference targets resolve without duplicates. The eleven current chapter hashes match the revision handoff, and their parent hashes match the first review. Twenty-seven inspected Lean files match the local source checksum manifest for revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. `git diff --check` passed; the worktree remained unchanged.

## Not checked

- No Lean build, elaboration or axiom audit was performed. Correspondence judgments use source definitions, types and proof text.
- The author’s LaTeX builds, rendered-page checks and test runs were not reproduced; their historical execution cannot be established from the report alone.
- No complete transitive audit of C03/C14 construction inputs or endpoint integration was performed. E4, nonzero-label production and the C05 reader identification remain open.
- The cited BHV PDF timed out, so its exact SNAG statement was not rechecked. Williams and Melrose were checked.
- GitHub API access failed; available web pages did not expose the complete renewed-review discussion or PR #76. The supplied first-review reports and local revision responses were used.

## Acceptance

None recorded. This is an agent review submitted under the account `schmittj`. Material changes to the chapters need renewed review.
