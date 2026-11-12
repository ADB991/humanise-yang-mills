# C12: common funded history and actual marked calibration (author pass)

- Package: C12, issue [#53](https://github.com/hairer/humanise-yang-mills/issues/53); parent #26. Unit YM-000026.
- Session: `schmittj-claude-c12-20261112`, role AUTHOR. Two Claude author agents on disjoint chapter sets (part A: `common-funded-history`, `original-history-portfolio-attachment`, `selected-course-binding`, `common-observable-purchases`, `marked-campaign-producer`, `selected-centered-service`; part B: `marked-portfolio-calibration`, `terminal-marked-construction`, `marked-field-local-estimates`, `actual-marked-portfolio-calibration`, `actual-phase-grid-approximants`), coordinated by a Claude session. A read-only Codex `gpt-6-astra` pass over every edited hunk was used as an author-side check; its findings and the responses are recorded in each part's `findings.md` under "Second round". None of this is an independent review.
- Status: **author draft, not reviewed.** No approval is recorded. An independent reviewer owns `review/`.
- Base: `codex/existence-monograph` at `18d0327`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Lean was read as text only; nothing was elaborated.

## Where things are

Each part directory has the four records required by the common contract: `part-A/` and `part-B/` each contain `findings.md` (errors repaired, gaps repaired, gaps not repaired, notes for other packages, second-round responses), `ledger.md` (outputs, incoming and outgoing edges with stable IDs), `correspondence.md` (manuscript label to Lean declaration, with hidden definitional choices) and `validation.md`. `handoff.md` in this directory is the summary for the reviewer and for G06.

## Summary of the pass

All eleven chapters were read against the declarations named in their evidence files and edited. The statements' quantifier order, exponents and constants were compared with the source at statement level. The main repairs:

1. `marked-campaign-producer.tex`: the factor lemma compared \(q-a\) with the whole ideal element instead of the term, which is false as it stood; corrected, with the symbol collisions in its proof. "Campaign", "imprint", "microscopic" and the equation ideal are now defined from the source; the generator read, the gauge average and the periodised independence step are written out; the force computation is a direct Euler identity.
2. `marked-portfolio-calibration.tex`: the reserve constant was described as a derivative price times a site count; in the source it is a sup-norm constant times a sum of threshold powers. A schedule identity was attributed to the wrong clause, and a sign hypothesis was used without being stated. The calibration step had no statement; `prop:ex-marked-solaris` now states and proves it, conditionally on the listed inputs.
3. `actual-marked-portfolio-calibration.tex`: the text identified the portfolio section with the family's local section; on the route the source uses they are distinct objects that the calibration compares. The quantifier of the "Music" datum was wrong in two sentences (one pre-existing): it is chosen per degree, level and period. `prop:actual-marked-figment` had undefined quantities and a hypothesis that the source does not have; its inputs are now an explicit record (R1)–(R7).
4. `selected-centered-service.tex`: the public run uses support exponent 100, not \(100+j\); the chapter now keeps the run's stored witnesses instead of choosing fresh ones.
5. `terminal-marked-construction.tex` and `marked-field-local-estimates.tex`: a summary proposition (`prop:terminal-marked-voice`) for facts cited by three chapters; exact remainder bill; corrected pointwise decomposition.
6. Smaller corrections of constants (\(C\ge1\) for \(C>1\)), exponents described by the wrong source field, reference types, and notation clashes that changed meaning.

## What is not done

- Three results (`prop:actual-marked-figment`, `lem:actual-grid-basis`, item (2) of `prop:ex-marked-solaris`) are conditional on the passage from the stored record to the served representation, which the manuscript does not prove (edge `C12-to-C12-served-residual`).
- The reserved addresses of the terminal representation, the fee delay and the floor-length conditions on the schedule, and parts of the record (R1)–(R7) have no identified producing statement in the manuscript; they are stated as inputs and listed as open edges.
- Parts of `common-funded-history.tex` (retention identities, batch and startup paragraphs), of `common-observable-purchases.tex` (from "differentiated output" onward) and of `selected-centered-service.tex` (history choice, wing and freight paragraphs) were read but not compared with the source declaration by declaration. They are listed in `part-A/findings.md`, section C.
- Several inner source structures were not expanded and are marked as such where they are named.
- No cross-package edge is closed: producers in C01, C02, C03, C06–C09, C11, C13, C16 and consumers in C03, C05, C13, C14 were opened only at the cited passages.

## Validation

- Full build: `latexmk -cd -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` from `manuscript/`: exit 0, 883 pages, no undefined references, no multiply defined labels, no overfull boxes (the base had 878 pages).
- Scoped wrappers for each part were built and the changed pages inspected as images (lists in the part `validation.md` files).
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units.` `git diff --check`: clean.
- New labels: `prop:ex-marked-solaris`, `eq:ex-marked-height-jump`, `prop:terminal-marked-voice`, `rem:marked-campaign-mixed`, and those listed in the part validation files. No label was removed or renamed.

## Content hashes

| Chapter | SHA-256 at start (`18d0327`) | SHA-256 at handoff |
| --- | --- | --- |
| `common-funded-history.tex` | `fb0c5d7126595ba7d49520766021c4d6ec73e439c93839c195c186100d63348b` | `815fc239c1483a174de756051f5611a6559642d8bd4caa38a91928e000e9aec0` |
| `original-history-portfolio-attachment.tex` | `ec9e030a3604be99a5892b437a84618eaae99cbd460a8669d115d8ac23de6fef` | `fef46786874e9ba76d56c2c6f8e836d8a113240d9f0911896bfa7010a47e09b6` |
| `selected-course-binding.tex` | `4e653d2415ae0f160a865ec3af41aedb92358940dde19319308fead739f2d102` | `1ef92935bb856be1b25db8bc1e913e5b7a4bc9d7898f01c3f5fef98be80b4f05` |
| `common-observable-purchases.tex` | `d0150c0f0ab3c24e8e3de691c45b9b368a4901003719c6d829623e90294e188e` | `256ff60ad0b31cfb1116686f4e98629ab268da40f39f2b6d4633899c647d541c` |
| `marked-campaign-producer.tex` | `17e48ef653b6b753ac7d278bc4d0cf50699c9b5b229f906da18e8d5d1404e880` | `140547288df6d91622db5d8042714349cf1e85f670f4e2a49424c71dd02b1c41` |
| `marked-portfolio-calibration.tex` | `cd4417f4e6fa22970682e31ec85460532782422c351128223980237e74e347b3` | `97869cb5f5b5b402281362734be9159e8ab6d4c5f6f9e8b9d7958979042dfc9b` |
| `terminal-marked-construction.tex` | `8ee1de534ce04b5d0c0dd8fd354e13e5367ecc05e4433e25cbfaf646df8fc0d7` | `c3c0f04355c216308c879c8ab8571516773a2fcf885f24efe937321e164d728d` |
| `marked-field-local-estimates.tex` | `50812262fd16bc4dc603a8513140d5161e26810f6023faecaec54731a0e2e7ba` | `6f5478f083654e9cfc6738d2ecee39bb68ec9913c433a50d48ceb5a552516a30` |
| `actual-marked-portfolio-calibration.tex` | `94a92748ef87edf19c4810cc6bb8c90c2cec2ef7b498eceb6132120a0dcf457f` | `a705ca6b8d2c6d52f1dcf9ee175648c00bda28af96ff2c52cc86358af1192073` |
| `selected-centered-service.tex` | `ea1ccdec549ae7fbd2335afa6295654f3619c24c4f6872afdffc9fec775b440e` | `a0f67509924084789df705de7eb8c7b40e63ad945c94ba30134d55a3842341e1` |
| `actual-phase-grid-approximants.tex` | `5f2b6050ae320e61cb0fdeada14bd07080d4ae31d162b7e2bb3fd3233ab4f685` | `243e556604d48e55bb7eb6b94d33af0392d8ca0c5d38b342768d0bebb4811993` |

The canonical evidence files `blueprint/units/YM-000026/*-evidence.md` were not modified and describe the text before this pass.
