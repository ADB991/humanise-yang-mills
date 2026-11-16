# C04 row 58: bounded mathematics review

- Session: `mgubi-astra-c04-leakage-review-20261113`, contributor account mgubi; one GPT-6 Astra subagent, with parent inspection. The account did not author the target. Human acceptance is **unset**.
- Task: [issue 184](https://github.com/hairer/humanise-yang-mills/issues/184); [claim](https://github.com/hairer/humanise-yang-mills/issues/184#issuecomment-6860996569).
- Exact target: [PR 203](https://github.com/hairer/humanise-yang-mills/pull/203), `9e7326b832793a0a8db6d08d045e024874f1178b`; parent `2017d6f3ee648beb054322e9b994eb3c757cbcf6`.
- Scope: audit row 58 in `complex-heat.tex`, the new `source-leakage-row58-20261113.md`, immediate coordinate definitions and the earlier coordinate caveats. This is not a full C04 review or renewed approval of inherited prose.
- Fingerprints: `inputs.json` and its verifier record immutable Git objects and SHA-256 values; whole-file hashing does not imply whole-file proof verification.
- Outcome: **no required correction to the row-58 edit or its new record; bounded local readiness only, with the inherited coordinate caveats still unresolved**.

## Row disposition and retained content

B is the correct audit class. The manuscript change deletes exactly `, as does the formal source` from the sentence asserting that the statement chapter uses time last. An exact byte comparison verifies that no other chapter content changes. The sentence still states the mathematical convention directly, and the comparison with the source is now supported by qualified definitions in the new author record.

The time-last convention of `statement.tex` and the time-first Minkowski notation of the C04 paragraph remain intact. The author record explicitly says that the surrounding coordinate-permutation discussion has not been repaired. It neither marks the old review accepted nor claims to discharge a mathematical input.

## The inherited coordinate caveat remains a real caveat

The earlier [PR 91](https://github.com/hairer/humanise-yang-mills/pull/91) finding is preserved accurately. For C(t,x₁,x₂,x₃)=(x₁,x₂,x₃,t), the two metric matrices satisfy η_last=Cη_first Cᵀ, and the corresponding linear actions satisfy L_last=CL_first C⁻¹. This is a passive identification between different coordinate realizations. It is not preservation of the fixed time-first matrix or cone: e₀ is future timelike in that realization, whereas Ce₀=e₃ is spacelike when interpreted in the same fixed realization. The unchanged phrases “to themselves” and “transfers verbatim” therefore still need the earlier clarification.

The new record also preserves the exception to the paragraph's blanket time-first convention. At the frozen target, Euclidean insertion points are still `(x_i,y_i)` in `analytic-boundary.tex:60` and `heat-vectors.tex:51,57`, and `(x,Y)` in `lorentz-covariance.tex:74,84`, with the time/height variable last. Those locations were read directly. The row-58 deletion does not resolve that exception, and this review does not approve those unchanged sentences by implication.

The correct future repair is already described in PR 91: specify time-first **Minkowski** coordinates, retain time-last **Euclidean** insertions, and state transfer under the coordinate and conjugation substitutions. No new author edit or broader C04 claim is made here.

## Limits and next step

The source-leakage relocation is adequate within issue 184's single-row scope. The outstanding coordinate repair remains for a separately authorized author pass; all other prior C04 findings, producer inputs, literature checks and package-level acceptance remain outside this review. The shared OS background note was searched and its coordinate-comparison entries inspected; no external theorem or new literature result is required for deletion of this clause. No claim of a fresh reconstruction proof or literature verification is made.

Checks and exact hashes are in `validation.md` and `inputs.json`. No manuscript, author record, source or old review was modified. Responsible human acceptance remains unset.
