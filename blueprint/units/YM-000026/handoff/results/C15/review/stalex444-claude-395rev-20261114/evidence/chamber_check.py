# Brute-force check of the inequalities in lem:ex-lattice-firesky-chamber (PR #395 @ 29f27cdb, l.209-227).
# q = a_w/a_N odd; site offset |u| <= floor(q/8); stencil coords |s| <= Z; link endpoints u+s, u+s+e (e = +-unit).
# Home cell (link seams, centered): offsets |r| <= (q-1)/2.
from fractions import Fraction as F
rows=[]; bad=[]
for q in range(1,401,2):
    for Z in range(0,30):
        cond = F(Z+2) < F(3*q,8)              # (mesh) divided by a_N
        umax = q//8                            # integer |u| <= q/8
        worst = umax + Z + 1                   # worst endpoint coordinate
        inside = worst <= (q-1)//2             # in the (closed-offset) home cell
        strict = worst < F(q-1,2)              # proof's strict claim
        proof_chain = (F(q,8)+Z+1 < F(q,2)-1) and (F(q,2)-1 < F(q-1,2))
        if cond and not (inside and strict and proof_chain): bad.append((q,Z))
        if q in (3,5,7,9,11,17) and Z in (0,1):
            rows.append((q,Z,cond,worst,(q-1)//2,inside))
for r in rows: print("q=%d Z=%d cond=%s worst=%d half=%d inside=%s"%r)
print("counterexamples (cond true, conclusion false):", bad)
# minimal q for which cond holds, vs minimal odd q for which the conclusion actually holds
for Z in range(0,6):
    qc=min(q for q in range(1,401,2) if F(Z+2)<F(3*q,8))
    qt=min(q for q in range(1,401,2) if all((q//8)+Z+1 <= (q-1)//2 for _ in [0]))
    print("Z=%d: smallest odd q with (mesh) = %d; smallest odd q where conclusion holds = %d"%(Z,qc,qt))
# N<k case: mesh condition holds at N=w+2 (a_w/a_N>=9) when Z=0, while a_k/a_N need not be an integer if N<k
print("Z=0, q=9:", F(0+2)<F(27,8))
