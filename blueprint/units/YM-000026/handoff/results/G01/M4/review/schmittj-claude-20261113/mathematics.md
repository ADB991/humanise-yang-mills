# Mathematical review: clause-by-clause determination

Identity, reviewed commit and hashes: [README](README.md), [validation](validation.md). Line numbers `l.N` refer to `M4/README.md` at the reviewed hash. Lean line numbers refer to the three public files at the source pin. Evidence labels: **P** proved here (the argument is written below in enough detail to be checked; none of it was formalised), **C** cited (all citations in this file are from memory; no source was opened in this review), **B** believed without a written argument.

**Outcome: (ii).** I found no clause that fails for a free-type model. After five local repairs of the candidate (R1–R5 below), every field of `WightmanTheory`, `Hierarchy`, `Reconstructed`, `OperatorProductExpansion`, `TraceTest` and the hypothesis `hH` has a direct Fock-space proof, sketched below. The record's O1, O2, O3 are routine; none hides an obstruction. No verdict (c) and no verdict (d) remains at the mathematical level. What remains is listed in §6.

## 1. Conventions that the Lean statement forces

Coordinates are $x=(\mathbf x,t)$ with time last (`timeAxis`, `PublicTheory.lean` l.53). All pairings below are the Euclidean one, $\langle a,p\rangle=\mathbf a\cdot\mathbf p+a_tp_t$.

- (K1) `W0.spectralRepresentation` (l.271–273) reads $\int e^{i\langle a,p\rangle}\,d\langle\psi,E(p)\psi\rangle=\langle\psi,U(a)\psi\rangle$, because Mathlib's `charFun μ t = ∫ x, exp (⟪x, t⟫ * I) ∂μ`. So $U(a)=\int e^{i\langle a,p\rangle}dE(p)$, and `positiveEnergy` says $E$ is carried by $\overline V_+=\{|\mathbf p|\le p_t\}$. In particular $U(te_t)=e^{itH}$ with $H\ge0$.
- (K2) `W2.fieldCovariance` with `pullback` (l.242–243, 300–307) reads $U(\Lambda,a)\Phi(A,f)U(\Lambda,a)^{-1}=\Phi(g\cdot A,\,f(\Lambda^{-1}(\cdot-a)))$, that is $U(a)\Phi(x)U(a)^{-1}=\Phi(x+a)$. With (K1) this is the usual Heisenberg picture with positive energy; the two clauses are sign-compatible. (Had they been incompatible, every positive-energy theory would fail; they are not.)
- (K3) `vacuumExpectation` (l.121–124) is $\langle\Omega,\Phi(A_1,f_1)\cdots\Phi(A_n,f_n)\Omega\rangle$, first index outermost. By (K1), (K2) the kernel is $\langle\Omega,\Phi_1(0)e^{i\langle x_2-x_1,P\rangle}\Phi_2(0)\cdots\Omega\rangle$, analytic in the times where $\operatorname{Im}(t_{j+1}-t_j)>0$: this is `orderedTube` (`ChallengeSpec.lean` l.95–96). So the tube, the operator order and the sign in `charFun` agree.
- (K4) `root` (l.137–138) evaluates at $z_j=i\tau_j$ with $\tau_1<\dots<\tau_n$, giving $\langle\Omega,\Phi_1e^{-(\tau_2-\tau_1)H}\Phi_2\cdots\Omega\rangle$. `traceTwo r` (l.146–149) is this for $n=2$, $\tau_2-\tau_1=r$, zero spatial separation.
- (K5) `boundary` (l.139–143) integrates over `Points n` with Lebesgue measure (reading (I): the `MeasureSpace` instance was not elaborated; `adequacy.md` (b) cites `YM.Points.volume_nil` for the point mass at $n=0$) and the limit is the vacuum expectation with $\Phi(A,f)=\int f(x)\Phi_A(x)\,d^4x$. No $2\pi$ occurs anywhere in the public statement. Hence: **the public statement fixes the two-point kernel absolutely.** If $\langle\Omega,\Phi(\Theta,f)\Phi(\Theta,g)\Omega\rangle=\iint f(x)g(y)W(y-x)\,dx\,dy$ with $W(\xi)=\int e^{i\langle\xi,p\rangle}d\mu(p)$, then `traceTwo r` $=\int e^{-rp_t}d\mu(p)$, with that same $\mu$.

## 2. The repaired candidate

- (R1, normalisation) $\mu(dp)=(2\pi)^{-3}\int\rho(ds)\,\delta(p_t^2-|\mathbf p|^2-s)\mathbf 1_{p_t>0}\,d^4p$, with $\rho$ and $c=n_G/(16\pi^2)$ as in the record, and $\hat f(p)=\int f(x)e^{i\langle x,p\rangle}d^4x$ without any $2\pi$. Equivalently keep the record's unnormalised $\mu$ and take $c=n_G/(128\pi^5)$.
- (R2, complex linearity) One-particle space $L^2(\mu)$; $\phi(f)=a^*(\hat f|_{\operatorname{supp}\mu})+a(\widehat{\bar f}|_{\operatorname{supp}\mu})$ with $a$ antilinear, $a^*$ linear. This is complex-linear in $f$, and $\phi(f)^*\supset\phi(\bar f)$.
- (R3, Wick rotation of labels) The symbol $\xi_\alpha$ acts as $i^{\alpha_t}\partial^\alpha\phi$ ($\alpha_t$ = number of time derivatives). Then the continuation of $\xi_\alpha$ at imaginary time is the Euclidean derivative $\partial^\alpha$ of the Schwinger function, since $\partial_z|_{z=i\tau}=-i\partial_\tau$. `adjointLabel` is the conjugate-linear algebra map with $\xi_\alpha\mapsto(-1)^{\alpha_t}\xi_\alpha$. `onLabels (Λ,a)` is the algebra automorphism induced by the linear action of $\Lambda$ on derivative symbols, conjugated by the diagonal map $\xi_\alpha\mapsto i^{\alpha_t}\xi_\alpha$; translations act trivially.
- (R4, unit) The label $1$ acts as $f\mapsto(\int f)\cdot\mathrm{id}$, not as "the identity" (l.46): the field map must be linear in $f$. Covariance holds because $|\det\Lambda|=1$.
- (R5, domain) $D_{\rm big}$ = finite-particle vectors whose $n$-particle components are bounded measurable symmetric functions on $(\operatorname{supp}\mu)^n$ with $\sup|\psi|(1+|p|)^N<\infty$ for all $N$. No smoothness. `domain` $:=D_0:=$ span of all words in the fields applied to $\Omega$ (a subspace of $D_{\rm big}$).

Everything else is as in the record: labels $\mathcal L$ = polynomial algebra in the $\xi_\alpha$; `Field d` = span of monomials of grade $4k+\sum|\alpha_i|\le d$; `Channel j` = monomials of grade exactly $j$; one phase; `correlation s` = Schwinger function on separated points, $0$ elsewhere, the same for all `s`; `continuation` = analytic continuation of the Wightman function on the tube (any value off it); `centeredTrace` $=\xi_0$.

## 3. Clause table

Verdicts: (a) satisfied; (b) satisfied after the stated modification of the record's candidate; (c) fails; (d) undetermined.

### 3.1 `WightmanTheory` and `Axioms` (`PublicTheory.lean`)

| Field or clause | Verdict | Reason |
| --- | --- | --- |
| `HilbertSpace` (l.79–83) | (a) P | Symmetric Fock space over $L^2(\mu)$; a `Type` in universe 0. |
| `FieldLabels` (l.96–99) | (a) P | $\mathcal L$, a complex vector space of countable dimension. |
| `FieldSystem.domain`, `vacuum` (l.106–107) | (b) R5, P | $D_0$ is a subspace containing $\Omega$. |
| `FieldSystem.field` linear in label, test, state, values in `domain →ₗ domain` (l.108–109) | (b) R2, R4, R5; P | Lemma A below: every Wick monomial maps $D_{\rm big}$ to itself. $D_0$ is invariant by its definition. Linearity in the label by linear extension from monomials; in $f$ by R2. |
| `DomainAxioms.normalizedVacuum` (l.128) | (a) P | |
| `DomainAxioms.denseDomain` (l.129) | (a) P | $D_0$ contains the polynomial vectors of $\phi$ alone. $\{\hat f|_{\operatorname{supp}\mu}\}$ is dense in $L^2(\mu)$ ($\mu$ is a Radon measure, $C_c^\infty\subset\{\hat f\}$ restricted is dense). Induction on particle number: the top component of $\phi(f_1)\cdots\phi(f_n)\Omega$ is the symmetrised product, lower components are removed by the induction hypothesis. |
| `DomainAxioms.cyclicVacuum` (l.130–131): `domain` **equals** the span of words | (a) P | True by the definition of $D_0$. This clause is not an obstruction: it only forbids choosing a larger convenient domain, and nothing needs one. |
| `DomainAxioms.tempered` (l.132–133): $f\mapsto\Phi(A,f)\psi\in H$ continuous on $\mathcal S$ for each $\psi\in$ `domain` | (a) P | Lemma A gives $\|\Phi(A,f)\psi\|\le C_\psi\,\|\hat f\|_{N}$ for a Schwartz seminorm. |
| `AdjointAxiom` (l.136–141) | (b) R3, P | Wick monomials in hermitian fields are symmetric on $D_{\rm big}$; $(i^k X)^*=(-1)^k(i^kX)$ for symmetric $X$. |
| `TranslationAction` (l.169–177) | (a) P | Second quantisation of $\psi\mapsto e^{i\langle a,p\rangle}\psi$. |
| `EnergyMomentumMeasure` all fields (l.180–200) | (a) P | Joint spectral measure of the translation group (SNAG); on the $n$-particle space, multiplication by $\mathbf 1_B(p_1+\dots+p_n)$. Set `projection B = 0` for non-measurable `B`; every clause has a measurability hypothesis except `empty`, `univ`. `diagonal ψ` $=\langle\psi,E(\cdot)\psi\rangle$, finite. |
| `PoincareAction` all fields (l.219–246) | (a) P | `Symmetry := ProperLorentz × Spacetime` with the semidirect product, `coordinates` the identity. One-particle action $(U(\Lambda,a)\psi)(p)=e^{i\langle a,p\rangle}\psi(\Lambda^{\mathsf T}p)$, $\Lambda^{\mathsf T}$ the Euclidean transpose. $\Lambda^{\mathsf T}$ is again proper orthochronous Lorentz, so $\mu$ and $\operatorname{supp}\mu$ are invariant; the composition law $U(\Lambda,a)U(\Lambda',a')=U(\Lambda\Lambda',\Lambda a'+a)$ is a two-line check. Strong continuity is standard for second quantisation. `onTests` is a Schwartz map. |
| `translationCompatibility` (l.261–262) | (a) P | By definition. |
| `W0.spectralRepresentation` (l.271–273) | (a) P | (K1); holds for every $\psi\in H$ by the spectral theorem. The Euclidean pairing is not a difficulty: it is the pairing used in $\hat f$ (R1), and Lorentz covariance then uses $\Lambda^{\mathsf T}$. |
| `W0.positiveEnergy` (l.274–275) | (a) P | $\operatorname{supp}\mu\subset\overline V_+$, which is a closed convex cone. |
| `W0.uniqueVacuum` (l.276–278) | (a) P | An invariant $n$-particle function is carried by $\{p_1+\dots+p_n=0\}$, which is empty in $(\operatorname{supp}\mu)^n$ for $n\ge1$ ($p_t\ge e$). |
| `W1` (l.282–284) | as above | |
| `W2.labelIdentity`, `labelComposition` (l.288–293) | (b) R3, P | A representation of the whole group by linear bijections of $\mathcal L$; no continuity or finite-dimensionality is asked. |
| `W2.domainInvariant`, `vacuumInvariant` (l.294–299) | (a) P | $U(g)$ maps a word on $\Omega$ to the transformed word on $\Omega$. |
| `W2.fieldCovariance` (l.300–307) | (b) R3, R4, P | For $\phi$: $U(g)a^*(h)U(g)^{-1}=a^*(U(g)h)$ and $U(\Lambda,a)\hat f=\widehat{f(\Lambda^{-1}(\cdot-a))}$. For derivatives: $(\partial_\mu\phi)(f\circ\Lambda^{-1})$ expands by the chain rule into the linear action on symbols. For Wick monomials: the momentum-space kernels are covariant. |
| `W3.locality` (l.149–156, 310–311), all pairs of labels | (a) P; C | Wick's theorem on $D_{\rm big}$ gives $[{:}A{:}(x),{:}B{:}(y)]=\sum_{\text{nonempty contraction sets}}\big(\prod W_e(x-y)-\prod W_e(y-x)\big){:}\cdots{:}$, each $W_e$ a derivative of $W$. $W$ is analytic and even on spacelike points, so the bracket vanishes on the open set $\{(x-y)^2<0\}$. `SpacelikeSeparated` uses closed supports with strictly spacelike differences, so $\operatorname{supp}(f\otimes g)$ lies in that open set; non-compact supports are handled by cut-offs converging in $\mathcal S$. Cited background: relative locality of Wick polynomials (Epstein 1963, Borchers class of a free field). |

**Lemma A (P).** Let $A={:}\partial^{\alpha_1}\phi\cdots\partial^{\alpha_k}\phi{:}$ and $f\in\mathcal S$. For $C\subset\{1..k\}$ (creators), $B$ its complement, the corresponding term of $A(f)$ sends an $n$-particle $\psi\in D_{\rm big}$ ($n\ge|B|$) to the symmetrisation of $\prod_{C}(ip_j)^{\alpha_j}\int\prod_{B}d\mu(q_j)(-iq_j)^{\alpha_j}\,\hat f(\sum_Cp_j-\sum_Bq_j)\,\psi(q_B,p')$. Use $(1+|P-Q|)^{-N}\le(1+|P|)^{-N}(1+|Q|)^N$, the rapid decay of $\psi$ in $(q_B,p')$, polynomial boundedness of $\mu$, and, for $p_j\in\overline V_+$, $|\sum_Cp_j|\ge\sum_Cp_{j,t}\ge2^{-1/2}\sum_C|p_j|$. The result is bounded, measurable and rapidly decreasing on $(\operatorname{supp}\mu)^{n-|B|+|C|}$, with constants bounded by a Schwartz seminorm of $\hat f$. The forward-cone inequality is what replaces smoothness: $\hat f(p_1+\dots+p_k)$ is not a Schwartz function on $\mathbb R^{4k}$, but it decays rapidly on $\overline V_+^{\,k}$. Polynomial boundedness of $\mu$: $\mu(\{|p|\le R\})\le CR^{8}$, and $\mu^{*k}(\{|P|\le R\})\le\mu(\{|p|\le \sqrt2R\})^k$. No renormalisation is needed, in any dimension and for any tempered $\rho$: the growth $s^2$ (two-point function as singular as $r^{-8}$) is irrelevant, because products of Wightman two-point functions are convolutions of measures carried by a proper cone. (The Euclidean two-point function $S\sim r^{-8}\log^{-2}$ is not locally integrable, so there is no Euclidean random field in the distributional sense; no public clause needs one. `correlation` is used only at separated points.)

**Injectivity of label $\mapsto$ operator (`faithful`).** No relation occurs: for a GFF whose $\rho$ has a density positive on an interval, $\operatorname{supp}\mu^{\otimes k}$ has nonempty interior in $\mathbb R^{4k}$, and distinct monomials of degree $k$ give distinct monomial symmetric polynomials in $(p_1,\dots,p_k)$, which are linearly independent as functions on an open set. A field with discrete mass would fail here (Klein–Gordon relation $\xi_{2e_t}-\sum_i\xi_{2e_i}+m^2\xi_0\mapsto0$), and one would have to quotient the labels; the continuous spectrum avoids this.

### 3.2 `Hierarchy` data (`ChallengeSpec.lean` l.24–48)

| Field | Verdict | Reason |
| --- | --- | --- |
| `Field d` normed, **finite-dimensional** (l.28–31) | (a) P | Monomials with $4k+\sum|\alpha_i|\le d$: $k\le d/4$, $|\alpha_i|\le d$; finitely many. Any norm. `Field 0` $=\dots=$ `Field 3` $=\mathbb C1$; `Field 4` $=\mathbb C1\oplus\mathbb C\xi_0$. |
| `toLabel` (l.32) | (a) P | Inclusion. |
| `project`, and the family `C₀` (l.33) | (a) P | Token type $\Sigma_d$ `Field d`; `C₀` needs only strictly increasing sequences, any `beta`, any `insertion`, and a Haar probability measure on the compact group `g.image`. `WilsonRegularity C₀` is not a hypothesis of the witness theorem. |
| `Character`, instances, `phaseMeasure`, `selected` (l.34–40) | (a) P | One point, Dirac mass. |
| `correlation`, `continuation` (l.41–42) | (b) R3 | Total functions; constrained only on separated points, respectively on the tube. |
| `Channel`, finite; `actor` (l.43–45) | (a) P | |
| `coefficient` (l.46–47) | (a) P | Defined in §4; depends on $(I,a,j,i,x,o)$ only. |
| `centeredTrace : Field 4` (l.48) | (a) P | $\xi_0$. |

### 3.3 `Reconstructed` (l.117–143)

| Clause | Verdict | Reason |
| --- | --- | --- |
| `axioms` | (b) R1–R5, P | §3.1. |
| `faithful` | (a) P | Above. For $P=\sum_kP_k\ne0$ pick $k$ with $P_k\ne0$; the $k$-particle component of $P(f)\Omega$ is $\hat f(p_1+\dots+p_k)\widetilde P_k(p)$; choose $\hat f\ne0$ near a point of the open set where $\widetilde P_k\ne0$. For $k=0$ use $\int f\ne0$. |
| `injective d` | (a) P | Inclusions. |
| `acts` | (a) P | $\phi(f)\Omega\ne0$. |
| `covers` | (a) P | It asks that every *label* lie in the image of one `toLabel d`; it does not ask that labelled fields generate $H$ (that is `cyclicVacuum` with `denseDomain`). The filtration covers $\mathcal L$. With `faithful` and `injective` it forces the label space to be a countable union of finite-dimensional spaces of operator-valued distributions; $\mathcal L$ is one. |
| `represents` | (a) P | `project` $=$ identity. |
| `normalized`, `fullSupport`, `characterContinuity`, `mixture` | (a) P | One-point space: the only nonempty open set has mass 1; the integral against the Dirac mass is evaluation. |
| `permutation`, `smooth` | (b) R3, P | Schwinger functions of Wick monomials are finite sums over contraction graphs without self-lines of products of derivatives of $S$, which is real-analytic and $O(4)$-invariant on $x\ne0$; the graph sum is symmetric under simultaneous permutation. This holds on all separated points, including equal times. |
| `analytic` | (a) P | The continuation is a finite sum of products of $\partial^\gamma W(\zeta_j-\zeta_i)$, $i<j$, with $\operatorname{Im}(z_j-z_i)>0$; each is $\int(ip)^\gamma e^{i\langle\zeta,p\rangle}d\mu$, absolutely convergent and holomorphic. Spatial coincidences are harmless on the tube. |
| `root` | (b) R3, P | At $z_j=i\tau_j$ the factor is $\int(ip)^\gamma e^{-\tau p_t+i\mathbf x\cdot\mathbf p}d\mu$, which with the twist R3 is the Euclidean derivative of $S$. Without R3 the clause is **false** for labels with an odd number of time derivatives (first review, M2; confirmed). |
| `boundary` | (a) P | For fixed $r>0$ the integrand is bounded and continuous in $x\in\mathbb R^{4n}$: $|\partial^\gamma W(\zeta)|\le\int|p|^{|\gamma|}e^{-r\delta p_t}d\mu<\infty$ with $\delta=\min(h_{j+1}-h_j)$. So the Bochner integral is a genuine integral; the totalisation noted in the ledger (C6) plays no role. Fubini gives $\sum_\Gamma\int\prod_\ell d\mu(p_\ell)\,(\text{polynomial})\prod_v\hat f_v(k_v)\,e^{-r\sum_\ell(h_{j_\ell}-h_{i_\ell})p_{\ell,t}}$, $k_v$ = outgoing minus incoming line momenta at $v$. The $r=0$ integrand is absolutely integrable: process vertices in order; vertex $1$ has only outgoing lines, so $\hat f_1$ controls them; at vertex $v$, $|{\rm out}_v|\le|k_v|+|{\rm in}_v|$ and the incoming lines are already controlled; forward-cone momenta do not cancel. Dominated convergence gives the limit, and the limit is the Fock-space vacuum expectation by the same formula. The cases $n=0,1$ and the unit label are consistent ($\int f$). |

### 3.4 `OperatorProductExpansion` (l.58–80)

Shape (S): `coefficients`: for fixed $(I,a,M\ge0,\eta>0,\varepsilon>0,j,i)$, eventually in $r\downarrow0$, for all $(x,o)$ with $|x_i-o|\le Mr$, $|x_i-x_{i'}|\ge\eta r$: $|c|\le r^{j-w(a)-\varepsilon}$. `remainder`: for fixed $(I,J,a,b,M,\eta,c,\varepsilon,D)$, eventually in $r$, for all $(x,o,y)$ in the geometry (`Clear`: $|o-y_k|\ge c$, $|y_k-y_{k'}|\ge c$) and all `s`: $|\,\cdot\,|\le r^{D+1-w(a)-\varepsilon}$. One coefficient family for all $D$, $b$, $y$, `s`. Only upper bounds; no lower bound and no constant.

| Clause | Verdict | Reason |
| --- | --- | --- |
| `coefficients` | (a) P | §4. |
| `remainder` | (a) P | §4. |

### 3.5 `TraceTest` (l.168–175) and `hH`

| Clause | Verdict | Reason |
| --- | --- | --- |
| `centered` | (a) P | $\langle\Omega,\phi(f)\Omega\rangle=0$. |
| `amplitudePositive` | (a) P | $n_G\ge1$ from the nonabelian conjunct of `IsSimple`. |
| `shortDistance` | (b) R1, P | §5. For $S$ as displayed at l.42 the record's computation is correct; the Fock-space data at l.37–38 do not produce that $S$. |
| `excludes` | (a) P (mathematics); Lean generic lemma not written | Follows from `shortDistance` and $A_G>0$ alone: each `Mode` integral is $c_P\int_m^\infty(E^2-m^2)^{(1+\sigma)/2}E^{k}e^{-rE}dE$, with a small-$r$ expansion in $r^a(\log r)^b$, $a\in\mathbb Z$, $b\in\{0,1\}$; finite products and sums stay in the class $r^a(\log r)^b$, $b\in\mathbb N$, and no such function has $r^8\log^2(1/r)f(r)\to A\ne0$. This is what `YM.TraceExtension.Wick.euclidean_excludes` proves (`Refute.lean` l.75–80: hypotheses `EuclideanAsymptotic F A`, `0 < A` only). The excluded class is finite combinations of finite products of single-mass kernels; a continuous superposition is outside it, as the source's own docstring says. |
| `hH` (vanishing at the zero vector of grade 0) | (a) P | `correlation` is multilinear in the vectors on separated points and $0$ elsewhere. The zero vector of `Field 0` is not the unit: the unit $1\in$ `Field 0` has nonzero correlations, as the OPE requires. |

## 4. The operator product expansion (P)

Write $w'\le w(a)$ for the true total grade; it suffices to treat monomials $a_i$ and extend multilinearly (a vector of `Field d` is a combination of monomials of grades $\le d$, and for $r<1$ a smaller true grade only helps both bounds).

*Algebraic step.* By Wick's theorem, the product of the $a_i(x_i)$ inside a correlation equals $\sum_G\big[\prod_{\text{lines of }G}\partial^{\gamma}S(x_i-x_{i'})\big]\,N_G(x)$, the sum over graphs $G$ of internal lines (no self-lines), where $N_G(x)={:}\prod_{e}\partial^{\alpha_e}\phi(x_{i_e}){:}$ is the multi-local normal product of the uncontracted legs. Its correlation with the spectators is $F_G(z_1,\dots,z_m;y)$ evaluated at $z_e=x_{i_e}$, where $F_G$ is the sum over contractions of every leg with a spectator leg and of the remaining spectator legs among themselves. Legs never contract with each other, so $F_G$ is smooth in $z$ on $\{|z_e-y_k|>0\}$, also where the $z_e$ coincide, and $\partial_z^{\beta}F_G(o,\dots,o;y)$ is the correlation of the one-point monomial $\prod_e\xi_{\alpha_e+\beta_e}$ at $o$ with the spectators.

*Definition.* For a monomial $m$ of grade $j$: `coefficient a j m x o` $=\sum_{(G,\beta)}\prod_{\text{lines}}\partial^\gamma S\cdot\prod_e(x_{i_e}-o)^{\beta_e}/\beta_e!$, the sum over the finitely many pairs $(G,\beta)$ with $\{\alpha_e+\beta_e\}_e=m$ as multisets. It does not depend on $D$, $b$, $y$ or `s`, and no symmetry factor has to be computed: it is a regrouping of Taylor terms. (This settles O2 and the first review's M5 request for one family for all $D$.) For $I=\emptyset$: coefficient $1$ on the unit channel, $0$ otherwise. Off the separated locus put $0$.

*Bounds on $S$.* $\partial^\gamma\Delta_m(z)=m^{2+|\gamma|}g_\gamma(mz)$ with $|g_\gamma(v)|\le C|v|^{-2-|\gamma|}e^{-|v|/2}$; integrating against $\rho\le cs^2/4$ gives (i) $|\partial^\gamma S(z)|\le C_\gamma|z|^{-8-|\gamma|}$ for all $z\ne0$ and (ii) $\sup_{|z|\ge c/2}|\partial^\gamma S|<\infty$. The logarithm only improves (i); the public clauses contain upper bounds only, so the logarithmic correction never has to fit into $\varepsilon$ from below.

*`coefficients`.* A line between legs of grades $4+|\gamma|$, $4+|\gamma'|$ is at most $C(\eta r)^{-8-|\gamma|-|\gamma'|}$, the sum of the two grades consumed. With $g_0=\sum_e(4+|\alpha_e|)$, a term is at most $Cr^{-(w'-g_0)}(Mr)^{|\beta|}=C'r^{j-w'}\le r^{j-w(a)-\varepsilon}$ for small $r$, uniformly in $(x,o)$.

*`remainder`.* For each $G$: if $g_0\le D$, Taylor-expand $F_G$ in $z$ about $(o,\dots,o)$ to total order $D-g_0$; the retained terms are exactly the pairs $(G,\beta)$ of grade $\le D$, and the Taylor remainder is at most $(Mr)^{D-g_0+1}$ times a supremum of derivatives of $F_G$ over $|z_e-o|\le Mr$. For $Mr<c/2$ these are products of $\partial S$ at arguments of norm $\ge c/2$ and are bounded uniformly in $y$ by (ii) (far spectators included). Times the internal lines: $\le Cr^{D+1-w'}$. If $g_0>D$, nothing is retained and the term is $\le Cr^{-(w'-g_0)}\le Cr^{D+1-w'}$. Summing over finitely many $G$: $\le Cr^{D+1-w'}\le r^{D+1-w(a)-\varepsilon}$. Separation of all slots in `grouped` holds once $Mr<c$. Edge cases checked: $I=\emptyset$ (difference is $0$); $J=\emptyset$ (only fully contracted graphs and the unit channel contribute; difference is $0$ for $D\ge0$); $M=0$ (forces $|I|\le1$, $x=o$); inhomogeneous vectors and the unit placed in a high grade.

Nothing here uses more than: Wick's theorem for the Schwinger functions, (i), (ii). The expansion is state-independent because there is one state.

## 5. Recomputation of the trace constant (P, and numerics)

By (K5), `traceTwo r` $=\int e^{-rp_t}d\mu(p)$. For the mass shell, $\int\delta(p_t^2-|\mathbf p|^2-m^2)\mathbf 1_{p_t>0}e^{-rp_t}d^4p=\int_{\mathbb R^3}\frac{e^{-rE}}{2E}d^3p=\frac{2\pi mK_1(mr)}{r}=(2\pi)^3\Delta_m(r)$, $\Delta_m(r)=\frac{mK_1(mr)}{4\pi^2r}$ (kernel of $(-\Delta+m^2)^{-1}$ on $\mathbb R^4$). With R1, `traceTwo r` $=S(r)=\int\rho(ds)\Delta_{\sqrt s}(r)$. Substituting $s=u^2/r^2$, $ds=2u\,du/r^2$, $\log s=2(L+\log u)$, $L=\log(1/r)$:

$$r^8L^2S(r)=\frac{c}{8\pi^2}\int_{er}^\infty u^6K_1(u)\frac{L^2}{(L+\log u)^2}du\ \longrightarrow\ \frac{c}{8\pi^2}\cdot384=\frac{48c}{\pi^2}.$$

The limit: on $u\ge\sqrt r$ the factor is $\le4$ and tends to $1$; on $[er,\sqrt r]$ it is $\le L^2$ and $\int_0^{\sqrt r}u^6K_1\le r^3/6$. The moment: $\int_0^\infty u^{\mu-1}K_\nu(u)du=2^{\mu-2}\Gamma(\frac{\mu-\nu}2)\Gamma(\frac{\mu+\nu}2)$ at $\mu=7,\nu=1$ gives $2^5\Gamma(3)\Gamma(4)=384$. Setting $48c/\pi^2=3n_G/\pi^4$:

**$c=n_G/(16\pi^2)$ when $\rho$ is the Källén–Lehmann weight in the standard normalisation ($W=\int\rho(ds)W_{\sqrt s}$ with $W_m$ the canonically normalised free two-point function, $\mu$ carrying $(2\pi)^{-3}$). For the measure literally displayed at l.37 (no $(2\pi)^{-3}$) with $\hat f$ unnormalised, the correct constant is $c=n_G/(128\pi^5)$; with the record's $c$ that measure gives the limit $(2\pi)^3A_G=24n_G/\pi$, and `shortDistance` fails.** If instead $\hat f$ carried the unitary factor $(2\pi)^{-2}$, the kernel would be $(2\pi)^{-4}\int e^{i\langle\xi,p\rangle}d\mu$, off by $(2\pi)^{-1}$; no reading of l.37–38 gives l.42. The Lean statement fixes only the kernel $S$, not a field normalisation separately (there is no commutation-relation clause), so the repair is a relabelling of constants; but it must be made, because `shortDistance` is an exact equality of limits.

Correction rate: $r^8L^2S(r)/A_G=1-2m_1/L+3m_2/L^2+O(L^{-3})$ with $m_1=\log2+\frac12(\psi(4)+\psi(3))\approx1.7826$ and $m_2=m_1^2+\frac14(\psi'(4)+\psi'(3))\approx3.347$; at $L=100$ this is $0.9654$, in agreement with the author's $0.965327$. Numerical results: [validation](validation.md).

## 6. What remains, precisely

All of it is routine writing; none is a mathematical uncertainty.

1. Write Lemma A, the Wick theorem on $D_{\rm big}$ and the adjoint, covariance and locality consequences as proofs (O1). About three pages.
2. Write §4 as a proof (O2) and the `boundary` argument of §3.3 (O3).
3. Apply R1–R5 to the record and replace its headline by a conditional ledger (as the first review asked).
4. A generic Lean lemma `excludes`-from-`shortDistance` for an arbitrary `Hierarchy` (the existing declaration is specialised to the internal `F`), if a formal witness is wanted. A full Lean instantiation of the candidate would be a substantial formalisation (Fock space, SNAG, Wick theorem) but raises no new mathematical question.

## 7. Findings on the record, by severity

1. **l.33, 37–42, 78 (required; confirms first review M1).** Normalisation inconsistent by $(2\pi)^3$; see §5. The constant $c$ at l.33 is right only for the standard kernel at l.42. Also l.60 "$=A_G$" is a statement about that kernel only.
2. **l.46, 77–78, 93 (required; confirms first review M2).** Derivative labels need the twist R3 or `root` is false. The repair also changes `adjointLabel` and the Lorentz action on labels (complexified), which the record does not mention.
3. **l.106–114 (required).** The proposed domain $D_{\mathcal S}$ ("Schwartz wavefunctions restricted to $\operatorname{supp}\mu^{\otimes n}$") is not invariant in the form stated: the creation part produces $\hat f(p_1+\dots+p_k)$, which is not the restriction of a Schwartz function in general, and "square-integrable because $\mu$ is tempered" is not the reason. Use R5 and Lemma A. With that, O1 is not "the first unresolved item" in any deep sense; it is a three-page verification.
4. **l.38 (required; confirms first review).** $a(\hat f)+a^*(\hat f)$ is not complex-linear in $f$; use R2.
5. **l.46 (minor).** The unit must act as $(\int f)\,\mathrm{id}$ (R4).
6. **l.83 (minor).** "The sign of the spatial pairing is immaterial because $\mu$ is invariant under $\mathbf p\mapsto-\mathbf p$" is true but is not the point; what is needed is that $\Lambda^{\mathsf T}$ is Lorentz, so that the Euclidean-paired Fourier transform intertwines the two actions. The conclusion stands.
7. **l.79 (minor).** `boundary` is classified "S / O3" by appeal to a general boundary-value theorem. A general theorem gives a distributional limit, not integrability of the integrand in the Lean Bochner integral; here integrability holds because the integrand is bounded for each $r>0$ (§3.3).
8. **l.10–18, 52 (required; first review M3).** "No clause fails" is correct as a finding of this review, but the record did not establish it; "proved here" should be limited to the scalar limit of §2 and the trivial clauses.
9. **l.93–101 (no error).** The expansion "to order $K=D+1$" does give one coefficient family, because every retained pair $(G,\beta)$ of grade $\le D$ has $|\beta|\le D$; this should be said. Bound (i) at l.90 is stated only for $|z|\le1$; it holds for all $z\ne0$.
10. **`trace_constant.py` (no error).** The upper cut-off $u=60$ and the lower limit $t=1-L$ are harmless; the script reproduces (validation).

## 8. On the first review's two technical points

Both are real, both are repairable, and neither is an obstruction. M1: R1, with the constants of §5. M2: R3; the explicit check is $F'(ir)=-iS'(r)$ for the label $\xi_{e_t}$, so the operator must be $i\partial_t\phi$. The first review's remaining conditional items (one coefficient family for all $D$; integrability in `boundary`; invariant domain and vector-valued continuity; label action) are settled by §4, §3.3, Lemma A and R3 respectively, at the level of proof sketches written here.

## 9. Consequence

If items 1–3 of §6 are written and independently checked, `constant_insertion_witness` applies (its hypotheses are exactly `Reconstructed`, `OperatorProductExpansion`, `TraceTest` for some `T₀ : Hierarchy C₀` and `hH`; statement read at `formal/Adequacy.lean` l.735–747, not re-elaborated), and `YangMills.JointExistence` holds for every simple group by a generalized free field. No public clause carries content beyond free-type fields: the only clause aimed at non-freeness, `TraceTest.excludes`, is implied by `shortDistance`, and `shortDistance` is met by a continuous Källén–Lehmann weight. A clause that would exclude this candidate would have to be added. Candidates (B; none was analysed here): a nonvanishing truncated higher-point function of the trace field; a stress tensor with the usual Ward identities (from memory, a GFF with continuous spectral weight has none); an identification of the selected correlations with the Wilson limit for insertions that read the configuration. Whether and how the public statement should change is a coordinator decision, not a finding of this review.
