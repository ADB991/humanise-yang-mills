"""Numerical sanity check of lem:ex-lattice-firesky-clock-fields
(manuscript/existence/trace-firesky-gallery.tex @ 1e511906, l.245-335).

Run: python3 -I clock_fields_check.py
Plain Python, no dependencies. Reads nothing, writes nothing.

Clock (sec:common-scale-selection, common-scale-selection.tex l.11-70):
  A_0=0, k_j=c_j+2A_j+1, A_{j+1}=A_j+b_{j+1}+2k_j+1, J_0(m)=j on [A_j,A_{j+1}),
  J(m)=j_*+J_0(m), s_0=0, s_{m+1}=s_m+log L_{J(m+1)}, a_m=e^{-s_m},
  hat-beta_m = beta_* + s_G s_m.
Entry requirement used by the lemma: log L_j <= s/j whenever s >= b_{j-j_*} log 3.
We choose b_{j'} as the least nonnegative integer making that true for the
chosen L (and c_j=0), which is an admissible instance of the section's choice.
Monitor mu_k = exp((loglog hat-beta_k)^2); cover size c_k = ceil((log hat-beta_k)^2).
"""
import math

LOG3 = math.log(3.0)


def make_clock(Lfun, jstar, beta_star, sG, K):
    # b_{j'} for stage j = j'+jstar: need log L_j <= s/j for s >= b log 3
    def bsel(jp):
        j = jp + jstar
        return max(0, math.ceil(j * math.log(Lfun(j)) / LOG3 - 1e-12))
    A = [0]
    while A[-1] <= K + 5:
        jcur = len(A) - 1
        kj = 0 + 2 * A[jcur] + 1          # c_j = 0
        A.append(A[jcur] + bsel(jcur + 1) + 2 * kj + 1)
    J0 = [0] * (K + 2)
    jj = 0
    for m in range(K + 2):
        while A[jj + 1] <= m:
            jj += 1
        J0[m] = jj
    J = [jstar + x for x in J0]
    s = [0.0] * (K + 2)
    for m in range(K + 1):
        s[m + 1] = s[m] + math.log(Lfun(J[m + 1]))
    # verify entry requirement where the lemma uses it
    entry_ok = all(math.log(Lfun(J[m + 1])) <= s[m] / J[m + 1] + 1e-12
                   for m in range(K + 1) if J[m + 1] > jstar)
    bh = [beta_star + sG * x for x in s]
    return A, J0, J, s, bh, entry_ok


def maxj(s, upto, target):
    # largest j<=upto with s[upto]-s[j] >= target (s increasing); -1 if none
    lo, hi = 0, upto
    if s[upto] - s[0] < target:
        return -1
    while lo < hi:
        mid = (lo + hi + 1) // 2
        if s[upto] - s[mid] >= target:
            lo = mid
        else:
            hi = mid - 1
    return lo


def run(name, Lfun, jstar, beta_star, sG, K, bs):
    A, J0, J, s, bh, entry_ok = make_clock(Lfun, jstar, beta_star, sG, K)
    print(f"== {name}: j*={jstar} beta*={beta_star} sG={sG} K={K} entry_ok={entry_ok}")
    print("   A_j:", A[:8], "...")
    # A_j - A_{j-1} >= 4/5 A_j and >= 4A_{j-1}+3
    rec = all(A[j] - A[j - 1] >= 0.8 * A[j] and A[j] - A[j - 1] >= 4 * A[j - 1] + 3
              for j in range(1, len(A)))
    print("   recursion bounds A_j-A_{j-1}>=4A_{j-1}+3 and >=4/5 A_j:", rec)
    # C_1 empirical: sup over k>=3 of loglog bh_k - log k ; s_k <= C0 2^k
    c1 = max(math.log(math.log(bh[k])) - math.log(k) for k in range(3, K + 1)
             if bh[k] > math.e)
    lin = all(s[k] >= k * LOG3 - 1e-9 * (k + 1) for k in range(K + 1))  # float-sum tolerance
    dbl = all(s[m + 1] <= 2 * s[m] + 1e-12 for m in range(K + 1) if J[m + 1] > jstar)
    print(f"   s_k>=k log3: {lin}; s_(m+1)<=2s_m at steps with J(m+1)>j*: {dbl}; "
          f"sup(loglog bh_k - log k)={c1:.3f}")
    for b in bs:
        last_fail = {}
        def fail(key, k):
            last_fail[key] = k
        for k in range(3, K + 1):
            u = math.log(math.log(bh[k])) if bh[k] > 1 else float('-inf')
            if u < 0:
                fail('u>=0', k)
                continue
            logmu = u * u
            ck = math.ceil(math.log(bh[k]) ** 2)
            l = maxj(s, k, (b + 2) * logmu)
            if l < 0:
                fail('item1-ell-nonempty', k); continue
            # w over j<=l with s_l - s_j >= 10 log c_k
            w = maxj(s, l, 10 * math.log(ck))
            if w < 0:
                fail('item1-w-nonempty', k); w = 0
            # repair chain: 3^l >= c_k^10
            if l * LOG3 < 10 * math.log(ck):
                fail('repair 3^l>=c^10', k)
            if ck > 2 * math.log(bh[k]) ** 2:
                fail('c_k<=2(log bh)^2', k)
            # displayed bounds (with the actual loglog, before log k + C1)
            if k - l > 1 + (b + 2) * logmu / LOG3 + 1e-9:
                fail('k-l bound', k)
            if l - w > 1 + 10 * math.log(ck) / LOG3 + 1e-9:
                fail('l-w bound', k)
            if l < k and not (s[k] - s[l + 1] < (b + 2) * logmu):
                fail('strict ell max', k)
            # item 2
            if J[w] < J[k] - 1:
                fail('item2 bracket', k)
            # item 3
            if not (bh[w] >= bh[k] / 2):
                fail('item3 plateau', k)
            jk = J[k]
            if jk - 1 <= 0:
                fail('J(k)-1>0', k)
            else:
                rhs = 2 * s[k] / (jk - 1) + 10 * math.log(ck) + (b + 2) * logmu
                if s[k] - s[w] > rhs + 1e-9:
                    fail('log(a_w/a_k) bound', k)
                if rhs > s[k] / 2:
                    fail('rhs<=s_k/2', k)
                if J[w + 1] <= jstar or J[l + 1] <= jstar:
                    fail('entry applies at w+1,l+1', k)
        print(f"   b={b}: last k (<= {K}) at which each check FAILS:",
              (last_fail if last_fail else 'none'))


if __name__ == '__main__':
    K = 400000
    bs = [0.5, 5.5, 20.0]
    run("L_j=3 (constant)", lambda j: 3, 1, 3.0, 1.0, K, bs)
    run("L_j=2j+1", lambda j: 2 * j + 1, 1, 3.0, 1.0, K, bs)
    run("L_j=2*3^j+1 (fast)", lambda j: 2 * 3 ** j + 1, 1, 3.0, 1.0, K, bs)
    run("L_j=3, j*=10", lambda j: 3, 10, 3.0, 0.1, K, bs)
