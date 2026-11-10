#!/usr/bin/env python3
"""Validate blueprint records, not Lean proofs or English mathematics (Python 3.9+)."""

import argparse
from collections import deque
import hashlib
import json
from pathlib import Path, PurePosixPath
import re
import sys
from urllib.parse import urlparse


class Invalid(ValueError):
    """An actionable metadata validation failure."""


def require(condition, message):
    if not condition:
        raise Invalid(message)


def record(path):
    try:
        value = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, ValueError) as error:
        raise Invalid(f"{path}: {error}") from error
    require(isinstance(value, dict), f"{path}: expected a JSON object")
    return value


def fields(value, expected, context):
    require(isinstance(value, dict), f"{context}: expected an object")
    require(set(value) == set(expected.split()), f"{context}: expected fields: {expected}")


def text(value, context):
    require(isinstance(value, str) and bool(value.strip()), f"{context}: expected nonempty text")
    require(value == value.strip() and "REPLACE" not in value, f"{context}: unresolved placeholder or whitespace")


def texts(value, context, nonempty=False):
    require(isinstance(value, list), f"{context}: expected a list")
    require(not nonempty or bool(value), f"{context}: cannot be empty")
    for item in value:
        text(item, context)
    require(len(set(value)) == len(value), f"{context}: duplicate entries")


def within(path, parent):
    try:
        path.resolve().relative_to(parent.resolve())
        return True
    except ValueError:
        return False


def local_path(root, value, parent, context, directory=False):
    text(value, context)
    pure = PurePosixPath(value)
    require(not pure.is_absolute() and ".." not in pure.parts and "\\" not in value,
            f"{context}: expected a repository-relative path without '..'")
    result = root / value
    require(within(result, root) and within(result, parent),
            f"{context}: path must stay within the repository and {parent.relative_to(root)}")
    require(result.is_dir() if directory else result.is_file(), f"{context}: missing path {value}")
    return result


def fingerprint(unit, proof_path):
    """Hash reviewable local content; statuses, credits, and approvals are excluded."""
    payload = {key: unit[key] for key in (
        "id", "title", "source_revision", "declarations", "depends_on"
    )}
    payload["proof"] = proof_path.read_bytes().decode("utf-8")
    canonical = json.dumps(payload, sort_keys=True, ensure_ascii=False, separators=(",", ":"))
    return hashlib.sha256(canonical.encode("utf-8")).hexdigest()


def validate(root):
    root = Path(root).resolve()
    source = record(root / "source/upstream.json")
    fields(source, "schema_version status url revision lean_toolchain project_root license targets", "source")
    require(type(source["schema_version"]) is int and source["schema_version"] == 1,
            "source: unsupported schema_version")
    require(source["status"] in ("awaiting-release", "imported"), "source: invalid status")
    local_path(root, source["project_root"], root / "Lean", "source project_root", directory=True)
    texts(source["targets"], "source targets")
    pinned_fields = ("url", "revision", "lean_toolchain", "license")
    if source["status"] == "awaiting-release":
        require(all(source[key] is None for key in pinned_fields) and not source["targets"],
                "source: awaiting-release must not claim pinned source or targets")
        require(not any((root / "Lean").rglob("*.lean")),
                "source: Lean files exist; record the imported source manifest")
    else:
        for key in pinned_fields:
            text(source[key], f"source {key}")
        parsed_url = urlparse(source["url"])
        require(parsed_url.scheme in ("https", "http") and bool(parsed_url.netloc),
                "source: url must be an HTTP(S) source location")
        require(re.fullmatch(r"(?:[0-9a-f]{40}|[0-9a-f]{64}|sha256:[0-9a-f]{64})", source["revision"]),
                "source: revision must be a full commit hash or sha256:<archive digest>")

    units = {}
    owners = {}
    units_root = root / "blueprint/units"
    require(units_root.is_dir(), "missing blueprint/units directory")
    for folder in sorted(units_root.iterdir()):
        if folder.is_file() and folder.name == ".gitkeep":
            continue
        require(folder.is_dir() and not folder.is_symlink(), f"{folder}: expected a unit directory")
        unit = record(folder / "unit.json")
        fields(unit, "id title issue source_revision status authors declarations depends_on reviews", str(folder))
        unit_id = unit["id"]
        require(isinstance(unit_id, str) and re.fullmatch(r"YM-[0-9]{6,}", unit_id),
                f"{folder}: invalid unit ID")
        number = int(unit_id[3:])
        require(number > 0 and unit_id == f"YM-{number:06d}" and folder.name == unit_id,
                f"{folder}: ID must match its directory and positive canonical issue number")
        require(unit["issue"] == f"https://github.com/hairer/humanise-yang-mills/issues/{number}",
                f"{unit_id}: issue URL must match the canonical unit ID")
        text(unit["title"], f"{unit_id} title")
        require(source["status"] == "imported", f"{unit_id}: no source has been imported")
        require(unit["source_revision"] == source["revision"], f"{unit_id}: stale source revision")
        require(unit["status"] in ("planned", "draft", "reviewed"), f"{unit_id}: invalid status")
        texts(unit["authors"], f"{unit_id} authors", nonempty=True)
        texts(unit["depends_on"], f"{unit_id} depends_on")
        declarations = unit["declarations"]
        require(isinstance(declarations, list) and bool(declarations), f"{unit_id}: declarations cannot be empty")
        for declaration in declarations:
            fields(declaration, "name module path", f"{unit_id} declaration")
            name = declaration["name"]
            text(name, f"{unit_id} declaration name")
            text(declaration["module"], f"{unit_id} module")
            path = local_path(root, declaration["path"], root / "Lean", f"{unit_id} declaration path")
            require(path.suffix == ".lean", f"{unit_id}: expected a .lean source path")
            require(name not in owners, f"{unit_id}: duplicate declaration ownership: {name} (also {owners.get(name)})")
            owners[name] = unit_id

        proof_path = local_path(root, f"blueprint/units/{unit_id}/proof.md", folder, f"{unit_id} proof")
        text(proof_path.read_text(encoding="utf-8").strip(), f"{unit_id} proof")
        digest = fingerprint(unit, proof_path)
        fields(unit["reviews"], "lean mathematics", f"{unit_id} reviews")
        authors = {author.lstrip("@").casefold() for author in unit["authors"]}
        for role, review in unit["reviews"].items():
            if review is None:
                require(unit["status"] != "reviewed", f"{unit_id}: reviewed status requires {role} review")
                continue
            fields(review, "reviewer evidence content_sha256", f"{unit_id} {role} review")
            text(review["reviewer"], f"{unit_id} {role} reviewer")
            require(review["reviewer"].lstrip("@").casefold() not in authors,
                    f"{unit_id}: authors cannot approve their own work")
            evidence = local_path(root, review["evidence"], folder / "reviews", f"{unit_id} {role} evidence")
            text(evidence.read_text(encoding="utf-8").strip(), f"{unit_id} {role} evidence")
            require(review["content_sha256"] == digest, f"{unit_id}: stale {role} review fingerprint")
        units[unit_id] = unit

    # Kahn's algorithm avoids a recursion limit on a large dependency graph.
    remaining = {name: len(unit["depends_on"]) for name, unit in units.items()}
    dependents = {name: [] for name in units}
    for name, unit in units.items():
        for dependency in unit["depends_on"]:
            require(dependency in units, f"{name}: unknown dependency {dependency}")
            dependents[dependency].append(name)
    ready = deque(name for name, count in remaining.items() if count == 0)
    visited = 0
    while ready:
        visited += 1
        for dependent in dependents[ready.popleft()]:
            remaining[dependent] -= 1
            if remaining[dependent] == 0:
                ready.append(dependent)
    unresolved = [name for name, count in remaining.items() if count]
    require(visited == len(units), f"dependency cycle; affected units include {', '.join(unresolved[:10])}")
    return len(units)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--fingerprint", metavar="UNIT_ID", help="print current local content hash; does not validate approval")
    args = parser.parse_args()
    try:
        if args.fingerprint:
            require(re.fullmatch(r"YM-[0-9]{6,}", args.fingerprint), "invalid unit ID")
            folder = args.root / "blueprint/units" / args.fingerprint
            print(fingerprint(record(folder / "unit.json"), folder / "proof.md"))
        else:
            count = validate(args.root)
            print(f"Blueprint structure OK: {count} units. Lean and mathematics were not verified.")
    except (Invalid, OSError, UnicodeError, KeyError) as error:
        print(f"Blueprint check failed: {error}", file=sys.stderr)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
