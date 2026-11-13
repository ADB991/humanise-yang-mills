# Finite-cell planted estimate: author response to issue 283

Session `mgubi-astra-c02-planted-proof-20261113`. Claim: https://github.com/hairer/humanise-yang-mills/issues/283#issuecomment-6865344268

This work is stacked on PR272 at `0c0215f83a9aa8b94de30aa084c2e93ab8ea6e7b`, whose conditional root-seminorm proof received the bounded independent review278 at `82dfbf227598b27334c598c4abc2e1fd0d6e98e7`. That review is evidence about its original scope, not acceptance of the new proof. The PR272 lemma statement and proof are byte-identical here; its existing records are untouched.

New `prop:ex-centered-planted` in `manuscript/existence/centered-estimates.tex` supplies the full-cell and injective planted estimates from explicit reflection invariance and positive seams for the same normalized law and tiling. It fixes the actual copy orientation: reflect each odd cell coordinate, conjugate iff the number of reflected axes is odd. The prior vague alternating-chamber sentence is corrected accordingly (review278 N2).

The proof includes strict-chamber geometry for both link and site seams, the Hermitian form and its zero-diagonal Cauchy–Schwarz case, the pointwise two-half product identity, closure of finite maximizers under every translated fold, a finite strip-spreading argument preserving already constant axes, positive-epsilon normalization and the limit to zero. Empty planted families and zero root budgets are included. Arbitrary positive half-period h is allowed, with no dyadic assumption.

The new proposition explicitly supplies the planted premise of the unchanged root-seminorm lemma. The quantitative producer theorem now asks for the proposition's geometric, invariance and positivity hypotheses, and cites its resulting planted inequality. Its transfer, packing, budget, schedule and covariance assumptions and all other proof passages remain unchanged.

## Remaining obligations

This is a conditional finite-volume implication. Wilson seam positivity itself, the continuous transfer representation, the RG centered-budget estimates, uniform label/period bounds, and identification of all inputs on the selected trajectory remain separate. `YM.Cells.laws` uses `YM.Slice.reflected_positive`; the new proof does not produce that upstream theorem in English. No C02 package closure or global continuum claim follows. No existing ledger, review fingerprint or shared metadata is refreshed.

The account authored PR272. This is author work with parent integration inspection, requiring new independent mathematical and textual source-correspondence review by a different account. No formal approval, human acceptance, merge or issue closure is claimed.
