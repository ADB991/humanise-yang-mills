# Dependency-inventory regeneration for `3456e5e`

## Method

`Lean/verification/Usage.lean` writes its two TSV outputs relative to the current
working directory. To avoid overwriting the imported source evidence, the audit
created a temporary overlay containing only a copy of
`verification/joint-headlines.txt`, then ran the pinned Lean executable with
Lake's environment from the project:

```sh
mkdir -p /private/tmp/ym-issue2-usage-3456e5e.sjDkMo/verification
cp Lean/verification/joint-headlines.txt \
  /private/tmp/ym-issue2-usage-3456e5e.sjDkMo/verification/joint-headlines.txt
cd Lean
env PATH=/Users/hairer/.elan/toolchains/leanprover--lean4---v4.32.0/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin \
  /usr/bin/time -p lake env sh -c \
  'cd /private/tmp/ym-issue2-usage-3456e5e.sjDkMo && /Users/hairer/.elan/toolchains/leanprover--lean4---v4.32.0/bin/lean -j1 -DmaxHeartbeats=0 -DmaxRecDepth=4096 /Users/hairer/humanise-yang-mills/Lean/verification/Usage.lean'
```

The command exited successfully after 104.49 seconds:

```text
USAGE_PASS headlines=17 project=250319 used=100168 outside=150151 modules=9469 modulesWithNoUsedDeclaration=2946
```

The root list generated from `source/upstream.json` was identical to
`Lean/verification/joint-headlines.txt`; both had SHA-256 digest
`4a5d4eba5d143858d12466aa818c4bfe202e548fc208b87264932a857f492745`.

## Inventory comparison

| Inventory | Checked-in SHA-256 | Regenerated SHA-256 | Byte comparison |
| --- | --- | --- | --- |
| `declaration-usage.tsv` | `1f16d6cbf7cd650c7edccd08f95967ce92cd7e36ec68cfdd081621aec126c5e9` | `9dc9a62a163d973cb37a94abc74280e7925a83a608e26b731a124d0202be4d2a` | Different |
| `module-usage.tsv` | `f9db49e0d1b7bc8262ecb7f77b18f378db687e9ed87356c42010f560dac265dc` | `f9db49e0d1b7bc8262ecb7f77b18f378db687e9ed87356c42010f560dac265dc` | Identical |

Both declaration files contain 250,320 lines, including the header. Comparing
only columns 1–5 (`module`, `declaration`, `status`, `headline_witness`, and
`immediate_user`) gives the same SHA-256 digest for each file:
`49c107bbdc756c4449cd13be8a0d2329fc003f4e192e80357069e72521d2daac`.
Thus declaration membership, classifications, endpoint witnesses, and immediate
users all agree. The only differences are these three `source_line` cells:

| Declaration | Checked-in line | Regenerated line |
| --- | ---: | ---: |
| `_private.YM.Work.F05.PiDensity.0.YM.Work.F05.lprodFin` | 17 | 19 |
| `YM.Work.F05.lprod` | 43 | 45 |
| `YM.Work.F05.piDensity` | 51 | 53 |

The regenerated values match the declarations' actual lines in
`Lean/YM/Work/F05/PiDensity.lean`. That file has SHA-256 digest
`cd3ec57d549b531ae10f2693a61f19fdb0f8f8ddedebfc3fd0730170e2862741`,
which matches its entry in `Lean/SOURCES.sha256`; it is not a local edit. Two
attribution-comment lines occur immediately above `lprodFin`, consistently with
the uniform offset. This audit does not establish when or from which source layout
the checked-in declaration TSV was generated.

The checked-in inventories were deliberately left unchanged, as required by the
task. The mismatch is evidence to review, not something to overwrite silently.

## What this establishes

For the imported source and restored compiled artifacts, the project-supplied
constant-reachability traversal completed for all 17 roots and reproduced the
published aggregate counts. Its output confirms 100,168 reached declarations and
150,151 declarations outside the root closures in the 250,319-declaration audit
universe. The module-level inventory is exactly reproducible; the declaration
inventory is reproducible apart from the three reported source locations.

This is a syntactic dependency inventory, not a mathematical proof graph. A
witness is one traversal path, generated declarations and implementation plumbing
are included, and dependencies outside the enumerated project modules are not TSV
rows. The result does not classify which declarations need exposition or validate
the physical interpretation of any endpoint.
