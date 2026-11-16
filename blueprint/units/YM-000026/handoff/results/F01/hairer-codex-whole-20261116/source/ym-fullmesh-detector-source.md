# Full-mesh detector and rank estimate: source map

Source checkout: `/tmp/ym-whole-stationary-source`, Lean revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. This is a source-only report.

## The full-mesh quantifier

`Lean/YM/FullVolume/Sluggish.lean:13-19` defines `mesh = comap Prod.fst atTop` on cutoffs (i=(N,p)). Lemma `late` identifies
[
 orall^mathrm{eventually}_{iin mesh} P(i)
 quadLongleftrightarrowquad
 orall^mathrm{eventually}_{N	oinfty} orall p:mathbb N, P(N,p).
]
Thus an eventual mesh assertion has one cutoff (N_0), valid for every admitted period (p), including (p=0). There is no late-period restriction. `FullVolume.cap` and `trained` use this filter; they do not prove a separate estimate for each p with p-dependent thresholds.

## Precisely what trained proves

`Lean/YM/FullVolume/Lit.lean:48-105`, theorem `trained`, for each fixed grade (d), trial family (T), field presentation (a), and any finite axis word (l), proves
[
 exists k_0 orall kge k_0 exists b_0(k)>0 orall 0<b<b_0(k) exists Z(k,b)ge0 exists N_0(k,b) orall Nge N_0 orall p orall xin C.label(d):
 quad |a.step_d(N,p)x|
 le Z(k,b),|probe(T,k,(N,p),b,l)(a.step_d(N,p)x)|.
]
Here (b) is taken in the right-neighborhood filter at zero, and the precise formal nesting is “eventually (k), eventually (bdownarrow0), then (Z) and eventually (iin mesh).” In particular k is fixed before b, and Z is chosen after k,b; Z and the N-threshold are uniform in p and x. The theorem's (k) does not depend on N,p. `trained` itself does not select a single b valid for all k; it supplies b after selecting a fixed sufficiently large k.

The proof is not an abstract compactness assertion about arbitrary projections. It uses (a) a uniformly bounded calibration `hf.uniform d`; (b) a rank bound on the same varying maps `a.step d i`; (c) the common finite family of purchased lifts; (d) their probe approximations at exactly those physical locations.

## Finite-dimensional mechanism and exact bound

Let (n=Y.dim+1), and let (f_j(i)=T.lift(k,N,p,j)), (j=0,ldots,n-1). The purchase `Booths.bounded k` (`Pavilion.lean:19-25`) gives one (vge0) with (|f_j(i)|le v) for all (N,p,j). The row-rank lemma `weighed` (`Lit.lean:58-85`) proves
[
 operatorname{rank}(a.step_d(i))le n
]
for every i, using (ker(a.step_d(i))=U), the exact Maxwell projection sequence and quotient/basis dimension. Importantly this is rank of each actual map, not an assumed rank of a limiting operator.

For the fixed k, the purchased detector rows converge to the desired finite matrix: `VitalRank.performance` / `gaugesFull` (`Maintain.lean:24-56`) gives, eventually in k and then uniformly in i∈mesh, each monitor entry within (epsilon) of its target. Given that k, `probesUp` (`Maintain.lean:57-82`) chooses all sufficiently small positive b, then a single full-mesh threshold, so the blurred probe of each lift differs from its monitor by at most (epsilon). Intersecting these two errors for each row/column yields entrywise error (<2epsilon); `trained` takes (epsilon=delta/4), and its displayed estimates budget up to four (epsilon)'s, hence strictly (<delta).

Here (delta,L>0) are obtained by `firm (true_lower Y)` (`Stand.lean:19-41`, `true_lower` at 73ff): the target matrix (g_{ji}=focus(i,j)) is injective because the finite manuscript testing rows jointly separate the chosen basis. `firm` gives the stable lower bound: if each column of a linear map (Q:mathbb C^n	omathbb C^m) is within (delta) of the corresponding target column, then
[
 |c|_{ell^infty}le L|Qc|_{ell^infty}.
]
In the Lean convention (L=2K) for an antilipschitz constant (K) of the target map; its chosen (delta=(2K(n+1))^{-1}) absorbs the operator perturbation.

Apply this to (Q=F_icirc a.step(i)circ arrange(f(i))), with (F_i=probe(T,k,i,b,l)). Then the `rank_upper` lemma (`Stand.lean:43-67`) extends the lower bound from the purchased n-dimensional span to all x, using only rank≤n and (|f_j|le v). For any calibration bound (Age|a.step(i)|), it gives exactly
[
 |a.step(i)x|
 le A, n, v, L,|F_i(a.step(i)x)|.
]
Hence the detector constant in `trained` is (Z=A(Y.dim+1)vL). It is independent of N,p,x. The threshold is also full-mesh: every eventual used in the proof is either from `VitalRank.performance`, `probesUp`, or `invites`, all on the filter `mesh`.

## Geometry: the probes fit every period

`Pavilion.lean:19-44` records `Booths.fit`: a positive margin (eta) keeps every real detector position inside (C.S.a(T.width,k)(1/2-eta)), and `axis` says the center is generic. `arena` then chooses (t,r>0) so the closed (t)-ball around that center is generic and every period's `Gaps.allFine` holds on the (4r) neighborhood. It first establishes the gap property at period 0, then uses schedule periodicity/separation (`pod`) to carry the same (r) to every p. These t,r depend on k,row, not p,N.

The local approximation `lobby` (`Pavilion.lean:185-214`) uses uniform detector-token price `provisions`, chooses a small grid radius after the local price, and takes both thresholds `deepen≥l` and `deepen≥T.depth k`. The latter makes `loc` the true scaled covering-lattice location. Exact identities `loc_wrap` and `loc_tag` show its wrapped coordinate is the intended physical detector and its tag is (T.realPlace). The threshold is again on full mesh, all p. The continuity estimate applies to every bounded tuple of labels and every point in the same physical neighborhood. This is the no-aliasing/support-fit argument; it is not inferred from convergence alone.

## How cap uses detector for arbitrary rows

`Moneys.lean:20-68`, theorem `cap`, assumes a funded primary (F), a Coin field x and a vanishing Owed remainder for (Bid.upper(x)-hops(F,l)). It first uses `trained` to get k,b,Z, then `invites` at the same k,l,b. The latter says (i) every funded continuous primary has eventually bounded probe, and (ii) every Owed vanishing remainder has probe tending to zero.

Writing (X_i=a.step(i)x_i), (f_i=(1+|X_i|)^{-1}), and (z_i=f_i(x_i-X_i)), the proof makes z Coin (using (0<f_ile1)) and projected-kernel zero; `sweep` makes z Owed with flight (-1/32), which tends to zero on mesh. Thus (Z|probe_i(z_i)|	o0). Meanwhile `probe_sub`, continuity of (F), and the funded bound give a constant (cge0) with (|probe_i(x_i)|le c) eventually. The detector applied to (X_i) and the identity (x_i-X_i) yields
[
 |X_i|le Z|probe_i(X_i)|
 le Zc + Z|probe_i(x_i-X_i)|,
]
and the final normalized estimate bounds the second term by ((1+|X_i|)/2). Rearrangement gives the theorem's uniform bound (2Zc+1). No compactness in p is used.

## Relation to manuscript actual-rank-purchases

The manuscript section `manuscript/existence/actual-rank-purchases.tex` is a separate, more construction-specific rank/readout argument. It purchases one (T_{k,N,p}) shared by the finite testing rows, with (|A v-Tv|lerac12|Av|), and obtains (|v|_1le D_k|A v|_1) for (D_k) independent of N,p. It then solves (S_t T u_i=W_{ho_k}v_i) exactly; the inverse bound gives a lift bound (B_k) independent of N,p at each fixed k. The Lean detector proof does not establish these exact normalizations, reality/unit constraints, manuscript readout covariance, or common auxiliary-history identity. Conversely, manuscript actual-rank-purchases relies on its stated local compiler/readout/cumulant estimates and doesn't by itself supply the Lean `rank_upper` stability argument for an arbitrary projected field.

There is a useful correspondence: the manuscript's one map for all rows and N,p-independent (D_k) are the construction-side counterpart to `trained`'s common finite detector matrix, `Booths.bounded k`, and all-p full-mesh bound. But they are not literally the same theorem. In particular do not cite the manuscript's (epsilon_k) root estimate or normalization equations as the proof of `trained`; nor cite `trained` as proving exact manuscript lifts. The precise finite rank argument needed for the manuscript is its purchased common readout plus inverse (D_k), with all finitely many rows intersected before thresholds as the manuscript says.

## Source-supported headline

The exact source result is a **fixed-grade, fixed sufficiently deep detector**: first choose k from an atTop tail; then choose positive blur b sufficiently close to zero; then obtain a single (N_0) such that the estimate holds for every cutoff N≥N0, every period p and every label x. The detector factor is (Z=A(Y.dim+1)vL). Its proof depends essentially on same-row rank≤Y.dim+1, a true_lower separating finite matrix, globally bounded purchased lifts, and support/gap locality uniform across all p.

