All eleven targeted `sorry` statements are **TRUE as written**, in my mathematical assessment. I found no required change to their statements or definitions. Their Lean proofs remain unfinished.

Write \(W(a)=\sum_i d_i\), where \(d_i\) is the grade of the tag \(a_i\).

| TASKS row | Lemma | Mathematical restatement | Verdict |
|---|---|---|---|
| 63 | [`corrL_perm`](FreeField/Continuation.lean:30) | For arbitrary finitely supported labels and distinct insertion points, simultaneously permuting labels and points leaves the Euclidean correlation unchanged. | **TRUE** |
| 64 | [`corrL_contDiffOn`](FreeField/Continuation.lean:44) | For fixed labels, the Euclidean correlation is infinitely differentiable on the open set of pairwise distinct configurations. | **TRUE** |
| 65 | [`contL_differentiableOn`](FreeField/Continuation.lean:56) | For fixed labels and spatial coordinates, the continuation is holomorphic in all complex times on the ordered tube. | **TRUE** |
| 66 | [`contL_root`](FreeField/Continuation.lean:71) | At a real Euclidean configuration with strictly increasing times, evaluating the continuation at those imaginary times gives the Euclidean correlation. | **TRUE** |
| 67 | [`contL_boundary`](FreeField/Continuation.lean:86) | For fixed labels, Schwartz tests and strictly increasing heights, the integral of the continued correlation against the product tests converges, as the positive approach parameter tends to zero, to the defined momentum-space Wightman functional. | **TRUE** |
| 68 | [`lineS_kernelHyp`](FreeField/OPE.lean:45) | The actual kernel has exchange symmetry everywhere, is smooth off zero, satisfies both signed index-raising derivative identities there, and obeys the stated global inverse-power bounds. | **TRUE** |
| 69 | [`gwickGrouped_factor`](FreeField/OPE.lean:150) | For any exchange-symmetric kernel and arbitrary positions, the raw grouped Wick sum equals the sum over cluster partial matchings of their internal products times the split correlation of their unmatched legs with the spectators. | **TRUE** |
| 70 | [`splitCorr_collapse`](FreeField/OPE.lean:161) | For any exchange-symmetric kernel, placing all split legs at one point gives the raw grouped Wick sum with their multiset as one monomial insertion. No separation hypothesis is required. | **TRUE** |
| 71 | [`splitCorr_fderiv`](FreeField/OPE.lean:171) | For a kernel satisfying `KernelHyp`, differentiating one split position in coordinate direction \(i\) raises that leg’s multi-index by \(e_i\), provided that position differs from every spectator position. | **TRUE** |
| 72 | [`gope_coefficients`](FreeField/OPE.lean:185) | Fix tags, \(M\ge0\), \(\eta,\epsilon>0\), and one channel of grade \(j\). For all sufficiently small positive \(r\), uniformly over every `Within` configuration and origin, its coefficient has magnitude at most \(r^{j-W(a)-\epsilon}\). | **TRUE** |
| 73 | [`gope_remainder`](FreeField/OPE.lean:205) | Fix cluster tags, spectator tags, \(M\ge0\), \(\eta,c,\epsilon>0\), and \(D\). For all sufficiently small positive \(r\), uniformly over all configurations satisfying `Within` and `Clear`, the exact displayed remainder has magnitude at most \(r^{D+1-W(a)-\epsilon}\). | **TRUE** |
| Assembly | [`exists_ope_coefficient`](FreeField/OPE.lean:220) | The single coefficient family `gcoef lineS` satisfies both public OPE clauses for every choice of the hierarchy’s group, Hilbert space, theory and trace scale. | **TRUE**, with no additional admission in its assembly proof |

There are no **FALSE**, **TRUE AFTER CHANGE**, or **UNDETERMINED** targeted items to restate. The supporting checks follow, including the definition-level issues I specifically investigated.

**`KernelHyp` is satisfied and is strong enough.** Its two derivative clauses have the correct signs. From
\[
K_{\alpha\beta}(\xi)=(-1)^{|\alpha|}\partial^{\alpha+\beta}S(\xi)
\]
one obtains, off zero,
\[
\partial_iK_{\alpha\beta}
=-K_{\alpha+e_i,\beta}
=K_{\alpha,\beta+e_i}.
\]
Smoothness off zero permits the required commutation of partial derivatives. The coordinate order chosen by `dirList` therefore causes no problem.

The global bound in [`Analytic.lean:126`](FreeField/Analytic.lean:126) is appropriate for the actual density, including at large distances. On its support,
\[
0\le w(p)\le p_t^4,\qquad \|p\|\le\sqrt2\,p_t.
\]
Consequently, for \(r>0\),
\[
|S_r^{(k)}(r)|
\le C_k\int_0^\infty t^{k+7}e^{-rt}\,dt
=C'_k r^{-8-k}.
\]
Coordinate derivatives of the radial function \(S_r(\|\xi\|)\) then give
\[
|\partial^\gamma S(\xi)|\le C_\gamma\|\xi\|^{-8-|\gamma|}.
\]
This argument uses a global majorant; it does not assume a short-distance asymptotic.

Exchange symmetry at \(\xi=0\) also survives the totalized derivative definition. Evenness of \(S\) gives the appropriate parity after each directional derivative. Reflection preserves differentiability; when differentiability fails, the totalized `fderiv` is zero on both sides of the reflection identity. Thus the everywhere statement `lineS_symm` does not silently require smoothness at zero.

For the generic OPE, no analyticity assumption is missing. Each fixed \(D\) requires only finitely many derivatives. The derivative clauses identify those derivatives, and the global bound controls the finitely many raised-index kernels used in the Taylor remainder.

**The coefficient definition has the required independence and grading.** In [`gcoefMono`](FreeField/OPE.lean:105), let \(g_0\) be the total grade of the unmatched original legs. Every retained Taylor assignment satisfies the multiset equality
\[
c=\{\alpha_e+\beta_e:e\text{ unmatched}\},
\]
hence
\[
\operatorname{grade}(c)=g_0+\sum_e|\beta_e|.
\]
Thus a coefficient assigned to `Channel j` has exactly grade \(j\), even though the input fields belong to filtered spaces.

The finite box does not omit assignments. For every assignment satisfying the multiset equality, each coordinate \(\beta_e(i)\) is at most \(\operatorname{grade}(c)\). The factorial denominators are nonzero. Empty products and \(0^0=1\) give the correct constant Taylor terms.

Neither definition contains \(D\), spectator data, the phase argument, or any Hilbert-space data. The witness is genuinely fixed before all those choices. I also checked in Lean that
\[
\texttt{toLabel j (actor j ch)}
=\texttt{Finsupp.single ch.1 1}.
\]
There is no additional normalization or admixture of lower-grade monomials in an actor.

**The matching identities have the correct multiplicities.** `Multiset.ToType` retains separate occurrences of repeated indices. Restricting a full matching to its cluster–cluster edges determines exactly one partial matching; its remaining edges determine exactly one `SMatching`. Conversely, these two pieces reconstruct the original matching. The internal and spectator orientation choices can differ from the grouped enumeration, but exchange symmetry removes that difference.

For collapse, choose one index-preserving bijection between the split legs and the occurrences in their multiset. Conjugating matchings by this bijection gives the identity. One does not sum over all such bijections, so there is no extra factorial.

Here are the small cases, writing \(S_{ij}=K_{00}(x_j-x_i)\), and writing \(F\) for the appropriate split correlation with fixed spectators:

- Two single fields give \(S_{12}F_{\varnothing}+F_{0,0}(x_1,x_2)\). There are exactly two partial matchings.
- A Wick square at \(x_1\) and a single field at \(x_2\) give
  \[
  2S_{12}F_0(x_1)+F_{0,0,0}(x_1,x_1,x_2).
  \]
  The factor \(2\) comes from choosing which occurrence in the square is contracted. With no spectators, both terms vanish. With one single-field spectator at \(y\), the result is \(2S_{12}K_{00}(y-x_1)\).
- Three single fields with one single-field spectator give
  \[
  S_{12}K_{00}(y-x_3)+S_{13}K_{00}(y-x_2)+S_{23}K_{00}(y-x_1).
  \]
  The completely unmatched cluster cannot be matched to only one spectator leg.
- Two identical collapsed legs against a Wick-square spectator give \(2K_{00}(y-o)^2\), as required.

The coefficients also retain the correct multiplicities. In one coordinate, with \(h_i=x_i-o\), two single fields have coefficients
\[
C_{\{0,0\}}=1,\qquad C_{\{0,1\}}=h_1+h_2,\qquad
C_{\{1,1\}}=h_1h_2.
\]
For the Wick-square/single cluster, the single-field channel has coefficient \(2S_{12}\).

I ran in-memory Python enumeration with exact rational kernel values for these cases, derivative labels, two Wick squares, and empty/unit clusters: seven factorization cases and five collapse cases passed, together with the coefficient checks and 32 kernel derivative-sign checks. These finite checks supplement the matching-bijection argument.

For `splitCorr_fderiv`, every matching has exactly one factor involving the selected split position:
\[
K_{\alpha_{u_0},\beta}(y_j-z_{u_0}).
\]
Its position derivative is
\[
-\partial_iK_{\alpha_{u_0},\beta}
=K_{\alpha_{u_0}+e_i,\beta}.
\]
All other factors are constant in that variable. Accordingly, the stated hypothesis excluding collisions only for \(z_{u_0}\) is sufficient; other split positions need no separation condition for this lemma.

**The separation convention is handled correctly.** The factorization and collapse lemmas use `gwickGrouped`, not the correlation that is zero off separated configurations. This distinction matters: two coincident unit insertions have raw Wick sum \(1\), while their `gcorr` is \(0\). The existing statements use the correct functions.

In the public remainder region, take \(r>0\) small enough that \(Mr<c/2\). Then:

- `Within` separates distinct cluster vertices by at least \(\eta r>0\).
- `Clear` separates distinct spectators by at least \(c>0\).
- Each cluster–spectator distance is at least \(c-Mr>c/2\).
- The collapsed actor at \(o\) is separated from every spectator.

Thus both grouped correlations in the remainder use their Wick-sum branches. Along the Taylor segment, split legs may coincide with one another; `splitCorr` has no lines between them, so these coincidences introduce no singularity.

**The public quantifier order and exponent bookkeeping agree exactly.** The coefficient threshold may depend on the fixed input tags, \(M,\eta,\epsilon\), and the particular channel \(j,i\). The public clause does not demand one threshold for all channels simultaneously.

The remainder threshold may additionally depend on the spectator tags, \(c\), and \(D\). It must be independent of \(x,o,y,s\), and the argument supplies this independence. Every spectator-related kernel argument along the Taylor segment has norm at least \(c/2\), or at least \(c\) for spectator–spectator lines. The global kernel bounds therefore control arbitrarily distant spectators without requiring an upper bound on their positions.

For a monomial selection from the input labels, let \(w'\le W(a)\) be its actual total grade. For a fixed partial matching, its internal product is bounded by
\[
C r^{-(w'-g_0)}.
\]
A Taylor assignment contributing to grade \(j\) has total degree \(j-g_0\), giving
\[
C r^{-(w'-g_0)}r^{j-g_0}
=C r^{j-w'}
\le C r^{j-W(a)}
\quad(0<r<1).
\]

For the remainder:

- If \(g_0\le D\), Taylor expansion through total order \(D-g_0\) leaves
  \[
  C r^{-(w'-g_0)}r^{D-g_0+1}
  =C r^{D+1-w'}.
  \]
- If \(g_0>D\), no channel from this partial matching is retained. Since grades are integers, \(g_0\ge D+1\), and its entire contribution satisfies
  \[
  C r^{g_0-w'}\le C r^{D+1-w'}.
  \]

Finite sums over monomial selections, matchings and assignments preserve these estimates. Finally, the fixed constant is absorbed by \(r^{-\epsilon}\). This gives precisely the public exponent.

The edge cases do not require exceptions:

- **Empty cluster:** the grade-zero unit coefficient is \(1\), all other coefficients vanish, and insertion of the unit at \(o\) reproduces the spectator correlation under `Clear`. The remainder is exactly zero.
- **Empty spectator family:** only completely contracted cluster terms contribute. The grade-zero channel reproduces them for every \(D\), so the remainder is exactly zero.
- **Grade-zero tags:** these are scalar multiples of the unit, including the zero scalar. Their products are reproduced exactly in grade zero.
- **Mixed monomial grades:** finite multilinear expansion and \(w'\le W(a)\) give the stated bounds term by term.
- **Small \(D\):** the split into \(g_0\le D\) and \(g_0>D\) handles this; input grades themselves need not be below \(D\).
- **\(M=0\):** for positive \(r\), a cluster with two distinct indices cannot satisfy `Within`. Empty and singleton clusters remain covered by the same argument.

**The continuation statements agree with the actual kernels and the public clauses.** The Euclidean integral identity used in `contL_root` is consistent with the concrete spectral density, not merely with its asymptotics. Put
\[
\rho(s)=\frac{s^2}{\log^2(e+s)}.
\]
Changing variables \(s=p_t^2-|\mathbf p|^2\), followed by Gaussian subordination, gives, for \(\tau>0\),
\[
\int e^{-\tau p_t+i\langle u,\mathbf p\rangle}w(p)\,dp
=
\frac{\pi}{2}\int_0^\infty
v^{-2}e^{-(\tau^2+\|u\|^2)/(4v)}
\left(\int_0^\infty \rho(s)e^{-vs}\,ds\right)dv.
\]
The expression depends only on \(\tau^2+\|u\|^2\), and at \(u=0\) agrees with the definition of `Sr`. The bound \(\rho(s)\le s^2\) supplies convergence. Polynomial Laplace bounds justify the derivatives used in the line-kernel identity.

The factors in [`TwoPoint.lean`](FreeField/TwoPoint.lean:36) satisfy
\[
A_\alpha(p)B_\beta(p)
=(-1)^{|\alpha|}
\prod_{i<3}(ip_i)^{\alpha_i+\beta_i}
(-p_t)^{\alpha_t+\beta_t}.
\]
Thus the time-derivative twist and the spatial signs agree with `lineS`; no missing factor of \(i\) occurs in `contL_root`.

For holomorphy, every used line has positive imaginary time difference on the ordered tube. On a neighborhood of each such point, its integrand and complex-time derivative are bounded by polynomial factors times \(e^{-a p_t}w(p)\), with \(a>0\). Finite sums and products then give the asserted joint holomorphy.

For the boundary theorem, the Bochner integrals are genuine integrals for each \(r>0\). Each line is bounded uniformly in the real positions, and the product of Schwartz tests is integrable. Absolute integrability also justifies exchanging the position and momentum integrals. Each matching becomes its defined Wightman integrand multiplied by
\[
\exp\!\left(
-r\sum_{\ell:v\to w}(h_w-h_v)(q_\ell)_t
\right).
\]
This factor lies in \([0,1]\) wherever the product of spectral weights is nonzero.

The directed-cut estimate provides the needed integrable majorant: with \(k_v\) the defined incoming-minus-outgoing vertex momentum,
\[
\sum_\ell(q_\ell)_t
\le\sum_j(Q_j)_t
\le(n-1)\sum_v\|k_v\|.
\]
Together with \(\|q_\ell\|\le\sqrt2(q_\ell)_t\), this allows Schwartz decay in the vertex momenta to dominate every polynomial line factor. Dominated convergence gives exactly `wightmanL`, with the Fourier signs and normalization in its definition.

The cases \(n=0\) and \(n=1\) also agree. Empty matching products have value \(1\), zero-dimensional volume has mass \(1\), and a single vertex contributes only its unit-label component.

The five assignments in [`Main.lean:42`](FreeField/Main.lean:42) and [`Main.lean:50`](FreeField/Main.lean:50) instantiate the corresponding public fields directly. For `boundary`, the explicit `hvev` assumption rewrites the target vacuum expectation to `wightmanL`. No stronger state-dependent statement is smuggled into this step.

**No definition-level error was found in the reviewed scope.** In particular, `PiLp` here is a coordinate-space wrapper, not an almost-everywhere quotient; `toLp`/`ofLp` do not discard pointwise information. The coefficient’s noninjective branch is excluded by `Within` for positive \(r\), and the relevant continuation integrals are integrable in their asserted regions. No argument above relies on an unintended zero from a totalized integral.

I re-elaborated both current target files through Lean’s stdin without output files. They succeeded with exactly the six OPE and five continuation admission warnings. The printed proof of `exists_ope_coefficient` uses `lineS_kernelHyp`, `gope_coefficients`, and `gope_remainder` and introduces no further `sorry`. Its axiom audit still reports `sorryAx` through those unfinished dependencies.

**What I did not check:** I did not audit the host reconstruction, Fock-space totalizations, symmetry operators, faithfulness, trace proofs, or the final `Adequacy` transformation. I did not produce formal Lean proofs of the eleven lemmas or perform a clean rebuild of every dependency; the elaboration checks used existing imported artifacts. No file was modified.
