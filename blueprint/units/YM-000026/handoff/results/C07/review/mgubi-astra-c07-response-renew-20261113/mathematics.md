# Renewed mathematical review: M1/N1/N2

**Verdict: M1, N1 and N2 are resolved in the exact response delta. No additional required correction was found in this bounded check.**

Target PR271 `c68df769f649ccd6f81597ddbc56832061678729..58b03e93fffd007969a88043dbf5f1c832a924e6`. Independent reviewer mgubi with Astra assistance, session `mgubi-astra-c07-response-renew-20261113`; this account did not author C07 or this response. Prior PR277 at `a47df64173818aca09668234e1a062601452a908` remains frozen. This is agent review, not human acceptance or whole-package renewal.

## M1: zero order

The definition in packet-estimates, “Derivatives at the edge of a mask,” is `||D^k F(y)||≤U v^k` for `0≤k≤j`, with the zero-order bound included. At j=0, it therefore requires only `|R(y0)|≤1`; the scale has exponent zero. The lemma's positive definite covariance makes its reference density positive. The hypotheses `C0=C(y0)` and `w(y0)=z` give `R(y0)=1` directly from the ratio, equivalently from `L(y0)=0`. Thus the inserted branch's choice K0=1 is valid and depends on no derivative bound. The existing N=0 convention (density and determinant both1) is unchanged.

The new sentence explicitly restricts the rest of the proof to j≥1, making the maximum over `1≤r≤j` nonempty. The lemma statement, assumptions, all positive-order inverse/log-determinant/quadratic/exponential calculations, application, and dominated-differentiation boundary are unchanged. The verifier compares the complete suffix starting at “Inverse” byte-for-byte, as well as the statement. This resolves the minor proof-edge omission without weakening the result or expanding its domain beyond the base-point estimate.

## N1: probability Haar notation

Both remaining prose references now use m_G: the integration variable's measure and invariance under inversion/right translation. They agree with the declaration of probability Haar measure and all displayed formulas. The manuscript no longer uses h for that measure in those two places; h remains the fine reference coupling. No integral, normalization or invariance claim changed.

## N2: forward source and inverse domain

The forward map `(u,n)↦exp(u)exp(n)` has source the product of the colour algebra and its orthogonal complement and derivative `(u,n)↦u+n` at0. The latter is a real-linear isomorphism of the ambient finite-dimensional matrix space. The repaired paragraph correctly takes O around(0,0), its diffeomorphic image V around1, and defines Log_* on V as the colour component of the inverse V→O.

For a group element g near1, the unchanged Hall application supplies X in the colour algebra tending to0 with exp(X)=g. Consequently (X,0) lies in O, the forward image is g∈V, and injectivity on O identifies the inverse pair with (X,0). This gives Log_*(g)=X. No such exponential-inverse assertion is introduced for arbitrary ambient matrices. The later fixed d_*,A product-neighborhood choices remain unchanged. This is the requested domain clarification, not a new group-logarithm theorem or enlargement of the earlier review's literature claim.

## Retained scope

The substantive conditional conclusions of PR277 at its original fingerprint are unchanged; this follow-up checks only the response's three passages and three author records. Palette/local-covariance work (PR201/220), C13 F7, canonical evidence/findings records, untouched notation findings, and C07-to-C08 same-history/support/active-coordinate/derivative supplier joins remain outside this renewal. No analytic supplier construction, global completion, formal approval, merge or human acceptance is implied.
