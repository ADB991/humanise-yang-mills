# Independent review: common chart purchase

Reviewer: `/root/chart_independent_review`, with no authorship or manuscript edits. Reviewed additions and status corrections in `/tmp/ym56-chart-20261116/manuscript/existence/trace-firesky-gallery.tex`. Final SHA-256: `c0db6429bc0b7afeec793cc2d53cb2e5d9d70758dd1060debe7117929d6290d8`.

## Verdict

PASS mathematics and textual source correspondence for the bounded additions, conditional on the explicitly stated local analytic inputs and the existing funded-family/readout hypotheses. This proves the common scheduling and stamp-identification argument; it does not prove the local component estimates, actuation estimates, or reserved signed-stamp prices.

## Mathematics

The stronger invoice follows from the actual bound retained in the proof of `lem:rank-growing-wick-pin`: the relative error is bounded by a grade-dependent constant times H^{-3/4}. The factor H^{1/4} absorbs any fixed finite symmetry-operator constants and yields H^{-1/2}. Finite averaging gives equivariance under the expressly assumed intertwining of A, while preserving the unit and conjugation. The text correctly warns that a stamp requires the corresponding raw and Wick polynomials to be averaged too, and retains their separate price purchases.

For the scheduling proposition, each active set K_j is finite and every fixed grade is eventually active, even without monotone profile orders. The floor max(M_j,M_{j+1}) pays both L_j and L_{j-1} for the stage-j requests. All accuracy trimming occurs after choosing lengths and before choosing the calendar/history. The common window is a finite sum at each fixed stage and remains sublinear; no uniform-in-stage sublinearity is required.

The revised geometric argument specifies the center i0 of the common construction's constant-stage interval and explicitly includes this run interval in what it means to pay the requirements. The backward depth H is at most k-i0 by the two cases t<=3s and t>3s. Writing H=d1+d2 gives the actual max-depth bounds ell>=k-d1 and w>=ell-d2; this supplies the bracket. The two run-ticket inequalities are now purchased before the case split and apply in both cases. Consequently the coupling loss is at most s_G H log L_{j+1} <= beta_hat_k/4, which supplies the required 3/4 plateau. The monitor bound is also purchased at the same finite stage.

Finally, reduced arcs leave the common Taylor/readout orders and the budget radius and threshold unchanged. The same raw polynomial, Wick polynomial, reading, covariance and paid label norm therefore give a stamp for every panel. This is reuse of one stamp, not equality of unrelated choices. Finite intersection gives a tail uniform over the offset. The scheduling choices precede every later null-sequence query.

The F3/F5 status updates are correctly conditional on the cited all-level-history and selected-readout propositions; they do not silently discharge their analytic hypotheses.

## Review corrections

The author addressed two required precision issues during review: the initial unspecified paid-interval start was replaced by the explicit common-long-plateau center; and the run-ticket inequalities were moved before the cases, with the missing d1/d2 maximum-depth proof supplied. The proposition now limits its histories to the resulting common calendar and explicitly includes constant-stage run intervals in payment. No further required change was found at the recorded hash.

## Textual source correspondence

Independently inspected the actual imported Lean at pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`:

- `YM.PhysicalNext.InteractingRank.Soft.asks_sky`, `forwardSky`, in `TraceExtension/Prom/Order/Road.lean`: finite active grade sets; adjacent floor maximum; accuracy trimming; finite maxima of capacity/run thresholds; the sum of stage-j bench costs at 3s for K(j+1); one Wait and panel family before any realized history.
- `runTicket`, `slackSky`, `atlasSky`, `lastsSky`, in `TraceExtension/Prom/Order/Graph.lean`: the two budget inequalities, actual backward middle/root depth, the 3/4 coupling plateau, the t<=3s/t>3s argument, and sublinearity of each fixed-stage bench cost.
- `RelaySky`, `submits`, `FiresSky`, `embalms`, in `TraceExtension/Prom/Order/State.lean`: common three-panel Taylor/readout orders, offset clipping, common staging tail and exact null-sequence choice order.
- `YM.MergeProof.reborn`, in `MergeProof/West/Tael.lean`: the same heater, T and W survive a change of representation with the same budget radius and threshold, at the same Taylor and halo orders.
- `YM.Next.Rank.East.InvoiceSky`, `mintingSky`, in `TraceExtension/Prom/Orion/Eupho.lean`: quantitative invoice and finite signed averaging of the entire stamp. The manuscript's H^{-3/4} proof is a valid deduction from its previously exposed readout estimate, rather than a claim that this is the verbatim Lean proof.

The manuscript uses the already exposed common calendar to realize the source's Wait/run requirements. The explicit ceilings are the corresponding bump-plus-more depth. The conditional local interface remains essential: `office`, the underlying component estimates and `stagingSky` are not consequences of the finite diagonal argument.

Manifest checks matched:

- Road: `03461a99525d627cf06ddca3b4bf25b12023f89e92852802396b4beb6c34b8f2`
- State: `0c5a9ddd577bbcb85a2d6fdd9c9ff2e2abbe57cd063572ff91181a50e96e50d5`
- Graph: `b28cfa2fbae0248f1bc761e82c0cba6338c292502c3d0d3e87ee7c70476bb568`
- Tael: `ba084646f77e665a60621751cbd5edad1d8084f28be1ebdadfead787d9daa72f`
- Eupho: `0aafd2a453519b4cb8d04e8f93d0e47208ff88eab7408236dcbc7570788133d5`

`git diff --check -- manuscript/existence/trace-firesky-gallery.tex` passed. No Lean elaboration or LaTeX build/rendering was run by this reviewer. No full dependency closure is certified.
