# Mathematical blueprint

The blueprint connects the formal theorem to a readable mathematical argument.
The [first-pass outline](outline.md) records the main dependency structure, and
the [provisional unit plan](unit-plan.md) turns the source clusters into proposed
mathematical work packages. Use the shared [glossary](glossary.md) and [notation contract](../docs/notation.md).

The source clusters are adapted from Scott Armstrong's
[Yang-Mills informalization project](https://github.com/scottnarmstrong/yang-mills-informalization).
Preserve that attribution in derivative maps, task descriptions, and published
material that uses its unit boundaries, declaration assignments, or summaries.

The blueprint records the evolving interfaces and verification of a research
monograph. The mathematical text is written directly in `manuscript/` LaTeX;
there is no separate blueprint prose stage and no duplicate Markdown proof.
Only a section's own interface must be precise before it is drafted; outstanding
prerequisite proofs stay explicit.

Keep the full formal dependency inventory separately as source evidence. Only mathematical interfaces
that need explanation or proof become proof units; generated helpers and standard
machinery do not each require a unit. Classify groups according to the
[proof standard](../docs/proof-standard.md) before assigning prose work.

Use [background notes](background/README.md) to share verified literature results
and record how they match the formalisation. Substantive uses still require their
hypotheses to be checked in the consuming proof. This avoids repeatedly searching
for, translating, or reproving the same established machinery.

## Proof units

Each unit lives in `units/YM-<six-digit canonical issue number>/` and contains
`unit.json`, `correspondence.md`, evidence as needed, and eventually `reviews/`.
The mathematical section lives in `manuscript/` and is linked by metadata. Use
[the template instructions](../templates/proof-unit/README.md). A revision or review task keeps
the original unit ID; it does not create a second owner of the same declarations.

`unit.json` fields:

| Field | Meaning |
| --- | --- |
| `id`, `title`, `issue` | Stable ID, mathematical title, canonical task URL |
| `source_revision` | Exact active revision from `source/upstream.json` |
| `status` | `planned`, `draft`, or `reviewed`; separate from the live task status |
| `authors` | Human GitHub accounts responsible for the unit |
| `declarations` | Owned results/definitions, each with `name`, `module`, and `path` |
| `manuscript` | Nonempty list of repository-relative `.tex` and `.bib` paths under `manuscript/`: the section and all local mathematical support files |
| `depends_on` | IDs of conceptual prerequisite units, including planned units |
| `reviews` | `lean` and `mathematics`; each is null or a review record |

Owned declarations are unique across units. Supporting declarations owned elsewhere
are cited in the prose and linked via `depends_on`; they are not added as duplicate
ownership. Standard library/background results can be cited precisely in the prose
without creating an exposition unit for each one, including results implemented
from scratch in the upstream project. `depends_on` lists only other proof-unit IDs;
literature notes are linked in `correspondence.md`. There is no requirement for every formal
dependency to appear in this list or be owned by a unit. A planned unit still requires
a real source declaration and an explicit interface; it is not a guessed theorem.

Each non-null review has `reviewer` (a human account other than an author),
`evidence` (a repository-relative file under this unit's `reviews/`), and
`content_sha256`. Generate the latter after finalising the content:

```sh
python3 scripts/check_blueprint.py --fingerprint YM-000123
```

The fingerprint covers the unit's identity, title, source revision, declarations,
dependencies, `correspondence.md`, and the paths and complete contents of every
file in `manuscript`. It excludes status, author credits, and review records so
acceptance can be recorded without changing the reviewed content. Include nested
inputs, shared mathematical macros and bibliography; reviewers must check that
this explicit list is complete. The checker does not parse LaTeX imports. A shared
support-file edit conservatively invalidates reviews of every unit listing it.
The assembly file need not be listed if it only arranges sections and contains no
mathematical content or notation affecting the unit. Changes to dependency
statements still require a separate assessment of downstream uses.
Review evidence should say which content was checked and disclose agent assistance.

The checker rejects duplicate ownership, unknown dependencies, conceptual cycles,
missing source paths, stale source revisions, and stale or incomplete review
records. It does not resolve Lean names, inspect proof terms, authenticate reviewers,
check the adequacy of prose, or inspect GitHub claims. Those need source tooling
and human review. `reviewed` is local to a unit, not a claim of global completion.

Legacy `proof.md` links may remain as short redirects, but are not proof sources
or review records. Historical evidence must be dated and distinguished from
current verification. Never copy old reviewer approvals onto migrated content.
