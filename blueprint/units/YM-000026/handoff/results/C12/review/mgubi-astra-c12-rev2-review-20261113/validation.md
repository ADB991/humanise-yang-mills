# Validation and scope record

Worktree: `/tmp/ym-astra-c12-rev2-20261113`; initial/report branch `codex/astra-c12-rev2-review-20261113`. Frozen review HEAD: `29356f6267b40df584df8a5eb37fc6399a06950a`.

Actual checks and reads:

- Read AGENTS.md, CONTRIBUTING.md, coordination and proof standard, source README, review template, checkpoint, package/common contract/prompt, known-open interfaces, canonical convergence evidence, C12 author README/part-A ledger/findings/correspondence/handoff, and relevant C13 ledger. Bots contained only its README; no note files were available in this snapshot.
- Read issue #53 body and all comments, issue #54 comments, PR #110 body/comments/reviews, and PR #109 body plus exact part3-mathematics M2 from head `ac3c1aed65048b148cfce56f905ddc738a419699`. Used `gh issue view`, `gh pr view`, and `gh api` raw content. Initial sandbox GitHub reads failed with connection errors; authorized escalated read calls succeeded. No credentials were printed.
- `git diff HEAD^ HEAD` identified exactly the 14-line manuscript qualification and eight-line README note. Full target chapter and immediate selected-history-limits supplier read; targeted coupled-background and parameter supplier passages inspected. Targeted source reads are listed in lean-correspondence.md.
- `shasum -a 256` on the seven frozen inputs succeeded; hashes independently recorded in hashes.json. Target chapter equals the author's revision-2 hash.
- `python3 scripts/check_blueprint.py --fingerprint YM-000026`: `547871ea04131a864b8d4cd428107cbc0ed7a256c43b672a936f2ba91151651b` at frozen target.
- `python3 scripts/check_blueprint.py`: exit 0, `Blueprint structure OK: 4 units. Lean and mathematics were not verified.` Repeated after creating reports, same result.
- `git diff --check`: exit 0, no whitespace findings. Final staged report check is run before commit.
- `git fetch origin codex/existence-monograph`: succeeded. Observed publication base `17b8f913d3ec1dd7d38b9b8f9756b889b2c72d1c`; merge-base report diff before adding reports was empty. PR #110 was merged by that point, with its exact head unchanged. Final live issue reread retained the review claim and disclosed no overlapping review-output claim.

Unrun: Lean elaboration, full Lean build, axiom replay, LaTeX compilation/rendering, and checker test suite. This report changes no LaTeX or checker; no artificial wrapper is required. The author's reported PDF build is not claimed as this reviewer's execution. No manuscript, source, author evidence or other review files were edited. Report-only publication is checked against the live base before creating the draft PR. Human acceptance and machine approval fields remain unset.
