# YM-000022: running-coefficient asymptotic

**Draft; independent mathematical and Lean-correspondence reviews pending.**
The authoritative mathematical text is
[the LaTeX section](../../../manuscript/pilots/running-coupling.tex), labels
`sec:running-coefficient`, `prop:uniform-extraction`, and
`prop:running-asymptotic`. There is no separate Markdown proof.

Human contributor: hairer. Agent assistance: Codex for exposition/integration;
GPT-6 Luna for bounded Lean extraction. Human contributor mgubi and GPT-6 Astra
(Codex) supplied the bounded author revision responding to PR #32; see
[the revision record](revisions/mgubi-astra-22-repair-20261113/README.md). See [issue #22](https://github.com/hairer/humanise-yang-mills/issues/22).
The provisional VII.5/CP-03 decomposition is credited to
[Scott Armstrong's informalization project](https://github.com/scottnarmstrong/yang-mills-informalization).

## Inputs and notation

The section follows the shared [glossary](../../glossary.md) and
[notation contract](../../../docs/notation.md): $N$ is the starting lattice
level, $p$ the period index, $m$ the observed stage, and $s_m=\log(a_m^{-1})$.
Its sole outstanding mathematical input is the uniform running estimate
`eq:running`, supplied by the projection chain `hc.wilson.running` (qualified declarations
listed below).
The construction of the family and that estimate are outside this unit.
No canonical prerequisite unit currently owns the estimate, so `depends_on` is
empty; this does not mean that the proof is independent of the input.

The existing LaTeX pilot also proves scale divergence from $B_j\ge3$ and
Casimir positivity by the invariant-trace calculation. These elementary arguments
are retained in the consolidated section, replacing the corresponding imported
inputs in the former Markdown exposition. They require independent review along
with the rest of the section; no review approvals were carried forward.

## Literature and editorial treatment

Hall, *An Elementary Introduction to Groups and Representations*,
[arXiv:math-ph/0005032v1](https://arxiv.org/pdf/math-ph/0005032v1),
31 May 2000, Chapter 3, Definition 3.13 (p. 36) and Theorem 3.16
(pp. 40–41), supplies the matrix Lie algebra definition and its real
vector-space and commutator closure properties. Chapter 2, Definition 2.2
(p. 9), requires a subgroup closed in the general linear group; the
manuscript checks this for the closed subgroup of the unitary group.
The definition uses all real exponential parameters, exactly as
`YM.Gauge.Generates` and `YM.Gauge.lie` do. The opening paragraph now cites
these results directly; see the [Hall follow-up record](revisions/mgubi-astra-22-hall-20261113/README.md)
for the inspected version, verification and bibliography impact.

Lebl, *Basic Analysis I*, author-maintained HTML §2.2, Propositions 2.2.5(iv)
and 2.2.6, inspected on 11 November 2026, supplies the reciprocal and square-root
limit rules. The section explicitly checks positivity and restricts to a tail.
The detailed search and source evidence are in [the evidence record](evidence/README.md).
The earlier pilot's upstream Bałaban lead remains unverified and is not used to
justify the running estimate. Formal filter/arithmetic helpers implement the
uniform estimate and limit steps; they do not need separate prose units.

## Correspondence with Lean

All source references in this section use revision
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Fully qualified names identify
interfaces; line numbers are supplementary. The exact types and axiom reports
for the owned declarations are retained in [the Lean inspection output](evidence/lean-inspection.txt).

| Mathematical datum or step | Fully qualified declaration | Source path and location |
| --- | --- | --- |
| Product formula and block lower bound used in the prose divergence proof | `YM.Schedule.denominator`, `YM.Schedule.block_large` | `Lean/YM/Lattice/Scale.lean:29–41` |
| Spacing $a_m$, its positivity, $s_m=\log(a_m^{-1})$, and divergence | `YM.Schedule.a`, `YM.Schedule.a_pos`, `YM.Schedule.scale`, `YM.Schedule.divergent` | `Lean/YM/Lattice/Scale.lean:99–120` |
| The family's schedule and scalar coefficients | `YM.Family.S`, `YM.RG.History.β` | `Lean/YM/Source/Construction.lean:32–35`; `Lean/YM/RG/History.lean:210–211` |
| Fixed $\bar\beta=C.\mathrm{path}.\mathrm{levels}.\mathrm{clock}.\mathrm{bar}$ and reference value $\bar\beta+c s_m$ | `YM.RG.Calendar.bar`, `YM.RG.Calendar.hatBeta` | `Lean/YM/RG/History.lean:64–79` |
| Running input (`eq:running`), supplied by the construction hypothesis | `YM.Family.Makes.wilson`, `YM.RG.History.Selected.running`, `YM.RG.History.Running` | `Lean/YM/Source/Construction.lean:44–45`; `Lean/YM/RG/History.lean:229–240` |
| Initial coefficient is the bare Wilson action coefficient | `YM.RG.History.Selected.starts`, `YM.RG.Rep.eval`, `YM.Wilson.bare`, `YM.Wilson.energy`, `YM.Gauge.price` | `Lean/YM/RG/History.lean:174–179,237`; `Lean/YM/Wilson/Law.lean:29,58`; `Lean/YM/Gauge/MatrixGroup.lean:112` |
| Matrix representation and its positive dimension | `YM.Gauge`, `YM.Gauge.repDim`, `YM.Gauge.dimPos` | `Lean/YM/Gauge/MatrixGroup.lean:23–26,73–75` |
| Real Lie algebra, skew-Hermitian generators, and bracket closure | `YM.Gauge.Generates`, `YM.Gauge.lie`, `YM.Gauge.generates_skew`, `YM.Gauge.bracket_mem` | `Lean/YM/Gauge/Lie.lean:26,42–44,126–134,159–176` |
| Color normalization and the Casimir formula | `YM.Gauge.Color`, `YM.Gauge.colorIso`, `YM.Gauge.trace_color`, `YM.Gauge.ad`, `YM.Gauge.casimir` | `Lean/YM/Gauge/Colors.lean:42–78,136–149,179–182` |
| Transport of the commutator to color coordinates | `YM.Gauge.frobInner`, `YM.Gauge.projectColor`, `YM.Gauge.colorMat_project_self`, `YM.Gauge.colorMat_ad` | `Lean/YM/Gauge/Colors.lean:25–38,96–105,152–154` |
| Nonabelian real Lie-algebra simplicity | `YM.Gauge.Simple` | `Lean/YM/Gauge/Lie.lean:178–182` |
| $c=11\operatorname{cas}(G)/(24\pi^2)>0$ under simplicity | `YM.Gauge.slopeConstant`, `YM.Gauge.slopeConstant_pos` | `Lean/YM/Gauge/Colors.lean:184`; `Lean/YM/Gauge/Casimir.lean:174–176` |
| $b_0$ and $c=2b_0$ | `YM.Pert.Asymptotics.b0`, `YM.Pert.Asymptotics.b0_normalizes` | `Lean/YM/Pert/Asymptotics/RawAxis.lean:13–14` |
| Uniform extraction proposition | `YM.Pert.Asymptotics.zeroUp_bound` | `Lean/YM/Pert/Asymptotics/RawAxis.lean:15–30` |
| Numerical inverse square root | `YM.Pert.Asymptotics.regulatorRun` | `Lean/YM/Pert/Asymptotics/RawAxis.lean:35` |
| Sequence substitution and logarithmic limit | `YM.Pert.Asymptotics.comparison` | `Lean/YM/Pert/Asymptotics/RawAxis.lean:36–48` |

The uniform extraction proposition weakens the construction's hypotheses to
the exact numerical interfaces used. The source's `Calendar.bar_pos` requires
a positive intercept, while extraction works for any fixed real intercept.
The source's `zeroUp_bound` needs `C.Makes` but no simplicity assumption;
`comparison` additionally assumes `G.Simple` and obtains positivity through
`YM.Gauge.slopeConstant_pos`. Its input `YM.Gauge.casimir_pos`
(`Lean/YM/Gauge/Casimir.lean:160–172`) uses `YM.Gauge.trace_adjoint`
(`Lean/YM/Gauge/Casimir.lean:140–158`), which uses full simplicity to identify
an invariant bilinear form with a scalar multiple of the color inner product.
The manuscript instead gives a reorganized positivity proof: sum the squared
commutator norms over an orthonormal basis and use noncommutativity. This
replaces, rather than paraphrases, `casimir_pos`; it needs only the nonabelian
clause, although the section retains the source's full simplicity hypothesis.
The new positive-definiteness and basis-independence calculations are author
arguments requiring renewed mathematical review. Neither the construction
hypothesis nor the simplicity predicate is redefined to mean only the
consequence used here.

For the closing bare-coefficient remark, `hc.wilson.starts N p` identifies
`(C.path.rep N p N).eval` exactly with `YM.Wilson.bare (C.path.β N p N)`.
The latter is the unnormalized density `exp(-β * energy U)`, where `energy`
is the sum of `G.price` over lattice faces and
`G.price u = 1 - Re tr(G.mat u) / G.repDim`. Thus “bare lattice action
coefficient” means the multiplier of this specific energy. `Rep.eval` is a
full represented density (an exponential times an activity gas), not itself
an action or a coupling. The equality in `starts`, rather than a general
simplification of `Rep.eval`, justifies the remark. No conventional physical
coupling normalization or matching theorem is asserted.

For the opening Casimir formula, `trace_color` makes `colorIso` an isometry
from color coordinates to the Lie algebra with the manuscript's normalized
inner product. `colorMat_ad`, using `bracket_mem` and
`colorMat_project_self`, transports the adjoint operator to the actual matrix
commutator; hence traces of the conjugate endomorphisms agree. The local
`frobInner` instance defining the projection is the unnormalized real
Frobenius inner product; `colorIso` rescales by `sqrt(repDim)`. These facts
support the formula without treating the projection as an extra Lie bracket.

Lean defines `Real.sqrt` and inversion on every real input, including negative
arguments and zero. The definition of `regulatorRun` has no hypotheses, as its
elaborated type confirms. Our ordinary positive-tail definition agrees with
that totalized expression eventually, which suffices for the exact conclusion
of `comparison`. There is no assertion here that all finite-prefix terms are
positive. The introductory source comment expressly limits the interpretation
to the numerical proxy.

## Open obligations and review status

The construction and its uniform running estimate require accepted exposition
or a checked reference before global integration can be complete. The numerical
proxy is not identified with a coupling defined by physical observables.
Independent correspondence and mathematical review remain outstanding. The unit
is draft, including the elementary positivity and schedule arguments inherited
from the earlier LaTeX pilot. The reports in `reviews/lean-mgubi.md` and
`reviews/mathematics-mgubi.md` concern the earlier fingerprint
`367b5982bb56035d3f0cbf81641d1f0564c27a48169707b9aa64a5cf3c0b0aa2`;
they remain unchanged historical evidence and do not review this revision.
The independent reports in [PR #113](https://github.com/hairer/humanise-yang-mills/pull/113)
reviewed the subsequent fingerprint
`37a404dea24a3001c320680e4b25334e619d6865178c86e3d85993bb4000168f`.
Their required Hall definition/citation addition is addressed by the follow-up
under [issue #114](https://github.com/hairer/humanise-yang-mills/issues/114),
which changes the fingerprint again and requires renewed independent review.
Both approvals remain null. No mathematical gap in the conditional scalar
argument is presently identified.

## Verification evidence

[Original source and axiom inspection](evidence/README.md),
[earlier pilot record](evidence/pilot-provenance.md), and
[LaTeX migration checks](evidence/latex-migration.md) distinguish the commands
run at each stage. The metadata lists the section, shared preamble and bibliography
so changes to any of them invalidate its review fingerprint.
