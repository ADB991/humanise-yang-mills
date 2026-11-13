# C11: background paths, reset and Wilson startup (author pass)

- Package: C11, issue [#52](https://github.com/hairer/humanise-yang-mills/issues/52); parent #26. Unit YM-000026.
- Session: `schmittj-claude-c11-20261112`, role AUTHOR. Method: four read-only Codex `gpt-6-astra` audit passes over all sixteen chapters; then two Claude author agents on disjoint chapter sets, who decided every audit item against the LaTeX and the Lean text and made the repairs (part A: `free-horizon-convergence`, `background-path-convergence`, `coupled-background-convergence`, `background-ray-estimates`, `background-test-prices`, `projected-parameter-prices`, `sector-analytic-prices`, `real-coupling-interpolation`, `five-period-localization`; part B: `coupling-reset-selection`, `physical-reset-reorganization`, `selected-nonlinear-offering`, `surviving-interval-shooting`, `path-attachment-producer`, `terminal-normalization-transfer`, `wilson-startup-construction`); then a second Codex pass over every edited hunk, whose findings and the authors' responses are recorded in each part's `findings.md` under "Second round". Coordinated by a Claude session. None of this is an independent review.
- Status: **author draft, not reviewed.** No approval is recorded. An independent reviewer owns `review/`.
- Base: `codex/existence-monograph` at `1749b55`, rebased onto `80be46a`. Source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Lean was read as text only; nothing was elaborated.

## Where things are

`part-A/` and `part-B/` each contain `findings.md` (errors repaired, gaps repaired, gaps not repaired, the table "Audit items and decisions", second-round responses, notes for other packages), `ledger.md` (outputs, incoming and outgoing edges with stable IDs), `correspondence.md` and `validation.md`. `handoff.md` in this directory is the summary for the reviewer and for G06.

## Summary of the pass

All sixteen chapters were read against the declarations named in their evidence files and in the audit. Main repairs:

1. `path-attachment-producer.tex`: four errors (the incoming path is attached to the fine bed, not the coarse one; the Wilson orders are 2, 3, 4; the cubic and quartic coefficients are classical stationary-value coefficients, not determinant coefficients; stage and level indices in the loop threshold). The Hessian gap is period-uniform, which the text had denied. New `def:path-admissible`, `def:path-plan` and `prop:path-retained-plan`, with a proof following the source that includes the base-path width ceiling and price floor.
2. `physical-reset-reorganization.tex`: proof that the affine Hessians depend only on the curl; the clip conditions; `lem:reset-absorption-continuity`; the stage constants with the allocation \(c=1/(64(1+B^{\rm reset}))\) (`eq:reset-stage-constants`); the passage that called a singleton-masked variant a specialisation of a C06 result is corrected.
3. `wilson-startup-construction.tex`: `prop:wilson-startup-family`, which states the startup family including its reserved labels; the proof internals for the reserved labels were read in the second round.
4. `terminal-normalization-transfer.tex`: standing data and `prop:terminal-replacement`.
5. `background-path-convergence.tex`: the selected subspace was misdefined; a detection principle that had been a one-line appeal is stated and proved; hypotheses and conclusion are now a subsection.
6. `projected-parameter-prices.tex`: wrong path rows were said to scale, and the payment inequalities were stronger than the payment they cited. The payment is relative to the forecast; the chapter now states two named inputs (`eq:projected-forecast-inputs`) and derives the inequalities from them.
7. `sector-analytic-prices.tex`: the exponential mark is the seed mark, not the warning gain.
8. `selected-nonlinear-offering.tex`, `coupling-reset-selection.tex`: exported return and budgets with their exponents; recipe compatibility stated with the pre-absorption batch and its certificate; the boundary estimate applied to the centred short total.

The second Codex pass found one regression, three errors and five gaps in the first-round edits. All were confirmed by the authors against the source and corrected; they are listed with the corrections in the findings files. No edit had to be reverted to the original text.

## Edges to C12

The C12 author pass recorded inputs expected from C11 without a located producer. After this pass:

- `C11-to-C12-reset`: produced (`eq:reset-stage-constants`, also stated in `background-test-prices.tex`).
- `C11-to-C12-startup` and `C11-to-C12-reserved-addresses` (at the terminal level): produced by `prop:wilson-startup-family`.
- Terminal normalisation: produced by `prop:terminal-replacement`.
- `C11-to-C12-stationary-paths`, `C11-to-C12-offering`, `C11-to-C12-free`, `C11-to-C12-sector`: produced conditionally on inputs listed in the ledgers.

## What is not done

- Inputs stated explicitly and not produced by any located chapter: the forecast inputs `eq:projected-forecast-inputs`; existence of the constant in the two forced payments; a strengthened startup bound (terminal \(1/8\)) for the coupled convergence; the auxiliary-period stationary service and the forecast-specific forced purchase of the offering (edges `unassigned-to-C11-auxiliary-service`, `unassigned-to-C11-forced-purchase`); finite-step data for path convergence; local continuity.
- Incoming edges from C10 (annulus, one-step), C01 and C12 (horizons), C16 (drift ratio, loop capacities, entry thresholds), C12 (recipe prices), C09, C08 and C06 were opened only at the cited passages.
- Declarations not opened are listed under "Still uncertain" / "Not checked" in the findings files (among them `Tent.columns`, `Cash.armK`, `Pairing.currency`, `kGoal`, `Boulevard.rising`, `Paintings.Supply`, `beckon`).
- Source identifiers used as words remain in the path chapter; renaming belongs to G05.
- `C11-to-G02-running` was not addressed.

## Validation

- Full build after the rebase: `latexmk -cd -pdf -interaction=nonstopmode -halt-on-error -outdir=<scratch> existence.tex` from `manuscript/`: exit 0, 918 pages, no undefined references, no multiply defined labels, no overfull boxes.
- Scoped wrappers for each part were built and changed pages inspected as images (lists in the part `validation.md` files; not every changed page was viewed).
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units.` `git diff --check`: clean.
- New labels are listed in the part validation files. No existing label was removed or renamed.

## Content hashes

| Chapter | SHA-256 at start (`1749b55`) | SHA-256 at handoff |
| --- | --- | --- |
| `free-horizon-convergence.tex` | `ce467cda16c7ddbc41f118596ec61aeadcbe8df7767be5c66c9b5563c8770e7c` | `b18ec3280bf190c184122d7f2e4bd53874906d4acea0dfe0885fb7b8a9efc754` |
| `path-attachment-producer.tex` | `90587cfacf405b4f84e4bbf23c63ecf3b27731cf4d558f47ef4b6e69510d3f56` | `68ff804accb442f7fba609c60c57b1fc184c5c4d4e4c1faa0000af6589cc021d` |
| `background-path-convergence.tex` | `a1ad1cb45ca9154c1758d788af61e0e3ce4a110fe1accc12c5d48fd3a38d80df` | `bd618520853a2cf14f99e10bd04b56dc3667129b95357c982fb73018aef6e3c4` |
| `real-coupling-interpolation.tex` | `d956958055a2acb0596fbfc29c8c2f1de26210c5b2fcaa6b365024481c3a805d` | `75a4926195a59e6d80fc5a0feae08db567057436e41f3609745d7835de20ed1a` |
| `sector-analytic-prices.tex` | `af27aea208c8ed80d25737eed1e1450b6565de3c9b4c516bdf5e669bbb72659f` | `93d6607de8bee24c1f96e217ca7bf8d49d5a11c011719953ecce936f34be0a51` |
| `five-period-localization.tex` | `9c3622d6fa3adfe3ff3b34aecb22d124bf7e82dd5e7807425518d88937473d36` | `e49662c03954ffefbee715576fa78f161e96dd7c1affc1e324fbeaafc441b35f` |
| `projected-parameter-prices.tex` | `d870cd896bd640223134014fc3a4ab9dae4e31b8f858594b46bfef66a461c254` | `21fc47db5ef0804fe5905b0724d0b7fa2c5d8fc082314f9d91ac33f222407d23` |
| `background-test-prices.tex` | `0d4274dd682023e0dce5f5ff01c2046c7299ee0ee487283c17480e3621d0c468` | `b2d1ac1c59746637fdab532367dce5a37515cf59182442e04dde8afbf6a13567` |
| `background-ray-estimates.tex` | `f78dd6cd65aa62147bb5d8fab043564ce855a62a91300be9b5eb1ff59a4d0212` | `3e62814da26f396922cca1a253b2a5e872601acdd83da78deae8262139accdea` |
| `coupled-background-convergence.tex` | `a06efa35b5a7d76f5fe9ee3220aff5813114bfb38b84b3996ed74760ec4c100d` | `ab2a661082b3466ddc8425bc7141da76bcaf8a6f3c9a85d8553a83813a8082ea` |
| `selected-nonlinear-offering.tex` | `8de3f86d16fd386ae1d38d8a25a49b397d3b85c74701caa8637cf430143bacd3` | `3f4df156e00f860c86a8bb04ae9f8ea17311482b5e64272eb38fad79896cf243` |
| `physical-reset-reorganization.tex` | `0ccb6c1fe0dc0536f8bf5655c253d80d38ab90ca489a4749fdf40a95fe96a5e2` | `47085cc0d4645b9583c9e5ad189e1b91cad31344a4869b9d635e500bcbd19622` |
| `coupling-reset-selection.tex` | `45318f4fb3ba9c65926dc99c096d979bd2a9be7799b19786f7dab712bf643fe3` | `3b442a584e76c09c9c028fbd2f693a0970ecb62dadc25233c9570b84cdeefa3a` |
| `surviving-interval-shooting.tex` | `13aab4c33c522d614f963e664dfde0f5089f8b2b5637381e098cf2bf62b0533b` | `1b7f5c4e91d7a8c4c76ef066d9b25d07d79330a1c9936e18c403769d7f2492ab` |
| `terminal-normalization-transfer.tex` | `83ca6fe75f046c2e322b8597516d35a6e2fd6ea55142dbde681997f930af37b4` | `07c03596d8c1459fc1aa9a8cfb041c5f3bc7d4080fa3df1f11c8848da70f0082` |
| `wilson-startup-construction.tex` | `d00d44fa7a020afa4683ca20b61291f115795c664f24e311edbab32cdb36015c` | `7120f4648e48b4af4dd547bf64d522b1e862f2b77b0e4a0711e9dc4a99eef787` |

The canonical evidence files `blueprint/units/YM-000026/*-evidence.md` were not modified and describe the text before this pass.
