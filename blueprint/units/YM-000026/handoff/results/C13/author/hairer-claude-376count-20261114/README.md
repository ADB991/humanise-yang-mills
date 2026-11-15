# Step counts without a block-length floor (author note; follow-up to #375/#376)

- Session: `hairer-claude-376count-20261114` (Claude, on behalf of @hairer). Scope: the step-count items of #387 (block-length floor) and #389 (status item 4). Recorded on #376.
- Base: stacked on #391 (`claude/issue-390-hairer` @ `fea3d48`).
- Status: **draft, unreviewed**.

## Output

New `subsec:allarity-lower-count` at the end of `allarity-marked-propagation.tex`:
- **`lem:allarity-lower-count-free`:** with c_k = ⌈(log β̂_k)²⌉ and L_j ≥ 3, ℓ − w = O(log log s). So (α+1)^{ℓ−w} ≤ H^{q−3/2} eventually, which discharges #389 item 4.
- **`lem:allarity-upper-count-power`:** (α+2)^{k−ℓ} ≤ H^κ, with κ = 1 + (b̄+2)·log(α+2)/log 3, using only L_j ≥ 3. With q ≥ κ+4 fixed before s, d_{k−ℓ} ≤ H^{κ−q} ≤ H^{−4}, and every conclusion of the preceding subsections holds. **This removes the block-length floor `eq:allarity-length-floor` and the bracket from the step count** of `lem:allarity-step-purchases`.

## Correspondence

- `Clock.coverSize m = ⌈(log hatBeta m)²⌉` (`Lean/YM/RG/History.lean:82`).
- `widthSky = gainSky A.S ℓ (coverSize k ^ 10)`.
- The step-count role in the source is played by `Caff.hikes` (not matched term by term).

## Checks actually run

- `latexmk … existence.tex` (stacked): exit 0, 1049 pages, 0 undefined references. pp. 798–799 inspected.
- `python3 scripts/check_blueprint.py`: see the PR.

## Addendum: lower forced inputs

`lem:allarity-lower-forced` drops hypothesis 3 of `lem:allarity-lower-propagation`. The lower calculation uses its incoming forced budget only through T_eη and 𝒲(B_c)L⁴T_eη, so any η ≤ z works. Take η to be the previous forced output G(y), which is ≤ H^{−q} eventually, and floor the z_t at H^{−q}. This discharges #389 item 3. The source's lower step (`ExhibitsSky`) uses the forced input z·w(u). The manuscript argument avoids needing a lower bound on w(u).

Checks: `latexmk` exit 0, 0 undefined references; p. 799 inspected.

## Errata after review #409 (session hairer-claude-409resp-20261114)

- The cover size is `YM.RG.Calendar.coverSize`, not `Clock.coverSize`.
- `Caff.hikes` bounds polynomial transport norms; it is not the step-count interface. The upper count corresponds to `YM.Next.Rank.Tapes.Racer.log`, and the lower count is used through `Perch.Tally.growth`. The manuscript count proofs are independent arguments, not transcriptions.
- The lower count is now (α+1)^{ℓ−w} ≤ H^{1/4}, starting from the launch bound H^{−3/4} (source `Perch.spouse`).
