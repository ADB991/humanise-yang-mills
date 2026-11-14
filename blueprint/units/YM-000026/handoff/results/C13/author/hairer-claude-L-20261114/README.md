# Input (L) of the launch: failed-mask regrouping and weight change (#413)

- **Session:** `hairer-claude-L-20261114` (Claude, on behalf of @hairer).
- **Claim:** https://github.com/hairer/humanise-yang-mills/issues/413#issuecomment-6883482573
- **Base:** #411's branch `claude/issue-409resp-hairer`. **Pin:** `3456e5e`.

## Established

The stated input (L) of `prop:allarity-launch` is replaced by `lem:allarity-launch-regroup`, which is proved under two hypotheses:
- **(F)** At the middle level, the forced background has site price η₋ at the weight ω₋ and the support exponent e+1+σ, for a fixed spare σ > 0. Marked forced pieces contain the readers of their marks. The first part is obtained by running the leading interval at the exponent e+1+σ.
- **(S)** Dispersal: every connected forced support meeting t ≥ 2 cell halos has cover number ≥ λt, with λ/log H → ∞. The text proves (S) from a halo separation D' with D'/((2B+1) log H) → ∞, by an ℓ^∞-ball argument.

The conclusion is an exact representation with the regular letters unchanged and forced site price ≤ 4H^{Un+2^n} η₋ at (ω, e).

The proof has four parts:
- **Exactness:** commutativity, ℓ_f² = 0, and the flag covering, as in the realignment subsection.
- **Failed pieces:** each costs H^{1/8} C_* R_{e+1}, with |R| ≤ C_* from `lem:allarity-amplitude`. A fee e^{−F}, F = log H, makes their site sum ≤ 2^n C_* R_{e+1} H^{−7/8}.
- **Old pieces:** the weight raise H^{Unt_o} and the fee e^{2^n F t_o} are paid by e^{−σ cov} when t_o ≥ 2, using (S). When t_o ≤ 1 they are absorbed by the smallness of η₋, through e^g = δ/(2H^{Un+2^n}η₋).
- **Components:** each failed piece is charged to an old piece of its component that it meets; at most 2^n t_o are charged to any one. The forest bound `eq:ope-forest-price` is then applied with δ = H^{−1/2}.

## Correspondence (textual)

| Manuscript | Source |
| --- | --- |
| exactness | `YM.Next.Rank.Shift.reg`/`fail`/`clips`/`made` (`Next/RANK/LocalShift.lean`) |
| spare exponent σ, dispersal | `Dock.Change.spare`, `local_pack`/`force_pack`, `Dock.mixed_cost` via `dispersal_cost` (`Next/RANK/DockBudget.lean`) |
| fee F, charge to old pieces | `Dock.Change.fee`, `force_hit` (`e^{m·narrow + fee·2^m + reserve}·hit + 2^m·limit_c·e^{−fee} ≤ γ`) |
| reference coefficient bound | `Dock.Wells.failed` (the manuscript uses the constant C_* of the compact window, not H^{1/4}) |

The source bounds the reference coefficients by H^{1/4} (`warmingSky` `hV`). The manuscript has a constant bound, so that hypothesis is not needed here.

## Not established

- (S), or the halo separation D', for the actual tiling at the middle level. It is plausible because cells at level ℓ have side ≥ c_k^{10} in level-ℓ units (by the root depth), while B ≈ c_k², but I have not checked it against the tiling geometry.
- The part of (F) about readers in marked forced supports. It is stated for principal pieces in the first subsection, and assumed here for forced pieces.

## Checks actually run

- `latexmk -g -pdf existence.tex`: rc 0, with no undefined references.
- The rendered proof was inspected (`pdftotext`).
- `python3 scripts/check_blueprint.py`: OK.
- The Lean was read textually (`LocalShift.lean`, `DockBudget.lean`).

## Addendum: the halo separation (session hairer-claude-S-20261114)

`lem:allarity-halo-separation` proves, for the trace chart, that at every level of [ℓ, k]:
- reader sites of distinct cells are more than 2QB apart, which is the hypothesis of `lem:allarity-step-charge`;
- the halos are at lattice distance ≥ D' = c_k^{10}/2, with D'/((2B+1) log H) → ∞, which is (S).

The proof uses three facts:
- cells of the depth-w centered tiling have side a_w;
- a_w/a_ℓ ≥ c_k^{10} by the root depth;
- B_i ≤ 4(log s)⁴ on the plateau.

Its hypothesis is that readers lie within 2a_ℓ of their cell centres. This is derived after the lemma from fitness (coordinates ≤ a_ℓ/8), rounding, and one coarse spacing. (U) The placement of reflected and conjugated replicas relative to cell centres is read from the definition of the centered root test (`centered-estimates.tex`); it is not separately checked.

The remaining launch input is now only the reader-containment clause of (F).

## Addendum: reader containment

`lem:allarity-reader-containment` derives the second part of (F) by induction along the interval. The compiler's letters are flattenings of components, the realigned and failed-mask pieces live on the X_{c,I}, and the regroupings take unions. The induction uses two structural properties:
- coarse footprints contain the projections of fine supports. `sec:mixed-activity-prices` l. 233 describes the footprint as the projection enlarged by a fixed halo.
- coarse reader sites are projections of fine reader sites.

(U) The second is the evident convention, but I did not find it stated as such.
