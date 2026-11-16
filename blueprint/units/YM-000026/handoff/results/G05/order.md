# Chapter order and dependency audit: working proposal

**Refreshed basis:** `b13f2ef462ee35a0329a5e1256daf49a31e82c84`. The earlier base reading-order proposal below is historical; `proposed-total-order.md` and `order-exceptions.md` give the new explicit candidate and its statement splits. The referenced open mathematical obligations are not resolved by reordering.

This is an editorial ordering proposal, not a verified topological sort of the
proof. `chapter-inventory.json` gives one reproducible complete **base reading
order**: its `order` fields are exactly the 241 inputs in `existence.tex`.
That sequence is the provisional order for this draft, with the following
requirements before it can be called dependency-respecting:

1. Keep the statement first as an explicitly forward-looking target; define
   `Λ_{N,p}` and its embedding before its first use there. A target preview is
   not a proof premise. The finite lattice definitions and normalization follow
   (`ex-lattice`, input 2).
2. Present definitions and finite tools before the local consumers that use
   them. One checked example is `sec:seed-tree-patch` (input 67), then
   `sec:packet-annulus` (71), then `sec:sector-gram` (72): the last chapter
   explicitly fixes the former's seed, tree, tags and comparison. This is a
   local ordering constraint, not verification of the whole sector theorem.
3. Separate the **public construction's early choice** from its final assembly.
   The construction family and numeric/non-numeric choices must be bound before
   a requested period sequence; the later `public-run-binding` and final
   `ex-assembly` cannot be moved wholesale to the beginning merely because an
   early step needs one of their definitions. Extract an early statement of the
   exact choice contract only when its owner has verified the supplier. Leave
   the conditional assembly last and make its input status visible.
4. Treat ordered extraction and full-mesh convergence as different nodes:
   `def:ex-limits-estimates` and `prop:ex-limits-extraction` use a mesh
   subsequence; `ex-full-mesh` separately requires convergence of the entire
   mesh sequence at each suitable period. A later proof may be announced at the
   target, but must not be silently used as an already-established premise.
5. For the phase chain, separate the ground-algebra construction, the
   character measure `ex-character-measure`, the phase regularity hypotheses,
   and selected-theory reconstruction `input:word-boundary` / `prop:word-fields`.
   A reference to a later section may be a preview, whereas a theorem use needs
   its exact statement and hypotheses available at that point. Preserve same
   table and quotient; no ordering alone proves their identification.
6. OPE and trace arguments must follow the precise producer statements they
   consume on the same family, filtration, scale, normalization and phase.
   In particular `ex-ope-remainder` and `ex-trace-limit` are requirements for
   the final hierarchy, not independent witnesses. The C05/C13/C14/C15/C16
   edge records remain unresolved; G06 must check proof-level closure.

The preliminary raw graph finds eight multi-file strongly connected components
of sizes 117, 16, 6, 2, 2, 2, 2, 2 when edges follow cross-file `ref`/`eqref`
links. They include explanatory forward references and section labels. Thus
these are **reference cycles**, not evidence that 117 theorems form a proof
cycle; reversing/topologically sorting them cannot certify the requested DAG.
The prior handoff graph is likewise only navigation. To settle an order, G04
and the package owners must classify each cited use as definition, assumed
input, proved result, preview or cross-reference at final chapter hashes;
split statements from proofs when necessary; then topologically order the
actual producer/consumer statements. The present data do not justify a stronger
claim that the complete 241-chapter order is dependency-respecting.

`reference-scan.json` records source line, label and target; it checks only
literal `\\ref` and `\\eqref` in included chapter sources after comment removal.
It neither expands TeX macros nor resolves semantic uses without a reference.
`lexical-first-occurrences.tsv` is a search index, not definitions, and its
candidates must be interpreted in scope. Chapter hashes identify its version.

### A concrete split within C01

The current `free-kernel-estimates.tex` precedes `free-kernel-components.tex`.
The former introduces the actual wire receipt at lines 226–247 and uses
`area_L` and `rail_L` at lines 251 and 271, while their explicit formulas
occur in the latter at lines 16–23. The component chapter in turn cites the
estimates chapter at its opening and near its final bound. Consequently
simply swapping these two whole files would not settle their reciprocal
references. A bounded proposed order is:

1. Extract the finite alias, rail, plank, area, train, and drive definitions
   from `free-kernel-components.tex:9–60` into an earlier definitions block,
   preserving all domains and the stage/side hypotheses.
2. State and prove the general analytic-cube-to-Fourier-strip and finite
   residue tools in `free-kernel-estimates.tex:14–225` without presupposing
   the eventual component estimate.
3. Give the factor-by-factor component bounds from
   `free-kernel-components.tex`, citing the earlier definitions and general
   tools as actually needed; then state the actual wire receipt and finish its
   applications in the remainder of `free-kernel-estimates.tex`.
4. Give `kernel-transport-identities.tex` after its train-response definitions,
   with the response/drive notation repaired as in contract action 4.

This is a proposed split, not a checked proof DAG: C01 must classify all cited
lemmas and determine whether its component proof needs any *later* specific
result from the wire-receipt block. If it does, isolate the relevant statement
with its exact hypotheses and proof; do not call a forward citation a proof.
This is an actionable example of why a chapter-level topological sort is
insufficient.

### Proposed order of the named common-data interfaces

The following is a candidate **statement-level** order for the named joins;
these nodes are portions of packages, not wholesale package moves. It makes
explicit why the apparent package cycle C16 → C12 → C13 → C14 → C16 is
not automatically a proof cycle. Arrows denote a proposed required producer
before the consuming statement, not a claim that the edge is already closed.

1. Finite lattice and the internal family/early public-run binding contract
   (C01 and early C16), together with the C07 actual-row and C11 path
   inputs. The actual early-run producer must be placed after its own numeric
   and postnumeric prerequisites, not assumed from its name.
2. C12 common funded history and selected course on that literal family,
   conditional on the C16 early binding and C11 path attachments.
3. C13 reader/compiler and selected-history limits for that same history,
   conditional on C12's exact course and C07/C09/C11 inputs.
4. C14 rank-seed and stress/Ward readout on the same extracted table and
   normalized local data. C13 → C14 needs the exact common scale, map,
   extraction/filter, derivative orders and test normalization, not merely a
   naming convention.
5. The C03 ordered/full-mesh outputs and C04 phase/reconstruction outputs,
   positioned after the precise suppliers of their hypotheses and before
   whichever C05/C16 consumers actually use them. Their placement relative to
   C13/C14 remains conditional until the exact same-table premises have been
   classified. If a C14 statement uses an earlier C03 table construction,
   move that *statement*, not the whole C03 package, before that C14 statement.
6. C05 matched-field projection, filtration and phase OPE, after the relevant
   C06/C08/C12/C16 early witnesses, C13/C14 physical filtration and C03/C04
   phase interfaces. The final C05 estimates remain conditional until those
   separately owned edges are proved and matched.
7. C15 trace calibration after its common history, C14 stress normalization
   and external #33/#34 suppliers at reviewed versions. Do not infer either
   external supplier from a local symbol match.
8. C16 final public assembly after the full-mesh, common hierarchy, Ward,
   OPE and trace inputs. This is a different node from the early C16 run in
   item 1; its final input remains conditional.

The source for these proposed edges is `handoff/known-open-edges.md` and the
individual package ledgers, not the reference graph. None of the named open
edges is closed by this proposal. For a final total order, split each item at
its actual statements, inspect the unclassified incoming premises (including
cross-edges within each item), and resolve or retain explicitly any genuine
cycle. The chapter inventory supplies a deterministic order *within* each
unresolved group only as a starting arrangement, not as proof of acyclicity.

### Producer/consumer checks at the refreshed basis

The following are inspected statement-level edges, rather than conclusions
inferred from reference direction. They remain conditional as indicated.

| Producer and consumer | Actual use / common data | Status |
| --- | --- | --- |
| `sec:common-scale-selection` → `sec:common-funded-history` → `sec:public-run-binding` | The first supplies a realization after profiles, lengths, rates, protections, lists and delays; the funded history applies retained horizon/path data on that realization; public binding consumes those arguments and retains `R,T,W` together. | The early numerical choice and late identification are distinct statements; neither may be assumed from the other. Public binding also requires `sec:ope-scale-purchases` and the exact local suppliers. |
| `sec:path-attachment-producer` and `sec:background-path-convergence` → `sec:selected-history-limits` | Paths, stationary maps, coefficient spaces, enlarged replacement domain and paid widths belong to the same schedule and retained horizon. The latter section explicitly assumes their strengthened version before its limit. | Auxiliary-history continuity also needs same-input protected chart, prices and output identification; C13 independent review points to `sec:selected-centered-service` as a consumer that must carry or discharge that input. |
| `prop:ex-lattice-actual-shell-node` → `def:ex-lattice-shell-receipt` → `lem:ex-lattice-annulus-annihilation` | The annulus receipt consumes the node bound on the selected family. Its `Q_m^quota` is finite for fixed birth level `m`; cancellation occurs before sending `m→∞`, so no uniform-in-`m` bound is inferred. | The proposition's exact producer-to-receipt hypotheses and selected-family purchases remain review items in the C14 ledger; treating the receipt as an input does not prove it. |
| `input:ope-raw-estimates` → `sec:ope-estimates` → `thm:ope-quantitative` | Raw rates apply to all positive radius sequences, moving configurations and phase choices on one hierarchy; finite-basis and averaging arguments then transfer them to the homogeneous prescription. | The raw estimate is explicitly an input. C05/C13/C14 same-table, derivative, projection and phase matches remain open; a static reference location does not supply these estimates. |
| `ex-full-mesh` and `ex-joint-input` → `ex-conditional-existence` | Full mesh convergence at each suitable period is combined with an ordered extraction by uniqueness, on the same family and hierarchy. | A subsequence alone is insufficient. Full mesh, phase, reconstruction, OPE and trace inputs are not discharged by the final assembly. |
| `ex-trace-limit`, `thm:trace-asymptotic` and `thm:profile-exclusion` → final trace clause | The selected two-point quantity has fixed `r^8 log²(r^{-1})` normalization; the profile exclusion is applied to that same field. | `input:trace-scales`, same-history normalization and external #33/#34 suppliers still require exact reviewed matching. |

`proposed-total-order.md` contains the explicit 241-file candidate and identifies
the places where statements must be split rather than an entire file moved.
Its order is conditional on the unresolved premises above and package-owner
validation; this report does not claim that every incoming mathematical edge
in all 241 files has been independently established.

### External trace-supplier split

At this basis the generic `lem:ex-lattice-trace-weighted-price` and
`lem:ex-lattice-trace-medium-receipts` occur at the start of
`trace-weighted-estimates.tex` (lines 13 and 99). They are finite-dimensional
receiver results with displayed hypotheses; they do not require the later
selected sensor as an input. YM-000033 uses these receivers and lists
`trace-small-means.tex` and `trace-free-rank.tex` as supporting manuscript
files. Later in `trace-weighted-estimates.tex:164–173`, the sensor **takes** the
three medium limits as marked-vector inputs; with its separate chart inputs
it derives chart convergence and the weighted sensor response using the generic
receiver. The scalar-medium lemma supplies those limits conditionally, with
field decay a separate priced-mission input. This is a later physical
application, not a premise of the earlier generic lemmas. YM-000034 lists
`trace-free-rank.tex` and `ope-filtration.tex` as mathematical supports.
`trace-asymptotic.tex:245–253` explicitly consumes both external sensor and
branch-limit/washout propositions. Thus use the order: generic receiver and
medium, their other precise suppliers, #33/#34 at their integrated reviewed
versions, then the corresponding selected application and trace asymptotic.
The external units' metadata lists supporting files but does not, by itself,
check every statement-level premise or same-scaling identification. The
external chapters remain absent from the current main include; F01 and their
owners control integration and exact order. This resolves the *editorial*
cycle caused by treating each entire file as one node, not the open supplier
or same-history mathematical obligations.

At `ce1b3a4` merged C14 revision 1b restates the shell-node conclusion and adds its scale-note argument; the chamber receipt, cited schedule inputs and renewed independent review remain open. Its two forward references to `def:ex-lattice-shell-receipt` require the definition to precede the proposition and scale note; see the then-current exception list (59 rows at the revised basis).

### Operational block placements

`statement-block-insertions.md` enumerates the 28 distinct target statements
of the inspected forward producer/definition uses and gives an exact insertion
position before each earliest consumer. Its default is an early statement of
the **existing** result with its meaning-determining definitions and unchanged
hypotheses, followed by its original proof at its owner block. The theorem is
not converted into an assumed input. This is a deferred-proof plan, not proof
that its prerequisites have been discharged or that no cycle remains. The two
finite-dimensional trace receiver and medium lemmas are moved with their
complete proofs before item 197, where the C14 calibration chapter uses the
receiver. The conditional `trace-small-means.tex` block is moved after item
218, before the external #33 sensor; #34 comes after both C14 free rank and
C05 filtration, then the C15 physical trace applications. Its priced-mission
field-decay input and all cross-owner data remain separate obligations.
The early theorem statements retain their own hypotheses; reference-free
dependency closure remains for the owners/G06.

The final Scope paragraph of `annulus-recording-yield.tex:343–355` announces
where its already-explicit inputs are supplied. Place that paragraph after
`lem:ex-annulus-same-data` and `lem:ex-annulus-common-strip`; their proofs
need not be moved into their own conditional consumer. For the terminal
fee, place the paying-the-birth-cost estimate (T6) and the finite
threshold/delay selection in `terminal-marked-construction.tex:160–200`
before its use in `common-observable-purchases.tex:253–261`. The cited
`prop:terminal-marked-voice` states the fee inequality as hypothesis (4): its
name alone is not the numerical threshold producer. Retain the same profile,
finite list and schedule conditions in both placements.

For three of the early blocks the proofs can move with the statements rather
than being deferred: the complete nearest-point subsection defining the real
matrix space and `lem:branch-nearest-projection` (including its cited Lie-group
and inverse-function inputs), the self-contained finite-dimensional
`lem:ex-public-frame-recovery`, and the elementary uniqueness proof of
`ex-full-mesh`. This is in addition to the two trace receiver lemmas and the
identified radial/group-generation/fee blocks. The remaining theorem blocks
keep their exact earlier statement and later proof; this plan still requires
checking the deferred proofs' actual premises and rules out treating them as
new unproved assumptions.
The finite word-replacement lemma moves with its telescoping proof and test
hypotheses; the radial-choice lemma moves with its proof and the definitions
of `K_j` and `S_{J,m}`; the point-reflection bump lemma moves with its proof
and the point reflection-positive form `ex-rp`. Their analytic/schedule or
smeared-positivity hypotheses remain unchanged.

### Same-file C14 delta at `ba4528f`

The current `actual-stress-shell-nodes.tex:164` uses `rate(r_m)=-1` and
`λ_{m+1}/λ_m→1` from the scale-note paragraph after the shell proposition
(now around line 491). Move the definitions and the short scale-note proof
before that rate calculation. Its premises are the selected schedule's
`log L_m/λ_m→0` and `log B_m/λ_m→0`; the shell proposition is not their
producer. The schedule facts remain inputs to this move.

In `trace-calibration-producer.tex:321–324`, the displayed comparison-curve
names `r_i=s_{n_i}` and `U_{i,d}=C_{i,d}` refer forward to the corrected
gallery theorem later in the *same* file. Introduce that exact declared
same-curve/chart interface before the normalization calculation, with the
gallery theorem's stated conditional suppliers and source-level one-witness
match kept open; do not cite the forward theorem as unconditionally produced.
The conditional `eq:ex-lattice-trace-uniform-tests` in that gallery theorem
is the cited producer of `eq:stress-uniform-tests` in
`actual-stress-normalization.tex:38–47`. Place its exact statement and
meaning-determining definitions before that consumer while retaining the
proof and suppliers; do not infer a uniform estimate from per-test convergence.
These same-file and equation-level dependencies supplement the 59-item
cross-file theorem/definition scan; that scan alone cannot discover them.

At target `b13f2ef`, the external sensor is merged with SHA-256
`b30651d88c358539561cda79c70a73fa0d6d21b27e5cf58873e550e9cb19796f`
and remains outside the main include. Its four named arch/price/lift lemmas
and (S1)–(S7) assumptions do not reverse the receiver → sensor → selected
application placement. The marked medium and priced mission retain their own
conditional hypotheses; see `delta-ba4528f.md`.
