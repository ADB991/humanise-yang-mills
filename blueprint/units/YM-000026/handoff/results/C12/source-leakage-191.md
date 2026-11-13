# C12 source-leakage audit response, issue #191

Session `TrishenGunaratnam-codex-c12-audit-191-20261113`; claim [issue comment](https://github.com/hairer/humanise-yang-mills/issues/191#issuecomment-6860523765). Base `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`; Lean pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Author revision, not an independent review. Row numbers and original classifications refer to `results/source-leakage/inventory.tsv`.

| Row | Disposition and evidence |
| --- | --- |
| 151 | B: retained the distinction between core and funded assemblies and their common configuration, schedule, transfers and transitions, without source commentary. See part-A ledger, `prop:ex-original-history-attachment`; its incoming matching edges remain open. |
| 157 | B: removed the source remark; the kernel statement and use are already in the immediately preceding proof. Source correspondence is in part-A `correspondence.md`, `lem:marked-factor-read`. |
| 158 | B: replaced the source packaging remark by a reference to the proof just given for the positioned read. |
| 160 | J: cited `prop:marked-positioned`, whose proof precedes the theorem; the proof inputs remain explicitly listed. Correspondence: part-A ledger and `correspondence.md` for `YM.Push.RELAY_MARK` positioned/mounted reads. This pass did not independently recheck the detailed proof. |
| 161 | J: removed source wording; the corollary proof cites `sec:local-sections` and applies the theorem with the slot-degree certificate. This is conditional on the cited section delivering that certificate; E-sections remains an input in part-A ledger. |
| 163, 164 | ? → N (mathematical data, harmless wording edit): call the already defined grade order the stamp; retain its two-coordinate formula and filtration use. |
| 165, 166 | ? → N (mathematical data, harmless wording edit): call the defined derivative estimate the section rate; the localized estimate and quantifiers are unchanged. |
| 167 | ? → N (mathematical data, harmless wording edit): call the displayed schedule quantity the sphere price. |
| 168 | ? → N (mathematical data, harmless wording edit): call the explicitly defined functions the door toll and purse. |
| 169 | ? → N (mathematical data, harmless wording edit): call the explicitly defined linear map the repainting map. |
| 170 | B: replaced reference to an evidence file with the still-required common-data and estimate matching; the detailed source audit remains in part-B ledger and correspondence. |
| 171 | J: derive the selected-budget radius divergence from `B_N = ⌈(log β_N)^2⌉` and `β_N → ∞`; for an arbitrary budget divergence remains an input. The selected identification and limit occur in `YM.Push.RelayDifference.cover_tops`, `Lean/YM/Push/RELAY_DIFFERENCE/Birth.lean`, and the radius formula is `YM.Pressure.radiusB`, `Lean/YM/Pressure/Seeds.lean`. |
| 172 | J: retain exactly the proved nonwrapping and locality consequences; do not assert an unexplained formal read relation. |
| 173, 174 | J: identify the local forced-family attachment as a separate input in the one-body proposition and propagate it to the downstream eventual-calibration assumptions. The price, hook, locality and gas-mark identity are retained. The proof does not claim that the terminal-voice attachment automatically proves this more general correction case. |
| 175, 176 | T-open: replace implementation identifiers by the corresponding named one-body and same-history propositions; keep their respective inputs. |
| 177 | J: explicitly retain the ordered transition, paid-profile and served-representation inputs, which are not consequences of the local reserve. |
| 178 | J: make the all-displacement transition properties assumptions, as in `lem:actual-marked-antilles`; the later inequality is a relation, not equality. |
| 179 | B: rename the heading to describe the same-history inputs. |
| 180, 181 | T-open/B: state the finite-census, positive-weight and occupancy quantifiers, priced offers, regular and forced outputs, weighted bounds, exact push and quiet/singleton identities; soundness, tuning and contact remain inputs, not proved. Correspondence: `YM.MergeProof.Menu.Volant` and `YM.MergeProof.Menu.Canopy`, `Lean/YM/MergeProof/Copse.lean`; priced offers `YM.MergeProof.Menu.Offer`, `Fruit.lean`; weighted bounds `YM.MergeProof.Accent.Towed`, `Accent.lean`; the source requires soundness, tuning and contact as separate interfaces. |
| 182, 183 | B: keep wing/Tale and Coupon witnesses as inputs and explicitly retain that their full conditions are not expanded. |
| 184 | T-open: replace the implementation record name with finite-copy data and describe the keyed residual versus translated voice, retaining the identities and allowances. Correspondence: `YM.MergeProof.Yeast`, `Lean/YM/MergeProof/Bakery.lean`. |
| 185 | J: state the served-residual passage as a separate open input with the same opened scale, support exponent and action allowance. The two numerical prices remain; they do not prove the passage. Existing edge E-served remains open. |
| 186 | J: describe the ingredients required of the selected funded-history route without saying their joint attachment has been proved. E-record remains open on the same original history, including terminal Cream. |
| 187 | ? → N (mathematical data, harmless wording edit): the finite record is the backward transfer data described by the following sentences, so call it the finite transfer record. This does not validate its upstream production. |

The attachment source anchor is `YM.MergeProof.garnish`, `Lean/YM/MergeProof/Platter.lean`, whose statement was opened in this pass. It requires a lawful representation, berths, origin support, `Attaches`, a nonnegative summable majorant and a merge-price sum budget, and concludes force format/cost, the hook identity and the gas-mark sum. Part-B correspondence records the slot-packing route and the prior reviewer’s observation that it is not `Attach.line`. A complete matching of the manuscript's correction, Keeper/berths and summability to these formal hypotheses was not carried out here; the attachment stays open. The earlier reports, including part-A/part-B review files and their fingerprints, are historical and are not refreshed by this revision.

Other open conditions include E-record (one family and one indexed field of doors for all stated indices), E-keeper, E-fee, E-served, and the selected-run budget/floor matching. Exact mathematical and Lean correspondence review of this new revision is required; an independent review under another GitHub account is required for acceptance of substantive mathematical edits. No claim is made that any of these obligations is closed.

## Local validation

- `python3 scripts/check_blueprint.py`: passed, `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`
- From `manuscript/`, `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/private/tmp/c12-latex-build existence.tex`: passed; rendered 983 pages. The final log contains one 1.83 pt overfull box in `public-run-binding.tex`, outside these edits. The build also reports a PDF destination warning for `proposition.202.6`; no claim is made that this was introduced here.
- Rendered and visually inspected relevant pages around the changed passages using `pdftoppm` and image viewing, including the final multi-marker interface and its pagination. No clipping was seen in those inspected pages.
- `git diff --check`: passed. No Lean build or mathematical verification was run. The independent review remains outstanding.

## Response to interim exact-version review

Checker alpha's review of `4c14471` identified that the finite-marker bound must use configuration-independent *coefficientwise* majorants, not merely a uniform bound on the weighted sum; the revised R4 interface now states this for both output families. It also identified the downstream application in `prop:ex-original-history-attachment`: the proposition and proof now retain the local forced-family, paid-history and served-representation inputs on the same `C_R`, uniformly in the period. Separately, row 171 now derives radius divergence for the actual selected budget; this replaces the earlier proposed open input only for that budget. The checker reported no other blocking findings on that version; independent review of the subsequent changes remains pending. The subsequent revision was rebuilt with the same LaTeX command, the affected pages were rendered and inspected, and the blueprint and whitespace checks passed.
