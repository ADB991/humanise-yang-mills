# Integrated exposition

The target is a research monograph giving the full mathematical argument in detail.
Chapters belong here once the blueprint supplies reviewed material. Integration
is a separate task: explain the main ideas, present the detailed proofs, harmonise
notation, connect the units, and check the hypotheses where results are combined.

Find and cite applicable existing results wherever possible. State the version
needed, verify its hypotheses in the present setting, and prove any extra steps
or variants. Standard machinery implemented from first principles in Lean does
not need a parallel proof in the monograph. All substantive steps not supplied
by applicable references must receive an adequately detailed argument.

Set the reader's prerequisites explicitly. Use conventional mathematical notation
and bibliography. Lean identifiers, source crosswalks, build logs, and classification
notes stay in the blueprint or an optional technical appendix. The chapter structure
follows the mathematics; it need not mirror the source files or helper declarations.

Keep links to the canonical proof units and source revision. Mark any use of a
draft result explicitly. Do not label the manuscript complete until its substantive
dependencies are covered by detailed proofs, applicable references, or stated
reader prerequisites, and the whole argument has been reviewed. Translation of
every declaration in the formal dependency closure is not required.

The initial writing format is Markdown with LaTeX mathematics. Choose the final
publication format after the pilot; avoid maintaining independent versions of the
same proof in Markdown and LaTeX.
