"""Independent forward-reference scan of the G05 proposed total order.

Usage: python3 -I fwd.py <repo root> <order file (one path per line)> <out json>
Comments stripped; ref macros: ref, eqref, cref, Cref, autoref, (multiple labels split on ',').
Each label is classified by its innermost enclosing environment.
"""
import re, sys, json, collections
from pathlib import Path

root, orderf, outf = Path(sys.argv[1]), sys.argv[2], sys.argv[3]
order = [l.strip() for l in open(orderf) if l.strip()]
pos = {p: i for i, p in enumerate(order)}
envre = re.compile(r'\\(begin|end)\{([^}]+)\}|\\label\{([^}]+)\}|\\(?:eqref|ref|cref|Cref|autoref|pageref|nameref)\*?\{([^}]+)\}')
labels = {}
refs = []
for p in order:
    t = (root / p).read_text()
    t = re.sub(r'(?<!\\)%[^\n]*', '', t)
    stack = []
    for m in envre.finditer(t):
        line = t.count('\n', 0, m.start()) + 1
        if m.group(1) == 'begin':
            stack.append(m.group(2))
        elif m.group(1) == 'end':
            if stack and stack[-1] == m.group(2):
                stack.pop()
        elif m.group(3):
            env = next((e for e in reversed(stack) if e not in ('equation', 'equation*', 'align', 'align*', 'aligned', 'gather', 'multline', 'enumerate', 'itemize', 'description', 'proof', 'split', 'cases')), 'section/eq' if not stack else stack[-1])
            labels.setdefault(m.group(3), []).append((p, line, env))
        else:
            for lab in m.group(4).split(','):
                refs.append((p, line, lab.strip(), stack[-1] if stack else ''))
fwd_cross, fwd_same, unresolved = [], [], []
for p, line, lab, ctx in refs:
    tg = labels.get(lab)
    if not tg:
        unresolved.append((p, line, lab)); continue
    tp, tl, env = tg[0]
    rec = dict(src=p, line=line, label=lab, tgt=tp, tline=tl, env=env, in_proof=(ctx == 'proof'))
    if pos[tp] > pos[p]:
        fwd_cross.append(rec)
    elif tp == p and tl > line:
        fwd_same.append(rec)
dups = {k: v for k, v in labels.items() if len(v) > 1}
envc = collections.Counter(r['env'] for r in fwd_cross)
json.dump(dict(n_labels=len(labels), n_refs=len(refs), unresolved=unresolved, dups=dups,
               fwd_cross=fwd_cross, fwd_same=fwd_same), open(outf, 'w'), indent=1)
print('labels', len(labels), 'refs', len(refs), 'unresolved', len(unresolved), 'dups', len(dups))
print('forward cross-file', len(fwd_cross), 'by target env', dict(envc))
print('forward same-file', len(fwd_same), dict(collections.Counter(r['env'] for r in fwd_same)))
