# Validation

Commands actually run, in the worktree at `codex/existence-monograph` `7edd9c2c`:

- `codex exec --model gpt-6-astra --sandbox read-only -C <worktree> <brief>`, three times (parts A, B, C), each with a brief asking for both review questions of `docs/proof-standard.md` and for verification of each finding before reporting. All three exited with status 0.
- `sed -n` on the passages quoted in `README.md` and in the coordinator notes of `mathematics.md`, to re-read each finding in the LaTeX.
- `grep -n` and `sed -n` on the Lean files listed at the end of `lean.md`.
- `sha256sum` of the reviewed files (`hashes.json`).
- `python3 scripts/check_blueprint.py` (result recorded in the pull request).

Not run: Lean elaboration, `lake build`, `#print axioms`, kernel replay, `latexmk` (no manuscript file is changed by this review).
