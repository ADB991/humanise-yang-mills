# C09 validation in progress

On 2026-11-12, after the first supplier prose edit:

- `python3 scripts/check_blueprint.py` exited 0: `Blueprint structure OK: 2
  units. Lean and mathematics were not verified.`
- `git diff --check` exited 0. This checks the then-tracked diff; untracked
  author records require a staged check at a later checkpoint.
- Three `pdflatex -interaction=nonstopmode -halt-on-error
  -output-directory=C09_BUILD_DIR existence.tex` passes from
  `manuscript/` exited 0. The third produced 872 pages. Its log contains one
  `amsmath` foreign-command warning and no overfull/underfull or unresolved
  reference warning. The affected page 383 was rendered by `pdftoppm` and
  inspected; the added paragraph is legible and fits the page. Supplier chapter
  hash at this check: `30ce647a2040040d0c025f440905eb8872c99c37c116f7c296e889106cdffb69`.
- An attempted `pdftotext` extraction exited 127 because the command was not
  available; the affected page was inspected as an image instead.

After the heading quantifier clarification, reran the structural checker and
`git diff --check`; both exited 0. A further `pdflatex` pass with the same
arguments exited 0, 872 pages, with the same `amsmath` warning and no box or
unresolved-reference warnings. Rendered and inspected affected page 415; the
new text fits. Heading chapter hash at this check:
`4b9fa1674badd32fa9d552427e896be60c53ebbc2be202033953eb2a6eabefb2`.

After the high-degree budget correction, the structural checker and
`git diff --check` again exited 0. The same `pdflatex` command exited 0
with 872 pages and the inherited `amsmath` warning; no box or unresolved
reference warning appeared. Rendered and inspected affected page 385.
The chapter hash at this check is
`c4ff72cbf69a7f76dc111b0e327e2a90aec85c2572d61922a658f6d5270826da`.

After correcting the packet seed count, reran the structural checker and
`git diff --check`; both exited 0. The same `pdflatex` command exited 0,
872 pages, with only the inherited `amsmath` warning and no box or unresolved
reference warning. Rendered and inspected affected page 382. The supplier
chapter hash at this check is
`41d088ebb677aac26770bad7dca75a4593975f95809605eb7db4231ee99d86b4`;
this supersedes the earlier supplier hash for the current version.

After the marked-tail quantifier clarification, the structural checker and
`git diff --check` again exited 0. A further identical `pdflatex` invocation
exited 0, with 872 pages, the inherited `amsmath` warning, and no box or
unresolved-reference warnings. Rendered and inspected affected page 417.
The local-source chapter hash at this check is
`1813d41d385adfd6fff4bb1c0d3b8601a77bacec551c6b4f9bda1be1886c706b`.

After the explicit covariance/precision distinction, structural and
whitespace checks again exited 0. The same `pdflatex` command exited 0 with
872 pages, the inherited `amsmath` warning and no box or unresolved-reference
warnings. Rendered and inspected page 378. The finite-volume chapter hash at
this check is
`9372f7f077d26a17a5b1817fcee50a7f0d05008754e6e11f8bd189de74852065`.

After stating the missing C03 interpolation assumptions at the C09 use site,
the structural and whitespace checks again exited 0. The same `pdflatex`
command exited 0 with 872 pages, the inherited `amsmath` warning and no box
or unresolved-reference warnings. Rendered and inspected page 415. The
heading chapter hash at this check is
`68b519b86c4658aa59d07a4b36740da63d63d8afd97cd95a7be4da0b1c64ab17`,
superseding the earlier heading hash for the current version.

After specifying complex linearity in that C03 interface, `git diff --check`
and a further identical `pdflatex` invocation exited 0. The result has 872
pages, the same inherited warning and no box or unresolved-reference warning;
page 415 was rendered and inspected again. The current heading hash is
`4f6b5107a96bfb33116c62a6cf7859f830772c7cac54e5ada260caf976abfc1a`.

After adding the regular-column short-support hypotheses, the blueprint
checker and `git diff --check` exited 0. The same `pdflatex` command exited 0,
with 872 pages, the inherited `amsmath` warning and no box or unresolved
reference warnings. Rendered and inspected page 405. The regular-principal
chapter SHA-256 is
`a2a9af5d963ba04235baa68ac6937be723e2cd6a752977ea6352106d57fe561b`.

After qualifying the marked-kernel background input, the blueprint checker
and `git diff --check` exited 0. The same `pdflatex` command exited 0 with
872 pages, the inherited `amsmath` warning and no box or unresolved-reference
warnings. Rendered and inspected pages 419 and 420. The marked-kernel chapter
SHA-256 is `69baa1e2bef16ed02bfd602a0328effa511bc1188a4e28d63d28d18476702c72`.

After the post-Alpha fixed-rung norm clarification, the blueprint checker and
`git diff --check` exited 0. The same `pdflatex` command exited 0 with 872
pages, the inherited `amsmath` warning and no box or unresolved-reference
warnings. Rendered and inspected page 425. The fixed-rung chapter SHA-256 is
`9314a85a97f986c89a70f18ccbdcfca12383c5e1f8677d6f9141e69a59867a75`.
This change is not included in the earlier Alpha snapshot.

After the post-Alpha stationary derivative-order clarification, the blueprint
checker and `git diff --check` exited 0. The same `pdflatex` command exited 0
with 872 pages, the inherited `amsmath` warning and no box or unresolved-
reference warnings. Rendered and inspected pages 392 and 393. The uniform
stationary chart SHA-256 is
`6aa3f0dfd6918e1ed26039d170650d05e1661b497bec6245aa3737466eb17755`.
This change is not included in the earlier Alpha snapshot.

After stating C08's high-degree premises in the post-Alpha small-field edit,
the blueprint checker and `git diff --check` exited 0. Two identical
`pdflatex` passes exited 0; the first reported changed labels, and the second
resolved them. The result has 873 pages, the inherited `amsmath` warning and
no box or unresolved-reference warnings. Rendered and inspected page 385.
The small-field chapter SHA-256 is
`42f5cab88bfcd2020e07e37ae7c00aed3273b388c796a2b10019ae675c23eebc`.
This later edit is outside the earlier Alpha snapshot.

After distinguishing the first-expansion component price from the
second-expansion root price, the blueprint and whitespace checks again passed.
Two more identical `pdflatex` passes exited 0; the first reported changed
labels and the second resolved them. The result remains 873 pages with the
inherited `amsmath` warning and no box or unresolved-reference warnings.
Rendered and inspected page 385. The current small-field chapter SHA-256 is
`df5ba5f17b8fb0dce2cfacaaab67ebe88a03505196aca1626830a8bb42920767`,
superseding the preceding small-field hash.

After making the eventual condition `D >= 1` explicit, the structural and
whitespace checks and one further identical `pdflatex` pass exited 0. The
result remains 873 pages, with the inherited warning and no box or unresolved
reference warning; page 385 was rendered and inspected. The current
small-field SHA-256 is
`d6248921aefdba245ac49c4d1939b470407af952dba66c5b576880e940799d0c`,
superseding the previous hash.

After writing the second-expansion price explicitly as
`S=(1+2^j B_1) omega`, the blueprint and whitespace checks and another
identical `pdflatex` pass exited 0. The result remains 873 pages with the
inherited `amsmath` warning and no box or unresolved-reference warnings;
page 385 was rendered and inspected. The current small-field SHA-256 is
`0b0bad77017fb55271cd12142a46d2eceec69a8e0a659ace544631b2eb0724c4`,
superseding the preceding hash and falling outside checkpoint 2.

After linking the regular-column moment hypothesis to the canonical screened
polynomial definition, the blueprint checker, `git diff --check` and one
identical `pdflatex` pass exited 0. The result has 873 pages, the inherited
`amsmath` warning and no box or unresolved-reference warning. Rendered and
inspected page 405. The current regular-principal SHA-256 is
`1eb440bf99bd45c6e49577f603ccdccc9f92ba21fbbe32f0cab0100391db46e6`,
superseding its Alpha-snapshot hash.

No fresh Lean build, declaration elaboration or axiom replay has been
performed by this author. Alpha's conditional interim review is limited to
the earlier frozen commit described in `activity.md`; later changes have no
independent final-hash review. The checks above are not proof approval.

During the later source pass, a discovery `rg` command using a brace pattern
with an unintended space failed in zsh with `no matches found`; the corrected
search of the `Sienna` and `Lantern` directories succeeded. A subsequent
`git diff --check` and `python3 scripts/check_blueprint.py` both exited 0; the
checker again stated that Lean and mathematics were not verified.

After clarifying the marked comparison's activity value-tail hypothesis,
`git diff --check`, `python3 scripts/check_blueprint.py`, and
`pdflatex -interaction=nonstopmode -halt-on-error -output-directory=C09_BUILD_DIR existence.tex`
from `manuscript/` exited 0. The PDF has 873 pages; the log contains the
inherited `amsmath` warning and no box or unresolved-reference warnings.
Rendered and inspected page 420. The resulting SHA-256 of
`marked-kernel-convergence.tex` was
`c02e59c937da7f11e7dfefa989e8e67a7dd346b08e53b82ab2d8049fd66c5224`.
The attempted clarification was subsequently reverted while the weighted
component-tail join is checked. The restored hash is
`69baa1e2bef16ed02bfd602a0328effa511bc1188a4e28d63d28d18476702c72`, and
`git diff -- manuscript/existence/marked-kernel-convergence.tex` is empty
relative to checkpoint 2. An initial `git diff --check` after editing the
review notes found a blank line at end of file; it was removed, and the
repeated `git diff --check` and blueprint checker passed. The earlier
rendered page and checks apply to the checkpoint-2 version as recorded above.
`git show` piped to `shasum -a 256` confirmed that both Alpha and
checkpoint 2 have this same restored marked-chapter hash. Alpha's
conditional local pass remains limited to its recorded scope; the weighted
cross-package tail question was not thereby resolved.

After adding C11's larger-step size conditions to the stationary-chart
application, `git diff --check`, `python3 scripts/check_blueprint.py`, and
the same `pdflatex` command exited 0. The PDF has 873 pages, with the
inherited `amsmath` warning and no box or unresolved-reference warnings.
Rendered pages 389 and 390 and inspected the changed page 390. The resulting
SHA-256 of `uniform-stationary-chart.tex` is
`4357b9bdeca47fe17c8c74b9e9b9997450f1d06ea1d93e4bebffcd1776ef2017`;
this post-checkpoint edit requires independent exact-hash review.
The same sentence was then completed with the kernel's branch-compatibility
hypothesis, which is also part of `Larger`. The same structural, whitespace
and `pdflatex` checks passed; the PDF remains 873 pages with the same single
inherited warning and no box or unresolved-reference warning. Rendered and
inspected page 390 again. The latest chart SHA-256 is
`0518b4ed6c688af67424bbd82135ff7c2efa1fcdfc240b0721215400fd7875c8`,
superseding the immediately preceding hash for independent review.
The frozen C09 base does not yet contain C11's explicit macro-radius
definition, so the chart now defines it locally as `(j_ph+7) ell`, equal
to C11's `(j+3) ell+4 ell`. The same checks passed, the 873-page PDF has
the same single inherited warning and no box or unresolved-reference
warning, and the changed page 390 was rendered and inspected again. The
latest SHA-256 is
`3fbd1cf604f96806864d65673c28bfaff1969a993eb223ea513d180fd78e5a28`;
it supersedes both preceding chart hashes for review.
Five attempted report-only patch applications failed their context checks
and made no changes; the intended report entries were then applied with the
correct context.

After checkpoint 3, four further report patches failed their context checks
and made no changes; the intended entries were applied with correct context.
One additional report patch then failed its context check and was reapplied.

After stating `0 < theta <= 1` in the fixed-rung partition estimate,
`git diff --check`, the blueprint checker and the same `pdflatex` command
exited 0. The PDF has 873 pages, the inherited single `amsmath` warning,
and no box or unresolved-reference warnings. Rendered and inspected page
427. The current `fixed-rung-convergence.tex` SHA-256 is
`e0060f9b036e754f32c87768e7e9080e59d4d1011336ba7dd3c537e95eb82497`;
this post-checkpoint edit requires independent exact-hash review.

After identifying the strong forced price and its coupling-band estimate,
`git diff --check`, the blueprint checker and the same `pdflatex` command
exited 0. The PDF has 873 pages, the same inherited `amsmath` warning, and
no box or unresolved-reference warnings. `pdftotext` was unavailable
(`command not found`); page 386 was instead rendered with `pdftoppm` and
visually inspected. The current `small-field-budget-selection.tex` SHA-256
is `c012375648df7c184158d315f37e3a0a3b72a897e0173f58467d16b74ddd8978`,
superseding its checkpoint-3 hash and requiring independent review.
The calculation was then widened to the source's band `[z/4,4z]`, giving
`beta*tau^2 >= P_F^2/4`. The same structural, whitespace and `pdflatex`
checks passed; the 873-page PDF has the same inherited warning and no box
or unresolved-reference warnings. Page 386 was rendered and inspected
again. The latest small-field SHA-256 is
`f46733221a52386cb60eb05e4f64b49779cb250bdc034df68f2e8b6ebe7241ae`;
it supersedes the preceding hash and requires independent review.
A subsequent source-discovery command used an unmatched `Time*` path and
failed in zsh; a corrected search located `Forecast.pair` in
`Lean/YM/AnalyticBridge/VERIFIED_RESET_STEP/Currency.lean`.

A subsequent chart edit stated the patch's odd blocking side `ell >= 3`
and phase `j_ph >= 4`. The same structural, whitespace and `pdflatex`
checks passed, producing 873 pages with the inherited warning and no box
or unresolved-reference warnings. Page 390 was rendered and inspected.
The current `uniform-stationary-chart.tex` SHA-256 is
`f116e65667e75c79b9ae718be3868f5d564b99be0125403850cd05b1d0c0453e`,
superseding its checkpoint-3 hash and requiring independent review.

After clarifying that the marked comparison concerns the actual pair of
admissible histories, the same structural, whitespace and `pdflatex`
checks passed. The PDF has 873 pages, the inherited `amsmath` warning and
no box or unresolved-reference warnings; page 420 was rendered and
inspected. The new `marked-kernel-convergence.tex` SHA-256 is
`ccf86633473e04d2f83a89f651f218ee05fdbb2af692143fd272b86a8f499c54`.
It supersedes the restored Alpha/checkpoint-3 hash and requires independent
review; it does not settle the weighted-tail or same-family joins.

A follow-up `rg` source check used a nonexistent shortened path for
`Marlin/Slots.lean` and exited 2; `rg --files Lean/YM` located the file under
`PhysicalNext/RG_NEXT_COMPLETE_REPEATABLE_NONLINEAR_STEP/Marlin/Slots.lean`.
The corrected check found `bound_up` and `pricingBuy` there. This was a
source inspection, not a Lean build or independent review.
One subsequent ledger patch failed its context check and made no change;
it was reapplied successfully with the exact surrounding line.

After checkpoint 4, a static Python scan compared `\\ref` and `\\eqref`
targets in all 18 owned chapters against labels in the existence chapter
files: it found no unlocated or multiply defined referenced labels among
1,821 distinct labels. This scan does not check mathematical applicability,
the include order, or references expressed by other macros.
An exploratory strongly connected-component scan of chapter-level
`\\ref`/`\\eqref` links found one five-file component touching C09; its
context is recorded in the ledger. Chapter-level references include
expository forward links, so this is not a theorem-cycle check.
A finer exploratory scan treating each section/subsection as a separate
node found no multi-node reference component containing either C09
supplier or chart subsection. A reference to a section was attached only
to its heading's own text, not automatically to every subsection, so this
also cannot establish acyclicity or replace the premise-by-premise audit.
One subsequent source-discovery `rg` named a nonexistent
`Lean/YM/ConnectedActivityE6` directory and exited 2 while also returning
matches from the valid `Lean/YM` search. A corrected focused read located
`Lotus.Wing` and `Lotus.Leaf` in `Lotus/Postcards.lean`.
A later source search used a nonexistent `Lean/YM/Work/E03` directory and
exited 2; the valid searched paths found the predictor declarations in
`Lean/YM/PREC/Derivative.lean`. An empty, malformed patch also failed
without changing a file; the intended ledger update was then applied.
Another ledger patch missed its context and made no change; it was
reapplied using the exact adjacent line.
Two auxiliary source searches used nonexistent `Urns*` and `Extra/ITERATION`
paths, and another named absent `Table/Foundation.lean` and `Table/Home.lean`;
these exited 1 or 2. Subsequent searches of valid paths located
`FullVolume.Urns.Show` and its underlying `Cash` in `Table/{Tabs,Salute}.lean`.

After stating the marked leaf's support, eligibility and regular-slot
blank conditions, the blueprint checker and `git diff --check` passed.
Two `pdflatex -interaction=nonstopmode -halt-on-error
-output-directory=C09_BUILD_DIR existence.tex` passes exited
0; the first requested a label rerun and the second resolved it. The PDF
has 873 pages, the inherited `amsmath` warning and no box or unresolved
reference warnings. Rendered and inspected page 420. The new chapter
SHA-256 is `f80adacc7d528ba9a6f978778e2eac6a2aa6ed7412e282afea20c85aa691cdca`;
it supersedes checkpoint 4 and requires independent review.
