# C13 continuation validation

- Separate clone /tmp/codex-c13-complete; local base ba4528f. All 22 C13 chapters refreshed from live codex/existence-monograph before editing, snapshot 33ea942. Other build inputs remain the local snapshot; this is not a current-HEAD integration build.
- python3 scripts/check_blueprint.py: passed, four units; mathematics and Lean not verified.
- git diff --check: passed.
- latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/c13-complete-build existence.tex: passed; log /tmp/c13-complete-build.log.
- Ghostscript rendered the corrected forced-output proof and reader-price pages, which were visually inspected.
- Fresh Lean elaboration/kernel checks/axiom replay: not run.
- No review approvals changed. Independent mathematics and source-correspondence review required.

## Final chapter SHA-256

manuscript/existence/actual-corrected-body-compiler.tex 644243b41adce386b596fca831df3b74632a87d70a47703e713be6b8837d8fa8

manuscript/existence/actual-local-compiler-handoff.tex baf20f6f32c2ba7f6a539be4915c3691f89d950b621720865e3b1a942a417b55

manuscript/existence/actual-mixed-marked-compiler.tex 32afbffdbb4f1a83614188d499fcb3e1f47aac9a99794c4651e1b757f7b3ef3a

manuscript/existence/actual-reader-dawn-selection.tex b458791a4946b82cbd37318652d8749c228a3617a6ac30886b476e046da9d389

manuscript/existence/actual-reader-guarded-curvature.tex bc9ffaf2f2df42fbf63e5444f9cbe63024a70e828ad696703df9467ac2ee9bff

manuscript/existence/actual-reader-small-window-bridge.tex a14205f268995ff5e93f02b57b2ba98d8357ba89b6ecc371166061ccc87febcf

manuscript/existence/allarity-coordinate-calibration.tex dcd9e44b550cb3ec54072570947d8fb381ba69a140226a84f5dde16572100c08

manuscript/existence/allarity-marked-propagation.tex ceae49d5d363fe9454ec4ec8c107c3046fc10cc45c95fa7c5d19f2d75623d362

manuscript/existence/allarity-planted-compiler.tex 2077c4cb2365a39b23c02d9aced3a16b7853e62e08567b4dc804db88bdf30d52

manuscript/existence/marked-healthy-cumulant-launch.tex 7d3805eb4fff4754c597c19c3fc3e8477ee86679c45499f48492a503f3181f8f

manuscript/existence/restarted-rank-history.tex de0cfb90d99622faeb1eaaa7ec49cfd8422ff47381b0cc5388d70190ee8b8b57

manuscript/existence/selected-history-limits.tex d7919bdb7c39feb4215a22d61ad1eb5a3ed471406e5dda51ff6d33ea0dcb44ad

manuscript/existence/three-panel-weak-comparison.tex 5f67fbce57159172bade4878c2b93fa4146d75d6cce153ee8c23e29db8ddec8b

