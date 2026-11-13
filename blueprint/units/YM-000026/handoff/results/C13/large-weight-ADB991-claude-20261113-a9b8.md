# C13 open join 2: one marker weight from launch to replica root

Refs #54 (claim https://github.com/hairer/humanise-yang-mills/issues/54#issuecomment-6863792170), #26. Session `ADB991-claude-20261113-a9b8`. Author-side work; ADB991 authored no other C13 chapter. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Base `codex/existence-monograph` at `69b2631`.

Answers: join 2 of `completion-20261113.md` ("large marker weight"), #109 part 3 M6 (schmittj) and obligation 2 of review #213 (mgubi).

## What the source does

The source uses a single marker radius, the large allowance, from the launch through to the replica root. It never uses a small radius that would later have to be rescaled.

| Step | Declaration (path) | Radius |
| --- | --- | --- |
| Allowance | `YM.Next.Rank.Ship.allowance := exp (2 * pot A M k)`, `pot := log (A.clock.monitor k) / (16 M)` (`Lean/YM/Next/RANK/Allowance.lean`) | a = 𝓜_k^{1/(8M)} ≥ 1 (`Ship.fixed`) |
| Same number as a power of the monitor | `YM.Next.Rank.Peak.packaged : powder (hatBeta k) m = Ship.allowance A m k`, `powder s m = bill (1/(8m)) s` (`Lean/YM/Next/RANK/TableGate.lean`); `bill a s = exp (boil s * a)` (`Next/RANK/Reign.lean`); `RG…monitor m = exp ((log log hatBeta m)^2)` (`Lean/YM/RG/History.lean`) | a = H^{1/(8m)}, H = 𝓜_k |
| Launch at the middle level | `Peak.Meter … radius := Ship.allowance A m k` (TableGate.lean); `Peak.launched` gives `Notice … (fun _ => J.radius)` (`Next/RANK/Memorandum.lean`); `Peak.warming` pays the restored entries with `Peak.aperture : toll (radius) (sectionAt x) ≤ bill (1/8) s` | a; cost H^{1/8} per piece |
| Steps from middle to width | `Perch.Exhibits` (hypothesis, part of `Rank.Instance` in `Next/RANK/Incoming.lean`) and `Perch.covers`, `Perch.settled` (`Next/RANK/Stepped.lean`): every `Notice` uses `fun _ => Ship.allowance A m k`; `Perch.follows` changes only the prices, not the radius | a throughout |
| Assembly | `Soft.v_conditioned` (`…/AFTERNOON_INTERACTING_RANK_COMPARISON/Soft/Supra.lean`) chains `Peak.launched`, `Perch.follows` and `Perch.covers` into `Ship.estimate … (Ship.allowance …)` | a |
| Replica root | `Soft.s_postage`, `Soft.coupon` (`Soft/Denarii.lean`): the `Notice` at r = allowance gives `rootTest ≤ exp(protection …)/r^{|s|}`, and `coupon` divides by `allowance = exp(2I)` | a |
| Prices | `Value.Notice`, `SourceAt.pays`, `Lifted.pays`, `Notice.price` (`Next/RANK/Value.lean`): every price contains `Poly.toll r fires`; `Notice.price` holds for every positive r | any r > 0 |

The step and launch inputs at radius a are hypotheses of `Rank.Instance` (`Arrangements ∧ Exhibits`, slot count 2), produced upstream (`Soft.v_culminates`, `crushed`). This record does not trace that producer.

## What changed in the manuscript

`manuscript/existence/allarity-marked-propagation.tex`

- The marker weight is now a general constant ω > 0, with ω^{|I|} ≤ ω̄_n = max(1,ω)^n (new eq. `eq:allarity-mode-weight`). The only use of the old hypothesis r ≤ 1 was the realignment price, which is now 2^n ω̄_n R_e y (eq. `eq:allarity-realign-regular`); the first purchase in `eq:allarity-step-purchases` is 2^n ω̄_n R_e y ≤ d_0.
- The submultiplicativity of the weighted marker norm is now proved for every ω > 0, using disjointness of the marker sets of non-vanishing products.
- The new paragraph "The marker weight" fixes ω = H^{1/(8u)}, H = 𝓜_k (`eq:allarity-marker-weight`), at every level from the launch to the output torus. It proves ω^{|I|} ≤ H^{1/8} (`eq:allarity-weight-cap`, using n ≤ u) and states the resulting discrepancy purchase 2^n R_e H^{1/8} y ≤ H^{-q} (`eq:allarity-weighted-discrepancy`). It also says that the one-step outputs, the principal-source bounds and the terminal purchase are hypotheses at this weight, and how an unweighted bound converts (factor H^{1/8}).
- The removed text is r = H^{1/(8u)-U} with its fixed cost exponent U, and the warning that the small weight cannot give the replica price.
- At the end of the envelope subsection: the replicated coefficient satisfies ω^{q_0|I|}|D_I^⊗(U)| ≤ exp{exponent_P(U) + q_0(L + nℓ)}, and with u = M, ω = 𝓜_k^{1/(8M)} = e^{2I_k} = a, the weight of `sec:rank-root-normalization`. So this is exactly the coefficient price a^{q|I|} with per-site expense X = L + nℓ ≤ 1 + M that the replica root uses.

`manuscript/existence/rank-root-normalization.tex`: one paragraph after "Set a = e^{2I_k}" identifies a with `eq:allarity-marker-weight`.

Hashes (sha256): allarity-marked-propagation.tex `ceae49d5…d362` → `a2d1315b…a418`; rank-root-normalization.tex `b1a2fe47…6b3d` → `c005fa46…019c`.

## What is established, and what is not

Established (elementary; no literature result is needed):

- The recurrence, the forced regrouping, the incidence/spatial counts and the scalar envelope hold at every positive weight. The single place where r ≤ 1 was used is re-proved with the explicit factor ω̄_n.
- With ω = H^{1/(8u)}, the cost of the large weight in this chapter is exactly H^{1/8} in the discrepancy purchase.
- The weighted bound at ω gives the replica-root coefficient price at a with no rescaling, because ω = a.

Not established here (they remain inputs, now stated at the correct weight):

1. **One-step outputs at weight ω.** These are the remainder (α+1)z, principal incidence H^{-2} and forced G_i^2 prices of the actual mixed compiler, in the ‖·‖_ω norm. The source has them as the hypothesis `Perch.Exhibits` at radius `allowance`. `actual-mixed-marked-compiler.tex` states its prices with "positive marker weights", so its estimates are weight-general as written. I have not checked that every purchase there (in particular its H^{-3}/H^{-q} margins) survives the factor H^{1/8} that weights up to ω cost.
2. **Discrepancy at weight ω.** The per-step discrepancy must now satisfy y ≤ 2^{-n} R_e^{-1} H^{-q-1/8}. This is H^{1/8} stronger than the earlier text required. Whether the joint Gaussian reader estimate supplies this at every level of the interval has not been checked.
3. **Launch at weight ω.** In the source the launch is at the middle level, at radius a. `Peak.warming` pays the restored entries H^{1/8}·H^{-31/32}, absorbed by `Shelf.wakes`. In the manuscript the launch is in `marked-healthy-cumulant-launch.tex` (not edited: it is outside this claim). That chapter's remark "Shrinking the marker radius preserves regular and forced bounds" is valid only for shrinking. Its terminal purchase must be read at weight ω ≥ 1, which costs at most H^{1/8} per piece by `eq:allarity-weight-cap`. A one-sentence follow-up in that chapter would make this explicit.
4. **Organization.** The manuscript runs the recurrence from the top comparison level with realignment at every step. The source launches at the middle level and takes each step as a hypothesis. This revision does not reconcile the two organizations; the weight question is independent of that difference.

The identification H = 𝓜_k pins the "monitor H fixed by k" of the recurrence to the clock monitor. This agrees with `allarity-cumulant-comparison.tex` (H = exp((log log s)^2)) and with the source (`Perch` uses `bill · (hatBeta k)`).

## Checks

Recorded in the PR body; see there for commands and outcomes.
