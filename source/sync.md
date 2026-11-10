# Automated source mirror

`.github/workflows/sync-lean-source.yml` mirrors the public upstream project
from `yang-mills-group/OpenAI-YM-20261028` into `Lean/`. It records the resolved
full commit hash and toolchain in `source/upstream.json`, checks the structural
metadata, and opens or updates one pull request. It never pushes the imported
source directly to `main`.

## Activation

1. In this repository, allow GitHub Actions workflows to create pull requests
   and grant the workflow `contents: write` and `pull-requests: write` access.
2. For immediate notifications, copy
   [`upstream-dispatch.yml`](upstream-dispatch.yml) into the upstream repository
   at `.github/workflows/`. Create the upstream secret
   `YM_DOCUMENTATION_DISPATCH_TOKEN`: a fine-grained token restricted to this
   repository with **Contents: write** permission. It is used only to send a
   `repository_dispatch` event; the target workflow still derives all imported
   files from the fixed upstream URL.
3. If the upstream repository is private before release, add its read-only
   fine-grained token here as `UPSTREAM_READ_TOKEN`. Omit it once the source is
   public.

The target workflow also polls twice per hour. That catches the first public
release, when an upstream workflow could not yet have run, and is a fallback if
the dispatch configuration is unavailable. GitHub may delay scheduled workflows
and can disable them after prolonged repository inactivity; the dispatch is the
prompt path.

## Review boundary

The mirror PR establishes source provenance only. Reviewers must still perform
the import procedure in [README.md](README.md): reproduce the upstream build,
write build evidence, identify the target declarations, and audit any effect on
existing proof units. A later upstream revision must be coordinated before merge
if it changes a source revision used by existing units. In that case the
blueprint check intentionally remains red after the PR is opened; it is a record
of the source-revision migration that must be completed before merging.
