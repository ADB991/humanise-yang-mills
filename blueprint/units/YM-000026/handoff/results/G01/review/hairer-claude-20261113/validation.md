# G01 review: validation record

Session `hairer-claude-g01-review-20261113`, 13 November 2026, about 09:40–11:30 UTC. Worktree: a separate checkout of `codex/existence-monograph` at `69c254b58e98c4bc82d7554c87a651f947934db0`, on branch `claude/issue-58-g01-review`. The only files written are in this directory.

**No Lean was built, elaborated or replayed. No LaTeX was built** (audit-only review; no manuscript file changed).

## Repository state and checks

| Command | Result |
| --- | --- |
| `git rev-parse HEAD` (start) | `69c254b58e98c4bc82d7554c87a651f947934db0` |
| `git log --oneline b2f59c3..69c254b -- manuscript/existence/statement.tex blueprint/units/YM-000026/handoff/results/G01` | `884feed` (merge #86), `3c2ed3b` (C16 audit), `39fc9ca`, `b9cecd7`, `c50ca14` (G01) |
| `git show b2f59c3:manuscript/existence/statement.tex \| sha256sum` | `43ca06106e2190e81f617d3fc7f668df06909d9a747309eff5e7045ba92f5378`, the hash audited by G01 |
| `git diff b2f59c3 69c254b -- manuscript/existence/statement.tex` | 32 insertions, 8 deletions, all in `3c2ed3b` (see README, patch table) |
| `python3 scripts/check_blueprint.py` (before writing) | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`, exit 0 |
| `python3 scripts/check_blueprint.py` (after writing) | see final row |
| `cd Lean && sha256sum -c SOURCES.sha256` | 9,497 lines `OK`, 10 not `OK`; `wc -l SOURCES.sha256` = 9,507; `grep -c 'verification/.*\.log'` = 10; `git ls-files Lean/verification \| grep -c '\.log$'` = 0 |
| `grep -nE "^\s*(instance\|axiom\|opaque\|macro\|syntax\|notation\|unsafe\|…)" formal/Adequacy.lean`, `grep -c sorry` | instances only as described in `lean.md` L1; 0 `sorry` |
| `curl` to `https://github.com/leanprover/lean4/releases` and `https://lakecache.blob.core.windows.net` | HTTP 403 and no connection: the toolchain and the Mathlib cache cannot be fetched, so no Lean check was possible |

The #37 evidence files `source/evidence/clean-build-3456e5e.md` and `comparator-3456e5e.md` were read from `main` at `6114c987c08e665c87f954d61c0c639d89d5aafb`. They are not on `codex/existence-monograph`.

## Content hashes (`sha256sum`) of what was reviewed

G01 records under review (`blueprint/units/YM-000026/handoff/results/G01/`):

| File | SHA-256 |
| --- | --- |
| `README.md` | `5fe74b5e78d5be8b7f86db6c0c46751fd6d49d27789ad43d6ce06b31edd5465d` |
| `adequacy.md` | `aa0fcfd053d4f9b3014eddf390aa9bb1eab74f70f282b22dd30eaa5c779ff4c1` |
| `proposed-patches.md` | `91d9d867dcd93fabb3718f6e409e8d4fb8b2f7ea1106b88bdace3eda63fd3043` |
| `source-trust.md` | `e27cf70ce9713032f64ff960006ca92759d84068953fc61f119c3b023c20f044` |
| `statement-ledger.md` | `2c76bee7546081668bfdbd240ee96e847a45a5d696380c501ed83df6e5854352` |
| `validation.md` | `482b3f227938401c56d1e2cbb4b20033a844d900632f919775e947be962fcfe7` |
| `formal/Adequacy.lean` | `581880ef39e48a1af37af8b67b50869a011958411be2c6fb291a5a38e43b18f3` (equals the value in `formal/README.md`) |
| `formal/AdequacyFull.lean` | `a4f05230225a73c36155f1159bda5cb83979333b4a4e7d9f6c97f09cc1c9706e` (equals the value in `formal/README.md`) |
| `formal/README.md` | `f3eb4e1c74457cde928e551ce7753c18f241ec0878bef427ef9ab3cb55a0daed` |
| `formal/lakefile.toml` | `ed67fb3b8344395d6b48c6f3ff54915c8c463397265cae965742396b85fbe855` (equals the value in `formal/README.md`) |

Sources and manuscript read:

| File | SHA-256 |
| --- | --- |
| `Lean/PublicTheory.lean` | `94111ad258b4218a263fcc0a7136446d5a6eff0e090809b72036fb3a7aecfff8` |
| `Lean/PublicWilson.lean` | `c1542c816cd42d23448b66b4cb021c7f3bdad64b64f1c643dde27147ce0c3233` |
| `Lean/ChallengeSpec.lean` | `e48b0be2b72d16b9b87c6c1923b3ae814270387bf9312b5cb0661dfa3e243749` |
| `Lean/Solution.lean` | `1838214ba7159a2babe703000cfd9c43905fb909c1f27b73c46aae48c11ece24` |
| `Lean/Construction.lean` | `86286ed17925b3e729cd2f721347e27054ea935f2653ceaa35b3b49fc25c343c` |
| `Lean/HierarchyBridge.lean` | `82c27a4ecb393c65566a09addd97d70aea7cc62b990d383293adde53d0fc423a` |
| `Lean/TraceBridge.lean` | `b3fa347e6ab79cd69a5b0e29a3ad1a743c9cedffe727a7f13bfc6328cf125a35` |
| `Lean/YM/Euclid/Lift.lean` | `64eaa79b9e7b4b0180384f9af8504916a822b6bae0998eab35f5eef008c2a1de` |
| `Lean/YM/Extraction/Orders.lean` | `4d7f6f2f3fc092219d817344e9a0bd9f82cc81ccea9f11a7f4ce92060314f9c7` |
| `Lean/YM/TraceExtension/Wick/Refute.lean` | `cb0340c14c23b700b0cc84f212578206304710e93d9b766b8224093d553024c6` |
| `manuscript/existence/statement.tex` | `127906c20579e173f17e715a27069d2b519bcbd0370b8c2e4e6e04f06331301d` |
| `manuscript/existence/assembly.tex` | `a82c6985751b1688e246597d6199ed6cec20b968a0ef97bdf5e9eab155d0dcc7` (statements only) |
| `source/build.md` | `db88d5133ad97584c5f424e68f272aad2fe9f3a2da5270bf675f6eda09958e87` |

The hashes of `PublicTheory.lean`, `PublicWilson.lean`, `ChallengeSpec.lean`, `Solution.lean`, `Construction.lean`, `HierarchyBridge.lean` and `source/build.md` equal those recorded by G01, so the audited Lean statements and source record are unchanged.

## Final check

| Command | Result |
| --- | --- |
| `python3 scripts/check_blueprint.py` | `Blueprint structure OK: 4 units. Lean and mathematics were not verified.`, exit 0 |
| `git diff --check` | no output |
