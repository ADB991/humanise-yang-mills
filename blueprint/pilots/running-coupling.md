# Running-coupling pilot correspondence

**Status:** Draft for independent mathematical and Lean-correspondence review.
This pilot follows the scope of the unpublished [T08 task draft](../../.github/task-drafts/T08-running-coupling-pilot.md).
The proof is in [running-coupling.tex](../../manuscript/pilots/running-coupling.tex).
Imported source revision is OpenAI-YM commit
[3456e5e75cf8d4cd558955a5c7638fba2d68f464](https://github.com/yang-mills-group/OpenAI-YM-20261028/tree/3456e5e75cf8d4cd558955a5c7638fba2d68f464).

## Statement and notation

The target is [YM.Pert.Asymptotics.comparison](../../Lean/YM/Pert/Asymptotics/RawAxis.lean#L36).
It assumes an internal construction family satisfying YM.Family.Makes, a
simple internal gauge group, and natural-number sequences N and k with
i ≤ N(i) eventually. The limit is along the natural-number tail, with no
monotonicity or divergence requirement on k. There is no requirement to take
an infinite-volume limit. The statement uses the representation fixed as
part of the gauge-group data.

| Symbol in the proof | Meaning | Source |
| --- | --- | --- |
| \(G,\mathfrak g,r_G\) | Internal closed unitary matrix group, its real Lie algebra, and representation dimension | [Shared gauge notation](../glossary.md#-gauge-group-and-spacetime), YM.Gauge.Simple in [Gauge/Lie.lean](../../Lean/YM/Gauge/Lie.lean#L178) |
| \(\mathcal C\) | Internal family with the additional Makes hypothesis | YM.Family and YM.Family.Makes in [Source/Construction.lean](../../Lean/YM/Source/Construction.lean#L24) |
| \(N,p,m\) | Starting lattice level, period index, and trajectory stage | Arguments of YM.RG.History.β in [RG/History.lean](../../Lean/YM/RG/History.lean#L211) |
| \(B_j,a_m,s_m\) | Block factor, spacing at stage \(m\), and the natural logarithm of its reciprocal | The schedule's [block size and denominator](../../Lean/YM/Lattice/Scale.lean#L31) and its [spacing and divergence](../../Lean/YM/Lattice/Scale.lean#L99) |
| \(\beta_{N,p,m}\) | Stage coefficient, read from the representative at \((N,p,m)\) | YM.RG.History.β in [RG/History.lean](../../Lean/YM/RG/History.lean#L211). The bare endpoint \(\beta_{N,p}=\beta_{N,p,N}\) is YM.Family.beta in [Source/Construction.lean](../../Lean/YM/Source/Construction.lean#L38). |
| \(\bar\beta,b_0(G),C_{\mathfrak g}\) | Reference intercept, logarithmic slope divided by two, and normalized adjoint Casimir | YM.RG.Calendar.hatBeta in [RG/History.lean](../../Lean/YM/RG/History.lean#L79), YM.Pert.Asymptotics.b0 and b0_normalizes in [RawAxis.lean](../../Lean/YM/Pert/Asymptotics/RawAxis.lean#L13), and YM.Gauge.casimir and slopeConstant in [Gauge/Colors.lean](../../Lean/YM/Gauge/Colors.lean#L180) |
| \(g_{N,p,m}\) | Inverse square root of the stage coefficient | YM.Pert.Asymptotics.regulatorRun in [RawAxis.lean](../../Lean/YM/Pert/Asymptotics/RawAxis.lean#L35). The mathematical limit only needs the positive tail, where the ordinary and totalized real operations agree. |

## Proof correspondence

1. **Running input.** YM.Family.Makes.wilson gives YM.RG.History.Selected,
   whose running condition is YM.RG.History.Running. Its comparison coefficient
   is YM.RG.Calendar.hatBeta. The construction of this history and its running
   estimate are upstream dependencies of the pilot. The proof states the
   estimate and retains its threshold uniform in \(N,p\). It proves divergence
   of the logarithmic scale by bounding the product of the block factors
   below by \(3^m\).
2. **Uniform ratio estimate.** YM.Pert.Asymptotics.zeroUp_bound divides the
   running estimate by the eventually positive logarithmic scale and bounds
   the additive intercept divided by that scale. The exposition chooses
   \(\varepsilon/2\) for each error budget, with the intercept inequality
   strict. The source uses \(\varepsilon/4\).
3. **Positive slope.** YM.Gauge.casimir_pos and YM.Gauge.slopeConstant_pos in
   [Gauge/Casimir.lean](../../Lean/YM/Gauge/Casimir.lean#L160) supply the
   positivity used by the limit. The exposition gives the invariant-trace
   argument in terms of the squared norms of brackets of basis vectors.
   The normalization comes from YM.Gauge.trace_color in
   [Gauge/Colors.lean](../../Lean/YM/Gauge/Colors.lean#L71).
4. **Admissible tail and continuity.** The hypothesis on \(N\) makes the
   uniform ratio bound applicable along the chosen sequences. The exposition
   infers eventual positivity of the ratio and uses continuity of
   \(x\mapsto x^{-1/2}\) on \((0,\infty)\). The source composes square root
   with reciprocal at the positive limit and uses eventual equality of the
   resulting expression with the scaled proxy.

The comparison is about the trajectory coefficient and includes the bare
endpoint as a special case. The identification with a physical X-scheme
coupling and the tangent-one test are separate questions. The [statement
ledger](../public-statement.md) records the scope of this companion result.

## Literature and source evidence

The pinned [Armstrong outline, VII.5](https://github.com/scottnarmstrong/yang-mills-informalization/blob/8f3c7ccaeabb17b0f928bc1a2e75328691de3032/outline/units/VII-5.md)
was consulted for the split between the uniform estimate and the companion
limit. A focused search for the exact comparison and for lattice
renormalization of the gauge coupling identified Bałaban's
[1987 small-field renormalization paper](https://doi.org/10.1007/BF01215223)
as a lead for the upstream construction. The Rutgers
[bibliographic record and abstract](https://www.researchwithrutgers.org/en/publications/renormalization-group-approach-to-lattice-gauge-field-theories-i-/)
were checked. Its recursive flow has not been matched to this history's
uniform running estimate. The pilot uses the stated construction input and
proves the scalar comparison directly.

The existing [release-root axiom audit](../../source/evidence/axioms-3456e5e.md)
records propext, Classical.choice, and Quot.sound for comparison. The pilot
uses that recorded evidence. A read-only GPT-6 Luna agent inspected the
bounded Lean dependencies with targeted line reads and searches. It used
`sha256sum` to check `RawAxis.lean`, `History.lean`, `Scale.lean`,
`Construction.lean`, `Colors.lean`, `Casimir.lean`, `Lie.lean`, and
`MatrixGroup.lean`. All eight matched the imported `Lean/SOURCES.sha256`.
The agent's attempted `lake env lean Lean/YM/Pert/Asymptotics/RawAxis.lean`
returned “Operation not permitted”. This pilot has no fresh successful
Lean elaboration.

The parent wrote the LaTeX argument and ran
`latexmk -pdf -interaction=nonstopmode -halt-on-error` with temporary output.
The final build produced one page with no warnings. The rendered page was
checked visually. `python3 scripts/check_blueprint.py` passed with zero
canonical units. `git diff --check` passed, and the two new files were
checked separately for trailing whitespace and relative link targets.
