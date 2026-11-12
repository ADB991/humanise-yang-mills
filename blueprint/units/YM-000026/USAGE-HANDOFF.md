# Maintainer stop condition — 12 November 2026

The maintainer instructed in chat: when remaining weekly usage reaches **30%**,
break **all remaining work** into separate work packages suitable for other
agents, push the handoff to the repository, and stop this parent and its active
subagents. The maintainer will request the final pass after those packages are
complete. This supersedes the earlier below-2% reset/continue instruction.

Check the account usage every 15 minutes during active work. Use the weekly
window (`windowDurationMins: 10080`); remaining percent is 100 minus usedPercent.
At or below 30%, stop mathematical expansion, collect existing work, and do only
the bounded packaging/validation/push needed for the requested handoff. Do not
consume a reset or resume proof work without a new instruction.

Each package must state its result, exact input interfaces and their status,
pinned Lean declarations/paths, existing canonical proofs to reuse, owned output
paths, dependencies/parallelism, acceptance criteria and independent review needs.
Include source-audit and dependency-closure work as well as mathematics. Keep the
final integration/editorial pass explicitly reserved for the user's later request.
Reconcile live claims, release parent-owned scopes on handoff, link each package
from the parent issue, and preserve unfinished drafts with honest status.

Stop triggered: 2026-11-12 13:46 UTC (14:46 Europe/Zurich), **30% weekly
remaining** (used70%, weekly window10080 minutes). Credits remained
50413.0750500000; no reset was consumed. Parent and all three subagents were
instructed to freeze. Only bounded handoff validation/publication continued.
No background monitor or automatic resume is scheduled. Final pass requires
the user's later instruction. See handoff/README.md and the release in issue26.
