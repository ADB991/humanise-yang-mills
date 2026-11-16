# Independent signed-stamp review

Verdict: PASS for mathematical argument and textual Lean-source correspondence, after the author's local-to-global healthy-extension correction. Review is of the standalone fragment; integration and compilation are not asserted here.

Reviewed file: `/tmp/ym56-signed-stamp-addition.tex`.
Reviewed SHA256: `3176188cad5052faa8cc0ab62d7a8d38f949980c8d910df02c94bdaa1eec1dbd`.

## Mathematical checks

The covariance argument is for the actual comparison covariance, not a freely chosen symmetric replacement. From QP=d*, ker Q contained in ker d, and signed equivariance of Q and d, subtraction of solution operators gives C kappa C*=kappa without invertibility on harmonic forms. Restriction is explicitly to all faces contained in the centred box, which is stable including negative-axis base-point shifts. Restricting an arbitrary base-point cube would not justify this step. The chain rule then proves Wick commutation. Formal radial jets and fixed weighted-degree extraction give exact reading naturality.

The calibrated-coordinate and full physical-entry identities are derived from the same terminal identification and transfer integrals. Crucially, division by background density proves the full-entry identity only on globally healthy fields. The initial candidate incorrectly applied it directly to locally healthy fields; the revised argument resolves this. Axial gauge makes all retained patch bonds at most 4b tau from identity. Retaining them and setting other bonds to identity makes every plaquette, including boundary plaquettes, at most 16b tau from identity, hence globally theta-healthy eventually. Both original and signed patches agree with these extensions. The fragment uses locality/gauge invariance only for the near insertion and polynomial, then decomposes error into Taylor error, signed based-path error, and two globally healthy wide tails. It does not require separate near/wide equivariance.

The signed path discrepancy is O(b² tau²/g): path length O(b), individual bond O(b tau), and curvature O(tau). Monomial telescoping gives the displayed polynomial estimate. At fixed D, coefficients and tau/g have only H-power or H^{o(1)} cost, whereas tau²/g has inverse-square-root coupling decay and log H=o(log coupling); the error is smaller than every prescribed H power. D=0 has identically zero path discrepancy.

The raw coefficient bound 4H^{2 gamma}, the Wick bound (1+H^{-1}w_D)H^alpha, and healthy error C H^{-D-15/16} retain strict margins. Finite orbit constants are therefore paid by one common threshold before volume, period and offset. The normalized finite average preserves all three prices, exact reading, unit/reality and locality; group reindexing gives signed covariance. No factor equal to group size is lost. The previously established quantitative invoice supplies the inverse bound for the same averaged reading.

I also checked the cited axial-link and strict Taylor-margin paragraphs in `actual-rank-purchases.tex`, including the 4b-link decomposition, row cost, and exponent -D-15/16.

## Independent source correspondence

Read the imported Lean source directly, rather than relying on the author's or cheaper reader's characterization:

- `YM/MergeProof/East/Crust.lean`: `treats_wind` uses actual `RankCovariance.signed_cash`; `stamp_at` combines covariance/Wick compatibility with exact formal radial reading.
- `YM/PhysicalNext/RANK_COVARIANCE_ATLAS/Atlas.lean`: `copper_stamp` identifies the actual covariance, and `signed_cash` proves signed symmetry with base-point shifts.
- `YM/MergeProof/East/Canes.lean`: `ParadeX` and `enclosing` give coordinate symmetry and full-entry symmetry only when all flags are absent; `when_all` explains density division.
- `YM/MergeProof/East/Solder.lean`: `ahead` performs axial gauge, extension with small bonds, global health, signed pullback and the four-term error decomposition; `wide_fare` supplies healthy wide tails.
- `YM/MergeProof/East/Lava.lean`: `metra` and `earn_ping` give the bounded-path curvature and polynomial errors.
- `YM/MergeProof/East/Glaze.lean`: `swing`, `prize`, `lustre` give the stable face patch and formal signed transformations.
- `YM/TraceExtension/Prom/Orion/Eupho.lean`: `mintingSky` constructs conjugate raw polynomials, Wick polynomials and readings, pays finite orbit constants, then averages complete stamps.
- `YM/RG/Masks.lean`: `flags` is exactly the plaquette chord threshold test, validating the boundary-plaquette extension argument.

All eight source file hashes independently match `Lean/SOURCES.sha256`. This is a textual-source audit, not Lean elaboration. No manuscript files were edited by this reviewer.

Final follow-up checked: the scalar hat-beta is now x, avoiding collision with the signed symmetry s, and the D=0 path error is explicitly zero. Both changes preserve the PASS verdict.

## Integrated scope fingerprint

Confirmed the complete reviewed fragment occurs exactly once, byte-for-byte, in `/tmp/ym56-analytic-20261116/manuscript/existence/trace-firesky-gallery.tex`, SHA256 `fe7c6a9895fdcd3b5f8f7640bc0afaf1985e99c0f82783773f6553baa57573be`. Fragment fingerprint remains `3176188cad5052faa8cc0ab62d7a8d38f949980c8d910df02c94bdaa1eec1dbd`. PASS applies to the signed-stamp scope at this integrated gallery hash; other gallery additions are outside this review's scope.

Final integrated-gallery follow-up: SHA256 `39c6d0459becbaa0ab7fa75c779eeac09ce437d659d9572933fe02ea8a575339` supersedes the earlier gallery fingerprint. Rechecked that the complete reviewed stamp fragment still occurs exactly once byte-for-byte. Scoped PASS is unchanged; the intervening capacity display line break is outside stamp scope.
