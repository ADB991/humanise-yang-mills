# C14 source-leakage author validation

Session `mgubi-astra-c14-leakage-author-20261113`; base `69b2631f7a3d3c4176ca0084d8607cb9d8d124a2`; source pin `3456e5e75cf8d4cd558955a5c7638fba2d68f464`. Author work under mgubi; no independent approval. All 42 issue #193 rows are answered in the response table. Six manuscript chapters changed, plus the appended input ledger and new author artifacts; no reviewer files, other chapters, shared files or source changed.

## Actual checks

- Read current AGENTS/contribution/coordination/proof-standard instructions, issue #193 and comments, parent #55 history, audit #159/#164, relevant C14 author and review records, source README and shared literature index. Focused literature searches supplied no substitute for these project-specific receipts; no new external theorem or invented proof is used. Bots/notes had no relevant files.
- Read all changed passages and immediate local proofs, the receiver/medium lemmas, firesky selection/lift interface, and the five source files fingerprinted below (relevant ranges, not an audit of every declaration). Source `Optics`/`Optics_pay`/`aprilA` were inspected directly for the material eventuality repair.
- `python3 scripts/check_blueprint.py`: passed, “Blueprint structure OK: 4 units. Lean and mathematics were not verified.”
- `git diff --check`: passed.
- `latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/private/tmp/c14-leakage-build existence.tex`, run from `manuscript/`: exit 0, 982 pages. This is the repository's documented latexmk procedure applied to the assembled existence monograph, with scratch output. Final log: `/tmp/c14-leakage-latexmk-final.log`; TeX log `/private/tmp/c14-leakage-build/existence.log`. No undefined-reference/citation or multiply-defined-label warning. One existing 1.82599pt overfull box in `public-run-binding.tex` lines 39–47, outside scope; no changed-chapter overfull box.
- System Poppler was unavailable. Installed PyMuPDF 1.28.2 in the temporary `/tmp/c14-pdf-env` using uv, extracted PDF text once to locate changed passages, rendered pages to `/tmp/c14-render/`, and visually inspected pages **786, 814, 833–840, 848–852, 854–857, 861, 876, 886** (22 pages) in six four-page sheets. Equations, references, margins and paragraph breaks are legible, without clipping/overlap. Search also matched unrelated pages 312 and 938; those are not claimed as changed-page inspections.
- Python verified exactly 42 distinct numbered response rows, generated final hashes for six chapters and two author records, and checked all five inspected source-file digests against `Lean/SOURCES.sha256`. The hash file contains 13 entries. The validation and hash files do not hash themselves.
- Two small follow-up text-edit helper invocations initially used a repository-relative path from `manuscript/` and raised FileNotFoundError before writing. They were rerun from the worktree root; the final build and checks above concern the corrected final files. An initial PDF text search repeatedly parsed the whole PDF; the final page map/render pass used a cached single extraction.
- No Lean command, axiom replay, checker test suite, shared integration or merge was run. The checker was not changed. Successful build and author checks are not mathematical acceptance.

## Final chapter fingerprints

| Chapter | Base SHA-256 | Final SHA-256 |
| --- | --- | --- |
| `trace-free-rank.tex` | `004d418a0f2121ed1fa3bd3ec3b1b6c06f39afa62203d23e17e0f2b6cabcedef` | `ace51fd4677bb25495c0f53855fb5c0731fbea0dd50f1735a76102c885e8dc89` |
| `physical-ward-free-classification.tex` | `e3356f9ba36869afdce60614e5e2680eed000d93f0b03d9bf7a951336ea381e7` | `9b8835110fba112df5df7820a8e503481d050c6f0ac89067cb59c7228c376457` |
| `trace-calibration-producer.tex` | `404f5e4cf240f155da5ca3c65719910299a6a0aafd84fcc7568bdb3da06b1035` | `ebb2d9647a095e3c0749c48aeeccd00aad37b96d2d3ef68023deb1ec4b26e609` |
| `actual-stress-shell-nodes.tex` | `fef7f53c3c74b7b2e15ba070589b767baf9dd39ea36f5fbefc711c935d7f192d` | `60ab328de5537583bef9b055ff83daaad5e2348d237f67102eca58160e2a36e7` |
| `actual-stress-annulus.tex` | `953b8bc789daf7685a10bda2f07b26e524688c54860d399ce25b89017d9db21b` | `bff031342188b91d200ff8ad0ece8da6a363f95f4da199ed389881ce1709dcfd` |
| `physical-ward-propagation.tex` | `89956e3fdb977acbce453c190bf0a9b42dc22516e5a8577cd198232b3be39f9d` | `8d6926618f5fb55b0ed5ba8f23bff65a8609615643161de5320aecaeb1c6c0a3` |

The source-leakage response identifies the one material optical quantifier repair and all remaining #177/free-rank findings. Other inherited producer claims are not certified here. A different-account independent mathematical/source review is required before accepting this draft; parent author-side inspection is not that review.

Submission recheck: issue #193 still contains this unexpired author claim, with no overlapping successor; the latest #55 handoff remains the PR #177 review and its unresolved findings. The author/reviewer claims on #55 are released or disjoint. The submitted diff is confined to the six named chapters, the appended C14 ledger and three new C14 author artifacts.
