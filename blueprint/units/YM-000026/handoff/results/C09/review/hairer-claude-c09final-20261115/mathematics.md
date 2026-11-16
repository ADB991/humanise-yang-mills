# Mathematics review

Session `hairer-claude-c09final-20261115`. Each proof was read line by line against its immediate
definitions. Cross-package producers are treated as the stated inputs.

## `stationary-action-prices.tex`: favorable

- **`eq:stationary-read-price`.** If every tested coordinate lies within the read radius $R$, then
  $\sum_h\operatorname{dist}\le qR\le nR$, so the right side is at least $A$. Otherwise the derivative
  vanishes. Correct.
- **`eq:stationary-support-payment`.** With $a=\mu/(4(n+1)(1+L))$,
  $an(2t+1+L)\le\mu\cdot2t/(4(1+L))+\mu/4\le\mu t/2+\mu/4$. The stated bound $\mu t/2+\mu$ holds with
  room to spare.
- **Site summation.** $\sum_h\operatorname{dist}(a_{i_t},a_{i_h})\le q\operatorname{dist}(v,a_{i_t})+s
  \le(q+1)s$. The half/half split of $e^{-as}$ is valid, and summing over $v$ costs a distance-shell
  sum at width $a/2$. The text notes that there is no order-zero claim.
- **Termwise differentiation of infinite families.** Valid by uniform convergence of the derivative
  series on the common ball.
- **Predictor penalty.** The identity competitor gives $\le\frac12(C_3r)^2$. Below the cutoff, the
  nearest-point projection is one smooth expression for all tags.
- **Vanishing at the identity.** $f(0)=0$ and $Df(0)=0$: every term other than the stationary direct
  penalty has degree at least two in the vanishing slots.

## `truncated-stationary-log.tex`: favorable (N1)

- **$V$.** Taylor's formula with integral remainder plus stationarity give $V$, and
  $V(0,x,z)=\frac12z^TM(x)z$.
- **`eq:stationary-zero-mass`.** We have
  $e^{A(0,x,z)}d\gamma_0=\sqrt{\det M(x)/\det M(0)}\,e^{-\frac12z^T(M(x)-M(0))z}\,d\gamma_0=d\gamma_x$,
  so $R(0,x)=\gamma_x\{|z|\le D\}$.
- **Parity.** $A(-b,x,-z)=A(b,x,z)$ term by term, and $\gamma_0$ and the ball are symmetric.
- **$|A|\le1$.** This follows from $A(0,0,z)=0$ and the first-order bound along the parameter segment.
  The joint derivative in $(b,x)$ costs at most twice the larger partial bound, and "enlarging $P_k$"
  absorbs this. Hence $e^{-1}/2\le R\le e$.
- **Tail.** Coordinates below $r$ imply $|Z|^2\le Pr^2\le P^2r^2$. The union bound over at most $P$
  coordinates with $s=r/c$ gives $2Pe^{-r^2/(2c)}$, and $Pr\le D$ when $P\le\sqrt{P_F}$.
- **$|\log r|\le\epsilon/(1-\epsilon)\le2\epsilon$.** Correct.
- **Interpolation lemma.** Induction with $c=a+\max(0,d-m)+1$, $b=m-1-c$, $s=z^{-c}$. The radius-$s$
  balls about centers within $s$ of $y$ lie in the $z^{-a}$ ball, since $2s\le z^{-a}$. The one-step
  estimate gives $2z^{b+c}+z^{d-c}$, with $b+c=m-1<m$ and $d-c\le m-a-1<m$. Correct.
- **Even gain.** Evenness gives $f'(0)=0$, so the change is at most $\frac12\sup|f''|\epsilon^2$.
  Correct.
- **N1 (typo, l.32).** `D_y^2\varphi(x,\rho(x)+tbz)[z,z],dt` should read `[z,z]\,dt`; it renders as
  "[z,z],dt".

## `stationary-exterior-receipt.tex`: favorable (N2)

- **`eq:exterior-exact-interior`.** The integrand is $\pi_\beta c_H^Ne^{-\beta\phi-\psi}$ in the chart.
  Substituting $y=\rho+bz$ (Jacobian $b^d$) with $\beta b^2=1$ gives the exponent
  $-\beta\phi(\rho)-\psi(\rho)-s(x)+s(0)-V(0,0,z)+A$. The Gaussian normalization
  $(2\pi)^{d/2}e^{-s(0)}$ then yields exactly $\Omega e^{-\Phi}R$, with
  $\Omega=\pi_\beta(\sqrt{2\pi}b)^dc_H^N$, and $d=N\dim\mathfrak g$ is consistent with
  $\Omega=\pi_\beta m_H^N$.
- **`eq:exterior-convex-gap`.** $\int_0^1(1-t)\,\gamma/2\,dt=\gamma/4$. Outside $\mathcal S_x$ this
  costs $\beta\gamma b^2D^2/4=\Delta$.
- **Pointwise exterior bound.**
  - Small wires: chart recognition, the gap, $|\ell|\le W\Lambda\tau^2$ and
    $-\beta\phi(\rho)\le-\Phi+p+t_W$.
  - Large wires: the exponent is at most $WB_{\rm loop}-\beta\kappa\delta^2/2$. Since
    $-\Phi\ge-\beta m_W\|x\|-p-t_W$, the wire reserve gives the same bound.

  Both cases are correct.
- **`eq:exterior-overhead-compare`.** Combining the matching bound, the cubic and quartic budgets, the
  log-determinant bound and $\Phi\le\beta\phi(\rho)+p+t_W$ gives exactly $e_*$.
- **Slack argument.** $e^{Y_*+e_*}\le e^{-2-\Delta/2}<\frac12$, and the allocation lies in $[0,1]$ and
  is supported on fields with all plaquettes at most $\tau/2$. The contradiction is valid.
- **Propagation.** $\max(r,C_\rho r+2bD)\le(1+C_\rho)r+2bD$, and $b\le\sqrt2z^{-1/2}$ gives
  $2L_0bD\le\tau/4$.
- **Asymptotics.** All positive terms are $o(P_F^2)$: $N\log z$ is polylogarithmic, $p_1P_F$ is
  $o(P_F^2)$, and $P_F/\log z\to\infty$. Hence $\Delta=\gamma d_0^2P_F^2/4$ dominates. The wire reserve
  divided by $\beta$ tends to zero.
- **N2 (quantifier, minor).** The final display holds for $\|y\|<u$ with $\|y-x\|\le r$, while the slack
  and wire-reserve steps are applied at the center $x$, which then only satisfies $\|x\|<u+r$. Every
  margin used, $m_W(u+r)\to0$ and the chart radii, absorbs this. One phrase, or $\|x\|<u$ as an
  explicit hypothesis, would make it exact.

## `pure-action-small-field.tex`: favorable

- **`eq:pure-log-value`.** The ratio lies in $[1,1+\eta/R]$, so $0\le E\le\eta/a_0$.
- **`eq:pure-relative-derivatives`.** The relative jets of $ae^{p}$ hold uniformly in the held field.
  Normalizing at one point with $f(x)=1$ never divides by a small partition function.
- **`eq:pure-action-decomposition`.** Substituting $\Phi=\beta a_{\rm fine}+\psi+\frac12\log\det M$
  shows it is an identity.
- **`eq:pure-classical-fifth`.** For $r\ge5$, $h^{5-r}\ge1$; for $r<5$, integration from zero jets
  gives $K_Ch^{5-r}$.
- **Symmetry.** Central inversion followed by translation by $2b+e_\mu$ reverses one bond and sends
  $e_i$ to $-e_i$, so $DG(0)=0$. The text correctly uses the symmetry of the full logarithm, not of
  each term.
- **`eq:pure-quantum-third`.** Order 0: $(a+v)h+qh^2+K_Wh^3/6$. Order 1:
  $(a+v)+qh+K_Wh^2/2\le$ amplitude$\cdot h^{-1}$. Order 2: $q+K_Wh\le$ amplitude$\cdot h^{-2}$. The
  factor 3 dominates all three.
- **Exponents with $h=z^{-7/16}$.** $ah\to-23/16$, $v\to-2$, $\beta K_Ch^5\to1-35/16=-19/16$,
  $K_Wh^3\to-21/16$, $(a+v)h\to-23/16$, $qh^2\to-1-7/8=-15/8$. The maximum is
  $-19/16=-1.1875<-23/20$. Correct.

## `healthy-boundary-jets.tex`: favorable (N3)

- **Retreat lemma.** $\|X'(1)-D\|\le\int_0^1K(1-r)\,dr=K/2<t$, and
  $X(s)-X(0)=sD+g(s)-g(1)$ checks. The strict inequality holds even when the endpoint lies on the
  boundary.
- **Plaquette application.** $t=r_G\tau$; endpoint chords at most $\tau$ give
  $\|X(1)-1\|\le t$; and $h^2$ has exponent $-7/8<-1/2$.
- **Chart transfer.** The inner jets are at most $h$ once $(1+r_G)C\le1$ and $j!J(1+r_G)C\le h$, and
  they cancel the outer $Th^{-m}$. The partition count is bounded crudely but correctly.
- **Array.** $\sum_ik_i\le|\Lambda|b$ (sum over roots, weights at least one). Term-by-term
  differentiation holds on $\mathcal S$, the identity for $\widetilde H$ is exact, and the factor two
  appears at order zero only.
- **Boundary passage.** Valid by continuity of $H$'s ordered derivatives at $U$, with no boundary
  smoothness of $f$ inferred.
- **N3 (sketched constant).** $\sup\|X''\|\le r_G(4r_GCw)^2$ is asserted, not derived term by term.
  The product rule also produces single-factor second-derivative terms. The conclusion that is used,
  $\sup\|X''\|=O(w^2)$ with a fixed constant, is clearly true, and any such constant works since
  $h^2\ll\tau$.

## `primary-calibration-producer.tex`: favorable (N4)

- **`eq:primary-integrand-difference`.** Exact telescoping.
- **Cutoff.** Off the plateau, $(g/\theta_f)P^2\ge(g/\theta_f)\|\mathrm{tape}\|\ge\varepsilon/8$ (using
  $P\ge1$), so $|\Gamma-1|\le2\le(16/\varepsilon)(g/\theta_f)P^2$. $\Gamma$ depends on $z$ only, so jets
  in $V$ do not hit it.
- **`eq:primary-normalized-jets`.** $t^{j-\ell_i+a}\le1$ with $a=\max(\ell_i-j,0)$, and
  $\|v\|^a\le(1+\|v\|)^{\ell_i}$.
- **Probe jets.** The probe's link-log jets are polynomials of degree at most $dj$. In a chain-rule term
  with $r\ge1$ blocks the threshold factor is $y^r/t\le y/t\le2$.
- **Heading.** The diagonal factors combine to $L^{g_i}\theta_f^{-\ell_i}L^{d-g_i}=L^d\theta_f^{-\ell_i}$.
- **Coefficient error.** Separation by the finite probe family gives $T_{\rm test}\delta_\beta$. The
  graded price is $2(C_i+1)L^{d-g_i}m_i$, with the factor 2 for real and imaginary parts.
- **N4 (sketched constants).** The base-point and argument-change costs in the first subsection, and
  the absorbed power $P^{4(n+1)}$, are given with unspecified constants. The scheme (Faà di Bruno,
  then one-at-a-time replacement) is standard and the conclusion `eq:primary-flat-gaussian` follows,
  but a reader cannot recompute the exponent $4(n+1)$ from the text.

## `wilson-vacuum-price.tex` (excluding rows 118–119): favorable (N5)

- **Cauchy factor.** Iterated Cauchy estimates on radii $R/2,\dots,R/2^n$ lose $2^k/R$ at step $k$,
  which is exactly $\operatorname{CTax}(R,n)$.
- **Mode size.** For independent momenta in the width-one strip, $|e^{i\langle p,y\rangle}|\le e^{16}$
  on the radius-four stencil, and $\le e^{16t}$ for $q_0$. So each mode is at most $e^{16n}$ and $n$
  modes cost $e^{16n^2}$, giving $A_t$ as stated.
- **Auxiliary torus.** The radius-four box embeds in $(\mathbb Z/9)^4$. The pullback reproduces the
  restricted mode, since modes with integer displacement are $2\pi$-periodic in $p$, also for $m<9$.
- **Volume factor.** The anchor sum of characters gives $|(\mathbb Z/m)^4|$ or $0$.
- **N5 (notation).** "$9=2d+1$ and $d=4$" uses $d$ for the box radius two paragraphs after $d_G$, and in
  a chapter where $d$ elsewhere denotes the spatial dimension. Suggest $9=2\cdot4+1$.

## `row-quadratic-price.tex`: favorable (N6)

- **Word bound.** At most $2\ell$ factors of norm at most $e^{\sigma/4}$ give $e^{(\sigma/2)\ell}$. The
  half-difference of forward and reverse words is skew on real fields, so the extension agrees with the
  slot.
- **Weighted activity.** It equals
  $\frac{d_{\rm col}}2\sum_a(\sum_i|c_{a,i}|e^{\sigma\ell_{a,i}})^2\le\frac{|\mathcal A|d_{\rm col}}2C^2$.
- **Coefficient bound.** The extension bound is $S_G^2e^{(\sigma/2)\ell}$ and the mode cost is
  $e^{4n^2\eta_t\ell}\le e^{(\sigma/2)\ell}$, since $4n^2\eta_t\le\sigma/2$. With the Cauchy factor this
  gives exactly the stated price. The M-test, termwise extraction and real-field regrouping are valid.
- **Translation and torus.** Characters give the volume factor or zero. The per-atom auxiliary torus
  $\Lambda_{2d+1}$, with $d=\ell_{a,i}+\ell_{a,j}$, has no internal identification.
- **Corollary.** The reflection fee per factor is at most $e^{n\eta_t}$ (plotted momentum imaginary part
  at most $n\eta_t$), so $n$ factors cost $\exp((t+1)^2\eta_t)$. `rotatePhase` preserves the strip.
- **N6 (notation).** Here $d$ is again a radius, $d=\ell_{a,i}+\ell_{a,j}$. This is harmless but, as in
  N5, could use a different letter.
