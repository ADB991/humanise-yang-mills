# #56 Coffer: explicit terminal planting and served expansion

## Audited source

The source pin is imported rather than a local Git ref. I read the live workspace source and verified `Lean/YM/TraceExtension/Soot/Basin.lean` against `Lean/SOURCES.sha256` (manifest line 8375): SHA-256 `8bf042201f96f8d4f10bed134d1f68603187db9e57ab4fa68e0698f95b9c4da2`.

Relevant sources and hashes:

- `TraceExtension/Soot/Basin.lean`: `8bf042201f96f8d4f10bed134d1f68603187db9e57ab4fa68e0698f95b9c4da2`
- `TraceExtension/Soot/Bloom.lean`: `7ab723994f0ac9de55f1795db37114233e859e5749bbd3889cd52ed080a3489a`
- `TraceExtension/Soot/Loom.lean`: `c31b92b3053fee05795f825a7e3358fb9ea4aaf99d6ebcd4fdf3f129f875392d`
- `MergeProof/Close.lean`: see workspace source; `closeup` below
- `MergeProof/South/Admit.lean`: `couple`, `Served.relay`
- `MergeProof/Bungalow.lean`: `birth`, `Served.unveiled`
- `MergeProof/Accent.lean`: `restore`, `Served`, `Carton`, `Towed`

## Terminal planted object: explicit formulas

Fix census sites `V`, census `B`, terminal rep `R_N = C.path.rep N p N`, marks `o_N(i)`, motions `t(i)`, and the public label `b`. Basin defines

\[
 U_0(i)=\operatorname{stepUp}(t_i,o_N(i),\operatorname{initial}(Y!,T,N,p,-b,0)),\qquad
 v(U)=\operatorname{birth}(B,R_N,U_0)(U).
\]

By `Bungalow.birth`, this is exactly

\[
 v(U)=R_N(U)\,\operatorname{pass}\Big(\sum_{i\in V}\operatorname{send}_{B.fire(i)} U_0(i,U)\Big).
\]

Its vacuum coefficient is `R_N.eval(U)` and its singleton coefficient at mark `i` is `R_N.eval(U) U_0(i,U)` (`Bungalow.boot`). `gust T N p N v` is the backwards composition of the actual Wilson push operators. `gust_sum` says its integral equals the terminal integral; `gust_live` propagates integrability.

At level `k`, Basin plants the response observable with

\[
 V_1(i,U)=\operatorname{stepUp}(t_i,o_k(i),G'(U)),\quad
 M_k(U)=\operatorname{couple}(Q_k,V_1)(U),
 \]

where `Q_k = gust(... birth ... )` and, exactly,

\[
 \operatorname{couple}(Q,L)(U)
 =Q(U)\,\operatorname{pass}\Big(\sum_i\operatorname{send}_{B.fire(i)}L_i(U)\Big).
\]

This is `South/Admit.couple`. It is not an abstract product placeholder: the `pass` factor adds all marked singleton directions while retaining the existing marked polynomial. `Served.jelly` proves this updates singleton data `F` to `F+L` and changes represented polynomial to `couple(X,L)`, without changing the served correction families.

`Basin.copious` returns the explicit level-m polynomial

\[
 X_m=\operatorname{gust}_{k\to m}(M_k)
\]

with singleton regular field `f! m`, forced profiles `λ! m`, sites `o_m`, common weight `w`, support exponent `α_m`, and reserve `1`; it proves `Served(X_m) ∧ Vault(2,1)`.

The exact coefficient identity furnished by `Served.relay` is, pointwise in `U`,

\[
 (X_m(U)).part(B.fire(i))=\operatorname{coin}_{R_m}(f_i, g_i)(U),
 \qquad (X_m(U)).part(B.quiet)=R_m.eval(U),
\]

where

\[
 \operatorname{coin}_{R}(F,K)(U)=R.eval(U)F(U)
 +e^{R.exponent(U)}\sum_{n\ge0}\operatorname{nickel}(R.p,R.activities,n,U,K_n(U)).
\]

Thus `coin` is the exact Wilson-density marked derivative (one forced insertion at a time); this identity is how the response correction is attached to the terminal observable. The `Buff.hit` premise in Bloom is the exact input identity
`alto * X.density 0 Y R U = (R.eval U : ℂ) * f U`. `boost` converts it into a pointwise `coin` identity for the lifted observable, not just a norm estimate.

## Exact correction construction inside `Served`

The important point is that anchored support prices are encoded in `Served` itself. In `MergeProof/Accent.lean`:

- `Served` is a pair of correction families `H : Support→Config→Poly` and `K : Box→Config→Poly`, with `Carton` plus separate `Towed` certificates for `H` and `K`, and the exact equality `X=restore ... H K`.
- `restore` is
  \[
  e^{R.exponent}\,\operatorname{pass}(\operatorname{Mach}(\Phi)+\sum_s H_s)
  \;\operatorname{field}(p\mapsto \bar R_p+\operatorname{Mach}(\omega_p)+K_p,\ flags).
  \]
- `Towed w S F b e u` means there is a nonnegative summable charge `a_i`, `Hit S b a e u`, and for every address `i`, a sheet `v_i≥0` such that every mode coefficient of `F_i(U)` is bounded by `v_i`, with `wordsPrice(w,v_i)≤a_i`.
- `Hit` is sitewise: for every lattice site `x`, the sum over addresses whose prescribed support contains `x` of `a_i exp(b*coverNumber(B,support_i))` is bounded by `u` (the exact `SumBudget` form). This is the anchored exponential support-cost control; it is stronger than `Vault`.
- `Carton` says each ordinary correction is support-local, gauge invariant/measurable, used only at its assigned final support, healthy when nonzero, quiet-free, and contains no singleton modes; flagged box terms are support-local and have precisely the assigned flag footprint.

The input to `Loom.cherish` is one existing served representation `(Φ,K0,H0)` plus forced-site corrections `X_i,Y_i`. Its hypotheses are explicit: positive old/new weights; `0≤a≤1` and `w_i≤a w'_i`; occupancy; activity validity; `ForceFormat` and `ForceCost(Y_i)≤f_i`; `w_i f_i≤e`; nonnegative local garnish `ψ_i` whose support contains the mark `o_i` and whose weighted exponential cover sum is ≤`b`; dominated forced profiles; exact hook identity `profile(Y_i)=hook(ψ_i)`; exact pointwise coin identity for the target; nonzero Wilson density; and the melting inequalities.

The algebraic construction in `cherish` is:

1. `hY.prune` lowers the old service charge to the new weight/radius and decomposes the old served polynomial with a `jelly` witness. It returns a representation with enough ordinary/flagged budgets remaining after paying the new forced terms.
2. Put `J'(U)=kelp(ψ,B)(U)=Σ_{i,s} send_{fire(i)} ψ_i(s,U)` and let `U₀=conviction(ψ,B)` be this same singleton polynomial indexed by `(i,s)`. For every local correction support `s`, `conviction(i,s)` is exactly `send_{fire(i)} ψ_i(s)`.
3. Let `κ_p=closure(K_p,U₀,Prod.snd,threshold)`. By `Close.closure`/`arranged`, this is the finite admissible disjoint-box gas expansion of `K_p` with local response insertions. `Close.posts` gives the exact flagged coefficient formula
   \[
   κ_p.part(fire(i))=K_p.part(fire(i))+hook(ψ_i)_p,
   \]
   while `Close.wine` preserves the quiet coefficient. `Close.reversal` is the exact identity
   \[
   play(K,F)=play(κ,F-J'),
   \]
   since the extracted `J'` is moved from the singleton/pass factor into the closure of the box field.
4. The resulting correction families in the final served certificate are exactly the high-degree truncations
   \[
   H^{new}_s=octave(H^{pruned}_s),\qquad
   K^{new}_p=octave(κ_p),
   \]
   where `octave(Q)` keeps precisely modes of cardinality at least 2. `Close.plank` proves these are the `Carton` fields and proves the represented polynomial equals `restore` exactly. The regular singleton is recovered by `coin`/`beach`; the forced profile is recovered from `posts` plus the hook identity. So the correction is not simply added with a triangle inequality: its singleton contribution is canceled/reassigned exactly, while all high-degree coefficients are charged to their assigned supports.
5. The ordinary `Towed` budget comes from the pruned old `H` certificate plus `Buoy` addition of its small forced-payment family. The flagged `Towed` budget comes from `Close.branch`: the closure expansion charges products by the exponential of the total response price. `Close.stock` converts per-site garnish into a `Hit` bound using occupancy; `Close.branch` then supplies the extra `exp(W+M·siteFactor·c)-1` price. `Close.closeup` uses the scale inequality `((B+B+1)^4)(W+M·siteFactor(B)c)≤z`, then weight reduction `Repegs` and `aS≤C`, `a(exp(...)-1)≤C`, to return both `Towed` bounds with the final advertised allowance `C`. These are the support-anchored inequalities, not consequences of the scalar vault.

For `Basin.copious`, the `hR'` terminal served witness is created by `pollinate` from the actual terminal birth, `hHa`/`Melts` paying the forced component and `hZ'` paying the selected label. `Bloom.bornK` turns the terminal coefficient remainder into a `ForceFormat`/`ForceCost` family; `Bloom.boost` turns `Buff`'s exact paid-response witness into the extra forced correction and coin identity. `Loom.cherish` combines those with `hR'`, producing `hl : Served` at scale k with reserve support exponent `supportExponent_k−4`. Then `chapter` gives Wakes on each address and `Accent.voyage` propagates `hl` to m on the same history. `toasted` supplies the final pointwise bounds

\[
 x_j\,\|X_{ij}(U)\|\le2,
 \qquad x_j\sum_\ell\|Y_{ij\ell}(U)\|\le1,
\]

in the notation of `Hearth.prolonged`; `Basin.copious` packages them as `Vault(2,1)`. The latter is the coefficient-level bound. Anchoring is separately retained by the `Towed` fields constructed above.

## Exact assumptions in `Basin.copious`

For transcription, the Lean hypotheses are: `k<N`; `C.ref d≤m<k`; `0<w`; `FReach` `hX`; calibrated `Sung` `hL`; every adjacent `Carol` receipt `hp`; hierarchy price `hZ'`; response `Buff hE'`; response/melting price `hHa`; occupancy at k; `Melts` `hM'`; terminal forced-profile hook identity `hi`; migration `hO : Migrating T m p N o`; occupancy at m; Drake bounds at m and k; and integrability of terminal birth and the coupled level-k polynomial. Also included are the selected family `C.Makes`, history `Scrim`, gauge doors, and section data. Its conclusion is exactly

`Served (R m) (f! m) (λ! m) (gust ... m ...) (o m) (fun _=>w) supportExponent_m 1 ∧ Vault (fun _=>w) ... 2 1`.

## Exact full-product moment identity: source theorem and composition

The whole-product identity is **not** a consequence of `Served.relay` alone. The actual proof is in `MergeProof/South/Loft.lean::conducts`, via `Push/GRID_APPROXIMATION/Joint.lean::restored`. This resolves the normalization and avoids any factorization claim about conditional push kernels.

Let `h=J`, `k` be the comparison scale, `N` terminal volume, `D` the old observable, and `F` the new observable at scale k. Let `T_h=tilesAt H.S p (h≤k)` and `T_N=tilesAt H.S p (h≤N)`. For a finite set of root cells `s`, Joint defines

\[
\mathrm{cutoff}(s,U)=\prod_{i\in s} T_N.copy_i(\mathrm{backTo}_{k	o N}F-D)(U).
\]

This is the exact reflected product on the terminal configuration. Its expansion (`Joint.expand`) is the full subset expansion

\[
\mathrm{cutoff}(s)=\sum_{l\subseteq s}
  \Bigl(\prod_{i\in l}T_N.copy_i(\mathrm{backTo}_{k	o N}F)\Bigr)
  \Bigl(\prod_{i\in s\l}-T_N.copy_i(D)\Bigr).
\]

At scale k the actual marked polynomial is constructed, not inferred: define

\[
L(U)=\mathrm{birth}(B,R_N, i\mapsto -T_N.copy_i(D)(U)),\quad
M=\mathrm{gust}_{N	o k}(L),\quad
X(U)=\mathrm{couple}(M, i\mapsto T_h.copy_i(F)(U)).
\]

`Loft.joins` proves mode-by-mode that

\[
(X(U)).part(s)=\mathrm{Joint.join}(D,F,s)(U),
\]

where `join` is the sum over all `l⊆s` of the pushed fine-level old-factor product times the incoming new-factor product. Proof detail: `Bungalow.boot` gives the coefficient of terminal `birth` as `bare * old(s\l)`; `Loft.gust_choose` identifies every pushed coefficient with `pushTo`; `South/Admit.couple` multiplies by `pass(Mach(copy F))`; and `Poly.pass(Mach(...))=∏_i(1+send_i(copy F))`. The census `Birth.array_read` gives exactly the subset expansion. This is the required full polynomial identity, including all mixed/noise modes.

`Joint.restored` proves the integral normalization for that entire expansion:

\[
\int \mathrm{join}(D,F,s)\,d\mathrm{prior}_k
 = Z_{N,p}\,\mathrm{moment}_{eta_N}(\mathrm{cutoff}(s)).
\]

For each subset term it uses `pushTo_dual` to move the same Wilson push onto the incoming product; `backTo_copies` identifies that back-pushed product with the product of copied `backTo F`; the terminal fine factor contributes the bare density. `moment_formula` converts the terminal prior integral to normalized Wilson moment, canceling exactly one partition factor and leaving the displayed `Z_{N,p}`. This is where the geometric hypotheses matter: every copied new factor must be interior to its assigned window and `room H.levels h k r` must hold, so `backTo_cells` can factor the conditional back operator over disjoint tile chambers. It is not a generic statement that a kernel preserves products.

`Loft.conducts` composes `gust_choose`, `pushTo_integral`, `Loft.joins`, and `Joint.restored`. Its exact type is

\[
\int (\mathrm{gust}_{k	o i}X(U)).part(s)\,d\mathrm{prior}_i
 = Z_{N,p}\,\mathrm{moment}_{eta_N}(\mathrm{cutoff}(s)),\quad i\le k.
\]

The hypotheses are: selected Wilson history; integrability of terminal birth; an envelope for the old observable; interiority of the new observable at radius `n`; and scale room. These are checked explicitly by the callers `South/Block.underS` and `South/Block.quakes`.

### How `copious` enters the exact root proof

The caller `South/Block.underS` (and parallel `quakes`) sets `V'=Site(side J)`, `B'=Stock.census(V')`, and `s'=Stock.final V'`. It chooses

- `D=U!`, the observed original field;
- `F=Tq=G'`, the new field at comparison scale k;
- terminal copied negative factors `q(i)=-X'.copy_i(U!)`;
- copied incoming factors `q'(i)=Z'.copy_i(Tq)`.

The geometry identities `hz` and `ht` identify these with `stepUp(... initial(-b) ...)` and the precise `copy` maps used by `Basin.copious`. That theorem yields a Served polynomial `Hq` at m whose full mode `s'` coefficient is the pushed/coupled signal. The caller proves `hE`, identifying its input field with the precise `gust` of the `birth`/`couple` construction, and invokes `Loft.conducts` with mode `s'`. Consequently its `he` premise to `South/Block.spiker` is exactly

\[
\int (Hq(U)).part(s')\,d\mathrm{prior}_m
 =Z_{N,p}\,\mathrm{moment}_{eta_N}
   \left(\prod_{i\in V'} T_N.copy_i(\mathrm{backTo}_{k	o N}G'-U! )ight).
\]

This is the manuscript's `M` (the normalized moment of the reflected-copy product), with exact sign, copy orientation/conjugation, and partition normalization. `Stock.final` selects the full census mode; the support exponent/room conditions ensure copy factorization. `spiker` then combines this exact `he` with the Served and Vault certificates to bound `‖M‖·Poly.toll(w,s')` by the finite marked-gas exponential. The root is taken only afterward by `Stock.spacer`; it is not hidden in `conducts`.

The manuscript should therefore replace its outstanding generic planted-moment input with the explicit construction above and cite the composition `Basin.copious → Loft.conducts → South.Block.spiker`. Do not assert the moment identity from the singleton relay: it follows from the full mode `s'` join expansion and same-history adjointness described here.

## Quantitative terminal seed and `cherish` specialization

The `copious` proof obtains its base served object `hR'` by `pollinate`/`pollinate`'s finite birth service on the one selected history, then applies `Loom.cherish` with the response correction. The quantitative map into `cherish` is exact and accounts for every term in `Melts`.

Use the following notation at level k:

- `γ = forcedAllowance_k`, `B_k = budget_k.B`, `R_k = j * siteFactor(B_k)` where `j` is the occupancy bound from `hb : Occupancy (o k) j`;
- `a∈(0,1]` is the mask fraction in `Melts j ... a γ v'`;
- `Ω_k = march (w/a) φ m k`, `τ_k = march w φ m k`.

Basin proves `τ_k=a Ω_k` exactly (its `hs`), with both weights positive. Therefore Loom's old/new weight hypothesis is satisfied with `w_old=τ_k`, `w_new=Ω_k`, and `τ_k≤a Ω_k` at equality. The initial `hR'` is served at weight `Ω_k`; `cherish` returns served data at the target weight `τ_k`.

The response construction (`Bloom.boost`) gives a local correction `ψ'_i` with `ForceFormat`, `ForceCost` bounded at the square-root scale `e=√γ`, and hook equal to its forced profile. `Wicket.cloth` turns its attainment/payment receipt into `Garnish` with the same site weights and `b=v'`: for each mark i it supplies a nonnegative support envelope `g_{i,s}` with `‖ψ'_i(s,U)‖≤g_{i,s}` and

\[
 \sum_s e^{(\alpha_k-1+1)\,\operatorname{coverNumber}(B_k,s)}
           (\tau_k)_i g_{i,s}\le v'.
\]

The support address condition is `ψ'_i(s)≠0 ⇒ o_k(i)∈s`. Thus the `Garnish` exponent is `α_k−1`, and its per-label fee is `v'`. The occupancy input is exactly `M=j`; `Garnish.stock` then gives the anchored `Towed` receipt for all `(i,s)` with sitewise Hit charge `j·siteFactor(B_k)·v'` at exponent `α_k−1`.

Now expand the `Loom.cherish` `closeup` budget. In its variables, the base regular-activity price is `t=γ`, the local forced price is `e=√γ`, the mask is `a`, and garnish fee is `b=v'`. The old flagged price entering the closure is explicitly

\[
 W=t+j\operatorname{siteFactor}(B_k)e+a
   =γ+R_k\sqrt γ+a.
\]

Adding the anchored response fee gives

\[
 W+j\operatorname{siteFactor}(B_k)b
 =γ+R_k\sqrt γ+a+R_k v'=t_{\rm melt}.
\]

This is precisely the `let t` quantity in `Basin.Melts`. Consequently its two hypotheses instantiate `Close.closeup` with `z=3`:

\[
 (2B_k+1)^4\,[W+j\operatorname{siteFactor}(B_k)b]
   =(2B_k+1)^4t_{\rm melt}\le3,
 \qquad e^{W+j\operatorname{siteFactor}(B_k)b}-1
   =e^{t_{\rm melt}}-1\le1.
\]

The support exponent hypothesis `4≤α_k` makes `d=α_k−4≥0`; with `μ=0,z=3`, the closure's incoming exponent is `d+z=α_k−1`, exactly the exponent of the Garnish/closure charge. Its output correction families are the high-mode truncations `octave(H)` and `octave(closure(K,conviction(ψ'),Prod.snd,threshold))`, both with the final anchored budget `C=1` at exponent `d=α_k−4`.

The ordinary-family price starts with the old served budget `S=1`; the mask conversion is `aS=a≤1`. The flagged-family price starts with `e^{t_melt}−1≤1`; mask conversion gives `a(e^{t_melt}−1)≤1`. These are exactly `Close.closeup`'s `hc` and `hc'`, so both output `Towed` certificates have bound `1` (not merely their sum). `Close.branch` supplies the flagged exponential price, `Garnish.stock` supplies the anchor-per-mark Hit bound, and `Close.plank` retains the support-local `Carton` clauses. This proves the manuscript's two separate anchored correction inequalities at exponent `α_k−4` from the actual `Melts` receipt, without an assumed `Served` terminal object.

At the next stage `Basin.copious` propagates this served certificate from k to m with `Accent.voyage` and same-history `Wakes`; its `toasted` receipts supply the independent Vault numbers 2 (ordinary coefficients) and 1 (flagged box coefficients). The full product moment is then the `Joint`/`Loft`/`spiker` composition described above.

## Price seed and explicit finite-gas majorant

### The base served seed and the negative-label price

The served seed `hR'` used by `Basin.copious` is built by `pollinate` from the selected history and terminal birth. `SpringT.pollinate` propagates that terminal `birth` to every level in the same run, with weights `w'_i=march(w)`, and returns `Served` with reserve 1 and the level's `topPitch` support exponent. At `k<N`, `topPitch` equals the current budget support exponent `α_k`; this is the seed to `Loom.cherish`. Its fields come from the selected finite voices and same-history terminal endowment, rather than a fresh history or a postulated service object.

For label cost, `Crisp.bond` is exactly

\[
 \operatorname{bond}_k(-b)=\|\operatorname{alto}_{k,d}\|
   \operatorname{coeffSize}((X.tone_k).index(-b)).
\]

Because `index` is complex linear and `coeffSize` is a norm, the negative sign changes no size. `FReach` contains the actual receipt

\[
 \operatorname{march}(w)_{m,k}\,\operatorname{bond}_k(-b)\le\zeta_k,
\]

as its `pay` field. `Basin.copious` additionally needs the stronger mask-adjusted receipt

\[
 \operatorname{march}(w/a)_{m,k}\,\operatorname{bond}_k(-b)\le\zeta_k.
\]

This is the separate `hZ'` premise of `copious`; it must not be silently inferred from the weaker `FReach.pay`. The selected label is nevertheless the same: `Skein.prevails` chooses `b` before the scale/weight quantifiers and gives `FReach` for every admissible pair `(m,w)`. Invoke its uniform conclusion at both `w` and `w/a`; the second `FReach`'s `pay` clause is precisely `hZ'`, while the first supplies the descent data used for the response. `underS` keeps this as its explicit `Hup` argument.

For the manuscript weight

\[
 w_m=a\,\frac{\zeta_m/2}{\|\operatorname{alto}_{m,d}\|(B/\operatorname{gain}(k,m))},
\]

set `w=w_m` in the root/response construction. The `Skein.prevails` admissibility check is

\[
 w_m\|\operatorname{alto}_{m,d}\|\frac{B}{\operatorname{gain}(k,m)}
 =a\zeta_m/2\le\zeta_m/2.
\]

For the stronger marked-label receipt use (w/a):

\[
 (w_m/a)\|\operatorname{alto}_{m,d}\|\frac{B}{\operatorname{gain}(k,m)}
 =\zeta_m/2.
\]

These are the two corresponding `prevails` price hypotheses. Thus the root's mask factor `a` is exactly where it belongs: regular service uses the smaller weight `w_m`, and the planted negative label is paid at the unmasked weight `w_m/a`. The scale `march` then gives the level-k payments from the uniform descent. In `underS`, the census is `V'=Site(side J)` with the camp marks `f=Mix.camp`; `Edition.Spaced` makes them distinct at level k, so `Occupancy (o k) 1` and `j=1`. At m, the propagated occupancy receipt is the selected history's `h.back m`; the `m*siteFactor` term in melting is therefore `1*siteFactor(B_k)`, while later voyage uses that separate m-level occupancy/Drake receipt.

The reference-coordinate bound used for the coefficient budget is also explicit. In `reference-difference.tex`, the selected dual chain satisfies

\[
 r_k+\mu(Z_k.x)\le4(1+c_k)q,
 \qquad Z_k.x=x_X-I_kv.
\]

Hence

\[
 \|x_X-I_kv\|_{\rm coeff}\le r_k+\|Z_k.x\|_{\rm coeff}
 \le4(1+c_k)q\le B.
\]

This is the terminal coefficient budget required by the planted response; it uses the full terminal signed-difference estimate, not merely the endpoint quota μ(I_kv)≤2E.

### Ordinary and flagged gluing costs, written as a polymer estimate

Specialize `Loom.cherish`/`Close.closeup` with old seed weight \(\Omega_k=\operatorname{march}(w_m/a)_{m,k}\), new weight \(\tau_k=\operatorname{march}(w_m)_{m,k}\), and `a` the mask. The exact identity `τ=aΩ` gives the reweighting hypothesis with equality. The old `Served` seed has reserve 1 at exponent `α_k`. Pruning it to the target weights gives an ordinary-family `Hit` charge (S\) with (aS\le1). Thus the *ordinary* corrections, summed over their support addresses and with the exponential cover weight, cost at most 1 at the final exponent.

For flagged corrections let (B_k) be the geometric budget (not coefficient budget), (R_k=\operatorname{siteFactor}(B_k)), and occupancy (j=1). `Garnish.stock` turns each support-attached response (\psi'_{i,s}) into an address (i,s) with nonnegative price

\[
 f_{i,s}=\tau_i g_{i,s},\quad g_{i,s}\ge\sup_U|\psi'_{i,s}(U)|,
 \quad \sum_s f_{i,s}e^{\alpha_k\operatorname{cov}_{B_k}(s)}\le v'.
\]

The support condition (\psi'_{i,s}\ne0\Rightarrow o_i\in s) anchors every letter at its own census mark. For every lattice site x, the rooted-tree construction `Ac.root_hit`/`Garnish.stock` bounds the sum of these letter weights over all addresses whose support contains x by

\[
 \mathrm{Hit}_{\alpha_k-1}(x)\le jR_kv'=R_kv'.
\]

The factor (R_k) is the explicit `siteFactor` from the occupancy/rooted-Hit estimate (`exp(1) [2(16B_k+9)]^4`), which pays for all connected support shapes around a site. It is not the raw number of response components at x; there can be many support addresses, and their exponential price sum is what is controlled.

The already-served flagged background has its own anchored charge. In `Loom.cherish`, the three contributions to it are:

1. activity/bar term at price (t=\gamma=\operatorname{forcedAllowance}_k);
2. forced component, from `Bloom.bornK` and `ForceCost`, at price (e=\sqrt\gamma), giving (jR_ke=R_k\sqrt\gamma);
3. mask/reweighting seam at price (a).

Therefore the old flagged family entering `Close.branch` has (P=W=\gamma+R_k\sqrt\gamma+a), with the incoming support exponent (d+3=\alpha_k-1), where (d=\alpha_k-4\). Adding the marked-response letters gives total local polymer activity

\[
 \eta=P+v=\gamma+R_k\sqrt\gamma+a+R_kv'=t_{\rm melt}.
\]

Here is the finite gas calculation in source terms. `closure` is `tally (forst X) (crow K u X threshold)`: `crow` is zero unless the old box flags match the prescribed admissible box; when they match, it is the finite product of old box factors and marked singleton response letters. `allclosed` sums these finite compatible gas terms and gives the exact identity

\[
 \operatorname{field}(\operatorname{closure}K\,u\,X,flags)
 =\operatorname{field}(K,flags)\prod_i(1+u_i).
\]

Each old-box component and response letter has a fixed support. `Towed` gives separate sitewise `Hit` budgets, so their union has total activity (\eta=P+v) at exponent (d+3). `Ac.forest_price` is the explicit polymer/cluster estimate: under

\[
 (2B_k+1)^4\eta\le3,
\]

the sum of all nonempty connected clusters rooted at any fixed site x, with each polymer weighted by its activity times (e^{d\operatorname{cov}_{B_k}(support)}), is `SumBudget`-bounded by (e^\eta-1). The proof is a finite forest recursion: `stepP` bounds adding a polymer to a proper subforest using `Real.add_one_le_exp`; `all_price` inducts on the forest, and the geometry inequality
\(\operatorname{card}(Y)\le\operatorname{coverNumber}(B_k,Y)(2B_k+1)^4\)
converts the sitewise Hit budget to the rooted exponential majorant. Subtracting the empty cluster leaves (e^\eta-1). This is the exact reason for the support loss three: the incoming tree charge has exponent (d+3), the geometry toll uses all three units, and the output `Towed` cluster family retains exponent (d=\alpha_k-4\).

In the `Melts` receipt,

\[
 (2B_k+1)^4\eta\le3,\qquad e^\eta-1\le1.
\]

The ordinary charge (S\) and flagged gas charge (e^\eta-1) are separately pushed through the mask. Since `a≤1`,

\[
 aS\le1,\qquad a(e^\eta-1)\le1.
\]

`Close.closeup`'s `hc` and `hc'` are exactly these two inequalities. `Close.plank` converts the resulting ordinary and flagged cluster families to `octave(H)` and `octave(closure K u X)`, with each separately `Towed` at exponent (d=\alpha_k-4) and price 1. The singleton terms are not charged again: `Close.posts` identifies their response hooks exactly, `Close.reversal` moves them between pass and box factors, and `plank` reconstructs the full `restore` identity. This supplies the mathematical gluing argument required for the manuscript.
