"""Adversarial math checks for hairer/humanise-yang-mills #377 (commit 01f5bf3c).

Run: python3 -I math_adversarial_377.py
Checks (symbolic, then numeric toy sequences):
 1. Which way up lambda_i is: scribe P = q r^4 U^{-1}, branch Psf = beta_Z r^4 U^{-1}
    (trace-branch-moments.tex 126, 137) => P = (q/beta_Z) Psf = lambda^{-1} Psf.
 2. Branch moment map M_i = U^{-1} c V_{k,omega} with V_{k,c} = pi(c theta^2 A^{-1})
    is linear in omega, so replacing omega by lambda^{-1} omega scales M_i by lambda^{-1}.
 3. Trace formula tr M(w) = 4(w1 + 4 w2) O at w^+ = (0, 1/4, 0) gives 4 O.
 4. Toy sequences: ratio limits => lambda -> 1; the three transfers; finitely many
    early indices with lambda^{-1} > 2 do not matter.
 5. What is at stake if the two units' clocks differed by a fixed factor c.
"""
import sympy as sp

q, bZ, r, w, lam, theta = sp.symbols('q beta_Z r omega lambda theta', positive=True)
Uinv = sp.Symbol('Uinv', commutative=False)

# 1. orientation of lambda
P_scribe = q * r**4
P_branch = bZ * r**4
lam_def = bZ / q
ratio = sp.simplify(P_scribe / P_branch)
print("1. P_scribe/P_branch =", ratio, "; lambda^{-1} =", sp.simplify(1 / lam_def),
      "; equal:", sp.simplify(ratio - 1 / lam_def) == 0)

# 2. linearity of V_{k,c} in c
c = sp.Symbol('c', positive=True)
V = lambda cc: cc * theta**2  # scalar stand-in for pi(c theta^2 A^{-1}); linear in c
print("2. V(omega/lambda) / V(omega) =", sp.simplify(V(w / lam) / V(w)))

# 3. trace formula
w1, w2 = sp.Rational(0), sp.Rational(1, 4)
print("3. tr M(w^+) / O =", 4 * (w1 + 4 * w2))
for name, (a, b) in {"w0": (-1, sp.Rational(1, 4)), "w-": (0, 0)}.items():
    print("   tr M(%s)/O =" % name, 4 * (a + 4 * b))

# 4. toy sequences
import math
def run(N, early_bad=True):
    out = []
    for i in range(1, N + 1):
        j = i                     # frame level
        k = j + 3                 # summit index >= frame level
        bh = 5.0 + 2.0 * k        # affine clock (beta-bar + kappa * s_k)
        z = bh
        zeta = bh + math.sqrt(k)  # zeta/bh -> 1
        bZk = bh - 3.0 * math.log(k + 1)  # beta_Z/bh -> 1
        if early_bad and i <= 3:
            bZk = bh / 4.0        # early indices with lambda^{-1} > 2 (finitely many)
        lam_i = bZk / zeta
        Psf = 1.0 + 1.0 / k       # P_i(Q_i) -> M = 1
        trPsf_false = math.exp(-0.1 * k)  # z * tr -> 0
        P = Psf / lam_i
        out.append((i, lam_i, 1 / lam_i, P, z * trPsf_false / lam_i))
    return out
rows = run(4000)
for i in (1, 2, 3, 4, 10, 100, 1000, 4000):
    i_, l, li, P, wz = rows[i - 1]
    print("4. i=%5d lambda=%.6f lambda^-1=%.6f  P(Q)=%.6f  z tr P(Q)=%.3e" % (i_, l, li, P, wz))
print("   indices with lambda^-1 > 2:", [r_[0] for r_ in rows if r_[2] > 2])

# 5. stake: a clock off by a factor c in one unit would give lambda -> c, not 1
cfac = 2.0
k = 10**6
bh = 5.0 + 2.0 * k
print("5. if branch clock were c*bh with c=2: lambda ~", (cfac * bh) / bh,
      "-> field limit would be M/c, trace limit 4O/c")
