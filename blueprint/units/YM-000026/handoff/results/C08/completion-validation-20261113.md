# C08 continuation validation

- Separate clone: /tmp/codex-c08-complete. Local base ba4528f; the thirteen C08 files were refreshed from the live codex/existence-monograph branch through GitHub before editing (snapshot commit 947ea0f). Other packages in the build remain the local snapshot; this is not an integration build of current remote HEAD.
- python3 scripts/check_blueprint.py: passed, four units; mathematics and Lean not verified.
- git diff --check: passed.
- latexmk -pdf -interaction=nonstopmode -halt-on-error -outdir=/tmp/c08-complete-build existence.tex: passed; log /tmp/c08-complete-build.log.
- Ghostscript rendered normalization, chart, cutoff and inherited-cancellation pages for inspection.
- Fresh Lean checks: not run. No review approvals updated.

## Final chapter SHA-256

manuscript/existence/forest-average-log.tex 79af5b5a56719d585b0d2ad9eaaa2d7765c0c0814d298a30e6708d80f65f0b5b

manuscript/existence/gaussian-reassembly.tex d84aecf66dc21b73af2f314f5d344c2429a36bd6f49db3a16e97d1d428546426

manuscript/existence/high-degree-cluster-prices.tex 42e79cd3cdb2755326f7ae151d139826e84f299783440a25be06777c49b21659

manuscript/existence/leaf-expansion.tex fc4000f6816556129f14e7c55db2caf9f9ed7db2add2bbcbf3f6921f6abe599f

manuscript/existence/marked-activity-jets.tex 47d7c628855e7876db56185ef3bc81bb6f73bf5000b59574faf8c1579c555ad3

manuscript/existence/marked-block-integral.tex 7a046b4d03cca6b4abf88ecf796d21d6d1c73b38e973e99c3df73c5d031e3f3f

manuscript/existence/nonlinear-singleton-inheritance.tex 288a71c743b6623b9ca9251f53efafe7f7741d47d69f609e86a3c6ab9566df9c

manuscript/existence/principal-comparison-jets.tex 2326bbc85cde5c702e7622ba244c29ba2cde9f40e154e3703af4f3eb5ab06fcc

manuscript/existence/principal-reference-attenuation.tex e3da4db58096422235082be44175ffaa0ea1f801c2c7e05136fcbc3f90f89b52

