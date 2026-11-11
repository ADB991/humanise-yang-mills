# Logarithmic asymptotics of the running inverse coefficient

Draft proof unit [YM-000022](https://github.com/hairer/humanise-yang-mills/issues/22).
Human contributor: `hairer`. Agent assistance: Codex for exposition and integration;
GPT-6 Luna for bounded Lean source extraction. Neither contribution constitutes
independent review.

## Purpose and statement

The running estimate controls an inverse action coefficient uniformly in the
cutoff and the volume index. This unit extracts its leading coefficient and the
corresponding inverse-square-root asymptotic. The running estimate itself is an
input from the construction.

Let $a_m>0$, $m\in\mathbb N$, be spacings, and put
$$
 r_m=\log(a_m^{-1}).
$$
Assume $r_m\to+\infty$. Let $A,c\in\mathbb R$, and let
$\beta_{N,p}(m)\in\mathbb R$ be given for all $N,p,m\in\mathbb N$.
The input estimate is
$$
 \tag{R}
 \forall\delta>0\ \exists M_\delta\in\mathbb N\ \forall m\ge M_\delta\quad
 \forall N,p\in\mathbb N,\qquad
 m\le N\ \Longrightarrow
 |\beta_{N,p}(m)-(A+c r_m)|\le\delta r_m.
$$
In particular, the threshold $M_\delta$ is independent of both $N$ and $p$.

**Proposition (uniform extraction).** Under these hypotheses, for every
$\varepsilon>0$ there is $M\in\mathbb N$ such that $r_m>0$ and
$$
 \tag{1}
 \left|\frac{\beta_{N,p}(m)}{r_m}-c\right|<\varepsilon
 \qquad(m\ge M,\ N\ge m,\ p\in\mathbb N).
$$

**Theorem (logarithmic asymptotic).** Suppose in addition that $c>0$.
For every two sequences $N,k:\mathbb N\to\mathbb N$ satisfying
$N(i)\ge i$ for all sufficiently large $i$, one has
$$
 \tag{2}
 \frac{\beta_{N(i),k(i)}(i)}{r_i}\longrightarrow c.
$$
Both $r_i$ and $\beta_{N(i),k(i)}(i)$ are strictly positive for all
sufficiently large $i$. On that tail define
$$
 g_i=\frac{1}{\sqrt{\beta_{N(i),k(i)}(i)}}.
$$
Then
$$
 \tag{3}
 g_i\sqrt{\log(a_i^{-1})}\longrightarrow\frac{1}{\sqrt c}.
$$
The expressions in (2) and (3) are defined on a sufficiently late tail; they
may be extended arbitrarily to the remaining finitely many indices without
affecting their limits. There is no growth or monotonicity assumption on $k$,
and no further assumption on $N$.

## Definitions and notation

All logarithms are natural. Square roots in the mathematical statement are
nonnegative real square roots of nonnegative arguments; reciprocals in the
proof are taken only after positivity has been established. The index $m$
is the scale being observed, $N$ is a cutoff with $m\le N$, and $p$
is the auxiliary volume index. We write $k(i)$ when that volume index varies
along a sequence.

For the gauge-theory application, fix a family $C$ satisfying its construction
hypothesis and a gauge datum $G$ with nonabelian simple real Lie algebra.
The source correspondence below identifies the spacings, coefficients and the
constant $A$. With the source's Casimir normalization, set
$$
 b_0(G)=\frac{11\,\operatorname{cas}(G)}{48\pi^2},
 \qquad c=2b_0(G)=\frac{11\,\operatorname{cas}(G)}{24\pi^2}.
$$
The required positivity of $c$ is supplied by the gauge-theory input stated
below. Formula (3) therefore has limit $(2b_0(G))^{-1/2}$. Here $g_i$
denotes the numerical inverse square root of the running action coefficient;
identification with an independently defined physical coupling is not a
conclusion of this theorem.

More precisely, if $d$ is the real Lie-algebra dimension and
$e_1,\ldots,e_d$ is the fixed orthonormal color basis, the convention is
$$
 \operatorname{cas}(G)=-\frac1d\sum_{j=1}^d
 \operatorname{tr}_{\mathbb R}(\operatorname{ad}_{e_j}\circ
 \operatorname{ad}_{e_j}).
$$
Color coordinates identify the Lie algebra with a Euclidean space using the
matrix inner product $-\operatorname{Re}\operatorname{tr}(XY)/d_0$, where
$d_0$ is the dimension of the fixed defining representation. The trace in
the displayed Casimir formula is the trace of a real linear operator on the
Lie algebra, rather than the matrix trace in the defining representation.

## Dependencies

The mathematical proof uses the explicit data and hypotheses above. Its
application to a constructed family imports three interfaces:

1. The schedule supplies positive spacings and
   $\log(a_m^{-1})\to+\infty$.
2. The construction hypothesis supplies (R) with a fixed $A$ and the stated
   value of $c$.
3. For the gauge datum under consideration, nonabelian Lie-algebra simplicity
   implies $c>0$.

These interfaces are recorded precisely in the correspondence table. Their
construction and gauge-theoretic proofs are outside this unit. No canonical
proof units for them are linked here; consequently the metadata has an empty
`depends_on` list. This records the current ownership graph, not mathematical
independence from the inputs. Integration must supply or cite their proofs.

For the elementary limit rules we use Jiří Lebl, *Basic Analysis: Introduction
to Real Analysis*, Volume I, author-maintained
[HTML edition, §2.2](https://jirilebl.github.io/ra/html/sec_factslimsseqs.html),
inspected 11 November 2026: Proposition 2.2.6 (square roots of a nonnegative
convergent sequence) and Proposition 2.2.5(iv) (quotients of convergent sequences,
with nonzero denominator terms and nonzero denominator limit). The positivity
and passage to a tail needed for these results are checked below.

## Proof

Fix $\varepsilon>0$, and apply (R) with
$\delta=\varepsilon/2$. Since $r_m\to+\infty$, there is a second
threshold after which
$$
 r_m>\frac{2(|A|+1)}{\varepsilon}>0.
$$
Take $M$ to be the larger of this threshold and $M_{\varepsilon/2}$.
For every $m\ge M$, every $N\ge m$, and every $p$, the triangle
inequality and (R) give
$$
 \begin{aligned}
 \left|\frac{\beta_{N,p}(m)}{r_m}-c\right|
 &=\frac{|\beta_{N,p}(m)-c r_m|}{r_m}\\
 &\le\frac{|\beta_{N,p}(m)-(A+c r_m)|+|A|}{r_m}\\
 &\le\frac{\varepsilon}{2}+\frac{|A|}{r_m}
 <\varepsilon.
 \end{aligned}
$$
The last inequality follows from
$|A|/r_m<\varepsilon/2$; when $A=0$ it follows directly from
$0<\varepsilon/2$. Both thresholds were chosen before $N,p$, proving
the uniform assertion (1). Positivity of $c$ was not used.

Now assume $c>0$, and fix sequences $N,k$ as in the theorem. For each
$\varepsilon>0$, take the threshold from (1) and enlarge it until
$i\le N(i)$ also holds. Substituting $m=i$, $N=N(i)$, and
$p=k(i)$ into (1) then yields
$$
 \left|\frac{\beta_{N(i),k(i)}(i)}{r_i}-c\right|<\varepsilon
$$
for every subsequent $i$. This proves (2), including when $k$ varies
without any bound.

Write $x_i=\beta_{N(i),k(i)}(i)/r_i$ on the tail where $r_i>0$.
Taking $\varepsilon=c/2$ in (2) shows that eventually
$x_i>c/2>0$. Hence $\beta_{N(i),k(i)}(i)=r_i x_i>0$ there.
Restrict to this tail. Lebl's Proposition 2.2.6 applies to $x_i$, since
all its terms are nonnegative and $x_i\to c$. It gives
$\sqrt{x_i}\to\sqrt c$. The terms $\sqrt{x_i}$ and their limit
$\sqrt c$ are strictly positive. Proposition 2.2.5(iv), with numerator
the constant sequence 1, therefore gives
$$
 \frac{1}{\sqrt{x_i}}\longrightarrow\frac{1}{\sqrt c}.
$$
Finally, positivity of $\beta_{N(i),k(i)}(i)$ and $r_i$ gives
$$
 \frac{1}{\sqrt{x_i}}
 =\frac{\sqrt{r_i}}{\sqrt{\beta_{N(i),k(i)}(i)}}
 =g_i\sqrt{\log(a_i^{-1})}.
$$
For the first equality, both $\sqrt{x_i}$ and
$\sqrt{\beta_{N(i),k(i)}(i)}/\sqrt{r_i}$ are nonnegative and their
squares equal $x_i$; uniqueness of the nonnegative square root identifies
them. All expressions are therefore defined in ordinary real arithmetic.
Discarding or changing finitely many initial terms preserves a limit: for each
tolerance one simply enlarges its threshold beyond those indices. This proves
(3) and the asserted freedom in the finite prefix. ∎

## Editorial and literature notes

The focused search was for elementary sequence limit rules, not for a derivation
of the running estimate. The shared background directory was checked; its SU(2)
note concerns a different interface. The author-hosted statements of Lebl's two
propositions were read and their hypotheses checked. They supply precisely the
square-root and reciprocal limit steps; the uniform estimate and diagonal
substitution are proved here. No novel analysis result is claimed.

The exposition reorganizes the source argument into an abstract extraction
proposition and its application. It uses $\varepsilon/2$ where the Lean
proof uses $\varepsilon/4$, and establishes eventual positivity of the
coefficient before applying ordinary square-root identities. These are explicit
expository arguments, not claims that new named Lean theorems have been added.
The source's filter manipulations, local aliases and arithmetic normalization
serve these same mathematical steps and need no separate prose units.

Scott Armstrong's
[Yang–Mills informalization project](https://github.com/scottnarmstrong/yang-mills-informalization)
is credited for the VII.5/CP-03 decomposition used in the repository's provisional
plan. Its outline is a navigation aid, not evidence for this proof.

## Correspondence with Lean

All source references in this section use revision
`3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Fully qualified names identify
interfaces; line numbers are supplementary. The exact types and axiom reports
for the owned declarations are retained in [the Lean inspection output](evidence/lean-inspection.txt).

| Mathematical datum or step | Fully qualified declaration | Source path and location |
| --- | --- | --- |
| Spacing $a_m$, its positivity, $r_m=\log(a_m^{-1})$, and divergence | `YM.Schedule.a`, `YM.Schedule.a_pos`, `YM.Schedule.scale`, `YM.Schedule.divergent` | `Lean/YM/Lattice/Scale.lean:99–120` |
| The family's schedule and scalar coefficients | `YM.Family.S`, `YM.RG.History.β` | `Lean/YM/Source/Construction.lean:32–35`; `Lean/YM/RG/History.lean:210–211` |
| Fixed $A=C.\mathrm{path}.\mathrm{levels}.\mathrm{clock}.\mathrm{bar}$ and reference value $A+c r_m$ | `YM.RG.Calendar.bar`, `YM.RG.Calendar.hatBeta` | `Lean/YM/RG/History.lean:64–79` |
| Input (R), supplied by the construction hypothesis | `YM.Family.Makes.wilson`, `YM.RG.History.Selected.running`, `YM.RG.History.Running` | `Lean/YM/Source/Construction.lean:44–45`; `Lean/YM/RG/History.lean:229–240` |
| Color normalization and the Casimir formula | `YM.Gauge.Color`, `YM.Gauge.colorIso`, `YM.Gauge.trace_color`, `YM.Gauge.ad`, `YM.Gauge.casimir` | `Lean/YM/Gauge/Colors.lean:42–78,136–149,179–182` |
| Nonabelian real Lie-algebra simplicity | `YM.Gauge.Simple` | `Lean/YM/Gauge/Lie.lean:178–182` |
| $c=11\operatorname{cas}(G)/(24\pi^2)>0$ under simplicity | `YM.Gauge.slopeConstant`, `YM.Gauge.slopeConstant_pos` | `Lean/YM/Gauge/Colors.lean:184`; `Lean/YM/Gauge/Casimir.lean:174–176` |
| $b_0$ and $c=2b_0$ | `YM.Pert.Asymptotics.b0`, `YM.Pert.Asymptotics.b0_normalizes` | `Lean/YM/Pert/Asymptotics/RawAxis.lean:13–14` |
| Uniform extraction (1) | `YM.Pert.Asymptotics.zeroUp_bound` | `Lean/YM/Pert/Asymptotics/RawAxis.lean:15–30` |
| Numerical inverse square root | `YM.Pert.Asymptotics.regulatorRun` | `Lean/YM/Pert/Asymptotics/RawAxis.lean:35` |
| Sequence substitution (2), followed by limit (3) | `YM.Pert.Asymptotics.comparison` | `Lean/YM/Pert/Asymptotics/RawAxis.lean:36–48` |

The abstract statement weakens the construction's hypotheses to the exact
numerical interfaces used. In particular, the source's `Calendar.bar_pos`
requires $A>0$, while uniform extraction works for any fixed real $A$.
The source's `zeroUp_bound` needs `C.Makes` but no simplicity assumption;
`comparison` additionally assumes `G.Simple`. The latter is used here solely
through `YM.Gauge.slopeConstant_pos`. Neither the construction hypothesis nor
the simplicity predicate is redefined to mean only the consequence used here.

Lean defines `Real.sqrt` and inversion on every real input, including negative
arguments and zero. The definition of `regulatorRun` has no hypotheses, as its
elaborated type confirms. Our ordinary positive-tail definition agrees with
that totalized expression eventually, which suffices for the exact conclusion
of `comparison`. There is no assertion here that all finite-prefix terms are
positive. The introductory source comment expressly limits the interpretation
to the numerical proxy.

## Open questions

The numerical extraction argument has no identified unresolved step. Independent
mathematical and Lean-correspondence reviews are still required. The imported
construction estimate, schedule properties and gauge positivity result need
accepted exposition or references at integration; this draft does not discharge
those upstream obligations. No physical-coupling identification is established.

## Verification evidence

See [the evidence record](evidence/README.md) for commands, source-integrity
checks, elaborated signatures, axiom reports and validation limits.
