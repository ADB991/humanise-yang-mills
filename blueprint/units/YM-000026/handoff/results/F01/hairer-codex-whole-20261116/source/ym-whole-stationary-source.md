# Stationary-source proof map for W, S, T

Inspected isolated checkout `/tmp/ym-whole-stationary-source`, detached at monograph base `a62f08fbcccdc92797ab910ace65f3e02ee79a06`. Root README identifies the preserved Lean upstream revision as `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. I read `AGENTS.md`, `CONTRIBUTING.md`, `docs/coordination.md`, and `docs/proof-standard.md`; no source or manuscript edits were made. This is source inspection, not a Lean build.

## Source route: exact coefficient pictures to fee-bounded tickets

The central bridge is the `wedlock` / `epic` / `jig` chain, not merely the response-array theorem.

- `YM.Stationary.Recorded` (`Lean/YM/Next/STATIONARY/Lift/Pathways.lean:491`) compares the normalized Taylor coefficient `noteAt f (t+1)`, where `noteAt = (t+1)!^{-1} beat f 0 (t+1)` (`Infrastructure/Jets.lean:340-341`), with the picture multiplied by the torus site count at conserving momentum. Thus a picture `P_j` corresponds to (D^{j+1}U(0)/(j+1)!), with the source's exact volume convention.
- `YM.Stationary.Drinkable` (`Shape/Vertex.lean:343`) asks for one such exact record for each side, a common strip fee `Firm σ C`, and the stated ray order. `DrinkIt` is the raw mixed derivative of `U ∘ dough`, where `dough(x_+,x_-)=log(exp(x_+)exp(x_-))`; `liquid` is the multilinear derivative, and `malt_bill_pick` is the chain-rule identity (`Vertex.lean:172,288-290`).
- `wedlock` (`Shape/Vertex.lean:369ff`) converts the exact normalized coefficient pictures to a `DrinkIt` picture. For each ordered partition (b) of the `t+1` inputs and each basis assignment (w), `cuddles` forms the Fourier component `sip` with the explicit factor ((n+1)!) (`Vertex.lean:290-296`); this cancels the coefficient normalization in `Recorded` and gives the *raw* mixed derivative. The remaining finitely many color, phase, and ordered-partition terms are summed. The exact cost is
  \[
  \operatorname{pintCost}(v,G)=\sum_{a\in\mathrm{Ink}(G,t+1)}\sum_{b\in\mathrm{Run}(t+1)}\sum_c |\operatorname{drinkCost}(v,b,c)|,
  \]
  with `drinkCost` the absolute sum of the products of the block-mode coefficients of `dough` (`Vertex.lean:314,365-369`). Consequently a common input picture price (C) yields fee (C\operatorname{pintCost}(v,G)), not a dimension-free (C). `Rays` are inherited under these finite sums. Its exact finite-volume identity is the Fourier recording equation `drink`/`cuddles`: zero unless total momentum is zero, otherwise the site count times the stitched coefficient.
- `epic` (`OneLoop/Lattice.lean:150-169`) takes the three `DrinkIt` identities and three priced `Firm` pictures and returns `Ticket (vintage F H T) (fineFlare p R)`. It uses the finite-mesh wave identity `vintage_sips` (`OneLoop/Lattice.lean:120ff`) to turn the response identities into the tab, one-mark, and two-mark Jaunt equalities. This is the source bridge from fees to all finite tickets.
- `jig` (`OneLoop/Lattice.lean:497-509`) runs `wedlock` at orders 1, 2, 3, then packages the three pictures into a `Jar`. It chooses (u(k)=\operatorname{calls}(k+1,\sigma)), where `calls(x,σ)=σ/(x+1)^2` (`Shape/Vertex.lean:221`), and
  \[
  \eta=\min(u(1),u(2),u(3))=\sigma/25,\qquad
  a_i=A\operatorname{pintCost}(\mathrm{creme}(i),G),\quad
  M=\max(0,a_0,a_1,a_2).
  \]
  The finer layer fees are respectively (a_0,a_1,a_2); `fees` weakens each to ((\eta,M)). Its `soft n` outputs ray orders (n,n-1,n-2) (where present). For input order (i), the `Drinkable` ray requirement is `n-(i-1)` and the `wedlock` picture at that marked level inherits that ray order. All constants are independent of the torus side; they depend on the scalar input width/price and the finite gauge-coordinate sets.

The manuscript's explicit complex chain rule explains the same normalization and ray arithmetic. For total mixed order (r=n+2\le4), write (D(x_+,x_-)=\log(e^{x_+}e^{x_-})). Its BCH terms through degree four are
\[
D=X+Y+\tfrac12[X,Y]+\tfrac1{12}[X,[X,Y]]+\tfrac1{12}[Y,[Y,X]]-\tfrac1{24}[Y,[X,[X,Y]]]+O(5).
\]
For a set partition \(\pi\) of the (r) labeled slots into (b\) nonempty blocks, ordered by least slot, the mixed derivative is
\[
D^r(U\circ D)(0)[v_1,\dots,v_r]
=\sum_{\pi\in\Pi_r}D^bU(0)\big[D^{|B_1|}D(0)[v_{B_1}],\dots,D^{|B_b|}D(0)[v_{B_b}]\big].
\]
The one-block term vanishes when (DU(0)=0). For (b=2,3,4), the coefficient-picture input is (P_{b-1}=D^bU(0)/b!), so every term has the factor (b!P_{b-1}), multiplied by the finitely many coordinate coefficients of the BCH block derivatives. This (b!\) is exactly the source `sip` factor; it does not count block permutations. At level (n), (P_{b-1}) has ray order (3-(b-1)=4-b\ge2-n), because (b\le n+2). Therefore the mixed response picture has ray order (2-n). The strip can be narrowed to (s_n=s/(n+3)^2), since each block sum of external momenta stays in the original strip there. Price grows by a fixed finite multiplier: sum over the set partitions, BCH coordinate labels, and input color labels of (b!\prod_j|c_{\pi,j}|\); boundedness of the finite-dimensional analytic product-log map through order four makes it uniform in mesh size.

This is the exact algebra in the proof of `prop:ex-three-level-conversion` and its paragraphs in `manuscript/existence/soft-curvature-receipts.tex` (around lines 731-1000). That section already proves the coefficient-picture ray/price input and the finite-period response identity, but its stated theorem returns spatial response arrays. For W/S, retain its intermediate mixed pictures and apply `wedlock` then `epic`; the source does exactly this. The arrays themselves need not be mistaken for the normalized pure-action pictures used as `Drinkable` inputs.

## W: Wilson response

Source theorem `YM.Stationary.vintageWilson` (`OneLoop/Lattice.lean:510-525`) has conclusion: there exist σ>0, M≥0 and a `Jar U` with `U.fees σ M` and `U.grey`; grey means `bindV U (WilsonQ G i)` for every side `i`, not just a diverging subsequence (`Lattice.lean:509-510`).

Proof mechanism:

1. For orders (t=1,2,3), `Wilson_stream G t` gives one finite-strip bounded coefficient picture for every side, recording the normalized derivatives of `WilsonQ` (`Shape/ClassicalMatch.lean:312ff`; its local plaquette bound is `price_vault`). Let the three input prices be (A_1,A_2,A_3), and use (A=A_1+A_2+A_3\ge0).
2. `outright G m` supplies (WilsonQ(G,m)(0)=0), (DW_{m}(0)=0), and the exact order-one coefficient picture (`Loops/Fourier.lean:387ff`). Analyticity is the first conjunct of `Wilson_stream`. Bounded analytic pictures have ray order 0, so the input meets `jig` with n=0.
3. `jig` gives σ=1/25 and (M=\max_i A\operatorname{pintCost}(\mathrm{creme}(i),G)) (also max with zero), with `fees` and all-side `bindV` tickets. This is the grey response W.

The matching manuscript input is `prop:ex-wilson-stream` in `manuscript/existence/wilson-vacuum-price.tex` (uniform plaquette coefficient pictures, exact site-count Fourier recording, bounds independent of side) together with the Wilson zero/Hessian calculation in `lem:ex-soft-quadratic-hessian` and the ordinary coefficient-to-response chain rule in `soft-curvature-receipts.tex`. The Wilson-stream existence and its finite-volume coefficients are already proved; what is not spelled out as a prose theorem is the priced `Jar` packaging using `pintCost` and tickets.

## S: Wilson-subtracted correction service

Source theorem `YM.Stationary.saunter` (`OneLoop/Lattice.lean:528-537`) outputs (w>0,K\ge0) such that for every divergent side sequence `m`, every bed/clip/path and Λ with `R.Bounds p τ A Λ`, `Attached B R`, `B.metric.strip σ C`, `p.direct≤Z`, all-side floors, and swornness at every selected side, there is one `Jar U` with `fees w K`, `soft 3`, and `bindV U (intended p R - WilsonQ)` at every selected side. This is precisely soft orders 3,2,1 and tickets of action-minus-Wilson.

Proof mechanism and actual costs:

1. `greyson G σ ε C Z τ A` (`Shape/Scaled.lean:363ff`) supplies width (k>0), coefficient price (M_g\ge0), and exactly recorded pictures of (I_m-W_m) at orders 1,2,3 with ray orders (3,2,1), uniformly for the full hypotheses above. Its displayed price in `prop:ex-greyson` is
   \[
   M_g=\operatorname{bedCharge}(\sigma,C)+\operatorname{bedCharge}(\sigma,1)+P_2+P_3+X_2+X_3+A K_c,
   \]
   where (P_2,P_3\) are row-action prices, (X_2,X_3) Wilson prices and (K_c) the curvature-veneer price. Width is (k=\min(\sigma,1,\eta_2,\eta_3,\eta_c)) in the manuscript. The proof is the exact Hessian subtraction — metric-slot picture minus Wilson leader has ray order 3 from \hat H(0)=I — followed by the Ward-partition and Ward-ray improvements for orders 2 and 3, then addition of cubic/quartic curvature pictures. This is detailed in `prop:ex-greyson` (`soft-curvature-receipts.tex`, around lines 666-730), using `lem:ex-soft-quadratic-hessian`, `prop:ex-row-controlled-action`, `lem:ex-ward-partition`, `lem:ex-ward-rays`, and `prop:ex-veneer`.
2. `pact` proves (D\operatorname{intended}(p,R;m)(0)=0) from the path bound, attachment, floor and sworn hypotheses (`Shape/Scaled.lean`, immediately preceding `greyson`). `outright` proves the Wilson derivative is zero. The derivative of their difference is zero, exactly the hypothesis needed by `jig`.
3. Set (U_i=\operatorname{intended}(p,R;m_i)-WilsonQ(G,m_i)), use `jig` with n=3, width input (k), price input (M_g). Then (w=\min(k,\operatorname{calls}(2,k),\operatorname{calls}(3,k),\operatorname{calls}(4,k))=k/25); the output ticket fee can be (K=\max(0,M_g\operatorname{pintCost}(\mathrm{creme}(i),G):i=0,1,2)). `saunter` obtains the correct `Drinkable` layer order from `greyson`, and uses `epic` via `jig` to produce the finite tickets.

The exact assumptions of the manuscript's `prop:ex-greyson` match S: every-side floors, selected-side swornness, path bounds, attachment, strip metric, direct cost. `thm:ex-soft-response-mockups` already proves a sequence-uniform priced local-array response under those assumptions, but the clean coefficient-picture-to-`Jar` route is the chain rule plus `jig`, not an assertion that arrays automatically are tickets.

## T: fixed-film tickets

`annulus-same-data-binding.tex` defines T only informally at lines 153-162. It needs two finite-dimensional calculations, both standard but currently not written out there:

1. **Gauge-fixing film slots.** Source `YM.Stationary.matinBeige` (`Lean/YM/Next/STATIONARY/OneLoop/Leading.lean:47-50`) gives `matina.tab = -pageD G 0`; `pageD G 0` has zero-form symbol `mode(k,step a)-1` (`Spectral/RealGap.lean:177`, `Spectral/Slabs.lean:204`), so this is \(1-e^{ik_a}\), the tab of \(D_1\). The exact first marked slot is `fireball` (`Leading.lean:52ff`):
   \
   \\[ (\operatorname{matina})_{(a,c);(i,x),(0,y)}(p,k)=-\operatorname{mode}(k,\operatorname{step}i)\,\delta_{ia}\,\operatorname{tintX}(c,x,y). \
   \\]
   Here `mode(k,step a)=e^{ik_a}`; `tintX(c,x,y)=cosetR(c,x,y)=(G.ad (pearl c) (pearl y)) x`, the coordinate \( (\operatorname{ad}_c)_{xy}\). In film convention the first mark momentum is (p), incoming ghost-wave momentum (k), and output is (p+k); the phase is (e^{ik_a}), exactly because the ghost input is evaluated at (x+e_a). Thus the source is orientation/sign matched to the manuscript’s B1 when its (p) denotes the input-wave momentum.

   There is no named standalone `matina.arch` formula in `OneLoop/Leading.lean`, but its definition is direct: `firstB=recitalX patina`, `patina` stores raw `beat (pummel i j)`, and `pummel=I-Ad_{exp(delocalF x)}` (`Lattice.lean:244ff`). `deflect` (`Leading.lean:17-21`) maps a basis field to the pearl color vector. Since \(Ad_{exp z}=e^{ad_z}\), the two background derivatives at directions (c,f) equal \(\tfrac12(ad_cad_f+ad_fad_c)\), with a minus sign from \(I-Ad\). Both marks and the shifted input give phase \(e^{i(p+q)x}e^{ik_a}\); the nonzero condition requires both marked directions and the incoming link direction equal, giving \(\delta_{ia}\delta_{ja}\). This is the stated B2 with the source’s ordered film marks (p,q) and incoming (k). `beat` is the raw iterated derivative; the factor (1/2) is the mixed derivative of the exponential, not an external Taylor normalization. `matina` inherits these slots from `firstB.pay boardF` because `boardF` is constant. `recordingA` (`Leading.lean:95ff`) explicitly computes the marked slot of `(matina G).pay (matina G).rear`; `boardJump`, `pelt_at`, and `pelt_ticket` (`Lattice.lean:284-308`) provide the mesh ticket. The B2 identification is therefore a short derivative calculation from the source definition, rather than an already named lemma.

2. **Products, rears, inverses.** A ticket records tab, one-mark slot, and two-mark ordered slot. `Ticket.plus`, `.pay`, `.rear` and `.back` are proved in `Lean/YM/Next/STATIONARY/Loops/Syntax.lean:222-272`. For matrix films (F=(A,B_i,C_{ij})), (G=(E,H_i,J_{ij})), the product `F.pay G` has
   \[
   (FG)_0=AE,\quad (FG)_i=B_iE+AH_i,
   \]
   \[
   (FG)_{ij}=C_{ij}E+B_i(p,q+r)H_j(q,r)+B_j(q,r+p)H_i(p,r)+AJ_{ij},
   \]
   with the source's momenta as shown in the film definition. Rear is transpose plus reversed momenta. If (A(0)) is invertible, differentiating (A^{-1}A=I) gives
   \[
   (A^{-1})_0=A_0^{-1},\quad (A^{-1})_i=-A(q+p)^{-1}B_i(p,q)A(q)^{-1},
   \]
   and for two ordered marks
   \[
   (A^{-1})_{ij}=A^{-1}_{r+p+q}B_j(q,r+p)A^{-1}_{r+p}B_i(p,r)A^{-1}_r
   +A^{-1}_{r+p+q}B_i(p,r+q)A^{-1}_{r+q}B_j(q,r)A^{-1}_r
   -A^{-1}_{r+p+q}C_{ij}(p,q,r)A^{-1}_r.
   \]
   This is exactly `Film.back` in `Loops/Syntax.lean` and the ticket proof `.back`, which explicitly requires `IsUnit (W 0).det`. In the annulus application the positive regulated floors supply these inverses, as recorded in the manuscript immediately before T (the mass bound is ω+s_μ≥2^{-10}μ^2>0). Constant direction selectors \mathsf D_a have trivial zero slots and zero marked slots; their tickets are `Ticket.current` plus the constant-symbol Jaunt.

The source’s `Ticket.pay` proof shows the finite-volume Leibniz rule: zero slot is product; one slot is the two ordered insertions; two-mark slot has the four displayed terms, including both cross terms in both orders. `Ticket.back` proves the derivative-of-inverse identity using `seat_flip`, `cart_flip`, and finite-dimensional matrix inverse rules. These identities, together with actual wave-symbol equalities for (D_U), prove T without an analytic estimate. The manuscript's `prop:ex-soft-quadratic-hessian` already proves the path/Wilson Hessian and identifies the metric symbol, and the common-strip proof already proves the regulator positive floor; these supply parts but do not prove T's covariant-difference symbol tickets.

## Remaining audit points

- Use the exact source `Film` routing/momentum conventions for the two-mark formulas; `Film.back` uses reversed momenta and the spot labels in `vSpot`, so the prose formula above must be transcribed with those conventions, not treated as an unshifted product rule.
- `Ticket` is a three-layer germ record (`Memo`, tab, spot, arch), not just equality of Taylor polynomials. The `epic` proof establishes all three at every momentum-conserving mesh input.
- The report has not checked the precise identification between annulus notation \mathsf B and the `matina` / `firstB` names or compiled any Lean declaration. T's finite derivative algebra is clear; that identification remains the required source-correspondence check.
