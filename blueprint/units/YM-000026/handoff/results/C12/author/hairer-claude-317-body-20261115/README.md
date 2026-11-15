# The residual body on the actual alphabet

Refs #317, #315, #43 and #26. Session `hairer-claude-317-body-20261115`.
Claim: https://github.com/hairer/humanise-yang-mills/issues/317#issuecomment-6898313886.
Prepared by Claude for Martin Hairer. Source pin:
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Base: `codex/existence-monograph` @ `0274bb8`.

## Result and scope

`lem:selected-residual-body` (new `sec:selected-residual-body` in
`manuscript/existence/selected-centered-service.tex`) shows that #449 does not need to assume the
"common mixed-body estimate" it retains in `lem:selected-menu-alphabet`. That estimate follows from
the existing simultaneous product estimate `eq:warning-sector-mass` (`gaussian-warnings.tex`),
applied to every residual vertex set $S\setminus O$ with $O$ optional. The proof:

- checks that the hypotheses of `eq:warning-sector-mass` hold for every subset: the pointwise
  bounds and the warning-excursion implication are both properties of individual vertices;
- recalls the one-line Fubini argument;
- notes that a removed warning takes its probability price $E(x)$ with it;
- covers forest and tag probability averages;
- identifies the prices: warning $E(x)T$, forced $v_i$, logarithmic $w_i$ (for $e^{\ell_i}-1$),
  packet $C_0e^{(s-g)n_i}$.

The "remaining analytic attachment" paragraph after `lem:selected-response-payments` is amended to
say this. **No hypothesis of `sec:gaussian-warnings` is removed.** The open work is now stated as the
local inputs of that estimate on the held tree sectors:

- pointwise packet, forced and logarithmic bounds (`sec:packet-estimates`, inherited/remote/itinerary
  prices);
- the plateau and mean inputs behind the excursion implication (`sec:warning-safety`);
- the uniform covariance bound;
- the separate items already listed: the usable vertex bound and tree criterion, summed packet
  variants, differentiated entrance, and the precursor/vapor estimates.

The scope was narrowed after claiming. I had planned to write the body integration from scratch,
but found it already proved canonically as `eq:warning-sector-mass`. Following AGENTS.md ("reuse
canonical proof units"), the lemma cites and applies it, recalling the short proof only for the
subset step.

No edits to `lem:selected-menu-alphabet`, `lem:selected-response-payments`,
`prop:selected-centered-retention`, the #318/#319 subsections, C02 chapters, ledgers, unit status or
`Lean/`.

## Source correspondence (textual inspection at the pin)

Paths relative to `Lean/`.

| Manuscript step | Source | Match |
| --- | --- | --- |
| Pointwise vertex bounds (table before `eq:warning-sector-mass`) | `YM.ConnectedActivityE6.Cash.voice`, `YM/AnalyticNext/CONNECTED_ACTIVITY_JETS_E6/Weaving.lean`; fields `quotes` of `Cash`, `Batch.lean:82` | Packet vertex ≤ `steamP` when connected, else 0; bag ≤ `v`; far-log/raise ≤ `w`; warning by `fires_at`. |
| Product bound $\lvert\prod f_i\rvert\le\prod c_i$ | `Cash.every`, `Weaving.lean` | `abs_prod` and `prod_le_prod`. |
| Nonzero product forces the joint excursion | `Cash.lease`, `Weaving.lean` (from `quotes.2.2.2`) | `body ≠ 0 → z ∈ catastrophe (blaze p)`. |
| One integration, Fubini over probability Haar | `Cash.statements`, `Weaving.lean` | The integrand is dominated by an indicator times a constant; `integral_prod`; the catastrophe mass is ≤ `alarms^card`. |
| Price identity $\prod\widetilde c_i$ | `Cash.combined`, `Weaving.lean` | `text = alarms^{#warnings} · fair`, which is the warning price $E\cdot T$. |
| Residual body after removal | `YM.PhysicalNext.Repeat.Lotus.Team.tip`, `YM/MergeProof/TeamPygmy.lean` | Applied to `p \ M.signs S`, with a pointwise insertion bound before integration. This matches the use in `lem:selected-menu-alphabet`. |
| Production of the quotes | `Target.Invoices.vapors` → `Cash` (`circulates`, `Batch.lean`); `Target.issue`, `Issue.lean:94` | Uniform in $x$ on steps with `Works P L x S T`, for representations with `Intake` and `Stamp T`. **Not attached here.** |

Thus `eq:warning-sector-mass` corresponds to `Cash.statements`. The open boundary for #317 is the
production of `Cash` (equivalently `Invoices`) on the selected step's tube and representation, the
manuscript counterpart of `Target.issue`.

## Findings for the next session

1. **"Stamped" is undefined in the manuscript.** `warning-safety.tex` l.246 concludes that the
   safety input holds "on every funded, stamped sector". `git grep -i stamp` finds no definition of a
   stamped sector or tube anywhere in `manuscript/`. The word appears to come from the source
   hypothesis `Stamp T` of `Target.issue`. The tube-level `Stamp` was not located in this session:
   `YM/Primitives/SMALL_FIELD_EXTERIOR/HaarCoin.lean:36` is a different, chart-ratio `Stamp`. Before
   the attachment can cite `sec:warning-safety` for the selected step, the manuscript needs to state
   what "stamped" means, and the selected history needs to supply it.
2. The manuscript counterpart of `Target.issue` (uniform `Invoices` on every funded, stamped step
   for every representation with `Intake`) is distributed across `sec:packet-estimates`,
   `sec:gaussian-warnings`, `sec:warning-safety` and `sec:activity-jet-assembly`. Its last
   paragraph supplies the differentiated product input and the optional site sum, conditional on
   the same local hypotheses. A single statement collecting these, with the selected step plugged in,
   would be the natural next unit for #317.

## Assistance and review

Written by Claude (Opus 5.5) in a session directed by Martin Hairer, with no subagents. This session
also reviewed #449 earlier today. The new lemma sits next to #449's lemmas but does not modify them.
Independent mathematical and source review by another session or account is required. Human
acceptance is unset.

## Validation (commands actually run)

- `python3 scripts/check_blueprint.py`: "Blueprint structure OK: 4 units."
- `python3 -m unittest discover -s tests`: 22 tests, OK.
- `git diff --check`: clean. No carriage-return bytes in the edited file.
- From `manuscript/`: `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/ymb7 existence.tex`:
  exit 0, 1098 pages, no undefined or multiply defined references. Pages 707–708 (new subsection and
  amended paragraph) were rendered and inspected.
- No Lean build, elaboration or axiom replay. The correspondence above is textual.
