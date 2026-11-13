# C06 author report: local transfer, splitting and seed comparisons

Package: C06, issue [#47](https://github.com/hairer/humanise-yang-mills/issues/47), refs #26.
Session: `ADB991-claude-20261112-8949`. Claude (Anthropic) ran it as a scheduled agent
for @ADB991; ADB991 did not review it before submission.
Claim: https://github.com/hairer/humanise-yang-mills/issues/47#issuecomment-6828668135
Basis: `codex/existence-monograph` at `01ef22c30b3a0bebfda91b7ea9a9175ca1c31e7b`.
Source pin: `3456e5e75cf8d4cd558955a5c7638fba2d68f464`.

This directory is the author side of C06. `review/` is reserved for the
independent reviewer. Nothing here is a review or an approval.

| File | Content |
| --- | --- |
| [findings.md](findings.md) | Audit result per chapter, the repairs made, notation proposals for G05, literature leads for G03 |
| [ledger.md](ledger.md) | Input/output ledger: theorem-level outputs, incoming premises and producers, outgoing consumers, with edge IDs |
| [correspondence.md](correspondence.md) | Source anchors rechecked in this pass, including the one that supports the `c_F` repair |
| [validation.md](validation.md) | Commands actually run and their results, and the checks that were not run |
| [handoff.md](handoff.md) | Final hashes, what remains, and what the reviewer and the next author should do |

Summary. I read all fifteen chapters in full and checked them line by line
against their stated inputs. I recomputed every displayed constant and
inequality: the anchored-to-site conversion, the expanded insertion price, the
jet read-out and section prices, the filtration and Newton-remainder bounds,
the principal reserve, the BFS tree-graph cancellation and the forest count,
the packet/walk counts, the warning crowding estimate, the axial-gauge,
frame-synchronization and predictor first-power bounds, the guide, hit and
unhit comparison rows, and the final energy allocation. All of them hold as
written. No mathematical error was found.

The repairs are local:
- a corrupted `\rm` (rendered as stray italic text) in `leaf-transfer.tex`;
- an implicit choice `c_F = C_1/L^2` in the final energy allocation, now
  explicit and matched to the source;
- three symbols overloaded inside a single chapter (`v`, `z`, `d`);
- a wrong symbol for the coupling power in `mixed-activity-prices.tex`;
- packet counts renamed to the names their consumer already uses.

Cross-chapter notation clashes (notably the swapped roles of `h` and `H` in
the seed chapters) are recorded as proposals for G05 instead of being changed
unilaterally. Global closure is not claimed. The package's analytic inputs
(the raw one-step localized expansion, nonlinear transition, packet weight
bound, flat stack and path expansions, physical covariance bound and local
plateau estimates) remain explicit and are listed in the ledger with their
producers.
