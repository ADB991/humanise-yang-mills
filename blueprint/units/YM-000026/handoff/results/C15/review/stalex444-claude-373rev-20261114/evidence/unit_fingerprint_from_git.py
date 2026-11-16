"""Recompute scripts/check_blueprint.py's fingerprint(unit) from git blobs (no checkout).
Usage: python3 -I unit_fingerprint_from_git.py <repo> <commit> YM-000026"""
import hashlib, json, subprocess, sys
repo, commit, uid = sys.argv[1:4]
show = lambda p: subprocess.check_output(['git','-C',repo,'show',f'{commit}:{p}']).decode('utf-8')
unit = json.loads(show(f'blueprint/units/{uid}/unit.json'))
payload = {k: unit[k] for k in ("id","title","source_revision","declarations","depends_on")}
payload["correspondence"] = show(f'blueprint/units/{uid}/correspondence.md')
payload["manuscript"] = {name: show(name) for name in unit["manuscript"]}
canon = json.dumps(payload, sort_keys=True, ensure_ascii=False, separators=(",",":"))
print(hashlib.sha256(canon.encode("utf-8")).hexdigest())
print('note in manuscript list:', 'manuscript/existence/trace-rounded-receipt.tex' in unit['manuscript'],
      '| parent in list:', 'manuscript/existence/trace-rounded-comparison.tex' in unit['manuscript'])
