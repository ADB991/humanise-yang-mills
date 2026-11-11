# Standard for an English proof unit

A proof unit provides the detailed proof of one coherent mathematical result or
construction, using existing results wherever possible. The final output is a
research monograph for mathematicians with the prerequisites stated in its outline.
Readers should be able to check the argument without knowing Lean or consulting
its tactic scripts. Write the mathematical text directly in modular LaTeX files
under `manuscript/`, from the first draft. Keep a linked blueprint record for
correspondence, dependencies, questions and evidence, without copying the proof.
Begin with precise local interfaces, even when upstream proofs are still pending;
state those inputs and track their status. Do not wait for a complete blueprint.

## Proof detail and use of the literature

The monograph must give the complete mathematical argument. State the constructions,
reductions, estimates, and substantive intermediate steps, and justify how they
combine. Explaining the new ideas or stating a sequence of claims is insufficient.
Every substantive step must be proved in the exposition or supplied by an
applicable, precisely cited result. Proofs supplied by such references need not
be reproduced, even when the Lean source develops them from first principles.

Before writing a proof, search the shared literature notes and relevant original
sources for a result that can be used. Make a reasonable, focused search rather
than assuming that unfamiliar formal code represents new mathematics. Record useful
searches and unresolved leads so subsequent agents do not repeat them. Failure to
find a reference does not establish novelty or excuse a missing proof.

For each substantive cited result:

- State the version needed in the project's notation. Give an identifiable source
  and a theorem, section, or page locator, including the edition/version where relevant.
- Read the source statement and check its hypotheses and definitions against the
  present setting. A title, search snippet, or remembered theorem name is insufficient.
- Explain the application and verify its hypotheses. Prove any extra argument,
  specialisation that needs justification, or strengthening the source does not cover.
- Identify unresolved mismatches explicitly. An approximate reference cannot stand
  in for a required proof. Check that the cited result does not presuppose the result
  under construction or otherwise introduce a circular argument.

Record reusable matches in [background notes](../blueprint/background/README.md)
at the level of a mathematical result or package, not one note per helper lemma.
Routine elementary reasoning may be compressed in the usual monograph style;
do not bury a substantive gap in the word “standard”.

## Decide what requires exposition

Classify mathematical interfaces or coherent groups of declarations before assigning
writing tasks. A single source file may contain several different categories.

| Treatment | What goes into the monograph |
| --- | --- |
| Prove | A detailed argument for the steps not supplied by cited results, whether or not those steps are novel |
| Cite and apply | The needed statement or reference, verified hypotheses, and its application; further details only where required |
| Suppress formal scaffolding | No discussion of coercion plumbing, generated helpers, tactic infrastructure, or similar implementation details; retain any mathematical content they encode |
| Unresolved | A visible classification or proof question until the content and required treatment are understood |

The full formal dependency graph remains useful for source verification. The
expository graph ends at accepted literature results and the stated reader
prerequisites. Once a standard interface has been identified and checked, there is
no obligation to translate its internal Lean proof. This editorial boundary does
not remove its transitive dependencies from the formal source audit.

## Required content

Items 1–4 belong in the authoritative LaTeX text. The blueprint's
`correspondence.md` links its labels and records items 5–7, literature-search
evidence and dependency status. Audit details need not interrupt the mathematics.
The unit's `manuscript` list includes every local file supplying its mathematical
text, notation or bibliography; the checker fingerprints those files as well as
the correspondence. Reviewers check the list is complete, including nested inputs.
A shared file change conservatively invalidates each unit that lists it.

1. **Purpose and statement.** State the result and why it is needed. Spell out
   quantifiers, hypotheses, spaces, normalisations, and what the conclusion means.
2. **Definitions and notation.** State the mathematical meanings, spaces and
   conventions. Reuse the project's glossary; record the meaning-determining
   formal definitions and instances in the blueprint crosswalk.
3. **Dependencies.** Name previously established proof units and precise external
   results, including hypotheses needed here. State outstanding inputs explicitly;
   keep links to shared literature notes and review status in the blueprint.
4. **Argument.** Give the mathematical steps and their justification. Explain the
   key construction or estimate. Prove substantive steps in detail, invoking
   verified literature results where available and checking their applicability.
   No unexplained substantive leaps.
5. **Correspondence.** Map the English statement and major steps to fully qualified
   declarations, paths, and the pinned source revision. Distinguish direct formal
   dependencies from a reorganised argument proposed by the author.
6. **Open questions.** Identify unresolved interpretations, missing arguments,
   unverified literature references, and limitations. Write “None identified” only
   after checking, not as a placeholder.
7. **Evidence.** Record inspection/build commands, outputs or log paths, and what
   they establish. Mark checks not performed. A summary of a tactic script alone
   is insufficient evidence of a mathematical explanation.

Keep source correspondence, classification decisions, and audit evidence in the
blueprint; the manuscript presents the proof and its conventional mathematical
references. Reordering the exposition, grouping helper lemmas, and invoking an
applicable literature theorem in place of its formal implementation are expected
editorial work. Any additional argument not established by the formal source or
the cited results must be identified and reviewed as a separate proof obligation.

## Two review questions

**Lean correspondence:** Are the definitions, quantifiers, assumptions, and claimed
conclusions faithful to the pinned source? Do the cited declarations exist and
actually support the stated steps? Were hidden instances and coercions inspected?

**Mathematical validity:** Does the English argument follow from the stated
hypotheses and dependencies in sufficient detail for a research monograph? Can a
reader check the substantive steps without mentally executing Lean tactics? Have
applicable existing results been sought, and do the verified references actually
supply the steps attributed to them? Are any uncited steps only sketched?

An independent person can perform both roles if qualified, but an author cannot
approve their own unit. Agent assistance is disclosed; a human reviewer takes
responsibility for acceptance. Model diversity is useful for error discovery,
but agreement between agents is not itself evidence of correctness.

Use the [review template](../templates/review.md). Store review evidence beside
the unit under `reviews/`, in a separate file for each role and review issue.
Concurrent reviewers write their own reports; the coordinator combines their
accepted records in `unit.json` so reviewers do not compete to edit that file.
The metadata records reviewer identity, evidence path, and the content fingerprint
returned by the checker. Changed prose, declarations,
or dependency interfaces require renewed review. CI checks the record and its
fingerprint, not the identity or mathematical competence of a reviewer.

`planned` means an interface is reserved; `draft` means an explanation exists;
`reviewed` means the local unit has both reviews. Local review can be conditional
on clearly stated dependency results. It does **not** mean those dependencies or
the entire Yang–Mills argument have been verified. Integration must check that the
target's mathematical dependencies are covered by detailed proofs, applicable
literature results, or the explicitly stated reader prerequisites. It must also
re-evaluate uses of changed dependency statements.

## Source audit and scope

Audit the actual final statements before attaching a physical interpretation.
Record dimensions, gauge groups, hypotheses, the construction of the theory,
and the precise axioms or properties established. Treat any mass-gap claim as a
separate statement to locate and examine, not something inferred from the title.

For target declarations, capture transitive `#print axioms` output and inspect
the theorem's elaborated type and relevant definitions. Incomplete proofs and
nonstandard axioms require explicit accounting; native-computation trust depends
on the pinned Lean version. An axiom audit does not detect an inappropriate
theorem hypothesis or a definition that misses the intended mathematics.
Use the pinned version's supported checking tools and record their limits.
See the official [validation guide](https://lean-lang.org/doc/reference/latest/ValidatingProofs/)
and [axiom reference](https://lean-lang.org/doc/reference/latest/Axioms/).
