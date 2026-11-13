# Textual Lean correspondence: C14 source-leakage response, PR #216 @ 44df7ab

Reviewer: ADB991 (session `ADB991-claude-20261113-41d8`, Claude agent). Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. The method is textual inspection of the pinned files. No Lean elaboration was run, and none was possible here: the Mathlib hosts are blocked in this environment.

## Row 256: `YM.Trace.Shelves.Optics`, `Optics_pay`, `aprilA`

File `Lean/YM/TraceExtension/Shelves/Lore.lean` (SHA-256 `20bafb5b…a3907a`, which matches the author manifest), lines 40–55.

- `Optics … i` is defined by `by_cases h : Coherent H₂.spin H₁.spin 5 (J.U i 5)`. In the negative case it is `0`. In the positive case it is `crown Z J (Stern V) 5 i • (s ∘ₗ DSeed H₁ o)`, where `s` is built from `(J.U i 5).symm`.
- `Optics_pay : ∀ᶠ i in atTop, ∀ B a, (Optics … i B).val a = Hero J V Z 5 i (nabla S₁ B.val a)` is proved by `filter_upwards [hq'.units 5]`. Coherence, and hence the formula, is therefore only eventual.
- `aprilA : ∀ᶠ i in atTop, ∀ B, Optics … i B = 0 ↔ nabla S₁ B.val = 0` is filtered through `Optics_pay`. Positivity `0 < crown …` (`mul_pos (measured …) (pow_pos (J.positive i) 5)`) and invertibility of `J.U i 5` (a `LinearEquiv`) hold at every `i`. Only coherence is eventual.

The response's account is accurate: at a failed-coherence index `Optics` is `0`, so the kernel identity fails whenever $\ker D\ne K$. The head's statement, "on one tail of scales, uniformly for all tensors", matches the `∀ᶠ i, ∀ B` quantifier order of `aprilA`. The manuscript's $b_i$ corresponds to `crown Z J (Stern V) 5 i`. The response notes that the head describes $b_i$ only as a positive normalization. That is acceptable, because positivity is all the argument uses.

## Rows 253, 255: `YM.Next.UVStress.centerEquiv`, `embrace`

File `Lean/YM/Next/UV_STRESS/Dimension.lean` (hash matches), lines 20–83. `Coherent` has exactly two fields: `stars` (conjugation) and `signed` (mirror action). `centerEquiv` takes `Coherent … 4 U` and `U (S.unit 4) = T.unit 4`. `embrace` proves the left inverse using `value_center`, the unit hypothesis and `const_out H.laws`, which is the normalized unit expectation. This matches the manuscript's coherent-center input word for word: conjugation, signed action, unit, and the centering identities. It also matches the ledger entry I-C14-coherent-center.

## Rows 268, 272: `boatsSky`, `wakesSky`, `harvestedSky`, `Station.Admissible`

I confirmed that the declarations exist at the cited files and lines: `Prom/Zoom/Boats.lean` lines 49 and 75, `Prom/Zoom/Pepper.lean` line 11, and `Next/UV_STRESS/Station.lean` line 89. I also confirmed that `wakesSky` calls `boatsSky` with lower index `max d (N+1)`, which is the strict recursive choice the response describes. I did not re-audit their full hypothesis lists. Those are inherited leads, and the response labels them as such.

## Other moved correspondence (rows 247, 251, 254, 257–267, 269–291)

The response's "Correspondence moved from the manuscript" section states clearly which declarations were directly inspected (the five fingerprinted files) and which are inherited leads from earlier C14 evidence. I did not re-audit the inherited leads. The moved material keeps every caveat that the base text carried: eventual tails per grade pair, pointwise late events, distinct weights, the compact flux test, and the open free-classification obligations. No source claim was dropped.

## Verdict

The only source-facing mathematical claim the PR changes (row 256) is now faithful to the pinned definitions. The base claim was not. No new source misstatement was introduced. No change required.
