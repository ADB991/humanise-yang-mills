# Source provenance and verification

`upstream.json` is the source manifest. It records the imported release at the
immutable revision `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Import integrity
has been checked against the upstream checksum manifest, but no successful Lean
build or independent proof validation is implied. See [build.md](build.md) and
[audit.md](audit.md).

The source was imported through the review workflow described in
[sync.md](sync.md). That workflow can propose later upstream revisions, but each
revision still requires the build, statement, dependency, and axiom audits below.

## Import procedure

1. Put the complete upstream project under `Lean/`, preserving its directory
   layout, toolchain file, dependency lock file, and licence notices. Do not copy
   its nested `.git` directory. Retain the upstream URL and exact commit, or an
   archive URL and SHA-256 digest if no commit is available.
2. Set the manifest to `imported`. Record `url`, immutable `revision`, exact
   `lean_toolchain`, project-relative `project_root`, and `license` identifier or
   notice path. `revision` is a full commit hash or `sha256:<archive digest>`.
3. Reproduce upstream's build instructions using the pinned dependencies. Write
   `source/build.md` with working directory, platform, versions, commands, outcomes,
   resource use, and log/artifact links. Keep failed checks and remaining blockers
   visible. An imported source is not yet a verified source.
4. Identify the actual final declarations; record their fully qualified names in
   `targets`. Write `source/audit.md` with their exact statements, relevant
   definitions, transitive axiom reports, and the mathematical scope established.
   Empty `targets` means target identification is still pending.
5. Record the upstream-supported verification method and any additional independent
   checking used. Use commands appropriate to this pinned Lean version, rather
   than assuming current tools work on an older release.

Run build scripts from a reviewed source snapshot in a suitable isolated environment
without contributor credentials. Keep the expensive full source build separate
from cheap prose checks; publish reusable results keyed by source and toolchain.
Fork PR checks should not receive write credentials or execute privileged workflows.

Audit snippets may use `#check`, `#print`, and `#print axioms` after importing the
relevant modules. Record the actual command and output. Keep inspection code in
a separate audit workspace or documented overlay; preserve upstream `Lean/`.

## Source changes

The manifest pins the active explanation wave. Every unit refers to that exact
revision. Changing it requires a coordinated migration and renewed review where
needed. Archive older evidence; do not relabel old build logs as a new verification.
