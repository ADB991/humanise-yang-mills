# Independent bounded review: installing the selected energy

Scope: the new paragraph “Installing the normalized energy in the selected algebra,” equation `eq:scribe-selected-energy`, and its introduction in `trace-scribe-producer.tex`. I did not author or edit the text. The earlier centering proof from PR461 is not re-reviewed here.

Reviewed file SHA-256: `9f74825a7d50515c5251a2076a6e0d28bc89d388f395c4d5a7679a2a379af8cc`.

## Mathematics: PASS under cited construction hypotheses

The raw charge scalar c is fixed across grades before the trace chart. Scaling J by c^{-1} changes its translation response c∂ to ∂ and its rotation response cD to D, by linearity of the collar flux. The finite-dimensional probability Haar average of the component-and-label orbit has exactly the formula already proved in physical-angular-actions. Its reality, symmetry, conservation and tensor covariance follow from that result. Orthogonal change of variables in each collar and covariance of the same derivative/action preserve each coefficient-one Ward identity, including reflections; normalized Haar integration leaves the common right-hand side unchanged.

Crucially the text chooses this tensor as the energy component of the selected algebra during assembly. It does not claim that an arbitrary preassigned energy equals this normalized tensor. This legitimately supplies the raw-energy laws for that construction, conditional on the explicitly retained upstream construction hypotheses. It neither selects a fresh tensor for each trace chart nor removes the later shell comparison of its centered version with the corrected tensor sequence.

## Textual Lean correspondence: PASS

Independently inspected the following actual imported source definitions/proofs:

- `YM.Work.A15.normalize_flux`: translates Crystal.sizes and X.lie=c^{-1}Y into coefficient-one StressLaws for c^{-1}J.
- `YM.Work.A15.averageStress`, `stressLaws_average`, and `answer`: the returned stress is precisely averageStress(X,c^{-1}J), with conservation, tensoriality and Ward laws.
- `rotateStress` in Work/A15/Tensor.lean: component formula agrees exactly with eq:scribe-selected-energy.
- `YM.Bid.station` in Bid/Town.lean: implements Commission.retune with the A15 proof on the same IR tensor, derivative plan, rotation, and scalar.
- `YM.Org.Tab`, `Commission.retune` and `Commission.picks` in Org/Twist.lean: the returned retuned tensor is installed as the third field of the selected Spec.Algebra tuple and its laws are packaged as locality.
- `Spec.Algebra` and `Spec.Locals` in Spec/Closed.lean: energy is a data field; Locals.charges concerns exactly that field with the tuple's own derivative and rotation maps.

The five inspected source files match their entries in Lean/SOURCES.sha256 at imported pin 3456e5e75cf8d4cd558955a5c7638fba2d68f464. No Lean elaboration was run.

## Limits

This is a same-object assembly check using the already stated/proved normalization and averaging argument in physical-angular-actions; it does not independently re-audit its upstream analytic inputs, the chart/detector comparisons, or the whole C14/C15 chain. No LaTeX build or page inspection was run by this reviewer. No required change found in the new paragraph.

## Additional detector review

PASS mathematics for explicit detector paragraph at final scribe SHA256 93acb39300b18d2e609d77277d988253f54450d628c98ed7ec457a935d34af39. Choose v=O and observer g -> S0(g,O;0,e_a). Differentiating 3N/(pi^4 |x-e_a|^8) in x_a at zero gives +24N/pi^4, nonzero for N>0. Both points are separated; the reference derivative law therefore gives the desired tested grade-five derivative. The choice is independent of charts. The corrected paragraph expressly retains the reference-field identification/normalization premise of trace-asymptotic.tex, so it neither proves that identification from Wick algebra nor appeals circularly to the interacting trace asymptotic. This detector check is a direct mathematical derivation from manuscript premises, not an assertion of an exact new imported Lean theorem. Previous installed-energy source/mathematics review remains valid.
