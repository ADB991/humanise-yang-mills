# Mathematical blueprint

The blueprint connects the formal theorem to a readable mathematical argument.
The [first-pass outline](outline.md) records the main dependency structure, and
the [provisional unit plan](unit-plan.md) turns the source clusters into proposed
mathematical work packages. Add `glossary.md` through a dedicated task once its
notation has been checked against the source and external map.

The source clusters are adapted from Scott Armstrong's
[Yang-Mills informalization project](https://github.com/scottnarmstrong/yang-mills-informalization).
Preserve that attribution in derivative maps, task descriptions, and published
material that uses its unit boundaries, declaration assignments, or summaries.

The blueprint is the proof structure of a research monograph. Keep the full formal
dependency inventory separately as source evidence. Only mathematical interfaces
that need explanation or proof become proof units; generated helpers and standard
machinery do not each require a unit. Classify groups according to the
[proof standard](../docs/proof-standard.md) before assigning prose work.

Use [background notes](background/README.md) to share verified literature results
and record how they match the formalisation. Substantive uses still require their
hypotheses to be checked in the consuming proof. This avoids repeatedly searching
for, translating, or reproving the same established machinery.

## Proof units

Each unit lives in `units/YM-<six-digit canonical issue number>/` and contains
`unit.json`, `proof.md`, and eventually `reviews/`. Use
[the template](../templates/proof-unit/proof.md). A revision or review task keeps
the original unit ID; it does not create a second owner of the same declarations.

`unit.json` fields:

| Field | Meaning |
| --- | --- |
| `id`, `title`, `issue` | Stable ID, mathematical title, canonical task URL |
| `source_revision` | Exact active revision from `source/upstream.json` |
| `status` | `planned`, `draft`, or `reviewed`; separate from the live task status |
| `authors` | Human GitHub accounts responsible for the unit |
| `declarations` | Owned results/definitions, each with `name`, `module`, and `path` |
| `depends_on` | IDs of conceptual prerequisite units, including planned units |
| `reviews` | `lean` and `mathematics`; each is null or a review record |

Owned declarations are unique across units. Supporting declarations owned elsewhere
are cited in the prose and linked via `depends_on`; they are not added as duplicate
ownership. Standard library/background results can be cited precisely in the prose
without creating an exposition unit for each one, including results implemented
from scratch in the upstream project. `depends_on` lists only other proof-unit IDs;
literature notes are linked in `proof.md`. There is no requirement for every formal
dependency to appear in this list or be owned by a unit. A planned unit still requires
a real source declaration and an explicit interface; it is not a guessed theorem.

Each non-null review has `reviewer` (a human account other than an author),
`evidence` (a repository-relative file under this unit's `reviews/`), and
`content_sha256`. Generate the latter after finalising the content:

```sh
python3 scripts/check_blueprint.py --fingerprint YM-000123
```

The fingerprint covers the unit's identity, title, source revision, declarations,
dependencies, and `proof.md`. It excludes status, author credits, and review
records so acceptance can be recorded without changing the reviewed content.
Review evidence should say which content was checked and disclose agent assistance.

The checker rejects duplicate ownership, unknown dependencies, conceptual cycles,
missing source paths, stale source revisions, and stale or incomplete review
records. It does not resolve Lean names, inspect proof terms, authenticate reviewers,
check the adequacy of prose, or inspect GitHub claims. Those need source tooling
and human review. `reviewed` is local to a unit, not a claim of global completion.
