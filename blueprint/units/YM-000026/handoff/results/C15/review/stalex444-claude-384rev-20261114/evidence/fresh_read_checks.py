"""Fresh-read numeric checks for trace-rounded-receipt.tex at 3166276d.
Checks: cost-lemma exponent identity, supply arithmetic a=e^{2I}=mu^{1/(8M)},
e^{I}/a = mu^{-1/(16M)}, width-lemma chain, reduced-threshold argument on
random clocks (incl. K=0, i=0), K(d,eps) for non-monotone monitors."""
import random, math
from mpmath import mp, mpf, log, exp
mp.dps = 50
random.seed(1)
# cost lemma and supply arithmetic
for M in [2,3,10,52]:
    for eps in [mpf(1), mpf(1)/2, mpf(1)/(M-1)]:
        mu = eps**(-16*M)
        assert abs(mu**(-mpf(1)/(16*M)) - eps) < mpf(10)**-40
    mu = mpf(10)**random.randint(1,30)
    I = log(mu)/(16*M); a = exp(2*I)
    assert abs(a - mu**(mpf(1)/(8*M))) < mpf(10)**-30*a
    assert abs(exp(I)/a - mu**(-mpf(1)/(16*M))) < mpf(10)**-40
print("cost/supply arithmetic ok")
# width lemma: r*mu^2<=a_l and mu^2>=8R => r*R<=a_l/8
for _ in range(10000):
    R = random.uniform(1e-3, 200); mu2 = random.uniform(8*R, 8*R*10)
    al = random.uniform(1e-6, 1); r = al/mu2*random.random()
    assert r*R <= al/8*(1+1e-12)
print("width chain ok")
# reduced threshold: any returned (k,b) with g_b(k)<theta' has k>=K
def trial(K):
    n = K+20
    a = [random.uniform(1e-3,1)*0.9**j for j in range(n)]
    mu = [max(1.0, random.uniform(0.5,3)*(1+j)) for j in range(n)]  # non-monotone, >=1
    theta = random.uniform(1e-6, 2)
    thp = theta if K==0 else min(theta, min(a[:K]))
    for k in range(n):
        for b in [5.0001, 6, 9.5]:
            g = a[k]*mu[k]**b
            if g < thp:
                assert k >= K, (k,K)
                assert g < theta
    return True
for K in [0,1,2,5,13]:
    for _ in range(300): trial(K)
print("reduced-threshold argument ok, incl K=0")
# K(d,eps) least K with conditions for all k>=K, non-monotone monitor
def Kthr(mu, KA, KB, M, eps):
    ok = [k>=KA and k>=KB and mu[k]**2>=800 and mu[k]>=eps**(-16*M) for k in range(len(mu))]
    # least K with ok[k] for all k>=K (within horizon)
    K = len(mu)
    while K>0 and ok[K-1]: K -= 1
    return K
mu = [1,40,1,1,50,60,70,80]
print("K example (non-monotone):", Kthr(mu,0,0,2,1.0), "(first k with mu^2>=800 is 1, but K must be 4)")
# i=0: M=2, eps=1 -> mu>=1 trivial, mu^2>=800 binding
print("i=0: eps^-16M =", 1.0**(-32))
