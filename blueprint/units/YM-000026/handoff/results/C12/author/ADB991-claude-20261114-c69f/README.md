# Author response to review #343 of PR #340 (S1, N1): zero-coordinate Coupon (#319)

Refs #319, #340, #343, #350. Author session ADB991-claude-20261114-c69f. Claim https://github.com/hairer/humanise-yang-mills/issues/319#issuecomment-6868253521. Base `97f806c7` (`codex/existence-monograph`). Upstream pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Prepared autonomously by Claude (Anthropic) as a scheduled agent on behalf of ADB991; ADB991 had not reviewed it before submission. This is an author-side change by the author of #340, so it needs a renewed independent check (not by ADB991).

## What changed

Only `sec:selected-zero-coordinate-coupon` in `manuscript/existence/selected-centered-service.tex` (old blob `e1d3037dd27c8a1e556d2f03962c2be71fd1f7b4`, new blob `8705a85d3e75bd60eb6e37b427fe6e1a8d83f96a`).

**S1 (three lawful-representation facts had no manuscript reference).** All three are now sourced in the manuscript and are not an extra input:

| Fact used | Before | Now |
|---|---|---|
| admissibility depends only on supports and inventories | asserted | admissibility is now *defined* as in the gas sum of `sec:local-splitting` (subsection "Putting the response into the existing gas", l. 254–257): pairwise disjoint supports, inventories covering exactly the flags. Tag-only dependence is read off the definition. |
| distinct members of an admissible set have disjoint supports | asserted | same definition |
| absolute bounds on the dressed sums | "by the absolute bounds … of a lawful representation" | new display `eq:selected-dressed-bound`, proved: $|\mathrm{Dr}_a|\le\sum_{T}\prod_{c\in T}\bar K_c\le\exp(|\Lambda_{i+1}|w^{\rm f}_{i+1})=D_{i+1}$. Inputs: lawfulness of $R^+$ (`sec:surviving-interval-shooting`: the selected history "satisfies all its local activity bounds"; the retained-history conditions in the proof of `prop:wilson-startup-family`), in the rooted-support-sum form (T3) of `sec:terminal-marked-construction` at $(\alpha_{i+1},w^{\rm f}_{i+1})$. |

The proof now cites `eq:selected-dressed-bound` where it was used: the density regrouping, step (iii) (both dressed series converge absolutely; forced series dominated by $D_{i+1}e'_a$), and the Tonelli domination of the forced terms in the decomposition. The closing paragraph says these facts are not further inputs.

**N1.** The remainder-convention paragraph and step (v) now state that $\mathrm{mass}(X,e)\ge e$ uses $\alpha_{i+1}>0$ (positive support exponent of a budget, `sec:local-splitting` l. 16) as well as the nonnegative cover number.

**#350 (not changed in the manuscript).** hairer's draft #350 (`lem:selected-reserved-slots`, #317) would supply the nonterminal Keeper required in (K). It is unreviewed and not on the base branch, so the manuscript is not changed to cite it. Once #350 is reviewed and merged, the first sentence of (K) and the last paragraph of the section can cite it, and (K) reduces to the regular and forced single-insertion estimates.

## Source correspondence (textual reading at the pin; nothing elaborated)

- Admissibility: `YM.RG.Activities.admissible` (`Lean/YM/RG/Activities.lean:114-116`) is `(b : Set ℕ).Pairwise (Disjoint on forced supports) ∧ b.biUnion inventory = flags threshold U`. It does not involve `extraTest`/eligibility ("Further predicates are internal, multiply by zero"; eligibility enters only through `ForcedFamily.permit`). This matches the new definition.
- Tag invariance: `YM.MergeProof.reach` (`MergeProof/BarCode.lean`) proves admissibility is invariant under a permutation preserving `barcode = (support, inventory)`. `tariff` uses `reach` and the disjointness clause (the `hp` step) for $\mathrm{Dr}_a=\mathrm{Dr}_{a'}$, as in step (iii).
- Dressed sums: `YM.Extra.Histories.coat`/`dressed` (`Extra/SOURCE_HISTORIES/Dressing.lean:22-28`). The absolute bound is `coat_budget`: from `h.labels.boundK` via `Activities.K_total` (`RG/ActivityBounds.lean:50`) it gets summable majorants $b_j\ge|K_j|$ and bounds $|{\rm coat}\,R\,i\,b\,U|\le z(b\setminus i)$, $z(b)=\prod_{j\in b}b_j$, summable. The manuscript bound $\exp(\sum\bar K_c)$ is the same argument with the explicit total $\sum_c\bar K_c\le|\Lambda|w$; `K_total` uses `summable_charge` with nonempty inventory ⊆ support, i.e. the same site-counting.
- Lawfulness of stored representations: `YM.RG.History.Selected.represents N p m : m ≤ N → Conv N p m`, and `Conv.good : (rep N p m).Lawful … (forcedAllowance m)` (`RG/History.lean:213-218, 236`). `Rep.Lawful.labels : Activities.Valid p δ w`, whose `boundK : KBound p w` is: majorants $b_i\ge|K_i|$, $b_i\ge0$, with $\sum_{i:x\in S_i}\mathrm{mass}(S_i,b_i)\le w$ for every site (`RG/Activities.lean:102-104`). With $p=$ budget$(i+1)$ (`Conv.vac`) this is exactly the displayed site bound at $(\alpha_{i+1},w^{\rm f}_{i+1})$.
- N1: `BudgetPoint.exponent_pos : 0 < supportExponent` (`RG/Masks.lean:133`) and `BudgetPoint.loMass : 0 ≤ c → c ≤ p.mass P c` (`RG/Masks.lean:146`).

## Open questions

- Q1 (citation granularity). The lawfulness of every stored $R_{N,p,m}$ is cited from the summary sentence of `sec:surviving-interval-shooting` and the list of retained-history conditions in the proof of `prop:wilson-startup-family` (stated there at level $N$). The manuscript has no single labelled statement "every stored representation of the selected history is lawful at $(\alpha_m,w^{\rm f}_m)$" corresponding to `History.Conv.good`. A reviewer should check whether that is acceptable or whether an owner of the shooting chapter should add one labelled statement.
- Q2 (unchanged from #340). (K), (S) and (M) remain inputs; the Keeper part of (K) is pending #350.

## Evidence (commands actually run)

- `python3 scripts/check_blueprint.py`: "Blueprint structure OK: 4 units. Lean and mathematics were not verified."
- `python3 -m unittest discover -s tests`: 22 tests OK.
- `git diff --check`: no output.
- `latexmk -pdf -interaction=nonstopmode -outdir=<scratch> existence.tex` from `manuscript/` on this branch: exit 0, 1022 pages, no undefined references; the one log warning (amsmath `\atopwithdelims`, `positive-row-producer.tex`) is pre-existing and outside this change. pp. 702–703 were rendered to PNG and inspected; pp. 704–706 checked with `pdftotext`.
- Lean: read as text only at the pin (files listed above); no elaboration, no axiom replay.
