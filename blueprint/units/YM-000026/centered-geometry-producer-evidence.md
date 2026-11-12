# Opened site geometry producer: evidence

Status: author draft; independent mathematical and source-correspondence review
pending. Pinned source revision: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

## Scope

The manuscript is `manuscript/existence/centered-geometry-producer.tex`.
It proves the opened-copy construction of the migration, occupancy, and
separated-origin inputs needed by the finite-volume centered moment route. It
does not produce marched weights, paid response estimates, the terminal
service receipt, or vacuum prices.

## Correspondence

| Assertion | Pinned declarations / files | Inspection notes |
|---|---|---|
| Open schedule and aligned sublattice | `YM.Stock.Tabs.opens`, `.open_later`; `YM.Cells.center`, `YM.Cells.Mix.camp`, `YM.Cells.copy_home`; `Lean/YM/Overlay/Prior.lean`, `Lean/YM/Cells/*` | The source defines `Tabs.opens i j` by `i≤j` and `s * coverSize(j)^2 ≤ a_i/a_j`. `Tabs.open_later` propagates this opening to later levels using `coverSize(j+1)^2≤2 coverSize(j)^2` and block ratio at least 3. At parameter one the initial bound is `B_k^2≤a_m/a_k`; exact adjacent ratios then inductively give `B_j^2≤a_m/a_j`. Adjacent integer side ratios compose exactly, and `camp` is the canonical ratio embedding after the opening. |
| Ratio embeddings compose and preserve ancestry | Private `embed_comp` and `YM.Work.I03.camp_step`; `Lean/YM/Work/I03.lean` | Exact divisibility identifies the composite ratio count with the product of adjacent counts, so the canonical embeddings agree. The resulting step identity gives `embed_j(o_j(x))=o_{j+1}(x)`, equivalently `parent(o_{j+1}(x))=o_j(x)`. |
| Separation and injectivity | `YM.Work.I03.answer`; `YM.Corona.below`; `Lean/YM/Work/I03.lean`, `Lean/YM/Corona/Spend.lean` | Distinct coarse sites have max periodic separation at least one. In each coordinate choose a centered integer representative of the difference; multiplying it by the exact ratio keeps it centered in the larger periodic side, including half-side ties. Thus the max periodic separation scales by exactly the integer ratio, and the opening induction gives `B_j^2≤sep(o_j(x),o_j(y))`. Positivity of the right side makes the copy map injective. This is the arithmetic proved by `Corona.below`. |
| Terminal copy identity | `YM.Bid.I03.ticket`; `YM.Work.I03.answer`; `copy_home`; `Lean/YM/Bid/Fuels.lean`, `Lean/YM/Work/I03.lean`, and cell construction dependencies | The ticket's first field identifies the centered root copy map with `camp` at the terminal level. `camp` is the same aligned embedding used in the manuscript. |
| Occupancy and geometric input to the public moment route | `YM.Extra.Multi.Occupancy.of_injective`; `YM.MergeProof.Accent.tentF`; `Lean/YM/Extra/MULTISOURCE_BOUNDS/Root.lean`, `Lean/YM/FullVolume/Dusk/Tackle.lean` | `tentF` uses the root sites as the finite name set, obtains injectivity from the copy-spacing field, and converts it to occupancy at most one. Its hypothesis `1≤r_j` upgrades that to the requested occupancy bound. The same separation field is packaged as the `Drake` input at the opened scale. |

## Public consumer and limits

The selected root-test consumer `Accent.tentF` builds the site family by
centering a single root cell and taking its copy names. The source calls the
geometric interface with opening parameter one, derives spacing by `I03`,
uses injectivity for occupancy, and passes migration/occupancy/Drake into
`Accent.occursT`. The downstream multiscale propagation of those geometric
facts under Brine weights is separately proved in the centered-construction
chapter. The remaining independent inputs to that consumer are the selected
weight/paid-size, service, and vacuum-price data.

## Checks

- Inspected only the declarations and immediate dependencies listed above;
  no Lean source was changed and no Lean build was run.
- The combined wrapper `/tmp/ym-centered-fragment.tex` compiled successfully with `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/ym-centered-fragment-build /tmp/ym-centered-fragment.tex`, producing 36 pages. Pages 35–36 were rendered and inspected; page 35 contains the end of the two-page geometry lemma. The wrapper has 11 unresolved references from omitted OPE, lattice rate/step, and column-subpower units.
- No literature reference applies to this project-specific lattice embedding
  argument.
