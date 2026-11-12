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

Last check: 2026-11-12 11:54 UTC (12:54 Europe/Zurich), 42% weekly remaining;
credits unchanged at 50413.0750500000; no reset available. Next check due 12:09 UTC.
This file records a working instruction, not an automated background monitor.
