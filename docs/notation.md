# Notation across proof units and chapters

The [shared glossary](../blueprint/glossary.md) is the canonical notation register for this exposition. It is pinned to the imported source revision recorded in `source/upstream.json` and remains an author draft until independently reviewed. A proof unit states its mathematics in ordinary language, with source correspondence in the blueprint. A chapter may improve the prose, but must preserve the spaces, quantifiers, normalisations and limits established by its source unit.

## Author contract

At the start of each proof unit's **Definitions and notation** section, give a short crosswalk with these columns:

| Symbol used here | Meaning, space and normalisation | Origin | Local conversion or qualification |
| --- | --- | --- | --- |
| A symbol inherited from the glossary | State only the detail needed for this proof | Link the exact glossary entry and dependency unit | Write “none” if unchanged |
| A new local symbol | Define its type and quantified scope | Cite the defining source declaration or mathematical reference | State when it expires and any collision avoided |

List every notation choice that determines a theorem hypothesis or conclusion. This includes gauge representation and Lie algebra, spacetime signature, lattice spacing and period, measure and phase, field grade and quotient, topology/filter of a limit, and the order in which witnesses are chosen. Do not turn Lean binder letters into global notation by accident. A local symbol may be shorter than a glossary symbol when the proof is clearer, but write its conversion at first use and retain one meaning within the unit.

When importing a theorem from another unit or the literature, show the source-to-local map for symbols whose type or normalisation differs. Check hypotheses after conversion. For example, identify whether a cited result uses group simplicity or Lie-algebra simplicity, a finite lattice side count or physical linear period, a full mesh limit or a subsequence, a selected phase or a mixture, and a grade or a scaling dimension. If the map requires a nontrivial lemma, prove it or make it a visible dependency; a notation change does not establish an equivalence.

Use fully qualified declaration names and pinned source paths in the blueprint correspondence table. In the manuscript, use conventional mathematical names and references, not Lean implementation scaffolding or unexplained nicknames. Cite a shared glossary entry instead of redefining it in every chapter.

## Symbol and meaning conflicts

The glossary reserves distinct prose symbols for the public Wilson family `\mathcal W`, the internal construction family `\mathcal C`, the Euclidean table `S`, and the public hierarchy `\mathcal T`. The public field space `F_d` (a quotient field space in the constructed hierarchy) differs from the internal final package `\mathsf F`. The character measure `\nu_{\rm ph}` differs from the Wilson law `\mu_{N,p}^{\mathcal W}`. A short-distance radius `r_k` differs from lattice mesh `a_N`. A physical linear period `P_p` differs from the torus site count `\ell_{N,p}`. A reviewer should reject an argument that changes one of these meanings without a stated bridge.

The public requested volume sequence is `\varrho`; the period component of a
general internal extraction order is `\tau`. They may be identified only in
the explicit assembly step that constructs that order from the public request.

Other source names can collide: `Reader` occurs in more than one namespace; `p` can be a period index, extraction order or unrelated parameter; `n` can be representation size or arity. Qualify the source name in the blueprint and choose a typed local symbol in prose. Reserve plain `\pi` for the mathematical constant. The word “phase” means the formal character parameter unless a separate result justifies a stronger physical use.

A symbol is **local** when absent from the glossary. The author may use it within one unit after defining it, and should send a proposed shared entry to the glossary issue if another unit needs it. Authors must not edit the shared glossary while holding an unrelated proof-unit claim. A glossary entry marked unresolved is a question; do not convert it into a theorem hypothesis or an accepted normalisation by prose convention.

## Chapter integration

Before joining units into a chapter, the integrator checks the following against the unit crosswalks and actual statements:

1. **Same object:** Every repeated symbol denotes the same mathematical space and construction. Distinguish public/internal bridges, reference labels/quotient fields, selected/mixed phases, and Euclidean/Minkowski structures.
2. **Same scale:** Mesh, site count, physical period, RG level, and short-distance radius use their declared normalisations. Couplings and the positive kernel penalty are not silently identified.
3. **Same limit:** State the filter/topology and the order of limits at the handoff. An iterated mesh-then-volume limit does not become an arbitrary diagonal limit; a subsequential result does not become uniqueness.
4. **Same quantified data:** Check which witnesses are chosen once and which may depend on a requested sequence, phase, truncation, compact set or geometry constant.
5. **Same reference:** A literature theorem is quoted in a checked version with its own symbols translated and hypotheses matched. An external glossary or AI outline is navigation evidence, not an accepted mathematical citation.

At first use in the chapter, define any chapter-local replacement for a canonical symbol and give a compact conversion. Keep that replacement consistent throughout the chapter. When adjacent chapters use different local aliases, include a one-line bridge at their join. Do not erase a unit's open question or strengthen its conclusion to make notation look smoother.

## Changing shared notation

`blueprint/glossary.md` has its own issue owner. Propose a new or changed shared entry on that issue (or a new dedicated issue after it closes) with the intended symbol, mathematical type, source revision and declaration, reason for the change, and affected unit/chapter links. The owner checks for collisions and updates the glossary in one focused PR. An integrator then finds all units and chapters that cite the entry and records their conversion or revision tasks.

A purely typographic correction may leave mathematical content intact. A change to a space, normalisation, quantifier, limit order, or claimed bridge is material: it invalidates the corresponding source-to-prose and mathematical review assumptions. Obtain renewed independent review of affected work. The structural checker does not track glossary semantics or automatically refresh reviewer fingerprints. Authors must not refresh another reviewer's approval themselves.

The proof-unit template requires this crosswalk; the independent Lean-correspondence reviewer checks it against the source, the mathematical reviewer checks its use in the argument and literature applications, and the chapter integrator checks consistency between units. This division is a workflow, not an automated guarantee of mathematical correctness.

## Evidence and scope

This protocol implements the notation ownership and integration rules in `AGENTS.md`, `docs/coordination.md`, `docs/proof-standard.md`, and `docs/maintainers.md`. It adds no theorem and changes no Lean source. The glossary currently covers the shared entry points and deliberately leaves most RG local symbols for their assigned interface audits; those agents should propose additions through the dedicated notation task rather than edit the shared file concurrently.
