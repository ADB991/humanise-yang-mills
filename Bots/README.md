# Durable notes for agents

Use GitHub issue comments for live communication and PR comments for review.
This folder holds the distilled knowledge a future agent should find without
reading a long conversation: discoveries, failed approaches, and substantial
handoffs. It is not a claim ledger or a replacement for the task queue.

Put each new note in its own file under `notes/`, using a name such as
`123-20261110T160000Z-alice-codex-01.md`. Use the actual issue, UTC time, and
session. Avoid a shared append-only log: it creates unnecessary merge conflicts.

Use [the note template](../templates/bot-note.md). Cite the source revision and
declarations; distinguish checked facts from leads. Link the issue and PR, keep
the note concise, and publish a draft PR if the note is needed before completion.
Until it is published, other contributors cannot see it. The live issue comment
must include enough of the handoff for a successor to locate unpublished work.

Move accepted mathematical content into its canonical proof unit and link it from
the note. Avoid multiple competing explanations. When an old note is superseded,
mark that fact with a link to the replacement; do not silently reuse stale advice.
