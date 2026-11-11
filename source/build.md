# Build record: OpenAI-YM-20261028

| Field | Value |
| --- | --- |
| Source | `https://github.com/yang-mills-group/OpenAI-YM-20261028` |
| Revision | `3456e5e75cf8d4cd558955a5c7638fba2d68f464` |
| Toolchain | `leanprover/lean4:v4.32.0` |
| Status | **Not run** |

This import PR records the published source and its immutable revision only. No
Lean build, cache download, or independent validation has been performed in this
repository. Consequently it supplies no evidence that the imported project
builds here.

## Import-integrity check

The source distribution's own checksum manifest was checked after copying the
tree:

```sh
cd Lean
shasum -a 256 -c SOURCES.sha256
```

The command completed successfully on 11 November 2026: all 9,507 listed files
reported `OK`. This establishes that the copied files agree with the upstream
distribution's supplied checksum manifest; it is not a Lean build or an
independent verification of the manifest's contents.

The upstream `Lean/README.md` gives its stated verification sequence. A source
verification task should reproduce it in an isolated environment, recording the
platform, exact commands, outcomes, resource use, and links to retained logs or
artifacts before changing this status.
