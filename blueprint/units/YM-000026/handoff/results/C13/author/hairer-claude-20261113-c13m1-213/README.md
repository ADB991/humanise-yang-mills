# Response to review #213 M1: component family versus aggregated activities

Issue #54; session `hairer-claude-20261113-c13m1-213`. Review #213 (mgubi) of
#202 required this clarification, and #233 noted it was still open. The edit
is by the hairer account, which did not author C13's #202, so a renewed
check by another account is needed.

## Change

- `allarity-planted-compiler.tex`, interface after `eq:planted-holes`:
  - the embedding and exhaustion are now required of the *unaggregated*
    unmarked forced-component family `F`;
  - the background identity is required of `K` (which is `F` with the hole
    and boundary factors attached) in the form "the sum of the members of
    `K` at each full support/inventory address equals the archived
    activity of `Q`";
  - "forced activities of `Q`" is reserved for those aggregated slots,
    with the two-component diagnostic (`u+v`) from the review.

  In the downstream regrouping proof, "by the transported forced-family
  embedding" now reads "by the transported embedding of `F` and the
  addresswise identity for `K`".
- `actual-corrected-body-compiler.tex`, `prop:corrected-forced-output`:
  - the statement now promises exactly this interface for the proof's `F`
    and `K`;
  - the proof calls `F` unaggregated, and adds a sentence that embedding and
    exhaustion concern `F` and `K`, not the slots `k_{X,I}` of `Q`.

No construction, estimate or normalization changes. This matches the
source separation the review cites (`YM.Next.Rank.Flux.Vac.f`,
`Flux.Embedded`, `Value.Background`).

## Checks

- The full monograph builds with no undefined references, and the changed
  pages were read in the PDF.
- `python3 scripts/check_blueprint.py`: OK.
