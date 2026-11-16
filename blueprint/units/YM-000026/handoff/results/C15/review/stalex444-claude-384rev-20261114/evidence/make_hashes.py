"""Build a hashes.json in the form of the C15 review records (e.g. hairer-claude-356rev-20261114).

Usage (read-only on the repository):
  python3 make_hashes.py <repo> <commit> <session> <reviewed_label> path:category [path:category ...]
  python3 make_hashes.py <repo> --check <hashes.json path inside repo> <commit>

Each sha256 is the plain SHA-256 of the file bytes at <commit>, i.e. exactly
`git -C <repo> show <commit>:<path> | shasum -a 256`. Category "source" entries
(Lean/...) are additionally compared with Lean/SOURCES.sha256 at the same commit.
"""
import hashlib, json, subprocess, sys

def blob(repo, commit, path):
    return subprocess.check_output(['git', '-C', repo, 'show', f'{commit}:{path}'])

def manifest(repo, commit):
    text = blob(repo, commit, 'Lean/SOURCES.sha256').decode()
    return {l.split('  ', 1)[1]: l.split('  ', 1)[0] for l in text.splitlines() if '  ' in l}

def main():
    repo = sys.argv[1]
    if sys.argv[2] == '--check':
        rec = json.loads(blob(repo, sys.argv[4], sys.argv[3]))
        commit = rec.get('review_commit') or sys.argv[4]
        ok = True
        for f in rec['files']:
            d = hashlib.sha256(blob(repo, commit, f['path'])).hexdigest()
            good = d == f['sha256']
            ok &= good
            print('MATCH' if good else 'DIFF ', f['category'], f['path'])
        print('ALL MATCH' if ok else 'MISMATCH', 'at', commit)
        return
    commit, session, label = sys.argv[2], sys.argv[3], sys.argv[4]
    full = subprocess.check_output(['git', '-C', repo, 'rev-parse', commit]).decode().strip()
    upstream = json.loads(blob(repo, full, 'source/upstream.json'))
    man = manifest(repo, full)
    files = []
    for spec in sys.argv[5:]:
        path, cat = spec.rsplit(':', 1)
        d = hashlib.sha256(blob(repo, full, path)).hexdigest()
        if cat == 'source':
            assert man[path.removeprefix('Lean/')] == d, f'not the pinned source: {path}'
        files.append({'path': path, 'category': cat, 'sha256': d})
    print(json.dumps({'session': session, 'review_commit': full, 'reviewed_pr': label,
                      'source_revision': upstream['revision'], 'human_acceptance': None,
                      'files': files}, indent=2, ensure_ascii=False))

if __name__ == '__main__':
    main()
