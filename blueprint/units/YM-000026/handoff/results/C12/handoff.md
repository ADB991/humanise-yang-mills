# C12 author handoff

Session `schmittj-claude-c12-20261112`. Author draft; needs independent review of mathematics and of Lean correspondence at the hashes in `README.md`. Nothing here closes a cross-package edge.

## For the reviewer

1. Start with the repairs listed as errors in `part-A/findings.md` and `part-B/findings.md`, section A in each. For each, the old text is `git show 18d0327:manuscript/existence/<chapter>.tex`. The claim to test is twofold: the old text was wrong, and the new text is what the source says. The second-round sections record where an author-side checker disagreed with a first diagnosis and what was done.
2. New statements added in this pass, to be checked against the cited declarations for strength: `prop:ex-marked-solaris` (`YM.MergeProof.solaris`, `Braze`, `Hearth`, `Fridge`), `prop:terminal-marked-voice` (`Extra/SOURCE_HISTORIES/Birth.lean` and neighbours), item (4) of `lem:actual-marked-antilles` (`Work.G09.cone_cost`, `cost_finest`, `pastures`), item (6) of `thm:ex-marked-portfolio-section` (`Portfolio.inter`, `truly`, `rank`), `rem:marked-campaign-mixed`, the binding definition in `selected-course-binding.tex`, the closing paragraph of `selected-centered-service.tex` mapping the record (R1)–(R7), and the new subsection of `common-observable-purchases.tex` on the terminal fee, floor thresholds and delay.
3. Passages read but not compared with the source declaration by declaration are listed in `part-A/findings.md`, section C. They have not been audited to the standard of the rest.
4. Source structures named but not expanded are marked in the text and listed under "Still uncertain" in both findings files.

## For G06 and neighbouring packages

Open edges with exact statements are in `part-A/ledger.md` and `part-B/ledger.md`. Those most likely to matter for closure:

- `C12-to-C12-served-residual`: passage from the stored record to the served representation, used by `prop:actual-marked-figment`, `lem:actual-grid-basis` and `prop:ex-marked-solaris`. No chapter proves it.
- `C11-to-C12-reserved-addresses`: reserved addresses of the terminal representation (`Nest.born`). No producing statement was located in the manuscript.
- `C16-to-C12-selected-run`: four concrete obligations on the public run (the portfolio sections and regradings are the ones chosen before the schedule; `paper` thresholds at most the floor lengths; `dusk` for the run's delay; \(d+3\le J(t_d)\)). `public-run-binding.tex` states only part of them.
- `unassigned-to-C12-maxwell-ideal`: no chapter states the equation ideal or the potential sequence as a labelled result; C12 now defines them where it uses them.
- `C03-to-C12-fullmesh` and `C03-to-C12-grid-lemmas`, with `C12-to-C03-grid-inputs` in the other direction: the C03↔C12 pair noted in the contract. The statements used were opened and agree; whether the pair of edges is free of a cycle between premises and conclusions was not analysed.
- `C02-to-C12-opened-copy`, `C02-to-C12-marked-estimate`, `C02-to-C12-centered-bound`, `C06-to-C12-slot-estimate`: producers opened and matching the use made here.

Notes for other owners, with locations, are in the findings files: C14 (`actual-equation-kernel-relay.tex` "insertion-site count" should be the seat price and can cite `prop:ex-marked-solaris`; a "grade-preserving" claim), C02 (radius hypothesis of `lem:ex-centered-opened-copy` on the selected run), C11 and C16 as above.

## Not done

No Lean elaboration or axiom query. No change to evidence files, the main include file, the bibliography or shared metadata. Symbol and terminology changes that belong to G05 (source identifiers used as words) were not made; where such a word carries a hypothesis it is glossed.
