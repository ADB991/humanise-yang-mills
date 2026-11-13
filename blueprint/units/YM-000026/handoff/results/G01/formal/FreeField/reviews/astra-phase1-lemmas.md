I found **no false lemma among the ten**. My verdict is **TRUE for each, as a mathematical statement about the definitions actually present**. The sign conventions, scaling dimension, logarithmic asymptotic, and OPE exponents are consistent.

This is a mathematical architecture review, not a completed Lean verification. The adjoint, Poincaré action, host vectors, and OPE coefficients are still existentially specified rather than concretely defined. I found one significant gap in the integrability proof outline, explained below, but it has a valid repair that requires no change to the statements.

I read the three public files first, then `DESIGN.md`, then every `FreeField/` source file. I modified no file.

1. **[`Host.reconstruct`](FreeField/Reconstruction.lean:91): TRUE.**

   Its mathematical statement is: given a Hilbert space containing word vectors satisfying `Host.Good`, there exists a Wightman theory satisfying all public W0–W3 axioms, with vacuum expectations equal to the host’s vacuum–word inner products. If every nonzero label acts nontrivially on some host word vector, the resulting fields are faithful.

   Put \(D=\operatorname{span}\{\Psi(w)\}\) and \(H=\overline D\). The essential well-definedness argument works with exactly the stated adjoint hypothesis. If \(\sum_j c_j\Psi(w_j)=0\), then, for every word \(v\),
   \[
   \left\langle\sum_jc_j\Psi(a::w_j),\Psi(v)\right\rangle
   =
   \left\langle\sum_jc_j\Psi(w_j),\Psi(a^\dagger::v)\right\rangle=0.
   \]
   The vector on the left belongs to \(D\), so it vanishes. Consequently, prepending a letter defines an operator on \(D\). Head linearity supplies linearity in the label and test.

   Here is the check against every public axiom field:

   | Public field | Why `Host.Good` suffices |
   |---|---|
   | W0 `spectralRepresentation` | Restrict the host translations and diagonal measures to \(H\). |
   | W0 `positiveEnergy` | Restrict the host’s zero projection on the cone complement. |
   | W0 `uniqueVacuum` | A translation-invariant vector in \(H\) is one in the host. |
   | W1 `normalizedVacuum` | `vacuum_norm`. |
   | W1 `denseDomain` | \(H=\overline D\). |
   | W1 `cyclicVacuum` | The reconstructed word vectors are precisely the host word vectors. |
   | W1 `tempered` | Every domain state is a finite linear combination of words; use `tempered` and finite sums. |
   | W1 `adjoint` | Extend `adjoint` sesquilinearly from word vectors. |
   | W2 `labelIdentity` | `label_one`. |
   | W2 `labelComposition` | `label_mul`. |
   | W2 `domainInvariant` | `covariant` maps word vectors to word vectors. |
   | W2 `vacuumInvariant` | Apply `covariant` to the empty word. |
   | W2 `fieldCovariance` | Apply `covariant` to a prepended word, then extend linearly. |
   | W3 `locality` | Extend `locality` linearly in the domain state. |

   The required translation and Poincaré representation laws, strong continuity, norm preservation, coordinate laws, and test pullback are already fields of the host’s public structures. They restrict correctly. Although `Symmetry` is not declared to be a group, its bijective coordinates and specified multiplication supply inverse elements through the ordinary Poincaré inverse.

   Restricting the spectral projections needs an argument; mere invariance of \(H\) under translations is insufficient without it. Here the proposed argument works. Translations by both \(a\) and \(-a\) preserve \(H\), so \(H^\perp\) also is invariant. For \(u\in H^\perp\), \(v\in H\), the four vectors \(u+i^kv\) have identical translation characteristic functions. Uniqueness of finite measures from characteristic functions, followed by polarization, gives \(\langle u,E(B)v\rangle=0\). Thus measurable spectral projections preserve \(H\). All public PVM fields then restrict, including countable additivity and the diagonal identity. Setting nonmeasurable-set projections to zero is permitted.

   There is no missing involutivity hypothesis on `adj`: the public adjoint axiom itself does not require one. Nor are the `Good` hypotheses contradictory; even a one-dimensional zero-field host satisfies them. The faithful generalized-free-field host requires the additional construction addressed next.

2. **[`exists_fockHost`](FreeField/Theory.lean:40): TRUE.**

   Its actual statement asserts the existence of **some** good host for the specified label space, reproducing `wightmanL`, with every nonzero label acting nontrivially on some word vector. Its type does not specify a particular Fock space, adjoint, action, or formula for \(\Psi\).

   Write \(p=(\mathbf p,E)\), \(s=E^2-|\mathbf p|^2\), and
   \[
   d\mu(p)=\mathbf1_{E\ge|\mathbf p|}
       \frac{s^2}{\log^2(e+s)}\,d^4p.
   \]
   This is a positive, locally finite, tempered measure. On its support,
   \[
   0\le \operatorname{weight}(p)\le s^2\le E^4.
   \]
   In particular, \(\int(1+|p|)^{-N}\,d\mu(p)<\infty\) for \(N>8\).

   Proper orthochronous Lorentz transformations preserve the density and Lebesgue measure. The transpose action needed for the Euclidean pairing also preserves them: with \(J=\operatorname{diag}(-1,-1,-1,1)\),
   \[
   \Lambda^T=J\Lambda^{-1}J.
   \]
   Each factor preserves the cone and Minkowski square, and the absolute determinant is one.

   The consistent state action is
   \[
   (U(\Lambda,a)\psi)_k(p_1,\ldots,p_k)
   =e^{\,i a\cdot\sum_jp_j}
     \psi_k(\Lambda^Tp_1,\ldots,\Lambda^Tp_k).
   \]
   Its composition law is exactly \((\Lambda,a)(\Gamma,b)=(\Lambda\Gamma,a+\Lambda b)\). Its translation characteristic functions use the positive exponential and Euclidean pairing required by Mathlib’s `charFun`.

   The compatible adjoint on a basis monomial is
   \[
   \left(\delta_{\{\alpha_1,\ldots,\alpha_k\}}\right)^\dagger
   =(-1)^{\sum_j(\alpha_j)_t}\delta_{\{\alpha_1,\ldots,\alpha_k\}},
   \]
   extended conjugate-linearly. This is essential: a label with one time derivative represents \(i\partial_t\phi\), which is anti-Hermitian.

   For first derivatives, let \(D=\operatorname{diag}(1,1,1,i)\). The label action, with columns representing images of basis labels, must be
   \[
   \rho(\Lambda)=D^{-1}\Lambda D.
   \]
   For a boost mixing coordinates \(x\) and \(t\),
   \[
   \rho(\Lambda)\xi_t=\cosh\chi\,\xi_t+i\sinh\chi\,\xi_x,\qquad
   \rho(\Lambda)\xi_x=\cosh\chi\,\xi_x-i\sinh\chi\,\xi_t.
   \]
   Extend this to higher derivatives and Wick monomials by the corresponding symmetric powers; translations act trivially on labels. This agrees with the public test pullback and `fieldCovariance`, and commutes with the adjoint.

   Positivity is available for the **whole Wick hierarchy**, not just its two-point function. The open-matching construction gives
   \[
   W(u^\dagger v)=\langle\Psi(u),\Psi(v)\rangle,
   \]
   so every finite word Gram matrix is positive semidefinite. The factorial normalization described in the design is consistent with the matching multiplicities.

   Faithfulness also holds. For a nonzero label, choose a nonzero component with a fixed number \(k\) of Wick factors. Its vacuum-created \(k\)-particle wavefunction is a nonzero symmetric polynomial in the momenta, multiplied by \(\widehat f(\sum p_j)\). Distinct multisets of derivative multi-indices give linearly independent symmetrized monomials. The measure has positive density on the open timelike cone, so a nonzero polynomial cannot vanish almost everywhere there. A Gaussian test, whose Fourier transform never vanishes, suffices. In fact, the empty word can serve as the witness \(u\).

   There is **no infrared obstruction**. The density vanishes at the light cone and origin; it has no atom at zero momentum. On every \(k\ge1\) sector, \(\sum_jE_j>0\) almost everywhere. Hence only the zero-particle sector contains invariant vectors, despite the absence of a mass gap. The spectrum remains in the closed forward cone.

   Locality follows from the mass-shell decomposition
   \[
   d\mu=
   \int_0^\infty\frac{s^2}{\log^2(e+s)}\,ds\,
   \frac{d^3\mathbf p}{2\sqrt{|\mathbf p|^2+s}},
   \]
   with the shell energy understood in the integrand. The resulting commutator is a tempered superposition of causal free commutators. Derivatives and finite Wick polynomials preserve locality. This construction for polynomially bounded spectral weights, including Wick derivatives, is also treated in [Dütsch–Rehren, §2–2.1](https://arxiv.org/pdf/math-ph/0209035).

   Cluster decomposition survives: cross-cluster Euclidean contractions decay at large separation, while smeared Wightman cross terms obey the corresponding Fourier-decay argument. The absolute-integrability estimate needed for these statements is given under lemma 7.

3. **[`corrL_perm`](FreeField/Continuation.lean:31): TRUE.**

   It says that simultaneously permuting labels and positions leaves `corrL` unchanged on separated configurations.

   Since \(S(\xi)=S(-\xi)\),
   \[
   \partial^\gamma S(-\xi)=(-1)^{|\gamma|}\partial^\gamma S(\xi),
   \]
   and therefore
   \[
   \operatorname{lineS}(\alpha,\beta,\xi)
   =\operatorname{lineS}(\beta,\alpha,-\xi).
   \]
   A vertex permutation induces a bijection of legs and matchings. Reversing an edge’s orientation changes neither its factor nor its multiplicity.

   Repeated labels do not cause undercounting: `Multiset.ToType` distinguishes repeated occurrences. For example, the definitions give
   \[
   \langle:\phi^2:(x):\phi^2:(y)\rangle=2S(y-x)^2,
   \]
   and \(\langle:\phi^2:(x)\phi(y)\phi(z)\rangle=2S(y-x)S(z-x)\). A short enumeration reproduced the expected matching counts \(2,2,3\) for multiplicities \((2,2),(2,1,1),(1,1,1,1)\).

   The small cases are also correct. For \(n=0\), there is one empty matching and the result is \(1\). For \(n=1\), every nonempty monomial has no matching; only the coefficient of the empty monomial survives. The empty monomial and the zero label are correctly distinct.

4. **[`corrL_contDiffOn`](FreeField/Continuation.lean:43): TRUE.**

   It asserts that each fixed-label Euclidean correlation is \(C^\infty\) on the open set of pairwise distinct configurations.

   For \(r>0\), differentiation under the Laplace integral is justified to every order. More explicitly,
   \[
   |S_r^{(k)}(r)|
   \le
   \frac{32\pi}{105}\Gamma(8+k)\,r^{-8-k}.
   \]
   This follows by replacing the logarithmic denominator by \(1\) and performing the spatial radial integral. Radial differentiation consequently gives
   \[
   |\partial^\gamma S(\xi)|\le C_\gamma|\xi|^{-8-|\gamma|}
   \qquad(\xi\ne0).
   \]
   Each matching is a finite product of such derivatives at nonzero differences, and each label has finite support.

   Setting `corrL` to zero on coincident configurations does not interfere with smoothness **on the specified open set**.

5. **[`contL_differentiableOn`](FreeField/Continuation.lean:55): TRUE.**

   It asserts complex differentiability in the entire tuple of complex times, for fixed spatial positions, on the strictly ordered imaginary-time tube.

   Every edge is oriented \(v<w\), so \(\operatorname{Im}(z_w-z_v)>0\). Locally in this tube the finitely many relevant gaps have a common positive lower bound. The integrand and all its time derivatives are then bounded by a polynomial in \(E\) times \(e^{-\delta E}\). This proves holomorphy of each line integral; composition with \(z\mapsto z_w-z_v\), finite products, and finite sums gives the asserted differentiability. The \(n=0,1\) cases are constant functions.

6. **[`contL_root`](FreeField/Continuation.lean:69): TRUE.**

   It says that at strictly increasing Euclidean times, substituting **positive** imaginary times \(z_j=i\tau_j\) into `contL` gives exactly `corrL`.

   Here is the explicit sign check from the definitions. For the basic field,
   \[
   W_{\phi\phi}(x,y)
   =\int e^{\,i[(t_y-t_x)E+(\mathbf y-\mathbf x)\cdot\mathbf p]}\,d\mu(p).
   \]
   Thus its convergent continuation is in the upper half-plane of the **later-minus-earlier** time difference. At \(z=i\tau\), \(\tau>0\), the exponential becomes
   \[
   e^{-\tau E+i\mathbf u\cdot\mathbf p}.
   \]
   Both the sign and orientation agree with `orderedTube`, `imaginaryTimes`, `complexShift`, `fourierE`, and the public spectral convention.

   Euclidean invariance gives
   \[
   \int e^{-\tau E+i\mathbf u\cdot\mathbf p}\,d\mu(p)
   =S_r\!\left(\sqrt{\tau^2+|\mathbf u|^2}\right).
   \]
   The design’s one-variable proof is valid: continue
   \(\int e^{-\tau E+s p_1}\,d\mu\) from real \(|s|<\tau\) to \(s=i|\mathbf u|\). Both sides are holomorphic on \(|\operatorname{Re}s|<\tau\), using the square-root branch with positive real part.

   For \(\xi_t=i\partial_t\phi\), the actual line factors are
   \[
   A_{e_t}=E,\qquad B_{e_t}=-E.
   \]
   Hence
   \[
   \begin{aligned}
   \operatorname{lineC}(e_t,0,i\tau,\mathbf u)
     &=\int E e^{-\tau E+i\mathbf u\cdot\mathbf p}\,d\mu
       =-\partial_\tau S(\mathbf u,\tau),\\
   \operatorname{lineC}(0,e_t,i\tau,\mathbf u)
     &=-\int E e^{-\tau E+i\mathbf u\cdot\mathbf p}\,d\mu
       =+\partial_\tau S(\mathbf u,\tau),\\
   \operatorname{lineC}(e_t,e_t,i\tau,\mathbf u)
     &=-\int E^2 e^{-\tau E+i\mathbf u\cdot\mathbf p}\,d\mu
       =-\partial_\tau^2 S(\mathbf u,\tau).
   \end{aligned}
   \]
   These are exactly the three `lineS` values. In general,
   \[
   A_\alpha B_\beta
   =(-1)^{|\alpha|}
     \prod_{j<3}(ip_j)^{\alpha_j+\beta_j}
     (-E)^{\alpha_t+\beta_t},
   \]
   so equality holds term by term for every matching.

   The negative two-time-derivative correlation is consistent with positivity because \(\xi_t^\dagger=-\xi_t\). In particular,
   \[
   W(\xi_t^\dagger(\bar f),\xi_t(f))
   =\int E^2|\widehat f(p)|^2\,d\mu(p)\ge0.
   \]

   I checked the integrals numerically with SciPy, independently differentiating the radial expression by finite differences. At \(\tau=1.3\), \(|\mathbf u|=0.7\):

   | Quantity | Momentum integral | Radial expression |
   |---|---:|---:|
   | Basic field | 28.5769557596 | 28.5769557596 |
   | Earlier time derivative | 116.541478108 | 116.541482399 |
   | Later time derivative | −116.541478108 | −116.541482399 |
   | Both time derivatives | −525.992876450 | −525.992886224 |
   | Earlier spatial derivative parallel to \(\mathbf u\) | 62.7531035964 | 62.7531033610 |

   The differences are consistent with finite-difference error.

7. **[`contL_boundary`](FreeField/Continuation.lean:83): TRUE.**

   It asserts convergence of the genuinely smeared continuation, along every strictly ordered height ray, to the explicitly defined `wightmanL`.

   For an edge \(v\to w\),
   \[
   e^{\,i(x_w-x_v)\cdot q}
   =e^{-ix_v\cdot q}e^{+ix_w\cdot q}.
   \]
   Consequently, integrating against the product tests gives
   \[
   \prod_v\widehat f_v(k_v),
   \qquad
   k_v=\sum_{\text{incoming}}q-\sum_{\text{outgoing}}q.
   \]
   This verifies the sign of `vertexMomentum` directly. The imaginary shift contributes
   \[
   \exp\!\left[-r\sum_{v\to w}(h_w-h_v)E_{vw}\right],
   \]
   which is bounded by \(1\) and tends to \(1\).

   The key integrability argument must use **cuts**, because incoming and outgoing momenta can cancel at an individual vertex. For the cut after vertex \(j\),
   \[
   Q_j=\sum_{v\le j<w}q_{vw}=-\sum_{v\le j}k_v.
   \]
   All momenta in \(Q_j\) are forward-pointing. Every edge crosses at least one cut, giving
   \[
   \sum_e E_e
   \le\sum_{j=0}^{n-2}(Q_j)_t
   \le(n-1)\sum_v |(k_v)_t|.
   \]
   Since \(|q_e|\le\sqrt2 E_e\), all edge momenta are controlled by the vertex momenta. Arbitrarily rapid Schwartz decay of \(\prod_v\widehat f_v(k_v)\) therefore dominates every polynomial from the weights and derivatives. Choose a decay order exceeding that polynomial degree plus the integration dimension \(4\,\#\text{edges}\).

   This proves absolute integrability, including near zero momentum. For fixed \(r>0\), exponential damping also justifies the original position–momentum Fubini interchange. Dominated convergence then gives precisely `wightmanL`.

   A Gaussian check supported the boundary orientation: for normalized four-dimensional Gaussians, the basic smeared value approaches \(0.456882448796\); the earlier-time-derivative value approaches \(0.739802516876\). At \(r=0.001\), the respective damped integrals were \(0.456143289127\) and \(0.738517218086\).

   For \(n=0\), both sides are \(1\). For \(n=1\), both sides are the empty-monomial coefficient times \(\int f\).

8. **[`exists_ope_coefficient`](FreeField/OPE.lean:38): TRUE.**

   Its statement is that one coefficient family works for every gauge group, Hilbert space, supplied theory, and trace scale. The OPE only reads the concrete correlation, actors, grades, and coefficients, so this independence is possible.

   The public quantifier order is crucial:

   - The coefficient threshold may depend on the input tags, \(M,\eta,\epsilon,j\), and channel.
   - The remainder threshold may additionally depend on spectator tags, \(c\), and \(D\).
   - It must be uniform in positions \(x,o,y\) and the argument \(s\).
   - It need not be uniform across all truncation orders or all spectator labels.
   - Here \(s:\mathrm{Option}\,\mathrm{Character}\) is a phase argument, **not an arbitrary Hilbert-space state**. The concrete correlations are independent of it.

   The partial-matching/Taylor coefficient family described in the comments supplies such a family. Its estimates can be checked directly.

   First take monomial inputs of actual total grade \(w'\). For an internal partial matching \(G\), let
   \[
   g_0=\sum_{\text{unmatched legs }e}(4+|\alpha_e|).
   \]
   The internally contracted legs account for exactly \(w'-g_0\) units of grade. The derivative bound from lemma 4 and `Within` give
   \[
   \left|\prod_{\text{internal edges}}\operatorname{lineS}\right|
   \le C\,r^{g_0-w'}.
   \]
   A Taylor assignment \(\beta_e\) produces the channel
   \(\{\alpha_e+\beta_e\}_e\), of grade
   \[
   j=g_0+\sum_e|\beta_e|.
   \]
   Its displacement factors are bounded by \(C r^{j-g_0}\). Therefore each coefficient is bounded by
   \[
   C r^{j-w'}.
   \]

   For general tags, every contributing monomial satisfies \(w'\le W\), where \(W\) is the public tag weight. Thus, for \(r<1\),
   \[
   |C_a^{j,i}(x,o)|\le C r^{j-W}
   \le r^{j-W-\epsilon}
   \]
   once \(r\) is sufficiently small. The positive \(\epsilon\) absorbs the fixed constant. The \(r^{-8}/\log^2(1/r)\) contraction is compatible with this estimate; it is bounded by \(C r^{-8}\).

   For the remainder, split each complete matching according to its internal cluster edges. Its remaining function \(F_G\) has lines only from unmatched cluster legs to spectators, or between spectators. It has no lines joining two unmatched cluster legs. Consequently, it is smooth even when all those leg positions coincide at \(o\).

   Once \(Mr<c/2\), `Clear` ensures that every cluster-to-spectator distance along the Taylor segment is at least \(c/2\), and every spectator-to-spectator distance is at least \(c\). The bounds
   \[
   \sup_{|\xi|\ge c/2}|\partial^\gamma S(\xi)|<\infty
   \]
   therefore control all required derivatives uniformly in \(o,y\), including arbitrarily distant spectators.

   If \(g_0\le D\), Taylor expansion through degree \(D-g_0\) leaves
   \[
   C r^{g_0-w'}r^{D-g_0+1}
   =C r^{D+1-w'}.
   \]
   If \(g_0>D\), the omitted entire block is bounded by \(C r^{g_0-w'}\), which is at most \(C r^{D+1-w'}\), because grades are integers. Summing finitely many contributions and using \(w'\le W\) gives
   \[
   |\text{remainder}|\le C r^{D+1-W}
   \le r^{D+1-W-\epsilon}.
   \]
   The coefficients used here are defined by channel grade, independently of \(D\) and the spectators.

   This covers arbitrary cluster sizes and derivative labels. For a concrete three-point check, three basic fields have \(W=12\). A one-contraction block has \(g_0=4\) and costs at most \(r^{-8}\). At \(D=4\), its Taylor remainder costs \(r^{-8}r=r^{-7}\), exactly the required exponent before the \(\epsilon\) allowance. The uncontracted grade-12 block causes no problem at lower truncation orders.

   Empty clusters give coefficient \(1\) in the unit channel and zero elsewhere. For sufficiently small positive \(r\), `Within` and `Clear` also guarantee that both grouped configurations are separated. Thus the zero extension in `corrL` does not invalidate the factorization.

   I found no failing tuple.

9. **[`Sr_asymptotic`](FreeField/Trace.lean:28): TRUE.**

   It asserts
   \[
   r^8\log^2(1/r)S_r(r)\longrightarrow384\pi
   \qquad(r\downarrow0).
   \]

   Put \(p=v/r\), \(L=\log(1/r)\), and \(s_v=v_t^2-|\mathbf v|^2\). Then
   \[
   r^8L^2S_r(r)
   =\int_{V_+}e^{-v_t}s_v^2
      \frac{L^2}{\log^2(e+s_v/r^2)}\,dv.
   \]
   For \(s_v>0\), the quotient tends to \(1/4\). The null boundary has Lebesgue measure zero. The proposed bound by
   \(\max(1,\log(1/s_v))^2\) is valid; multiplication by \(s_v^2\) makes its light-cone singularity integrable.

   The constant is
   \[
   \begin{aligned}
   \frac14\int_{V_+}e^{-E}(E^2-k^2)^2\,d^3\mathbf k\,dE
   &=\pi\int_0^\infty e^{-E}
       \left(\int_0^E(E^2-k^2)^2k^2\,dk\right)dE\\
   &=\pi\frac8{105}\Gamma(8)
   =384\pi.
   \end{aligned}
   \]
   There is no missing \(2\pi\) factor in these definitions.

   Quadrature gave \(1206.3715789784555\) for the limiting integral, versus \(384\pi=1206.3715789784806\). Direct evaluation of the scaled expression gave:

   | \(L=\log(1/r)\) | Scaled expression divided by \(384\pi\) |
   |---:|---:|
   | 20 | 0.8439412411 |
   | 100 | 0.9653267142 |
   | 500 | 0.9929095671 |

   The trace normalization consequently is correct:
   \[
   \lambda_G^2=\frac{\dim\mathfrak g}{128\pi^5}.
   \]

10. **[`wickProfile_excluded`](FreeField/Trace.lean:44): TRUE, including for arbitrary \(F\).**

    It says: if an arbitrary function \(F:\mathbb R\to\mathbb C\) has the stated positive, finite, nonzero scaled limit, it cannot agree on a sufficiently small positive neighborhood with any finite public `wickProfile`.

    The arbitrary continuous homogeneous numerator does not supply a counterexample. Let its spatial degree be \(\sigma\), time order \(k\), mass \(m\), and angular integral
    \[
    A_N=\int_{S^2}N(\omega)\,d\omega.
    \]
    Continuity makes \(A_N\) finite, and positive homogeneity reduces the mode integral exactly to
    \[
    \frac{A_N}{2}
      \int_m^\infty(E^2-m^2)^{(\sigma+1)/2}E^k e^{-rE}\,dE.
    \]
    Thus even nonpolynomial angular dependence contributes only a constant.

    For \(m=0\), this is
    \[
    \frac{A_N}{2}\Gamma(\sigma+k+2)\,
      r^{-(\sigma+k+2)}.
    \]
    For \(m>0\), expand the large-\(E\) factor:
    \[
    (E^2-m^2)^{(\sigma+1)/2}E^k
    =E^{\sigma+k+1}
      \sum_{\ell\ge0}a_\ell E^{-2\ell}.
    \]
    Truncating sufficiently far and integrating gives an expansion to any required finite order in integer powers of \(r\), with nonnegative powers of \(\log r\). The bounded-energy part is analytic in \(r\). Finite products and sums preserve this form, including after cancellations.

    Such a finite power-log expansion cannot have leading behavior \(A r^{-8}\log^{-2}(1/r)\) with \(A\ne0\): a surviving power more singular than \(r^{-8}\) diverges after scaling; an \(r^{-8}\) term multiplied by a nonzero polynomial in \(\log r\) also diverges after the extra \(\log^2\); less singular terms tend to zero.

    Finally, eventual equality transfers the limit. No measurability or regularity assumption on \(F\) is needed. I found no counterexample.

I found **no verified definition-level error** in `Labels.lean`, `TwoPoint.lean`, `Wick.lean`, or `Hierarchy.lean`. The following implementation gaps and domain qualifications should nevertheless be recorded explicitly:

- **Adjoint and label action are not concrete definitions yet.** [`Reconstruction.lean:33`](FreeField/Reconstruction.lean:33) merely declares an abstract `adj`, and [`Theory.lean:29`](FreeField/Theory.lean:29) describes the intended choices in a comment. The formulas above are consistent choices; there is no implementation of them to audit.
- **The Fock host and coefficient family are also not defined.** [`Theory.lean:40`](FreeField/Theory.lean:40) and [`OPE.lean:38`](FreeField/OPE.lean:38) assert their existence. Their names and comments do not constrain the eventual witnesses beyond their types.
- **The non-cancellation proof outline needs sharpening.** At [`Theory.lean:32`](FreeField/Theory.lean:32) and [`DESIGN.md:82`](FreeField/DESIGN.md:82), the cone observation alone does not bound an individual vertex momentum: in a chain with equal incoming and outgoing momentum, the middle vertex momentum is zero. The directed-cut argument above repairs this without changing any definition or lemma.
- **Totalized integral values are not boundary distributions.** In [`TwoPoint.lean:29`](FreeField/TwoPoint.lean:29) and [`TwoPoint.lean:47`](FreeField/TwoPoint.lean:47), Lean’s Bochner integral returns zero when the integrand is not integrable. In particular, literal real-time evaluation of the basic `lineC` is not its Wightman boundary distribution. The public statement correctly asks for a smeared limit instead.
- **The Euclidean function is not locally integrable across coincidences.** Its \(r^{-8}/\log^2(1/r)\) singularity in four dimensions remains nonintegrable after assigning a value at zero. This does not contradict the public clauses: they require a smooth separated-point correlation and smear `contL` for the boundary limit.

I did not supply Lean proofs of the ten lemmas, rebuild the entire project, re-audit the proofs of `Adequacy.lean` or `GroupIndependence.lean`, or verify the proposed upstream code imports and line-count estimates. I used Lean through stdin against the existing compiled modules to inspect the declarations; `#print axioms YangMills.jointExistence_of_freeField` still reports `sorryAx`. I also did not assess whether the public specification captures the intended physical Yang–Mills problem.
