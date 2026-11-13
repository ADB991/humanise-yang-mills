# G01 M4: a generalized free field against the public hierarchy clauses

- Issue [#162](https://github.com/hairer/humanise-yang-mills/issues/162); follow-up to #58 and finding M4 of `../review/hairer-claude-20261113/mathematics.md`. Parent #26.
- Session `hairer-claude-g01-m4-20261113`, role AUTHOR. Claim: https://github.com/hairer/humanise-yang-mills/issues/162#issuecomment-6858760926 (until 2026-11-14 16:00 UTC). Prepared by Claude (Anthropic) for @hairer. The same account wrote the review that raised M4, so independent review by another account is required.
- Base: `codex/existence-monograph` at `97128ab`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Lean was read as text; nothing was elaborated.
- Files: this report and `trace_constant.py`, a numerical check of §2.

## Outcome (bounded partial result)

**No clause fails.** An explicit scalar generalized free field (GFF) $\phi$, with its Wick monomials in derivatives graded by scaling dimension, appears to supply hierarchy data $T_0$ satisfying:
- `Hierarchy.Reconstructed`, `Hierarchy.OperatorProductExpansion` and `Hierarchy.TraceTest` (`Lean/ChallengeSpec.lean`);
- the vanishing hypothesis `hH` of `YangMills.constant_insertion_witness` (`../formal/Adequacy.lean` l.735–738).

Proved here:
- the spectral choice and the trace normalization (§2), including the exact constant;
- `TraceTest` in full;
- the vanishing hypothesis, the phase clauses and the grading clauses;
- the OPE, given the standard Wick/graph representation of the correlations (§4).

**The first unresolved item is O1**: a written verification that the derivative Wick monomials of this GFF form a `WightmanTheory` satisfying `Axioms` exactly as the Lean structure demands. The difficult points are:
- the common domain must *equal* the span of the polynomial vectors (`cyclicVacuum`);
- `spectralRepresentation` uses the Euclidean pairing on $\mathbb R^4$;
- `boundary` asks for a particular one-ray boundary limit.

The literature covers closely related statements but, as far as checked here, none identical to these (§5). O2 (the combinatorial identity behind the OPE grouping) and O3 (the fine form of `boundary`) are routine but not written out.

**Consequence if O1–O3 close.** By `YangMills.constant_insertion_witness` and `jointExistence_body_constant_insertions` (already formalized and audited in G01), `YangMills.JointExistence` would follow at every simple $G$ from a GFF, with no Yang–Mills content. The public statement would then not certify existence of Yang–Mills theory. In particular, `adequacy.md` (d)(3), "as hard as before", would be false. The source itself flags the gap: the docstring of `Lean/YM/TraceExtension/Wick/Refute.lean` says "No claim against a continuous-mass generalized free field". Until O1–O3 are closed and reviewed, G01's (d)(3) should stay marked *open* (review Q2 wording), and G06 should not treat it as established.

## 1. The candidate

Fix a simple $G$ and put $n_G=\dim_{\mathbb R}\mathfrak g$, $A_G=3n_G/\pi^4$ (the constant of `TraceTest.shortDistance`). Let
$$
\rho(ds)=c\,s^{2}(\log s)^{-2}\,\mathbf 1_{\{s\ge e^{2}\}}\,ds,\qquad c=\frac{n_G}{16\pi^2}.
$$
$\rho$ is a positive Borel measure on $(0,\infty)$, polynomially bounded: $\int(1+s)^{-4}\rho(ds)<\infty$. Its support is bounded away from $0$. Let $\phi$ be the hermitian scalar GFF with Källén–Lehmann measure $\rho$ (Greenberg 1961). On the symmetric Fock space over $L^2(\mathbb R^4,\mu)$ it is
$$
\mu(dp)=\int\rho(ds)\,\delta(p_t^2-|\mathbf p|^2-s)\,\mathbf 1_{p_t>0}\,dp,\qquad
\phi(f)=a(\hat f)+a^*(\hat f),
$$
with the time coordinate last, as in `PublicTheory.lean`. Its Euclidean two-point function is
$$
S(x)=\int\rho(ds)\,\Delta_{\sqrt s}(|x|),\qquad \Delta_m(r)=\frac{m\,K_1(mr)}{4\pi^2 r},
$$
with $\Delta_m$ the four-dimensional Euclidean propagator of mass $m$.

**Labels and grades.** Let $\mathcal L$ be the complex polynomial algebra in the commuting symbols $\xi_\alpha$, $\alpha\in\mathbb N^4$ ($\xi_\alpha$ stands for $\partial^\alpha\phi$), with unit $1$. A monomial $\xi_{\alpha_1}\cdots\xi_{\alpha_k}$ has grade $4k+\sum|\alpha_i|$, and $1$ has grade $0$. Put `labels` $=\mathcal L$ and let `Field d` be the span of the monomials of grade $\le d$, a finite-dimensional *filtration*, with `toLabel` the inclusion. The monomial $\xi_{\alpha_1}\cdots\xi_{\alpha_k}$ acts as the Wick monomial ${:}\partial^{\alpha_1}\phi\cdots\partial^{\alpha_k}\phi{:}$, and $1$ as the identity. Set `centeredTrace` $=\xi_0\in$ `Field 4`. The filtration rather than a grading is forced by `covers`: every label must lie in the image of one grade.

**Phases and lattice data.** Put `Character` $=$ `Unit`, `phaseMeasure` $=$ the Dirac mass, and `correlation s` independent of `s`: the Euclidean (Schwinger) function at separated points and $0$ elsewhere. `continuation` is the analytic continuation of the Wightman functions (§3). Take `C₀` a Wilson family whose token type is `Σ d, Field d`, and `project` $=$ the identity (for `represents`). Only the type of `C₀` matters for the witness theorem.

**Channels and coefficients.** `Channel j` is the set of monomials of grade exactly $j$, and `actor` is the inclusion. `coefficient a j i x o` is the Wick-expansion coefficient defined in §4.

## 2. `TraceTest` (proved here)

`traceTwo r` $=S$ at separation $r$, because `timePair r` puts the two points at distance $r$. Substitute $u=\sqrt s\,r$:
$$
r^8(\log r^{-1})^2S(r)=\frac{c}{8\pi^2}\int_{e r}^{\infty}u^6K_1(u)\,\frac{L^2}{(L+\log u)^2}\,du,\qquad L=\log r^{-1}.
$$
On $u\ge er$ one has $L+\log u\ge1$. The factor $L^2/(L+\log u)^2$ tends to $1$ pointwise. It is bounded by $4$ on $u\ge\sqrt r$, where $L+\log u\ge L/2$. On $[er,\sqrt r]$ it is at most $L^2$, while $\int_0^{\sqrt r}u^6K_1(u)\,du=O(r^{3})$, because $u^6K_1(u)=O(u^5)$. Dominated convergence on $[\sqrt r,\infty)$, together with the vanishing contribution of $[er,\sqrt r]$, gives
$$
r^8(\log r^{-1})^2S(r)\longrightarrow\frac{c}{8\pi^2}\int_0^\infty u^6K_1(u)\,du=\frac{c}{8\pi^2}\,2^5\Gamma(4)\Gamma(3)=\frac{48c}{\pi^2}=A_G .
$$
The moment uses $\int_0^\infty u^{\mu}K_\nu(u)\,du=2^{\mu-1}\Gamma(\tfrac{1+\mu+\nu}2)\Gamma(\tfrac{1+\mu-\nu}2)$. `trace_constant.py` confirms the moment ($384$) and shows the ratio to $A_G$ tending to $1$, as $0.55, 0.72, 0.84, 0.93, 0.97$ at $L=5,10,20,50,100$, with the expected $O(1/L)$ approach.

- `centered`: $\langle\Omega,\phi(f)\Omega\rangle=0$ in Fock space.
- `amplitudePositive`: immediate.
- `excludes`: the argument of `YM.TraceExtension.Wick.euclidean_excludes` (`Refute.lean` l.75–80) uses only the asymptotic. If `traceTwo` were eventually equal to `wickProfile terms`, the real part of that profile would satisfy `Expands` (`real_profile`), and `no_powerlog` (`Wick/Log.lean` l.96) would force $A_G=0$. The bridge `nativeTerms`/`profile_eq` used by `YangMills.publicTrace` (`Lean/TraceBridge.lean` l.36–44) applies verbatim. This confirms review M5 for an arbitrary hierarchy. Lean formalization of the generic statement: not done.

## 3. `Reconstructed` and the vanishing hypothesis

| Clause | Status | Argument |
| --- | --- | --- |
| `normalized`, `fullSupport`, `characterContinuity`, `mixture` | P | one phase, Dirac measure on a point |
| `injective`, `covers` | P | inclusions of a filtration whose union is $\mathcal L$ |
| `represents` | P | `project` is the identity on the chosen token type |
| `acts` | P | $\phi(f)\Omega\ne0$ for $\hat f\not\equiv0$ on $\operatorname{supp}\mu$ |
| `faithful` | P (given O1) | Write $P=\sum_kP_k$ by Wick degree. The $k$-particle component of $P(f)\Omega$ is $\hat f(p_1+\dots+p_k)\,\mathrm{Sym}\,P_k(ip_1,\dots,ip_k)$ on $\operatorname{supp}\mu^{\otimes k}$. This support has nonempty interior ($\{p_t>0,\ p^2>e^2\}$ is open), so a nonzero symmetrized polynomial does not vanish there, and $\hat f$ can be chosen nonzero at a point where it does not |
| `permutation`, `smooth` | P | The Schwinger functions are finite sums, over contraction graphs without self-lines, of products of derivatives of $S$. $S$ is real-analytic and Euclidean-invariant on $x\ne0$, so the functions are symmetric and smooth on separated configurations |
| `analytic`, `root` | S | Spectrum in the forward cone; with the Lean convention (below), $\langle\Omega,\phi(x_0)\phi(x_1)\Omega\rangle=\int e^{i\langle x_1-x_0,p\rangle}d\mu$ continues to $\operatorname{Im}(t_1-t_0)>0$, which is `orderedTube`. At purely imaginary times the continuation is the Laplace transform, which equals the Euclidean Wick formula with $S$ (Osterwalder–Schrader; explicit for a GFF) |
| `boundary` | S / **O3** | the standard boundary-value theorem for Laplace transforms of tempered distributions supported in a cone, applied along the ray $r\cdot$`height`; the exact Lean form (one fixed ray, product tests) is not written out |
| `axioms` (W0–W3) | **O1** | see §5 |
| vanishing hypothesis `hH` | P | `correlation` is multilinear in the labels and `toLabel 0 0 = 0` |

**Spectral convention.** `W0.spectralRepresentation` requires `charFun (diagonal ψ) a = ⟪ψ, U(a)ψ⟫`, where Mathlib's `charFun` pairs with the *Euclidean* inner product of $\mathbb R^4$. Take the energy–momentum measure to be the joint spectral measure of the generators in that pairing; the field covariance in `W2` fixes $U(a)\phi(f)U(a)^{-1}=\phi(f(\cdot-a))$. Since $\mu$ depends only on $p_t$ and $|\mathbf p|$, it is invariant under $\mathbf p\mapsto-\mathbf p$, so the sign of the spatial pairing is immaterial. `positiveEnergy` holds because sums of points of $\{p_t\ge|\mathbf p|\}$ stay there. `uniqueVacuum` holds because $\operatorname{supp}\mu$ is bounded away from $p=0$. This is a check of conventions, not a new mathematical input.

## 4. `OperatorProductExpansion` (argued here)

Let $a:I\to$ Tag carry monomials of total grade at most $w=$ `weight a`, at points $x$ with `Within r M η x o`. Let $b:J\to$ Tag sit at $y$ with `Clear o y c`. By Wick's theorem, `grouped s a x b y` is a finite sum over contraction graphs $\Gamma$ without self-lines. Each graph is a product of derivatives of $S$ along its lines: internal lines join two $x$'s, external lines join an $x$ to a $y$, and spectator lines join two $y$'s.

The two bounds used are:
- (i) $|\partial^\gamma S(z)|\le C_\gamma|z|^{-8-|\gamma|}$ for $0<|z|\le1$, from the substitution of §2 and $(\log)^{-2}\le1$;
- (ii) $\sup_{|z|\ge c/2}|\partial^\gamma S(z)|<\infty$, by exponential decay, since $\operatorname{supp}\rho\subset[e^2,\infty)$.

*Expansion.* In every external line, Taylor-expand the $x_i$-end about $o$ to order $K$. Group the terms by the multiset of external half-lines $(\alpha_e+\beta_e)$. By Wick's theorem at $o$, the sum over spectator contractions of each group equals `grouped s ⟨j, m⟩ o b y`, where $m=\xi_{\alpha_1+\beta_1}\cdots$ has grade $j=\sum_e(4+|\alpha_e|+|\beta_e|)$. Its coefficient is the product of the internal lines times $\prod_e(x_{i_e}-o)^{\beta_e}/\beta_e!$, summed over the graphs with those external legs. This defines `coefficient a j m x o`; it is independent of $b,y$. Writing this grouping out with its symmetry factors is **O2**: routine, but not written out here.

*Coefficient bound.* An internal line consumes two fields and their derivatives. By (i) and `Within`, it contributes at most $C(\eta r)^{-8-|\gamma|}$. Each Taylor monomial contributes $(Mr)^{|\beta|}$. Grade bookkeeping gives a product bounded by $C\,r^{\,j-w'}$, where $w'\le w$ is the true total grade, hence by $r^{\,j-w-\varepsilon}$ for $r<r_0(\varepsilon)$. This is `coefficients`, uniform in $x,o$.

*Remainder.* With $K=D+1$, there are two kinds of error:
- Taylor remainders, each $O(r^{K+1})$ times derivatives of $S$ on $|z|\ge c/2$, by (ii);
- the dropped groups of grade $j>D$, with coefficients $O(r^{j-w'})$, $j\ge D+1$, times spectator correlations bounded by (ii).

Both are $O(r^{D+1-w'})\le r^{D+1-w-\varepsilon}$ for small $r$, uniformly in $y$ (far spectators included, by decay) and in the phase. This is `remainder`.

## 5. O1: the Wightman axioms in the Lean form

The required facts are:
- the fields `field m f` $={:}\partial^{\alpha_1}\phi\cdots{:}(f)$ map the common domain $D_0=\operatorname{span}\{\phi_{m_1}(f_1)\cdots\phi_{m_n}(f_n)\Omega\}$ into itself (this *defines* $D_0$, as `cyclicVacuum` requires);
- $D_0$ is dense; the fields are tempered on it and satisfy the adjoint identity, `W2` covariance with finite-dimensional label transformations, and locality.

The natural proof realizes every Wick monomial on the space $D_{\mathcal S}$ of finite-particle vectors with Schwartz wavefunctions restricted to $\operatorname{supp}\mu^{\otimes n}$:
- the creation parts give $\hat f(p_1+\dots+p_k)\prod(ip)^{\alpha}$, which is square-integrable because $\mu$ is tempered;
- the annihilation parts integrate Schwartz wavefunctions against $\mu$;
- the mixed parts combine the two.

$D_{\mathcal S}$ is then invariant, and $D_0\subset D_{\mathcal S}$ is invariant by construction. Density of $D_0$ follows from density of $\{\hat f|_{\operatorname{supp}\mu}\}$ in $L^2(\mu)$ and of polynomial vectors in Fock space. Locality follows because the commutator of $\phi$ is a c-number supported in the light cone. Covariance is the second quantization of the Poincaré action on $L^2(\mu)$.

Literature located for this step, with its limits:
- **Greenberg**, *Generalized free fields and models of local field theory*, Annals of Physics (1961), doi:10.1016/0003-4916(61)90032-X (volume and pages not verified here). Introduces GFFs as Wightman fields. Only bibliographic data was checked here, not the statements.
- **A. Klein**, *Renormalized products of the generalized free field and its derivatives*, Pacific J. Math. 45 (1973), no. 1. Constructs the products as continuous sesquilinear forms on the $C^\infty$ vectors of an adjusted free Hamiltonian, which are operators under extra conditions on the test function and on $\mu$ (Theorem 2), and proves covariance (Theorem 3). This is a different domain and smearing class from those `W1` requires, so it does not directly give `cyclicVacuum`/`tempered`. It supports the plausibility of O1 but does not discharge it.
- **Dütsch and Rehren**, *Generalized free fields and the AdS–CFT correspondence*, Ann. Henri Poincaré 4 (2003) (arXiv:math-ph/0209035). Treat GFFs as well-behaved Wightman fields. The statements were not checked here against the Lean form.

O1 therefore needs either a written Fock-space proof along the lines above or a precisely matching reference (Gårding–Wightman's operator realization of free-field Wick products is the closest model). It also needs a check of the details of `PoincareAction` (the coordinates homeomorphism and the label action).

## 6. Recommendation

- Keep the G01 statement of (d)(3) as *open*, with the Q2 wording of the G01 review, and record in G01 that the only obstacle located so far to a GFF witness is the verification of O1–O3, not a failing clause.
- Open a bounded proof task for O1 (with O3), then an independent mathematics and source-correspondence review of this record and of that proof.
- If O1–O3 close, the coordinator should decide how the monograph presents the public statement: as stated, it would be satisfiable without Yang–Mills content. In that case the meaningful theorem is the internal one (`YangMills.constructed` with its Wilson-family identification), and the public statement should be described accordingly.

## Checks actually run

- Source read at the pin: `Lean/ChallengeSpec.lean` (all), `Lean/PublicTheory.lean` (all), `../formal/Adequacy.lean` l.730–765, `Lean/TraceBridge.lean` l.30–48, `Lean/YM/TraceExtension/Wick/Refute.lean` l.1–90, `Wick/Log.lean` l.96, `Wick/Expansion.lean` l.47, `LogScaling.lean` l.74–75.
- `python3 -I trace_constant.py` (numpy, scipy): moment $384.0000$; ratios as in §2 for $n_G=3,8$.
- Literature: web search for GFF and Wick-product references, and a reading of the theorem statements of Klein (1973) from the MSP PDF. The Greenberg and Dütsch–Rehren texts were not read.
- No Lean code was written or elaborated, and no manuscript file was changed.
