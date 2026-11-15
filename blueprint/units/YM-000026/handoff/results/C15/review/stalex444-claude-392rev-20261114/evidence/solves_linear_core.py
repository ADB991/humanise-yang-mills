"""Linear-algebra core of lem:ex-lattice-firesky-solves (trace-firesky-gallery.tex @ 1e511906, l.164-180).

Plain Python, exact rationals (fractions.Fraction), no numpy. Run: python3 -I solves_linear_core.py

Setting (finite-dimensional, as in actual-rank-purchases.tex l.13-14, 110, 196):
  V = Q^n with the l1 norm |.|_1; each coordinate i has a position degree pos[i] and a factor degree fac[i] >= 0.
  A (calibrated entry map) invertible, so |v|_1 <= D |Av|_1 with D = ||A^{-1}||_{1->1}  (eq:rank-reference-inverse).
  T (reading) = A - K A with ||K||_{1->1} <= 1/2, so |Av - Tv|_1 = |K A v|_1 <= 1/2 |Av|_1  (half-accuracy, (F5)).
  S_sigma = diag(sigma^fac[i]), W_m = diag(m^pos[i]).
Checks:
  (1) T injective (det != 0) for many random instances; |v|_1 <= 2D|Tv|_1 on random v.
  (2) X e := T^{-1}(S_sigma^{-1} W_m e) satisfies S_sigma(T X e) = W_m e, and is the unique solution.
  (3) Necessity controls: (a) A singular -> T = A satisfies half-accuracy but is singular;
      (b) constant 1 instead of 1/2 -> T = 0 satisfies |Av - Tv| <= 1*|Av| and is singular.
"""
from fractions import Fraction as F
import random

random.seed(392)


def matmul(X, Y):
    n, m, p = len(X), len(Y), len(Y[0])
    return [[sum(X[i][k] * Y[k][j] for k in range(m)) for j in range(p)] for i in range(n)]


def matvec(X, v):
    return [sum(X[i][k] * v[k] for k in range(len(v))) for i in range(len(X))]


def l1(v):
    return sum(abs(x) for x in v)


def op1(X):  # l1 -> l1 operator norm = max column abs sum
    return max(sum(abs(X[i][j]) for i in range(len(X))) for j in range(len(X[0])))


def inverse(X):
    n = len(X)
    M = [row[:] + [F(int(i == j)) for j in range(n)] for i, row in enumerate(X)]
    for c in range(n):
        piv = next((r for r in range(c, n) if M[r][c] != 0), None)
        if piv is None:
            return None
        M[c], M[piv] = M[piv], M[c]
        pv = M[c][c]
        M[c] = [x / pv for x in M[c]]
        for r in range(n):
            if r != c and M[r][c] != 0:
                f = M[r][c]
                M[r] = [a - f * b for a, b in zip(M[r], M[c])]
    return [row[n:] for row in M]


def rand_mat(n, lo=-5, hi=5):
    return [[F(random.randint(lo, hi)) for _ in range(n)] for _ in range(n)]


def rand_contraction(n, bound=F(1, 2)):
    K = rand_mat(n)
    s = op1(K)
    if s == 0:
        return K
    scale = bound / s * F(random.randint(1, 10), 10)  # op norm in (0, bound]
    return [[x * scale for x in row] for row in K]


fails = 0
trials = 0
for n in (2, 3, 4, 5):
    for _ in range(40):
        A = rand_mat(n)
        Ainv = inverse(A)
        if Ainv is None:
            continue
        trials += 1
        D = op1(Ainv)
        K = rand_contraction(n)
        KA = matmul(K, A)
        T = [[A[i][j] - KA[i][j] for j in range(n)] for i in range(n)]
        # half-accuracy on random vectors (it holds for all v by construction)
        for _ in range(10):
            v = [F(random.randint(-9, 9)) for _ in range(n)]
            Av, Tv = matvec(A, v), matvec(T, v)
            assert l1([a - t for a, t in zip(Av, Tv)]) <= F(1, 2) * l1(Av)
            assert l1(v) <= D * l1(Av)
        Tinv = inverse(T)
        if Tinv is None:
            fails += 1
            continue
        for _ in range(10):
            v = [F(random.randint(-9, 9)) for _ in range(n)]
            assert l1(v) <= 2 * D * l1(matvec(T, v))
        pos = [random.randint(0, 3) for _ in range(n)]
        fac = [random.randint(0, 3) for _ in range(n)]
        sigma = F(random.randint(1, 9), random.randint(1, 9))
        m = F(random.randint(1, 9), random.randint(1, 3))
        for j in range(n):
            e = [F(int(i == j)) for i in range(n)]
            We = [m ** pos[i] * e[i] for i in range(n)]
            Sinv_We = [We[i] / sigma ** fac[i] for i in range(n)]
            X = matvec(Tinv, Sinv_We)
            lhs = [sigma ** fac[i] * c for i, c in enumerate(matvec(T, X))]
            assert lhs == We, (lhs, We)
print(f"(1)-(2) instances with invertible A: {trials}; T singular in {fails} of them; "
      f"X e solves S_sigma(T X e) = W_m e exactly in all others; uniqueness = det T != 0")

# (3a) A singular: T = A satisfies half-accuracy (zero error) but is singular.
A = [[F(1), F(2)], [F(2), F(4)]]
print("(3a) A singular, T = A: half-accuracy holds trivially; T invertible?", inverse(A) is not None)
# (3b) constant 1 instead of 1/2: T = 0 has |Av - 0| = |Av| <= 1*|Av|; T singular.
print("(3b) constant 1: T = 0 satisfies |Av - Tv| <= |Av|; T invertible? False (T = 0)")
