# PR465 Bill audit-repair final source review

Read-only review of the root-authored manuscript snapshot `/tmp/ym465-audit-repair-20261116` against Lean at pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464` (workspace checkout `de0cc5d9570deba7721eab163f92bc577179744e`). I did not edit files or elaborate Lean. The snapshot's four relevant TeX files and Lean source hashes are listed below so this review is pinned to exact text.

## Verdict

The repaired scale-ticket proof in `trace-bill-prices.tex`, its connection to the existing first-open/summit moving-depth proof, the finite-volume beta proof in `trace-probe-assembly.tex`, and the local-pairing treasury expansion are mathematically consistent with the source definitions. The coffer “smoke” arithmetic checked out. The first-open argument in the manuscript is self-contained from the selected schedule receipts and does **not** need `Stock.Tabs.cheap`; this differs from the exact Lean theorem `Terrace.Stanza.Bgap/liability`, whose API takes `K : Stock.Tabs`. The manuscript's argument uses the same first-open predicate/minimality but proves existence by exhibiting the summit predecessor as open. It is therefore valid to avoid stating a Tabs premise if the selected schedule has already paid the explicit block/column/treasury bounds there.

One small proof-detail omission: in moving-depth bills, the “preceding ratio” argument uses (m-1), which needs (m>j). For large j this follows at once from (B_j=lceil(log\hat\beta_j)^2\rceil>1), so j itself is not open. Add that clause, or split off (m=j) (where the ratio bound is trivial). This is not a substantive obstacle.

The stage-majorant expansion is now explicit enough to close the prior placeholder: at fixed stage, `Treasury(z)≤C_stage+2D_G log z`, with exact source terms and a stage-entry threshold. It should still be understood as a pre-extraction finite-stage delay choice; it is not a uniform constant over all stages. The selected schedule paragraph states this ordering.

## Detailed checks

### Bill tickets

The lemma uses exactly the previous moving-depth quantities: frame i=j, basin J=m, summit K=k; (A_i/A_J\ge B_J^2) is exactly first-open, and the summit is first crossing of (G_i=(\log\hat\beta_i)^{48}). It derives:

- ratio (A_i/A_J\le y^6);
- liability ( (A_i/A_J)^4\mathcal T_J\le y^{27});
- (hat\beta_K\le2x), (J<K), and scale gap (S_K-S_J\ge y^{48}/2).

These give the four rate-zero quantities with logarithmic bounds (y^{27}+5), (6d\log y), (4(y+\log2)), and (w_d(y+\log2)). For fixed grade d and every positive ticket epsilon, each divided by (y^{48}) tends to zero. `f_i=hatBeta_{J_i}^{-w_d}` follows the fixed-grade selected height definition; monotonicity and (J<K) yield (f_i^{-1}\le(2x)^{w_d}). Gain exponent ( (S_K-S_J)/8\ge G_i/16\ge500G_i/10^4) is correct. Product exponent 70 and quotient exponent -430 are correct.

This is the direct manuscript proof and is stronger expositionally than merely citing Lean's API. Lean source corroboration at the pin: `Base.lean` Gate/summit; `Stanza.lean` basin and `open_budget/Bgap/liability/glacier`; `Fund.lean` ticket definition; `Arms.lean` gain/inverse flight; `Casa.lean` exact native simplification.

### Summit receipt and probe assembly

The assembly's (t\ge1) follows from the clock `hatBeta>1`. Its (1+2t\le\tau_j(230)) proof is correct: rate-zero ticket for (t^4) at exponent 229/10000 gives (t\le e^{229G/10000}) because t≥1; multiply by 3 and absorb the fixed 3 into (e^{G/10000}) eventually. (6c\le t) holds for fixed finite symmetry-average coefficient cost c as summit (k\ge j\to\infty).

For the separate finite-volume coupling, the proof correctly uses the same summit k and the representation band (\hat\beta_k/2\le\beta_{N,p,k}\le2\hat\beta_k), with (N\ge k), plus positive coupling. This is not inferred from the selected index's monotonicity. Lean corroboration: `RG/History.lean` field `band`; `Overlay/Prior.lean` history `represents`; `TraceExtension/Terrace/Grid.lean` uses the exact upper bound and positivity in its corresponding assembly.

### Local-pairing stage treasury majorant

The expanded text's fixed-stage formula agrees term-by-term with `Vac.treasury` and `Vac.fiat`:

- `fiat = 2*(1+(4r+1))+1+n_plaq(c_dir+r²)+4D_G(log16+log z/2)`;
- with (C_{stage}=2(1+4r+1)+1+n_{plaq}(c_{dir}+r^2)+4D_G\log16), this is (C_{stage}+2D_G\log z).
- Treasury's loop price is (2z(r\vartheta^3+r\vartheta^4)+\Lambda\vartheta^2). The selected clock gives (artheta\le z^{-1/2}e^{(\log\log z)^2}), so the first two terms (z\vartheta^3,z\vartheta^4\to0), while its loop-cap condition gives (\Lambda\vartheta^2\le1). Therefore loop price ≤4r+1 eventually.
- Ordinary and forced allowances are ≤1. Since (h=z^{-1/2}), (zh^2=1), making the quadratic action term exactly (n_{plaq}(c_{dir}+r^2)); the small-ball term is (4D_G\log(16/h)=4D_G(\log16+\tfrac12\log z)).
- For (u=\log z\ge\max(1,L,c,C_{stage},2D_G+1)), (C_{stage}+2D_Gu\le u+2D_Gu\le u²). Finite active/next-stage demands can be included before extraction in the entry-threshold finite maximum. Thus the displayed `L,c,treasury≤log/log²` payments are genuinely paid for the single selected history.

The coffer’s later use of the treasury at ρ=\hat\beta_m^{-1/2} is consistent: it uses the same-history denominator receipt, and the bracket in that estimate is the Treasury expression at that radius. The corrected forced-allowance asymptotic and age arithmetic also check: (f(x)=e^{-e^{(\log\log x)^2/5}}), so √ f decays faster than any (x^{-A}); (R_x=O((\log x)^8)), hence its melting products vanish. With (q=u\vartheta²Age(1/6)), θ²=\hat\beta^{-1}Age(2), so q≤1 eventually; (4(1+c)u≤Age(1/12)) since c≤log β and (e^{(\log\log\beta)^2/12}) eventually dominates log β. Dividing the column estimate by κ=Age(1/2) yields exactly θ²Age(1/12+1/6-1/2)=θ²Age(-1/4).

### `trace-small-means` summit ticket

This is a distinct sequence/index from the Bill factor (t_i^4): there (z_i=\hat\beta_{k_i}) with k_i the summit of j_i, and the proof explicitly gives the zero-rate ticket from the summit/frame ratio (eventually ≤2\hat\beta_{j_i}). The fifth power of `tiltcap` uses its named ticket lemma, and Θ has rate -100δ. Product rate is negative. This is a valid small-means input; it does not claim summit scale decays.

## Precise source/text hashes

Manuscript snapshot SHA-256:

- `trace-bill-prices.tex`: `ae51d12ada3f04531b1ce930b09f7280f8a6996a1822e74ccd21194507f9516b`
- `trace-local-pairing.tex`: `0f6c2e1bb183f8e9ea9b2cd67a18127b6d0d5730d9b68eae1cc627aab7d93e55`
- `trace-probe-assembly.tex`: `4b80c7f936e447e13b40653b9616532a3b4a99661eb4441ccceaa4fd55905f6b`
- `trace-coffer-supplier.tex`: `098bea9b9c1312eb73303bc27b86039ee8cc41d75196934bc96d8c3ba29fc71e`
- `trace-small-means.tex`: `414cfef30f692b6d1f0fe8e91707b0d6db980a193db5f540b1faa3133a278455`

Lean source SHA-256:

- `Lean/YM/TraceExtension/Terrace/Base.lean`: `2411e3c57004bc11b27096e7cb8aff4f1018b3ce98fd4e5f79baa9768da857fb`
- `Lean/YM/TraceExtension/Terrace/Stanza.lean`: `d720c20d98489710484e8c1018a169ba9b9ceb55fc225e6194e299b72ac389d5`
- `Lean/YM/TraceExtension/Terrace/Fund.lean`: `1fd7e5086fe84e6b7e6efcc5d1b149a1f8d5823367ef7eb4587b6b9da181fbbc`
- `Lean/YM/TraceExtension/Terrace/Arms.lean`: `ef1ee935b8ffe7dfea65d0e6e3505a58237acfa5fa099dd8c5a396486e20c831`
- `Lean/YM/TraceExtension/Terrace/Casa.lean`: `bf0e8b73c88ee98cb7a619d74e3d3ec45335e1fee9c8a917eb85ca811133205f`
- `Lean/YM/TraceExtension/Terrace/Grid.lean`: `015a4aaa7c04d70d1c01921af501705688e3af1f7d32075838479cb19f277065`
- `Lean/YM/Vac/Treasury.lean`: `c662707ce9dcac1888773ea74b64358343e7306f45d8013f3b88c2c85eff3bd7`
- `Lean/YM/Overlay/Prior.lean`: `3806a25f308589ebc7ac453a88442ef965e9f4f3a8acf3b826b5b0ac2bb2b318`
- `Lean/YM/RG/History.lean`: `ab604669cec205cd92020d34e4e672417ab40a0f484621067803548ba7bf81f6`
