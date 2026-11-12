# C05: renewed review of revision 2 (agent review, no human acceptance)

- Unit: YM-000026, package C05, issue #46.
- Role: Lean correspondence and mathematical validity of the author's revision 2.
- Human reviewer: `schmittj` (account under which the agent review is submitted; no human acceptance is recorded).
- Agent assistance: one read-only Codex `gpt-6-astra` pass over every hunk of the revision, with the first review's findings as checklist; a Claude session then checked the residual points against the Lean text (see "Verification by the coordinating session").
- Reviewed content: `git diff 8b15d44 889deac` of the author's draft PR #72 (ten chapters, the author's records), i.e. revision 2 at commit `889deac`. The ten chapter hashes of revision 2 agree with the author's `validation.md`.
- Source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.
- Review task and PR: issue #46; first review in this directory (PR #79); author PR #72.
- Outcome: **the revision resolves the first review's main findings; three small changes are still requested.** Of the 27 findings (M1–M16, L1–L11), 18 are resolved, 7 partly resolved (four of them only because canonical evidence files outside the author's scope are unchanged), and 2 were correctly left to C16. No error was introduced by the revision. In particular M1 is resolved: the covariance, translation invariance and reality of the mixed correlations are now a stated standing assumption (`eq:ope-mixed-covariance`), cited where used and included in `thm:ope-quantitative`; its producer remains an open edge, as the author says.

## Still requested

1. **`ope-cutoff.tex` 232–253: apply the three-depth dictionary to all rows.** The revised table maps centred \(J\), opening \(m\), matching \(k\) to \(k\), \(K(k)\), \(m\), but the gain and single-source allowance rows still read \(G(m,k)\) and \(\vartheta_q(k)\). They should be \(G(m,K(k))\) and \(\vartheta_q(K(k))\), and the physical normalisation should use \(a_{K(k)}^{-q}\). No rate changes. (New issue 1 below.)
2. **`reference-match.tex` 13–15: define the opened depth where it is invoked.** The cited section uses opened depths but does not state the predicate. In the source it is \(J\le m\) and \(B_m^2\le a_J/a_m\) with \(B_m\) the purchased covering radius, which is a different condition from the room inequality. (New issue 2 below.)
3. **`ope-filtration.tex` 245–262 (M8, L8): the local-trial criterion still omits the regularity component.** The source hypothesis contains a regularity clause in addition to the supremum bounds; continuity plus bounded derivatives does not give it.

Smaller: add the three `Fibers` declarations named under L5 to the author's correspondence file. The canonical evidence files `ope-evidence.md` and `local-projection-evidence.md` still carry the wrong names listed in the first review (L1, L11); they are outside the C05 author's scope, so this is for their owner or the integrator. The C16 sentence (M10, L4) is unchanged and remains with C16.

## Verification by the coordinating session

The three requested points were checked directly in the source, not taken from the agent pass:

- `YM.Stock.Tabs.opens` (`Lean/YM/Overlay/Prior.lean`): `def opens (i j : ℕ) := i≤j ∧ s*(a.clock.coverSize j:ℝ)^ (2:ℕ) ≤ a.S.a i/a.S.a j`, used with `s = 1`. This is the opening predicate of request 2.
- `YM.OPE.funding` (`Lean/YM/OPE/Prices/Circuit.lean`): the opened level is `P := Stock.Tabs.chosen C.path.levels 1 L.tabs ∘ k`; `terminalAfford` is applied with `hP` (the opened level) and the output uses `stakes C (k i) (P i)`. So gain and allowance are evaluated at the opened level while the root test stays at the centred level, as request 1 says.
- `clothed` (`Lean/YM/Push/RELAY_DIFFERENCE/RawTop.lean`): `B.Regular X u ∧ B.supBounds o X u c ∧ 0 ≤ b ∧ ∀ U,‖u U‖ ≤ b`, and `RawProtected` requires `clothed` late in the order. The `Regular` conjunct is the component of request 3.
- `manuscript/existence/centered-construction.tex` lines 20 and 96 onward use "opened depth" and choose it, without displaying the predicate.

The remaining rows of the table below are the agent pass's verdicts with its evidence; they were read and found consistent with the diff, but not each re-derived.

## Finding-by-finding table and new issues (agent pass)

| finding | verdict | evidence (file:line) | what remains |
|---|---|---|---|
| M1 | RESOLVED | `ope-homogeneous.tex:14–26` states all three identities for “every finite label list”, separated positions, every rotation and every translation, with actions at each label’s degree. `ope-estimates.tex:96–139` invokes them at the three required steps; lines 179–181 include them in the theorem. | The producer remains open. Mixed-state covariance and reality suffice here: the averaged detector error uses mixed correlations; the final phase estimate uses the raw-comparison input. No covariance assumption on individual phases is needed for these steps. |
| M2 | RESOLVED | `C05/handoff.md:15`: “upper rates `qa` and `τ−qa`, hence upper rate `τ` (no exact rate…)”. | None locally. The rates add to \(\tau\); vanishing labels preclude an exact-rate conclusion. |
| M3 | RESOLVED | `ope-cutoff.tex:64–67`: “Each factor \(\lambda W_r\) is the new weight … of the single old mark \(r\)”, and \(8\widetilde W_A=\prod_{r\in A}(\lambda W_r)\). | None. This agrees with `Salt.tow` in `Lean/YM/OPE/Grouping/Shift.lean:19` and the separate product requirement in `Birth.lean:46`. The author’s R3 record is also corrected. |
| M4 | RESOLVED | `ope-phase-prices.tex:153–160`: “the unreflected conjugation identity … \(M(\bar w)=M(w)^*\)” is an input on “this same hierarchy”. `ope-cutoff.tex:381–384` includes it in the assembly. | Production remains conditional. `actual-phase-detector-moments.tex:16–22` states precisely this input; `reflection-transport.tex:70–94` supplies it through ordinary reflection under the stated approximation, regularity and real-basis hypotheses. |
| M5 | RESOLVED | `ope-phase-prices.tex:185–192`: continuity holds “for every character”, with `ex-phase-caps` conditional on “the all-copy bound and the slot identity”. The assembly includes this continuity at `ope-cutoff.tex:382–384`. | None in the conditional application. `phase-regularity.tex:5–30,32–44` supplies smoothness, hence continuity, for every character under these inputs. |
| M6 | PARTLY RESOLVED | `reference-match.tex:8–15` introduces \(J,m,k\); lines 85–87 state \(2(a_kR+T_k)<a_J\); lines 161–169 define \(\mathcal V_m=t_m\) and \(S_0=\exp((a_J/a_m)^4t_m+5)\). | The room inequality, cell count and treasury normalization are correct. The newly invoked “opened depth … in the sense of” `ex-centered-construction` still lacks a definition at that citation; see new issue 2. |
| M7 | RESOLVED | `ope-grouping-algebra.tex:190–207` now assumes \(\pi(a(i))=b(\pi(i))\), compatible representatives, copied-family membership, transformed positions/data and coefficient identities; the conclusion is restricted to coefficients “whose group names lie in the copied family \(v\)”. | None in the mathematical statement. These are the relevant partition and covariance conditions of `Permutes`, `CopyFamily` and `CopyFamily.twines`. The correspondence-record omission is noted under L5. |
| M8 | PARTLY RESOLVED | `ope-filtration.tex:245–262` adds locality, literal translation, eventual continuity and “Two prices”, with derivative bounds on healthy configurations. Lines 317–322 explicitly condition the application on these properties. | `RawProtected` also requires `BudgetPoint.Regular`, not only `supBounds`: `RawTop.lean:28–36`; `Masks.lean:154–166`. Add the \(C^{q_N}\) germ in left-increment variables at every healthy configuration, including threshold equality, and the iterated derivative identities. Global continuity plus bounded existing derivatives does not imply this germ regularity. The candidate C14 passage likewise assumes “regularity” separately (`actual-insertion-derivative-relay.tex:22–29`). |
| M9 | RESOLVED | `ope-grid.tex:241–249`: “one grade-raising choice” with arbitrary exterior insertions and the indicated values “in every phase table”; slab regularity “assumes the same identity and does not produce it”. | Production remains open. The stated input matches `slab-regularity.tex:75–86` and the separate derivative/quotient-compatibility premises of `Lean/YM/OPE/Interpolate/Chart.lean:34–47`. |
| M10 | NOT ADDRESSED | No replacement text. `ope-history-service.tex:153–155` still says “A singleton coefficient stays the sum of the derivatives of its original insertions”. `C05/findings.md:186` assigns the correction to C16. | The ownership reason is acceptable: C05’s scope prohibits editing another package’s chapter. C16 must distinguish an individual marker from a grouped cell singleton. The claimed handoff to #57 was not verified. |
| M11 | RESOLVED | `ope-estimates.tex:218–221`: the threshold “does not depend on the phase, on the mixed-state choice or on the positions”. | None. This agrees with the quantifier order in `Lean/ChallengeSpec.lean:71–80`. |
| M12 | RESOLVED | `ope-local-projection.tex:42–44`: “for \(m\ge t_d\)”, \(d+3\le J(t_d)\), “every cutoff \(N_0>m\) and every period”. | None locally. The restriction matches `ope-history-service.tex:184–192` and `Bandage.thaw`, `Lean/YM/MergeProof/North/Freckles.lean:36–38,57–59`. Ledger line 53 retains it. |
| M13 | RESOLVED | `ope-local-projection.tex:19–25`: \(R+\kappa_m^{-1}F\le B\), with “The same \(\kappa_m\) … for every field at this scale”. | None concerning normalization and finite summation. This is the reparameterization \(R=a,\ F=\kappa_m b\) of `Coefficient.remBound`, `Lean/YM/Source/Insertion.lean:63–68`. The cited supplier specifies the positive square-root allowance at `leaf-transfer.tex:120`. |
| M14 | RESOLVED | `ope-grouping.tex:12–15` names the connected covering number; lines 182–185 explicitly require \(a=\nu\ge0\). `ope-cutoff.tex:148–152` now identifies \(x=\widehat\beta_i,\ y=\widehat\beta_{i+1}\). | None locally. The definition agrees with `Support.lean:52–71`; positivity is supplied by the purchased budgets. The revised cover-rate ledger entry is supported by `ope-scale-purchases.tex:10,26–36,91–103` and `common-scale-selection.tex:59–60`. |
| M15 | RESOLVED | `C05/ledger.md:28` adds “terminal bound … `r_k≤w+C_k(w+μ(v_k))`” and the affordability growth condition “with the initial payment”. | None. These are the premises at `reference-cone.tex:36–43,107–122`. |
| M16 | RESOLVED | `ope-phase-prices.tex:211–213`: add the residue to the integer address and multiply “by the mesh \(h\)”. | None. Both the \(hK\) displacement bound and residue avoidance now concern physical grid points. |
| L1 | PARTLY RESOLVED | `C05/ledger.md:48` records “`X.Oriented S`, `Homogeneous`, `RealSpin.real`”; the manuscript repair is quoted under M1. | The manuscript matches `YM.Table.Rotation.Oriented` (`Stress.lean:46–48`), `Homogeneous` and `RealSpin.real` (`Table.lean:80–86`). `discrepancy_spin` explicitly uses `Oriented` (`Quotes.lean:80–86`). The canonical `ope-evidence.md:38–46` remains uncorrected. Deferral is acceptable under the read-only scope restriction. |
| L2 | PARTLY RESOLVED | `ope-cutoff.tex:223–240`: centered \(J\), opening \(m\), matching \(k\) correspond to \(k,K(k),m\). `C05/correspondence.md:16` correctly distinguishes `PriceAt` from `funding`’s opened level. | The gain and allowance rows still use the centered \(k\), inconsistent with the revised dictionary; see new issue 1. The opening criterion also needs the clarification in issue 2. |
| L3 | RESOLVED | `C05/handoff.md:15`: “hence upper rate `τ`”. | None. `whole_origin` (`SectorCost.lean:67–68`) supplies the multiplier of rate \(qa\); `funding` (`Circuit.lean:64–75`) supplies quota rate \(\tau-qa\). |
| L4 | NOT ADDRESSED | `C05/findings.md:186`: “Not C05 … ‘for each individual marker (cell, slot)’.” | Ownership deferral is acceptable. `ManyCopies.Unites` (`Replicas/Price.lean:18–19`) concerns individual markers; `Fibers.reap` (`Grouping/Fibers.lean:42–45`) reads a grouped singleton at the whole old fibre. The manuscript ambiguity remains. |
| L5 | PARTLY RESOLVED | `ope-grouping-algebra.tex:190–207` supplies the missing hypotheses and restricted conclusion. `C05/findings.md:176` says these match “`Permutes`/`CopyFamily`”. | The requested correspondence entry is absent. Add `YM.MergeProof.Ribbons.Fibers.Permutes`, `.CopyFamily` and `.CopyFamily.twines`, with `Grouping/Family.lean:20–48` and `Grouping/Care.lean:57–60`, to the owned supplemental correspondence file. No canonical-file edit is necessary. |
| L6 | RESOLVED | `ope-cutoff.tex:245–250`: \(Q_{N,p}=T_{N,p}b\), with quota \(\mu(I_mT_{N,p}^{-1}Q_{N,p})=\mu(I_mb)\); compactness is applied to \(Q_{N,p}\). | None. This matches `bequeathed`’s `B := terminal b` and quota calculation (`Merman.lean:53,60–62`) and the definition in `Least.lean:20–21`. |
| L7 | RESOLVED | `ope-phase-prices.tex:154–159,185–192` explicitly assumes the unreflected identity and every-character continuity. `C05/ledger.md:49` reopens the edge. | The conditional producers remain open. The uses agree with `YM.Work.B17.conj_M` (`B17.lean:22–28`) and the smoothness premises used in `OPE/Eye/Civic.lean:42,76–77`. |
| L8 | PARTLY RESOLVED | `ope-filtration.tex:245–262` now names the stencil, translation, continuity and separate prices. | The `Regular` component of `RawProtected` is still missing; see M8. Consequently the new criterion does not yet state the full premise of `YM.MergeProof.onions` (`Portions.lean:36`). |
| L9 | RESOLVED | `ope-grid.tex:242–249` includes phase-compatible derivative representatives; `ope-local-projection.tex:43–44` includes the reference threshold and cutoff/period quantifiers. | None locally; both producer inputs remain conditional as stated. |
| L10 | RESOLVED | New text specifies “connected covering number” (`ope-grouping.tex:12`), the “single old mark” weight (`ope-cutoff.tex:65`), and \(R+\kappa_m^{-1}F\le B\) (`ope-local-projection.tex:22`). | None concerning the three definitions identified in L10. |
| L11 | PARTLY RESOLVED | `C05/correspondence.md:7,19` uses `../../../` and names `YM.Work.G09.answer`, `cone_cost`, `cost_finest`; `C05/validation.md:40` fixes the other relative path. | Those repairs are correct. The private-lemma, `ripe` namespace and nonexistent-directory references remain in canonical records. Leaving them unchanged is acceptable under `handoff/C05.md:31–34`; the author records the outstanding corrections at `findings.md:185`. |

1. **INACCURACY — the revised three-depth dictionary is not applied consistently.**

   Location: `ope-cutoff.tex:232–253`.

   New text fixes the correspondence as:

   > “centered \(J\), opening \(m\), matching \(k\)” → “\(k\), \(K(k)\), \(m\)”

   But the retained rows give:

   > “gain \(G=e^{(s_k-s_m)/8}\)” → “\(G(m,k)\)”
   > “single-source allowance \(\theta_m\)” → “\(\vartheta_q(k)\)”

   The revised paragraph then says the affordability formulas correspond “literally”.

   Under the new dictionary, those right-hand entries must be \(G(m,K(k))\) and \(\vartheta_q(K(k))\). The physical normalization must likewise use \(a_{K(k)}^{-q}\). `YM.OPE.funding` evaluates `terminalAfford` at the opened level `P`, while retaining `k` as the centered level in `stakes`: `Lean/YM/OPE/Prices/Circuit.lean:67–75`.

   The earlier instruction at manuscript lines 212–215 to substitute the opened level makes the intended argument recoverable. It does not make the displayed dictionary literal. No rate calculation changes, since opening preserves rate \(b\).

   Proposed wording:

   > Put \(k^\circ=K(k)\). The gain, single-source allowance and transported weight correspond respectively to \(G(m,k^\circ)\), \(\vartheta_q(k^\circ)\) and \(\mathcal M(z;k^\circ,m)\). The second payment condition is
   > \[
   > 32(1+\zeta_m)z\,a_{k^\circ}^{-q}
   > \frac{E}{G(m,k^\circ)}
   > \le \frac{\vartheta_q(k^\circ)}2.
   > \]
   > The root test remains centered at \(k\).

   Also remove “like Sections … reference-cone and … reference-difference” from lines 222–223: those chapters formulate an interval comparison using \(l,k\), not the three-depth centered construction.

2. **INACCURACY — the new reference for “opened depth” does not define that condition.**

   Location: `reference-match.tex:13–15`.

   > “an opened depth for \(J\) in the sense of Section~\(\ref{ex-centered-construction}\)”

   `centered-construction.tex:20,128–145` uses an opened depth and states its schedule estimates, but does not define the numerical opening predicate. In the source, `YM.MergeProof.bequeathed` separately requires
   `Stock.Tabs.opens C.path.levels 1 J m` (`Merman.lean:32`) and the room condition at \(J,k\) (`Merman.lean:43`).

   `YM.Stock.Tabs.opens`, `Lean/YM/Overlay/Prior.lean:23`, means
   \[
   J\le m,\qquad B_m^2\le a_J/a_m,
   \]
   where \(B_m\) is the purchased covering radius. This is distinct from
   \[
   2(a_kR+30a_k(h_k+5))<a_J.
   \]
   For example, taking \(m=J\) with \(B_m>1\) fails the opening condition even when a sufficiently large matching depth \(k\) satisfies the room inequality.

   Proposed wording:

   > Assume \(J\le m\le k<N\), \(\operatorname{ref}(d)\le m\), and \(B_m^2\le a_J/a_m\), where \(B_m\) is the purchased covering radius. We call \(m\) an opened depth for \(J\).

   The remaining new formulas in this passage agree with the source: the room condition is `YM.Push.GridApprox.room` (`Geometry.lean:107,153`); the factorization citation states the required identity (`actual-phase-grid-approximants.tex:57–90`); and \(S_0\) is exactly `YM.MergeProof.Accent.stakes` (`Strudel.lean:21`). The \(5M\) contribution follows from \(2+1+2\cdot1=5\), and the treasury bound is supported by `centered-construction.tex:63–77` and `YM.Vac.suffices_bill` (`Treasury.lean:39–59`).

I inspected every hunk of the actual diff: ten manuscript files and **five** record files. All 22 labels cited in added lines exist uniquely. The ten revision-2 chapter hashes match `validation.md`; 35 checked Lean files match the local source manifest. The blueprint checker passes, the diff passes `--check`, and the worktree remains unchanged.

## Not checked

- Live issue/PR discussions or the claimed C16 handoff: GitHub API access failed.
- Lean elaboration, implicit-instance resolution or transitive axioms. No Lean command was run.
- The author’s LaTeX build and rendered-page claims. No build or rendering was performed.
- Production of the remaining open analytic inputs, including covariance, regular local-trial comparison, signed transitions and same-history compatibility. Reading their cited statements does not close those dependencies.
- The previously noted distinction between matching on schedule meshes and the broader wording “meshes of logarithmic rate \(d\)”. Revision 2 explicitly leaves that wording unchanged; it remains outside the proved assembly’s literal scope.

## Acceptance

None recorded. This is an agent review submitted under the account `schmittj`. Material changes to the chapters need renewed review.
