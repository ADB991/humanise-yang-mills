# G3 and terminal marked-price source review

Repository revision: `67c0560e5905fb7ca221378392505046444e9cc8` (working tree also contains manuscript edits). SHA-256 of the inspected `manuscript/existence/trace-rounded-receipt.tex`: `134dfed97e600141b51913a3b30f2e8f7a556e665a7928b1f25f31e119121bdc`.

Read-only inspection; no Lean build or edits. The selected-family manuscript route below is a reorganized mathematical proof checked independently through its named inputs, not a proof elaborated as one Lean theorem.

## G3 invoice and root depth

The dynamic source chain is:

- `YM.MergeProof.East.SeqPair` and `YM.MergeProof.East.boatsSky` in `Lean/YM/TraceExtension/Prom/Zoom/Boats.lean`;
- `YM.MergeProof.East.lava_vSky` in `Lean/YM/TraceExtension/Prom/Orion/Reach.lean`;
- `YM.MergeProof.earningsSky` in `Lean/YM/TraceExtension/Prom/Front/West/Tael.lean`;
- `YM.PhysicalNext.InteractingRank.Soft.y_readySky` in `Lean/YM/TraceExtension/Prom/Front/West/Lys.lean`;
- `YM.Next.Rank.Tapes.West.tenderlySky` in `Lean/YM/TraceExtension/Prom/Front/West/Equity.lean`;
- `YM.PhysicalNext.InteractingRank.Soft.couponSky` in `Lean/YM/TraceExtension/Prom/Port/Soft/Denarii.lean`.

In `SeqPair.boot`, `w : Fin (d+1)` is a grade index. It is not the root depth. The root test is on `Ship.yardSky`; the definition of `YM.Next.Rank.Ship.yardSky` centers the tiling at `widthSky A b k`, defined in `Lean/YM/TraceExtension/Prom/Hill/Station.lean`. Thus the manuscript's chart root depth (w) must be identified with `widthSky A b k`. `SeqPair.boot`, `TimberSky.rate`, and `earningsSky` quantify over finite-volume cutoffs (N>k) and periods. The downstream coupon theorem permits (k≤N), so it covers that strict case.

The invoice identification is exact at the square-free insertion level. `YM.Next.Rank.Ship.invoiceSky` is the `Read.cylinder` of the cumulant targets and actual clients/probes. In `Lean/YM/Next/RANK/Finite.lean`, `Read.cylinder D a x` is `Poly.pass (-D) * bareP a x`; `bareP` is the square-free product. `Read.cumulants` is the connected cumulant of `Read.maxProfile`, and `Read.cumulative` states its expansion to that profile. `jointX` and `q_asked` in `Lean/YM/MergeProof/West/Mooncake.lean` turn each corrected grade label into its standard tag and token. This matches the manuscript's cumulant correction times the two actual insertion factors, provided its (D_R) and (f_c^{N,p}) are these same finite-volume cumulants and probes. The Lean path gives a direct root-test bound conditional on its allocated ticket and value-local estimate; it does not itself prove the manuscript's full pushed replica-density price theorem.

`YM.MergeProof.East.trays` in `Lean/YM/MergeProof/East/Gran.lean` is exactly `d+2`. It is the `PoisedSky` query arity, not the number of inserted sites or marker variables. The inserted comparison has two sites (`Fin 2`, equivalently (m+1=2)); `earningsSky` requires (m+1≤n≤u), and the route sets (n=mathrm{trays}(d)=d+2). So (2≤mathrm{trays}(d)) is explicit and there is no hidden arity obstruction. In the manuscript allarity calculation, (n=2) counts marker variables per replica cell and (u=M=d+2) is the marker allowance. Hence (n≤M) and (M≥2).

The new `prop:trace-selected-rounded-receipt` states a selected-chart-family supplier using the five common-history inputs and identifies the root depth. Its uniformity in the finite chart offsets and the tails for (N,p,x) comes from its common-history argument and the separately cited allarity/lawful-representation suppliers; it is stronger than `boatsSky` alone. The manuscript route was checked as a mathematical reorganization of those suppliers, not directly Lean-elaborated.

## Terminal marked forced-price reserve

In the manuscript, `trace-firesky-gallery.tex` labels (m_s) as lost old-support price, (t_s) as enlarged rooted price, and (b_s) as new flag-site price. In particular
\[
 b_s=(8B+1)^4 e^{-a_{\rm coast}\,\mathrm{hot}(s)^2}e^{(e+1)9^4}
\]
retains an explicit exponential flag-site factor, multiplied by the support-count/cover cost. The combined estimate (2H^{-3}+t_s+m_s+b_s≤H^{-1}) is only a total-error bound; that inequality alone does not retain a separately usable forced allowance (G(s)=e^{-a_{\rm coast}\,\mathrm{hot}(s)^2}).

The manuscript's `prop:restart-endpoint` in `restarted-rank-history.tex` does preserve the reserve before grouping: it constructs each flagged (X_z) with |(X_z)|≤(e^{-2u}), proves the exact endpoint factorization and gas bijection, reserves (e^{-u}) per selected flag factor, and only then applies the connected rooted estimate. It concludes with the separate forced bound (e^{-u}(e^{\rho_s}-1)≤e^{-u}). This is the mathematical argument that supports a forced input at (G(s)), with the other (m_s,t_s) terms paid as residual prices. The proof should cite this separate factorization/reserve, not infer (G(s)) from the combined (H^{-1}) inequality.

I did not find a Lean theorem for this exact `restart-endpoint` factorization or an (e^{-u})-per-flag-factor estimate. Closest source results are related but quantitatively different:

- `YM.PhysicalNext.Repeat.Quince.gasT` (`Lean/YM/TraceExtension/Quince/Gas.lean`) retains the actual forced profile via `Blush.rose` and pays a forced `PaidAtom` using the fine normalization √(forcedAllowance). It does not assert the restart endpoint's separate (e^{-u}) reserve.
- `YM.MergeProof.Geyser.sylvan` (`Lean/YM/MergeProof/West/Sylva.lean`) transports the original marked expansion to `Served` with its advertised aggregate allowance. The chart specialization `YM.Next.Rank.Edition.caughtXSky` in `Lean/YM/TraceExtension/Prom/Front/West/Lais.lean` yields `StakeXSky`; `YM.Next.Rank.Edition.StakeXSky` (`.../Dart.lean`) records `Unpacks`/`Unfold` bounds of 1, source cardinalities, and exact whole-polynomial equality. These preserve the forced component/profile and marked expansion, but do not expose the restart-specific (e^{-u}) flag-factor reserve.

Accordingly, source correspondence confirms preservation and pricing of the forced profile in the existing terminal launch, but not the new sharper separate flag reserve. For that reserve the inspected support is the manuscript proof in `restarted-rank-history.tex`; it should be described as that checked mathematical endpoint construction, not as an already-elaborated Lean result.
