# Source-leakage audit of the manuscript (report only)

- Issue [#159](https://github.com/hairer/humanise-yang-mills/issues/159); parent #26, unit YM-000026.
- Session `hairer-claude-source-leakage-20261113`. Claim: https://github.com/hairer/humanise-yang-mills/issues/159#issuecomment-6858380544 (until 2026-11-14 12:00 UTC). Prepared by Claude (Anthropic) for @hairer.
- Base: `codex/existence-monograph` at `97128ab`. Scope: the 242 chapters `\input` by `manuscript/existence.tex`, plus `pilots/running-coupling.tex`. Comment lines are excluded.
- Files:
  - `inventory.tsv`: every hit, with its class;
  - `proposed.patch`: the mechanical replacements;
  - this report.

## Method

Each non-comment line was matched against five patterns:
- the words "source" and "sources";
- `\texttt`;
- `.tex` or `.lean` file names;
- dotted identifiers of the form `Capital.lower`;
- the Lean expressions `C.S.` and `C.path`.

This gives 413 lines in 89 files. No line mentions "Lean". Each line was then classified by reading it, with its neighbouring lines where needed.

| Class | Meaning | Lines |
| --- | --- | --- |
| **N** | Mathematical use of the word, not leakage: an affine source, a source vector or row, the source term of an equation, the source link of an edge, "single-source" allowances, and labels containing `source` | 142 |
| **B** | A remark about the formalisation. It says how the source names, packages, normalises or routes something ("in the source …", "the source crosswalk", "the source's … record"). The content belongs in the blueprint correspondence. In the text it should be deleted, or rephrased without the source. | 109 |
| **J** | **The argument defers to the formalisation**: "the source proves …", "the source obtains …", "the source constructs …", "… is the source's … formula". The sentence supplies a step of the proof, or of a construction, by pointing to the source rather than proving it or citing literature. Under `docs/proof-standard.md` these are gaps or outstanding inputs. They cannot be fixed by rewording. | 76 |
| **T-patched** | A file name, raw label, blueprint unit ID or Lean expression printed in the text, with an exact replacement in `proposed.patch` | 21 |
| **T-open** | A Lean name used as mathematical notation, whose meaning the text does not define: `Parterre.inviting`, `Figment.figment`, the record `Volant`, the "Yeast record", `Aff.weight`. The name cannot be replaced until the object is defined. | 12 |
| **?** | Unclear from the line and its immediate context; left to the owner | 53 |

The classification was made line by line, with limited context. It is a first pass for the chapter owners, and every B, J and ? row needs their confirmation. No N line is patched.

## Main finding: arguments deferred to the formalisation (class J)

76 lines in 27 chapters rely on the formal source for a step. The heaviest are:

| Chapter | J lines |
| --- | --- |
| `trace-calibration-producer` | 14 |
| `path-attachment-producer` | 8 |
| `trace-small-means` | 6 |
| `phase-quantitative-producer` | 5 |
| `marked-field-local-estimates` | 5 |
| `centered-public-service`, `actual-marked-portfolio-calibration`, `trace-bill-prices` | 3 each |
| 19 further chapters | 1–2 each |

Typical forms:
- "The source proves $w_i\to x$, weighted decay of …" (`trace-calibration-producer.tex:193`);
- "The source obtains the first two subpower estimates …" (`phase-quantitative-producer.tex:244`);
- "Indeed this is the source fine-price formula with …" (`centered-public-service.tex:28`).

Some of these sentences say explicitly that the step is an input, for example "remain source inputs" (`trace-calibration-producer.tex:129`). Those are honest, but the input should be stated as a mathematical hypothesis, not by reference to the source. The others present the source as the justification. Each J row should get one of two outcomes from its owner:
- a proof in the text, or a precise literature citation;
- a restatement as an explicitly named outstanding input.

**G06 should treat the J list as a checklist of possibly unproved premises.**

The T-open items are of the same kind. `actual-marked-portfolio-calibration.tex:351–356` says that a door "has the multi-marker offer property of the source (the record `Volant`) … This property is named from the source field; its content is not expanded here". The proof therefore rests on a property that the text never defines.

## Proposed patch (T-patched)

`proposed.patch` changes four chapters, all under no live claim. It replaces:
- the cross-references to the external units YM-000033 and YM-000034, which were printed as file names, raw labels and blueprint unit IDs, by `\ref`/`\eqref` to the same labels (`trace-scribe-producer.tex`, `trace-asymptotic.tex`, `trace-weighted-estimates.tex`);
- the unused definition `A_j=C.S.a(j)`, which it deletes (`trace-crown-buffer.tex:21`; $A_j$ occurs nowhere else in that chapter).

No mathematical content changes.

**Integration dependency.** The new references point to `trace-prosper-sensor.tex` and `trace-branch-moments.tex`, which `existence.tex` does not include yet. The patch must therefore be applied together with F01's inclusion of those two chapters; applied alone, it leaves undefined references. Test performed:
- the patch on `97128ab`, plus `\input{existence/trace-prosper-sensor}` and `\input{existence/trace-branch-moments}` inserted immediately before `\input{existence/trace-scribe-producer}`;
- `latexmk -g -pdf -interaction=nonstopmode -halt-on-error`: exit 0, 993 pages, 0 undefined references, 0 multiply defined labels; the only warning is the existing `amsmath` `\atopwithdelims` notice;
- the replacements were checked in the PDF text (pages 952 and following), and no `??` appears.

The include position is the reviewer's suggestion for F01, not part of this patch. G05's order does not yet place the two units.

Base hashes of the patched files (SHA-256 at `97128ab`):
```
c20605af5cba507c600463a41a97b62884203701f87fb903c0bdcc78994ac738  manuscript/existence/trace-crown-buffer.tex
9a805ba11d8a56a2fa7892258bbb65e6730650a8b25e83eb16693440cbe5b96a  manuscript/existence/trace-scribe-producer.tex
ccb50cdba852e470937cd038c3524f2a24a02c6624cbca884b8a1753d1d167c2  manuscript/existence/trace-asymptotic.tex
c1d181d871c298b83e3bc29c984c0699243f75fcc5d6f5d3edb6fbe3746b2e3f  manuscript/existence/trace-weighted-estimates.tex
```

## Not done, and why

- **No rewording patches for B, J or ?.** The issue asked for exact replacements for these as well. That turned out not to be safe as a mechanical pass. Many B sentences carry a caveat that matters to the argument (for example "the proposition is stated under weaker hypotheses than in the source"), and deleting them would lose information unless the same caveat moves into the blueprint at the same time. J sentences cannot be reworded at all. These need the chapter owners. Suggested follow-up: one bounded task per owning package, using the rows of `inventory.tsv`.
- **Chapters under the open PR #157** (`phase-quantitative-producer.tex`, `fullmesh-fixedbounds-producer.tex`, `reflection-transport.tex`, `actual-slab-copy-bounds.tex`) are inventoried at `97128ab` only. Their rows may move once #157 merges.
- The B lines include the closing paragraph of `inherited-loop-transport.tex` (rows 126–127), which this account added in C10 revision 3 (#155) at a reviewer's request. That paragraph follows the chapter's existing convention. If the project adopts this audit's convention, it should move to the C10 correspondence as well.
- The pattern list misses Lean identifiers without a dot or `\texttt` (for example `\operatorname{cheque}`, `\operatorname{radiusB}`, `\operatorname{fiery}`, which may be source names). A separate pass with a vocabulary of the source's declaration names would be needed to find them.

## Commands run

- An inventory script (Python, standard library) over the `\input` list of `existence.tex` plus the pilot; output `inventory.tsv`.
- `git apply --check proposed.patch` on `97128ab`: passes.
- The scratch build described above.
- `python3 scripts/check_blueprint.py`: `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`; `python3 -m unittest discover -s tests`: OK.
