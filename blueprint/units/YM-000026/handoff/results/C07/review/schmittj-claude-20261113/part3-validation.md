# C07 review, part 3: validation (commands actually run)

All commands were run in `/home/jo314/ym-wt/c07-review` (HEAD `e058a61`), read-only except for this output directory. No Lean build, elaboration, axiom query or LaTeX build was run.

1. `git log --oneline -3` gave `e058a61` at HEAD. `git log --format='%H %P' -1 9f8fa0b` gave parent `81538d6dcf2e71f24cc74a4afc556dd015046691`.
2. `git diff --stat 9f8fa0b~1 9f8fa0b` listed 18 files (10 records, 8 chapters); `git diff 9f8fa0b~1 9f8fa0b -- manuscript/existence/packet-estimates.tex manuscript/existence/activity-jet-assembly.tex` was read in full (packet-estimates: +27/-8 around lines 133-152, 193-212; activity-jet-assembly: +5/-1 at lines 143-147).
3. `sha256sum` of the five chapters, compared with the coordinator's list `c07-hashes.txt`: all five MATCH.
   - `packet-estimates.tex` `22e6a79fb555bff564d4fa0868b4685238cd116652e745c3b59d9af990424077`
   - `activity-jet-assembly.tex` `f812bf27d1bd8b326c8f6950c22d161931c0d11cdcb7ceb3c6a60d1cce27a6b6`
   - `packet-annulus.tex` `792ae567fa768014a63e38a17f5da6fa24209f3a0f19a69b411d75a597b244da`
   - `itinerary-prices.tex` `28fc529ec6c83d5a06a48b394096053afefeb5a92a5a58171abfff4c28abc0ad`
   - `inherited-activity-prices.tex` `23786125ed0471f58dbc8901238658197ae8ea5c8b7d230f0aa42b7826a7a10e`
   The check was run at the start and again after writing the review; unchanged.
4. A Python script recomputed, for all 18 entries of `chapter-hashes.json`, the SHA-256 of the file at HEAD and at `git show 9d11cca4644bad07126bfa372cc85fb120dee7ba:<path>`, and compared with `current_sha256`, `released_sha256`, `changed` and `manifest.json` `chapters_sha256`: no mismatch; 8 entries have `changed: true`.
5. `git cat-file -t` on `9d11cca…` and `81538d6…`: commit; on `35173bd5c8e33a8eaed6e35531739d85ac061aae`: object not found (author snapshot unverifiable here).
6. `git rev-parse HEAD:Lean 9f8fa0b:Lean`: both `328ad19b404d2db2a578319ea3e4eba4b27e34ef`, as recorded.
7. `grep -n <hash prefix> blueprint/units/YM-000026/reviews/draft-review.md` for the five chapter hashes and `599c7bfc7e3c`: lines 868, 1050, 1048, none, none, and 1060 respectively, as recorded in `review-index.md` and `ledger.md`.
8. `grep` checks that each cited Lean declaration exists at the stated file (a shell loop over `lemma|theorem|def|abbrev|structure` and structure fields); all found. Declarations opened and read are listed in `part3-lean.md`.
