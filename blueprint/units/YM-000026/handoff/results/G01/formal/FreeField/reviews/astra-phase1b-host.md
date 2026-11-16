All **62 statements are TRUE as written**. I found no required change to a definition or lemma statement. There are two corrections to explanatory prose, described below.

Here, TRUE is a mathematical verdict; the missing Lean proofs remain missing. I re-elaborated all eight implementation files together through stdin, without writing files: Lean accepted them with exactly 62 `sorry` warnings. The concrete definitions I inspected have no `sorryAx` dependency. `fockHost_good` has the expected dependency on the named, currently sorry-ed lemmas.

For the table, write \(a_w^k=\mathrm{openAmpW}(w,k)\), \(W(w)=\mathrm{wightW}(w)\), \(\mu_k=\mu^{\otimes k}\), \(P(p)=\sum_jp_j\), \(U(a)=\mathrm{transOp}(a)\), \(V(g)=\mathrm{poinOp}(g)\), and \(E(B)=\mathrm{projOp}(B)\). Inner products are conjugate-linear in their first argument. \(B_\gamma\) denotes `Bmono γ`.

| # | Lemma and location | Mathematical statement of the Lean text | Verdict |
|---:|---|---|---|
| 1 | [weight_le](FreeField/Analytic.lean:31) | For every momentum \(p\), \(\mathrm{weight}(p)\le p_t^4\). | TRUE |
| 2 | [measurable_weight](FreeField/Analytic.lean:35) | The spectral density is measurable. | TRUE |
| 3 | [integrable_pow_exp_weight](FreeField/Analytic.lean:46) | For every \(r>0\) and natural \(k\), \(\|p\|^k e^{-rp_t}\mathrm{weight}(p)\) is Lebesgue integrable. | TRUE |
| 4 | [weight_adjoint](FreeField/Analytic.lean:53) | Every public proper orthochronous Lorentz transformation satisfies \(\mathrm{weight}(\Lambda^Tp)=\mathrm{weight}(p)\). | TRUE |
| 5 | [mu_map_adjoint](FreeField/Analytic.lean:59) | \((\Lambda^T)_*\mu=\mu\). | TRUE |
| 6 | [Sr_euclid](FreeField/Analytic.lean:75) | For \(\tau>0\), \(\int e^{-\tau p_t+i u\cdot\mathbf p}\,d\mu(p)=S_r(\sqrt{\tau^2+\|u\|^2})\). | TRUE |
| 7 | [S_contDiffOn](FreeField/Analytic.lean:84) | \(S(x)=S_r(\|x\|)\) is smooth on \(\mathbb R^4\setminus\{0\}\). | TRUE |
| 8 | [partialDeriv_S_contDiffOn](FreeField/Analytic.lean:89) | Every specified iterated coordinate derivative \(D^\gamma S\) is smooth away from zero. | TRUE |
| 9 | [partialDeriv_S_succ](FreeField/Analytic.lean:95) | Away from zero, differentiating \(D^\gamma S\) in coordinate \(i\) gives \(D^{\gamma+e_i}S\). | TRUE |
| 10 | [partialDeriv_S_neg](FreeField/Analytic.lean:103) | For every \(\xi\), including zero, \(D^\gamma S(-\xi)=(-1)^{\mathrm{idxOrder}(\gamma)}D^\gamma S(\xi)\). | TRUE |
| 11 | [partialDeriv_S_integral](FreeField/Analytic.lean:112) | If \(\xi_t>0\), then \(D^\gamma S(\xi)=\int B_\gamma(p)e^{-\xi_t p_t+i\boldsymbol\xi\cdot\mathbf p}\,d\mu(p)\). | TRUE |
| 12 | [partialDeriv_S_bound](FreeField/Analytic.lean:126) | For each \(\gamma\), one constant \(C_\gamma\) bounds \(\|D^\gamma S(\xi)\|\le C_\gamma/\|\xi\|^{8+\mathrm{idxOrder}(\gamma)}\) for every nonzero \(\xi\). | TRUE |
| 13 | [lineS_symm](FreeField/Analytic.lean:134) | For all \(\alpha,\beta,\xi\), including \(\xi=0\), \(\mathrm{lineS}(\alpha,\beta,\xi)=\mathrm{lineS}(\beta,\alpha,-\xi)\). | TRUE |
| 14 | [lineC_differentiableOn](FreeField/Analytic.lean:140) | For fixed derivative indices and spatial difference, `lineC` is holomorphic on the upper half-plane. | TRUE |
| 15 | [lineC_euclid](FreeField/Analytic.lean:149) | If \(\xi_t>0\), then \(\mathrm{lineC}(\alpha,\beta,i\xi_t,\boldsymbol\xi)=\mathrm{lineS}(\alpha,\beta,\xi)\). | TRUE |
| 16 | [matching_integrable](FreeField/Analytic.lean:167) | Every closed-matching integrand, including its explicit density factors and Schwartz Fourier factors, is absolutely Lebesgue integrable over its line momenta. | TRUE |
| 17 | [wightmanL_continuous](FreeField/Analytic.lean:177) | For fixed labels, the Wightman functional is jointly continuous on the finite product of Schwartz test-function spaces. | TRUE |
| 18 | [Host.reconstruct](FreeField/Reconstruction.lean:91) | Every good host yields a W0–W3 theory whose VEVs are its vacuum–word inner products; this theory is faithful if every nonzero label moves some word vector for some test. | TRUE |
| 19 | [fockOp_apply](FreeField/Theory.lean:27) | If each \(c_k\) is measurable with modulus at most one and each \(T_k\) preserves \(\mu_k\), then \((\mathrm{fockOp}(c,T)\psi)_k(p)=c_k(p)\psi_k(T_kp)\), \(\mu_k\)-almost everywhere. | TRUE |
| 20 | [transOp_zero](FreeField/Theory.lean:40) | \(U(0)=I\). | TRUE |
| 21 | [transOp_add](FreeField/Theory.lean:44) | \(U(x)U(y)=U(x+y)\). | TRUE |
| 22 | [transOp_norm](FreeField/Theory.lean:48) | Every translation preserves every host vector’s norm. | TRUE |
| 23 | [transOp_continuous](FreeField/Theory.lean:54) | For each host vector \(\psi\), \(x\mapsto U(x)\psi\) is norm-continuous. | TRUE |
| 24 | [projOp_empty](FreeField/Theory.lean:68) | \(E(\varnothing)=0\). | TRUE |
| 25 | [projOp_univ](FreeField/Theory.lean:72) | \(E(\mathbb R^4)=I\). | TRUE |
| 26 | [projOp_inter](FreeField/Theory.lean:76) | For measurable \(A,B\), \(E(A)E(B)=E(A\cap B)\). | TRUE |
| 27 | [projOp_adjoint](FreeField/Theory.lean:82) | For measurable \(B\), \(E(B)^*=E(B)\). | TRUE |
| 28 | [projOp_hasSum](FreeField/Theory.lean:88) | For pairwise disjoint measurable \(B_i\), \(\sum_iE(B_i)\psi\) converges in norm to \(E(\bigcup_iB_i)\psi\). | TRUE |
| 29 | [diagMeasure_finite](FreeField/Theory.lean:94) | Every host vector’s defined diagonal measure is finite. | TRUE |
| 30 | [diagMeasure_apply](FreeField/Theory.lean:99) | For measurable \(B\), the real mass of the diagonal measure, embedded in \(\mathbb C\), equals \(\langle\psi,E(B)\psi\rangle\). | TRUE |
| 31 | [charFun_diagMeasure](FreeField/Theory.lean:119) | \(\mathrm{charFun}(\mathrm{diagMeasure}(\psi))(a)=\langle\psi,U(a)\psi\rangle\). | TRUE |
| 32 | [projOp_cone](FreeField/Theory.lean:126) | The spectral projection onto the complement of the closed forward cone is zero. | TRUE |
| 33 | [poinOp_one](FreeField/Theory.lean:132) | \(V(1)=I\). | TRUE |
| 34 | [poinOp_mul](FreeField/Theory.lean:137) | \(V(gh)=V(g)V(h)\), with the multiplication defined on `Sym`. | TRUE |
| 35 | [poinOp_norm](FreeField/Theory.lean:141) | Every Poincaré operator preserves every host vector’s norm. | TRUE |
| 36 | [poinOp_continuous](FreeField/Theory.lean:149) | For each \(\psi\), \(g\mapsto V(g)\psi\) is continuous in the specified product topology on `Sym`. | TRUE |
| 37 | [poinOp_translation](FreeField/Theory.lean:153) | \(V(1,x)=U(x)\). | TRUE |
| 38 | [rhoL_one](FreeField/Theory.lean:159) | \(\rho(1)\) is the identity on labels. | TRUE |
| 39 | [rhoL_mul](FreeField/Theory.lean:165) | \(\rho(\Lambda\Gamma)=\rho(\Lambda)\circ\rho(\Gamma)\). | TRUE |
| 40 | [rhoL_bijective](FreeField/Theory.lean:170) | Every \(\rho(\Lambda)\) is bijective on the label space. | TRUE |
| 41 | [wightW_ofFn](FreeField/Theory.lean:199) | Forming a word from indexed labels and tests and evaluating \(W\) gives exactly `wightmanL` of those labels and tests. | TRUE |
| 42 | [openAmpW_memLp](FreeField/Theory.lean:208) | For every word and every \(k\), \(a_w^k\in L^2(\mu_k)\). | TRUE |
| 43 | [openAmpW_eq_zero](FreeField/Theory.lean:215) | Each word has a finite cutoff \(N\); for \(k>N\), its amplitude is identically zero at every external momentum tuple. | TRUE |
| 44 | [Psi_apply](FreeField/Theory.lean:220) | The \(k\)-component of \(\Psi(w)\) is the \(L^2\) class \([a_w^k]/\sqrt{k!}\). | TRUE |
| 45 | [cut_identity](FreeField/Theory.lean:235) | \(\sum_{k\ge0}(k!)^{-1}\int\overline{a_u^k(p)}a_v^k(p)\,d\mu_k(p)=W(u^\dagger\mathbin{++}v)\). | TRUE |
| 46 | [inner_Psi](FreeField/Theory.lean:245) | \(\langle\Psi(u),\Psi(v)\rangle=W(u^\dagger\mathbin{++}v)\). | TRUE |
| 47 | [Psi_nil_norm](FreeField/Theory.lean:249) | \(\|\Psi([])\|=1\). | TRUE |
| 48 | [wightW_add_label](FreeField/Theory.lean:254) | At any slot between fixed prefix and suffix words, \(W\) is additive in the label. | TRUE |
| 49 | [wightW_smul_label](FreeField/Theory.lean:259) | At any such slot, replacing label \(A\) by \(cA\) multiplies \(W\) by \(c\). | TRUE |
| 50 | [wightW_add_test](FreeField/Theory.lean:265) | At any such slot, \(W\) is additive in the test. | TRUE |
| 51 | [wightW_smul_test](FreeField/Theory.lean:270) | At any such slot, replacing test \(f\) by \(cf\) multiplies \(W\) by \(c\). | TRUE |
| 52 | [wightW_local](FreeField/Theory.lean:286) | Between arbitrary prefix and suffix words, two adjacent letters can be exchanged when every difference between points in their closed supports is spacelike. | TRUE |
| 53 | [Psi_add_label](FreeField/Theory.lean:294) | For a fixed tail, \(\Psi((A+A',f)::u)=\Psi((A,f)::u)+\Psi((A',f)::u)\). | TRUE |
| 54 | [Psi_smul_label](FreeField/Theory.lean:299) | \(\Psi((cA,f)::u)=c\Psi((A,f)::u)\). | TRUE |
| 55 | [Psi_add_test](FreeField/Theory.lean:304) | \(\Psi((A,f+f')::u)=\Psi((A,f)::u)+\Psi((A,f')::u)\). | TRUE |
| 56 | [Psi_smul_test](FreeField/Theory.lean:309) | \(\Psi((A,cf)::u)=c\Psi((A,f)::u)\). | TRUE |
| 57 | [Psi_adjoint](FreeField/Theory.lean:315) | \(\langle\Psi((A,f)::u),\Psi(v)\rangle=\langle\Psi(u),\Psi((\mathrm{adjL}(A),\bar f)::v)\rangle\). | TRUE |
| 58 | [Psi_tempered](FreeField/Theory.lean:325) | For fixed label and tail, \(f\mapsto\Psi((A,f)::u)\) is continuous from Schwartz topology to host norm topology. | TRUE |
| 59 | [Psi_local](FreeField/Theory.lean:331) | Two spacelike-separated head letters can be exchanged in every word vector. | TRUE |
| 60 | [Psi_covariant](FreeField/Theory.lean:345) | \(V(g)\Psi(u)\) equals the word vector obtained by applying \(\rho(g.\mathrm{lor})\) to every label and `onTests g` to every test. | TRUE |
| 61 | [transOp_invariant](FreeField/Theory.lean:354) | Every host vector fixed by all translations is a scalar multiple of \(\Psi([])\). | TRUE |
| 62 | [Psi_faithful](FreeField/Theory.lean:366) | Every nonzero label \(A\) has a test \(f\) with \(\Psi([(A,f)])\ne0\). | TRUE |

There are **no FALSE, TRUE AFTER CHANGE, or UNDETERMINED entries**, so there are no proposed lemma restatements. The following records the definition-level audit and the evidence for the delicate verdicts.

The measure in [Analytic.lean:19](FreeField/Analytic.lean:19) is genuinely \(\mathrm{weight}(p)\,d^4p\): the density is nonnegative, so `ENNReal.ofReal` does not truncate any intended contribution. It is locally bounded and defines a locally finite, sigma-finite measure. Finite products are ordinary product measures. Mathlib’s empty product measure is the unit Dirac measure on the singleton empty-function space. Consequently, `Sector 0` is one-dimensional, the empty matching contributes one, and \(\Psi([])\) has zeroth component one and all other components zero. There is no missing vacuum normalization.

Internal lines in `openAmp` are integrated against Lebesgue measure with one explicit density factor per internal line. External momenta are integrated against \(\mu_k\) when taking norms or inner products. Thus no line receives a duplicated density factor. `Multiset.ToType` distinguishes repeated occurrences, which is necessary for the Wick multiplicities.

The \(1/\sqrt{k!}\) normalization in [Fock.lean:104](FreeField/Fock.lean:104) is correct. For a closed matching with \(k\) crossing lines, assigning distinct external slot labels to those lines gives exactly \(k!\) pairs of open matchings. The product measure is invariant under these slot permutations. Dividing the resulting integral by \(k!\) therefore counts each closed matching once.

For explicit small cases, write \(F=\widehat f\), \(G=\widehat g\), and \(H=\widehat h\).

- One scalar letter has \(a^1(p)=F(p)\).
- One derivative letter has \(a^1(p)=B_\alpha(p)F(p)\).
- Two scalar letters have
  \[
  a^0=\int F(-q)G(q)\,d\mu(q),\qquad
  a^2(p,q)=F(p)G(q)+F(q)G(p).
  \]
- One Wick-square letter has \(a^2(p,q)=2F(p+q)\) and no vacuum component.
- Its inner product against two scalar letters is therefore
  \[
  2\int\overline{F(p+q)}G(p)H(q)\,d\mu(p)d\mu(q),
  \]
  exactly the two closed contractions.

I independently enumerated the matchings, retaining repeated legs as distinct occurrences:

| Leg counts in \(u\) | Leg counts in \(v\) | Contributions after division by \(k!\) | Closed matchings |
|---|---|---|---:|
| \((1)\) | \((1)\) | \(k=1:1\) | 1 |
| \((2)\) | \((2)\) | \(k=2:2\) | 2 |
| \((1,1)\) | \((1,1)\) | \(k=0:1,\ k=2:2\) | 3 |
| \((2)\) | \((1,1)\) | \(k=2:2\) | 2 |
| \((2,1)\) | \((1,2)\) | \(k=1:4,\ k=3:6\) | 10 |
| \((1,1,1)\) | \((1,1,1)\) | \(k=1:9,\ k=3:6\) | 15 |
| \((2,2)\) | \((2,2)\) | \(k=0:4,\ k=2:32,\ k=4:24\) | 60 |

I also checked the full finite algebra using discrete momentum sums, complex Gaussian Fourier factors, spatial and temporal derivative labels, internal lines, and labels containing several monomials. The cut-identity relative discrepancies were below \(6\times10^{-16}\). These checks test signs and multiplicities; they are not proofs of continuum integrability.

The absence of symmetrization in the host causes no failure. The amplitudes are symmetric by relabelling external slots, but the host norm is the ordinary unsymmetrized \(L^2\) norm. The factorial already belongs in the vector components. Reconstruction only requires density in the closure of the word span, not density in the whole host.

The totalized operator constructor in [Fock.lean:116](FreeField/Fock.lean:116) is sound under the hypotheses of `fockOp_apply`. A measure-preserving \(T_k\) preserves almost-everywhere equality and \(L^2\) norms. Multiplication by \(c_k\) contracts the norm. These facts make every sector condition true, make the resulting sequence square-summable, and produce the bounded linear map required by the outer existential branch. Its representing continuous linear map is unique. Crucially, `fockOp_apply` asserts equality **almost everywhere**, not equality of chosen representatives at every point.

Likewise, `openAmpW_memLp` and finite sector support make both branches defining the word vector select their intended values. `Psi_apply` is equality of \(L^2\) classes. The use of chosen `Lp` representatives in `diagMeasure` is harmless because changing them on null sets leaves the weighted measures unchanged.

The spectral formulas are consistent:
\[
\nu_\psi(B)=\sum_k\int 1_B(P(p))|\psi_k(p)|^2\,d\mu_k(p),
\qquad
\nu_\psi(\mathbb R^4)=\|\psi\|^2.
\]
In particular, `.real B` in `diagMeasure_apply` is not concealing an infinite mass converted to zero.

I checked Mathlib’s actual definition: `charFun μ a` integrates \(e^{i\langle p,a\rangle_{\mathbb R}}\). Consequently,
\[
\widehat{\nu_\psi}(a)
=\sum_k\int e^{i\langle a,P(p)\rangle}|\psi_k(p)|^2\,d\mu_k(p)
=\langle\psi,U(a)\psi\rangle.
\]
The sign and Euclidean pairing are correct.

For positive energy, sums of forward-cone momenta remain in the forward cone. For vacuum uniqueness, \(\mu\)-almost every momentum has strictly positive time component. Hence, for every \(k>0\), \(P_t>0\) almost everywhere. Translation invariance at a countable sequence of time translations forces each such sector to vanish: for \(E>0\), \(e^{iE/n}\ne1\) for sufficiently large \(n\). This argument applies equally to symmetric and nonsymmetric sector vectors. It needs no mass gap.

The symmetry definitions in [Symmetry.lean](FreeField/Symmetry.lean:26) have the correct composition order. Explicitly,
\[
(V(\Lambda,a)V(\Gamma,b)\psi)(p)
=e^{i\langle a+\Lambda b,P(p)\rangle}
 \psi\bigl(\Gamma^T\Lambda^Tp_1,\ldots\bigr).
\]
Since \(\Gamma^T\Lambda^T=(\Lambda\Gamma)^T\), this is exactly the defined product on `Sym`. The public coordinate multiplication uses the same \(a+\Lambda b\). Although only `One` and `Mul` instances are bundled, their concrete operations have the ordinary group law; the public structure does not require a `Group` instance.

`onTests` really evaluates to \(f(\Lambda^{-1}(x-a))\). Changing variables, with determinant one, gives
\[
\widehat{\mathrm{onTests}(g)f}(p)
=e^{i\langle a,p\rangle}\widehat f(\Lambda^Tp).
\]
There is no missing Jacobian or inverse transpose.

For the explicit boost with \(c=5/4\), \(s=3/4\) in the first-space/time plane, the label definition gives
\[
\rho(\Lambda)\xi_x=c\xi_x-is\xi_t,\qquad
\rho(\Lambda)\xi_t=is\xi_x+c\xi_t.
\]
Evaluating their \(B\)-factors gives respectively \(i(cp_x+sp_t)\) and \(-(sp_x+cp_t)\), exactly the factors at \(\Lambda^Tp\). The same identity holds for the \(A\)-factors. Polynomial substitution extends it to derivative multi-indices; convolution multiplication in `AddMonoidAlgebra ℂ Mon` extends it to multileg labels, including repeated indices.

I independently checked a boost composed with a nontrivial spatial rotation and a nonzero translation. The checks included expanded multileg label transformations and open matchings with internal contractions. Relative discrepancies were below \(3\times10^{-16}\). Algebraically, the translation phase works because
\[
\sum_v\mathrm{openMomentum}(\sigma,q,p,v)=\sum_jp_j;
\]
every internal momentum cancels.

The adjoint definition also has the required signs:
\[
\overline{B_\alpha(p)}=(-1)^{\alpha_t}A_\alpha(p),\qquad
\overline{\widehat f(k)}=\widehat{\bar f}(-k).
\]
Reversing a word reverses its internal-line orientations. The resulting signs are precisely the monomial time-degree signs in `adjL`. Thus `Psi_adjoint` follows from `inner_Psi` with the written dagger order.

The analytic estimates have adequate quantifiers. On the cone,
\[
0\le\mathrm{weight}(p)\le p_t^4,\qquad \|p\|\le\sqrt2\,p_t.
\]
This gives polynomially weighted Laplace integrability. Differentiating the radial Laplace transform gives
\[
|S_r^{(j)}(r)|\le C_jr^{-8-j}\quad(r>0).
\]
The derivatives of \(S_r(\|\xi\|)\) then give the stated bound for every nonzero \(\xi\). The constant in `partialDeriv_S_bound` may depend on \(\gamma\), but not on \(\xi\), its direction, its distance from zero, or any subsequently introduced origin or spectator position. This is exactly sufficient.

For `Sr_euclid`, the strip argument is valid: on \(|\operatorname{Re}s|<\tau\), the Laplace–Fourier integral is holomorphic, and \(\sqrt{\tau^2-s^2}\) has a holomorphic branch with positive real part. Real boosts establish equality on the real interval; the identity theorem reaches \(s=i\|u\|\). Differentiation then gives precisely \(B_\gamma\) in `partialDeriv_S_integral`. The repository’s numerical convention script also passed, including \(S_r\)-invariance and the one- and two-time-derivative signs.

The directed-cut estimates justify the integrability statements. For a closed matching, every line crosses a cut, and positivity of the line energies controls all line momenta by the vertex momenta. For an open matching, the cuts must include the external vertex. If \(Q_j\) is the momentum crossing the cut immediately before word vertex \(j\), then
\[
Q_j=\sum_{v\ge j}\mathrm{openMomentum}(v).
\]
Every internal or external line crosses at least one such cut. Thus the external momenta are controlled as well, despite the absence of a test at the external vertex. Schwartz decay supplies arbitrarily strong decay on the product of cones. Integrating internal momenta leaves sufficient external decay for \(L^2(\mu_k)\).

For fixed external momenta outside those cones, the internal integrals remain integrable using the corresponding estimate with an additional constant depending on those fixed external momenta. Hence the parameter integrals do not acquire an unintended zero branch relevant to the construction.

Mathlib’s test-function topology here is the usual topology generated by Schwartz seminorms, and `Fin n → TestFunction` has its finite product topology. The matching estimates give bounds by products of finitely many such seminorms, establishing joint continuity. This supplies the public norm-valued temperedness requirement through
\[
\|\Psi((A,f)::u)\|^2
=W\bigl(u^\dagger++[(A^\dagger,\bar f),(A,f)]++u\bigr),
\]
followed by finite linear combinations of word states. No topology on the label space is needed.

The locality hypothesis in [Theory.lean:286](FreeField/Theory.lean:286) is exactly the public one: every pair of points in the two **closed supports** has strictly spacelike difference. It neither means merely disjoint supports nor assumes a uniform separation margin for noncompact supports.

The scalar boundary distribution is smooth and even on the spacelike region. Its value there is
\[
S_r\!\left(\sqrt{\|\boldsymbol\xi\|^2-\xi_t^2}\right).
\]
This follows by continuing the Fourier–Laplace identity; it is not obtained by evaluating the totalized `lineC` integral at real time. Derivatives give the corresponding exchange identities for the differentiated lines. Exchanging adjacent vertices reverses only the lines joining those two vertices. On spacelike-separated supports those factors are smooth and obey the exchange identity; the remaining graph distributions are controlled by the same directed-cut estimates. Compactly supported tests give a compact subset of the spacelike region. Support-preserving Schwartz cutoffs then extend the identity to the exact public hypothesis. This establishes the mathematical content of `wightW_local` and subsequently `Psi_local`.

For faithfulness, fix a particle number occurring in a nonzero label. The one-letter amplitude is its Fourier test factor at total momentum times a linear combination of symmetrized momentum monomials. Distinct multisets of derivative indices have disjoint ordinary monomial orbits under permutation of particle slots, so those symmetrized polynomials are linearly independent. The resulting nonzero polynomial cannot vanish on the open product cone, where the density is positive. A Gaussian test has a nowhere-zero Fourier transform. The empty-monomial case is covered separately by its nonzero vacuum-sector value.

There is no missing reconstruction hypothesis in [Reconstruction.lean:39](FreeField/Reconstruction.lean:39). The adjoint identity makes prepending descend from formal words to their actual span: a relation maps to a vector orthogonal to every word vector and still lying in that span, hence to zero. Completing that span gives the required Hilbert space and dense domain.

The spectral projections also preserve this closure. Translation invariance of the closure, including under inverse translations, makes both cross terms between it and its orthogonal complement vanish. The four vectors \(u+i^jv\) therefore have equal characteristic functions. Uniqueness for finite measures, followed by the diagonal identity and polarization, gives \(\langle u,E(B)v\rangle=0\). Thus the proposed restriction of the spectral data is justified; no assumption that the host equals the reconstructed space is needed.

The assembly at [Theory.lean:380](FreeField/Theory.lean:380) has no additional proof hole. Its fields are discharged as follows:

| `Host.Good` field | Supplied lemma |
|---|---|
| `compat` | `poinOp_translation` |
| `vacuum_norm` | `Psi_nil_norm` |
| `add_label`, `smul_label` | `Psi_add_label`, `Psi_smul_label` |
| `add_test`, `smul_test` | `Psi_add_test`, `Psi_smul_test` |
| `adjoint` | `Psi_adjoint` |
| `tempered` | `Psi_tempered` |
| `locality` | `Psi_local` |
| `covariant` | `Psi_covariant` |
| `label_one`, `label_mul` | `rhoL_one`, `rhoL_mul` |
| `spectral` | `charFun_diagMeasure` |
| `positive` | `projOp_cone` |
| `unique` | `transOp_invariant` |

I checked the elaborated term, not only the source. Its `sorryAx` dependency comes through the unfinished ingredients. The inspected definitions `mu`, `openAmp`, `Psi`, `fockOp`, `diagMeasure`, `adjL`, `rhoL`, `onTests`, and `poinOp` have only the ordinary classical/propositional/quotient axioms.

I found **no definition-level error**, but these totalized values must be understood literally:

- `Sr 0`, and therefore `S 0`, is zero because the defining nonnegative integral diverges.
- `lineC α β z u` is zero when \(\operatorname{Im}z\le0\), because its defining Bochner integrand is not absolutely integrable there.
- Those assigned values are not the physical distributional boundary values. The audited statements correctly use positive imaginary time, limits, or identities valid for the totalized derivatives.
- The nonmeasurable-set branch of `projOp` is compatible with the public specification, whose relevant identities are restricted to measurable sets.

Two prose corrections are warranted, without changing any verdict:

1. [DESIGN.md:57](FreeField/DESIGN.md:57) says a time reflection preserves `weight`. It does not: \((0,0,0,1)\) has positive weight and its time reflection has zero weight. Replace that explanation with: “Let \(J=\operatorname{diag}(-1,-1,-1,1)\), the spatial reflection. Then \(\Lambda^T=J\Lambda^{-1}J\), and both \(J\) and \(\Lambda^{-1}\) preserve the forward cone and Minkowski square.” The comment in `Analytic.lean` already uses this correct spatial reflection.
2. [Theory.lean:280](FreeField/Theory.lean:280) reduces a general spacelike vector to \(ae_1\) “after a rotation.” A spatial rotation alone cannot remove a nonzero time coordinate. Replace this with “after a proper orthochronous Lorentz transformation.” Alternatively, use the direct spacelike continuation argument above.

I did not audit the OPE, continuation, trace, hierarchy, or final `Adequacy` construction beyond the public interfaces needed here. I did not supply the 62 Lean proofs, validate their estimated lengths or difficulty tags, or recheck imported Mathlib/Adequacy artifacts from first principles. The numerical checks establish only the tested finite algebra and numerical identities; the mathematical verdicts also rely on the arguments stated above. No file was modified.
