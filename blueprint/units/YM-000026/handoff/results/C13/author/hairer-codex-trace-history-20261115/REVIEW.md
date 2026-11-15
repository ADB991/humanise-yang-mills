# Independent review: auxiliary chart family and all-level F3

Reviewer: review_trace_family. Scope: the newly added `subsec:restart-chart-family` in `restarted-rank-history.tex`; the amended (P) and path lemma, new `cor:rank-trace-all-levels`, and replacement status paragraph in `actual-rank-purchases.tex`. Current submission base reported by author: 72eabe5453958edb70efd8e3548834b1a5657f50. I did not author or edit these manuscript changes.

Final SHA-256:

- restarted-rank-history.tex: `39f5c72d05253d4c4b96f8632c07328fc7b6f038bb61daa70980cf6a07e57da6`
- actual-rank-purchases.tex: `7dd531418c49e6d46c33038e27cbfa92ef98cc19e2069359bb739eff78f80c38`

## Mathematics: PASS, conditional on retained funded inputs

The new budget calculation is valid. With b(x)=ceil(log(x)^2), the purchased retiming x<=r(x)<=x^2 gives b(x)<=b(r(x))<=4b(x) on the stated large tail. Thus 25b(r(x))+30<=b(x)^2<=b(r(x))^2 eventually. The fine/coarse budget ratio tends to one for each fixed stage pair; purchasing the finite adjacent-pair thresholds permits B_f<=2B_c throughout the window. The threshold identity is taken from the existing retiming construction, rather than falsely deduced from comparison of r and x.

The endpoint is correctly re-expressed at the smaller threshold without claiming equality of representations. Finite backward construction retains each already chosen higher entry. Its pointwise density identity follows directly from the kernel recursion. Bounded positive kernels, integrable endpoint, normalized mass and Fubini establish the unchanged finite-volume partition function. No injectivity of evaluation is asserted or required.

For every level j, the endpoint coupling bound and plateau yield beta<=9*x_j/4 and g<=sqrt(8/7)/sqrt(x_j). The exact phase threshold dominates g and is at most the clock threshold eventually. The retained stage clip and coefficient bounds give the correct row and loop bills, and q_{k-j}<=s^(-1/400)<=1 gives the additive bill. These are all the suppositions used by the normalization ticket; there is no additional unidentified test-threshold condition. The endpoint j=k is covered by its re-expression, fixing the previous text's erroneous suggestion that it remained in the original budget.

Two clarifications requested during review were applied: define b(x) to avoid mixing scalar and level indices; state fixed finite menu and bounded chart arc explicitly in both new results. The final text carries these quantifiers.

## Textual Lean correspondence: PASS, bounded scope

Independently inspected:

- `YM.Next.Rank.Station.Meets`, `Lean/YM/Next/RANK/StationMeter.lean`: its eight fields are exactly clip equality, coupling cap, beta*g^2=1, positive g, entrance g<=threshold, upper threshold, additive cap and loop cap. Removal of a separate vague compatibility premise is justified.
- `YM.PhysicalNext.InteractingRank.groomSky`, `TraceExtension/Prom/Port/Leashes.lean`: derives the same tests on the actual BushSky representation with exactClip and exact budget. The manuscript uses a stronger direct running estimate for its constants; this is sound.
- `YM.PhysicalNext.InteractingRank.Soft.leafSky` and `thicketSky`, `TraceExtension/Prom/Port/Soft/Grows.lean`: endpoint parser followed by descending updates, preservation of previously chosen higher entries and the Uses density/coupling equations. The new prose follows this construction rather than assuming uniqueness.
- `NylonSky.use_`, `embroideredSky`, `TraceExtension/Prom/Port/Soft/Coupons.lean`: all-level Novice records, distinguished from the separate backing family's endpoint equality. The manuscript selects its actual constructed family and does not misuse that equality.
- `Spear` in `PhysicalNext/AFTERNOON_INTERACTING_RANK_COMPARISON/Soft/Spear.lean`: exact fine/coarse phase thresholds and walls radii are data of the actual representations.

All five inspected source files match their `Lean/SOURCES.sha256` entries at imported source pin 3456e5e75cf8d4cd558955a5c7638fba2d68f464. Source hashes respectively: a873d41e6036a362815c1897105e6aec6176f0c5a2506e78bde089b749aa6bf4; 72efeae8099927a1281f518cf129de5ca75c97be252306f579f6260c9fe5d656; b397c769e204972ac7a496fb00400fb74dea573e8b789a5336446461d8fdeff7; c5f8ab9c8f7acc340cd12b459f72fa5ade8c7c0f8a4853513ac0701e290aefef; c845686a601df822ef85385b51491ac500207f02d1457c4308d798f812245b22.

## Limits

I checked the immediate manuscript interfaces in the local compiler, endpoint/restarted construction, dawn retiming, path admissibility, trace F3 specification and root normalization ticket. I did not independently re-prove all analytic premises of those earlier sections. This is a local integration PASS under their stated funded hypotheses, not closure of the trace endpoint or whole monograph. No Lean elaboration or LaTeX build was run by this reviewer; the author owns those validation checks.
