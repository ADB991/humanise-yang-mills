# Assessment glossary against the G01 statement ledger

This is an author-side cross-check for #382 item 8, not an independent
whole-proof review. Compared the actual 35-page assessment, *Validation of
the OpenAI Yang–Mills construction*, 10 November 2026,
`https://raw.githubusercontent.com/yang-mills-group/YM/main/docs/assessment-1.pdf`,
with `results/G01/statement-ledger.md` and the current statement/headline.
Downloaded 16 November 2026. PDF SHA-256:
`8e658c00900bf723cbe90436eb1f78fca4f287e008a85c21fdceaf59e61db219`.
This agrees with the independently recorded assessment identity in #446.
PDFKit text extraction was read for pages 23–35, plus Sections 1–2 for the
scope comparison. Display formulas were interpreted with their adjoining
text; the report below records structural/quantifier matches, not a new
proof of those formulas. No external excerpt is reproduced here.

The glossary deliberately alternates between a public declaration's
requirements and the construction's particular instantiation. G01 more
strictly separates the two. Agreement below means agreement after retaining
that distinction, not that every glossary description is encoded in the
weak public target.

## Complete entry map

| Assessment pages and entries | G01 ledger | Comparison |
| --- | --- | --- |
| 23: `JointExistence`, group and simplicity | A1–A2 | Same order: group first, one regular family, arbitrary period order, then subsequence and hierarchy. Nonabelian simple real Lie algebra; no connectedness assumption. |
| 23: `period`, `denominator`, both strictness fields | A3 | Positive strictly increasing integers and mesh reciprocal agree. The glossary's concrete arithmetic periods and odd block products describe the constructed family, not extra public conditions. Its gentle-ratio condition is likewise construction data. |
| 23: `beta` | A3–A4 | Coefficient multiplying normalized Wilson energy. Shooting to one reference coupling is the construction's choice; the public field alone is unrestricted. |
| 23–24: `haar`, `probability`, `invariantHaar` | A3–A4 | Same probability Haar measure and product prior. |
| 24: `Token` | A3/A6 | Public tokens are abstract. The construction's token is a grade paired with polynomial coordinates. This confirms that the grade must remain explicit in the headline; it is not only an ungraded polynomial label. |
| 24: `insertion` | A3–A4, A11 | Fixed finite link stencil, jet-normalized lattice polynomials, inverse reference transport and factor-dependent rescaling agree with the stronger construction. They are additional content beyond the arbitrary public insertion function. The assessment explicitly says matrix entries of the inverse are not given by formulas. |
| 25: `running` | A3 | Same eventual bound uniform over all periods. The public clause only existentially quantifies its slope; the constructed value is `2*b0`. #447 settles its numerical value and uniqueness, so these are consistent readings. |
| 25: `continuous`, `invariant`, `localSupport` | A3 | Same product topology, site gauge action and both-endpoint finite-stencil condition, with one stencil for every cutoff, period and placement. |
| 25: hierarchy `H`, `labels` | A6–A8 | Same Hilbert-space role; glossary additionally describes the reconstructed word space and the common span of all-spectator response functions. These are construction realizations. |
| 26: `theory`, `Field`, `toLabel`, `project` | A6–A7 | Same finite-dimensional quotients, injective response realization and quotient token map. The all-spectator null space is preserved. The glossary's coefficient sup norm is a particular quotient norm, not a new statement-level constraint. |
| 26: `Character` | A6 | Compact metric phase space agrees. Compression to the mixed zero-energy space and the Gelfand spectrum explain the construction; the bare public type does not require this algebraic meaning. |
| 27: `phaseMeasure` | A6–A7 | Vacuum representing probability measure agrees; full support appears in the reconstruction conditions below. |
| 27: `selected` | A6/A11 | A distinguished phase is the public datum. The glossary describes selection via the extra Echo condition. #403 established that this is a separate source route; the headline `Final` route selects by one-dimensional ground space and subsequently proves its trace law. This is a distinction in explanatory construction routes, not a stronger requirement in `JointExistence`. The manuscript must not transplant the Echo selection premise into the headline. |
| 27: `correlation`, `continuation` | A6–A7 | Phase/mixed tags, complex-time continuation and ordered imaginary-time root agree. The public function types alone do not impose multilinearity; the constructed table does. |
| 27–28: `Channel`, `actor`, `coefficient` | A6/A9 | Same finite degree-indexed channels and state-independent coefficients. Stratum bases, Haar averaging and finite response evaluation explain the constructed prescription, beyond the public data fields. |
| 28: `centeredTrace` | A6/A10 | The public field is a distinguished degree-four element. The glossary identifies the constructed one as the physical stress trace minus its selected-phase expectation. This is exactly the stronger identification retained in the headline and required of #439. |
| 28: `Properties.wilson`, smear/finiteMoment/place/law/Converges | A4–A5 | Same normalized Wilson law, all ordered tuples, factor `a_N^(4n)`, compact support within centered box, full mesh limit at each suitable fixed period, and then the selected volume limit. One hierarchy supplies all tokens and tests; a diagonal limit would not match. |
| 29: `Properties.ope`, Within/Clear, coefficient and remainder bounds | A9 | Exponents, separation geometry, state independence of coefficients and uniformity over all states agree. Thresholds may depend on fields/truncation/geometry; no common threshold for all truncation degrees. No spectator upper-position bound appears. |
| 30: `TraceTest.centered` | A10 | Zero selected vacuum functional for every complex Schwartz test, not just a pointwise Euclidean slogan. |
| 30: `amplitudePositive`, `shortDistance` | A10 | Real Lie-algebra dimension, constant `3 dim_R(g)/pi^4`, complex limit, and factor `r^8 log^2(1/r)` agree. The glossary's monotone bracketing explains the source proof; it is not a hypothesis of the public clause. |
| 30–31: `excludes`, profiles | A10 | Same finite complex sum of finite products of mass-shell Laplace integrals; nonnegative masses, integer derivative orders and continuous homogeneous numerators. Empty products and sums are allowed. Exclusion concerns exact equality near zero, not all generalized free-field descriptions. |
| 31–33: `Reconstructed.axioms`, W0 | A8 | Strongly continuous translations, projection-valued energy-momentum measure, closed forward cone, and a one-dimensional translation-invariant space agree. Spectral support in the cone does not give a mass gap. |
| 32–33: W1 | A8 | Common dense invariant domain, normalized cyclic vacuum, Schwartz-to-Hilbert continuity, linearity and adjoint word identity agree. The word-space construction explains the domain rather than adding a new public axiom. |
| 32–33: W2 | A8 | Strongly continuous Poincare action, affine pullback of tests and label representation agree. The public action on labels need not make translations trivial; G01 preserves this subtlety, while the constructed action has the usual form. |
| 32: W3 | A8 | Spacelike separated closed supports imply commutation on the common domain. Same strict spacelike inequality after switching time-first to time-last coordinates. |
| 33: `faithful`, `injective`, `acts`, `covers` | A7 | Nonzero label detected by a smeared operator; each grade embeds; at least one operator nonzero; every common label occurs at one grade. The glossary correctly distinguishes `acts` from vacuous faithfulness and uses the nonzero unit. |
| 34: `represents`, `normalized`, `fullSupport` | A7 | Token surjection onto all graded fields, total probability mass one, and positive measure of every nonempty open set agree. |
| 34: `permutation`, `smooth`, `characterContinuity`, `mixture` | A7 | All phase/mixed separated correlations, smoothness off diagonals, continuity in each character at fixed separated points and the vacuum barycenter identity agree. No full-space correlation formula is inferred at coincident points. |
| 34–35: `analytic`, `root`, `boundary` | A7 | Same ordered imaginary tube, imaginary-time Euclidean root, and approach from a fixed ordered imaginary direction. Product tests and operator order agree. The constructed integral exists; G01 additionally notes that the public Lean Bochner integral is totalized and alone does not state integrability. The glossary's prose uses the stronger constructed interpretation. |

## Outcome

No unresolved discrepancy was found in the public clauses covered by the
G01 ledger. The glossary supplies useful descriptions of construction data
which the public statement omits, precisely why the stronger headline was
introduced. It does not invalidate G01's cautions about multilinearity,
label-action generality, totalized boundary integrals or the missing public
identification of the trace with physical stress. The one construction-route
difference (`selected`, p. 27) is already settled by #403 and is preserved
in the manuscript's ground-only selection remark and existential headline.

This comparison validates neither the assessment's proof judgement nor
all producer proofs. In particular, its description of every-character
reconstruction in Section 6.1 must still be supplied by the manuscript's
own argument; #439 and G06 cannot replace that task with this glossary.
