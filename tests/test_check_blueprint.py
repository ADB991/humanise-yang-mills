"""Regression checks for collaboration failures, using synthetic metadata only."""

import json
from pathlib import Path
import tempfile
import unittest

from scripts.check_blueprint import Invalid, fingerprint, validate


class BlueprintChecks(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        (self.root / "Lean").mkdir()
        (self.root / "Lean/Test.lean").write_text("-- Synthetic test fixture, not a proof.\n")
        (self.root / "source").mkdir()
        (self.root / "manuscript").mkdir()
        (self.root / "blueprint/units").mkdir(parents=True)
        self.source = {
            "schema_version": 1, "status": "imported", "url": "https://example.org/source",
            "revision": "a" * 40, "lean_toolchain": "test-fixture", "project_root": "Lean",
            "license": "test-fixture", "targets": ["Fixture.target"],
        }
        self.write_source()

    def write_source(self):
        (self.root / "source/upstream.json").write_text(json.dumps(self.source))

    def add_unit(self, number=1, dependencies=None, name=None):
        unit_id = f"YM-{number:06d}"
        folder = self.root / "blueprint/units" / unit_id
        folder.mkdir()
        (folder / "correspondence.md").write_text("# Synthetic fixture\n\nAn argument for testing metadata.\n")
        unit = {
            "id": unit_id, "title": "Synthetic fixture",
            "issue": f"https://github.com/hairer/humanise-yang-mills/issues/{number}",
            "source_revision": self.source["revision"], "status": "draft", "authors": ["alice"],
            "declarations": [{"name": name or f"Fixture.result{number}", "module": "Test", "path": "Lean/Test.lean"}],
            "manuscript": [f"manuscript/{unit_id}.tex"],
            "depends_on": dependencies or [], "reviews": {"lean": None, "mathematics": None},
        }
        (self.root / unit["manuscript"][0]).write_text("A synthetic mathematical statement.\n")
        self.save(unit)
        return unit

    def save(self, unit):
        path = self.root / "blueprint/units" / unit["id"] / "unit.json"
        path.write_text(json.dumps(unit))

    def review(self, unit):
        folder = self.root / "blueprint/units" / unit["id"]
        (folder / "reviews").mkdir()
        digest = fingerprint(unit, folder / "correspondence.md")
        for role in ("lean", "mathematics"):
            evidence = folder / "reviews" / f"{role}.md"
            evidence.write_text("Synthetic independent acceptance record.\n")
            unit["reviews"][role] = {
                "reviewer": "bob", "evidence": evidence.relative_to(self.root).as_posix(),
                "content_sha256": digest,
            }
        unit["status"] = "reviewed"
        self.save(unit)

    def test_empty_pre_release_scaffold(self):
        (self.root / "Lean/Test.lean").unlink()
        self.source.update(status="awaiting-release", url=None, revision=None,
                           lean_toolchain=None, license=None, targets=[])
        self.write_source()
        self.assertEqual(validate(self.root), 0)

    def test_valid_dependency_chain_and_reviews(self):
        self.review(self.add_unit())
        self.add_unit(2, ["YM-000001"])
        self.assertEqual(validate(self.root), 2)

    def test_two_authors_cannot_own_the_same_declaration(self):
        self.add_unit(name="Fixture.shared")
        self.add_unit(2, name="Fixture.shared")
        with self.assertRaisesRegex(Invalid, "duplicate declaration ownership"):
            validate(self.root)

    def test_unknown_dependency(self):
        self.add_unit(dependencies=["YM-000002"])
        with self.assertRaisesRegex(Invalid, "unknown dependency"):
            validate(self.root)

    def test_circular_reasoning_in_conceptual_graph(self):
        self.add_unit(dependencies=["YM-000002"])
        self.add_unit(2, ["YM-000001"])
        with self.assertRaisesRegex(Invalid, "dependency cycle"):
            validate(self.root)

    def test_old_source_revision(self):
        unit = self.add_unit()
        unit["source_revision"] = "b" * 40
        self.save(unit)
        with self.assertRaisesRegex(Invalid, "stale source revision"):
            validate(self.root)

    def test_reviewed_requires_both_reviews(self):
        unit = self.add_unit()
        unit["status"] = "reviewed"
        self.save(unit)
        with self.assertRaisesRegex(Invalid, "requires lean review"):
            validate(self.root)

    def test_prose_change_invalidates_review(self):
        unit = self.add_unit()
        self.review(unit)
        (self.root / "blueprint/units" / unit["id"] / "correspondence.md").write_text("Changed claim.\n")
        with self.assertRaisesRegex(Invalid, "stale lean review"):
            validate(self.root)

    def test_dependency_change_invalidates_review(self):
        self.add_unit(2)
        unit = self.add_unit()
        self.review(unit)
        unit["depends_on"] = ["YM-000002"]
        self.save(unit)
        with self.assertRaisesRegex(Invalid, "stale lean review"):
            validate(self.root)

    def test_self_approval_with_different_case(self):
        unit = self.add_unit()
        self.review(unit)
        unit["reviews"]["lean"]["reviewer"] = "@ALICE"
        self.save(unit)
        with self.assertRaisesRegex(Invalid, "authors cannot approve"):
            validate(self.root)

    def test_missing_source_path(self):
        self.add_unit()
        (self.root / "Lean/Test.lean").unlink()
        with self.assertRaisesRegex(Invalid, "missing path"):
            validate(self.root)

    def test_review_evidence_cannot_escape_repository(self):
        unit = self.add_unit()
        self.review(unit)
        unit["reviews"]["lean"]["evidence"] = "../outside.md"
        self.save(unit)
        with self.assertRaisesRegex(Invalid, "repository-relative path"):
            validate(self.root)

    def test_review_directory_cannot_link_outside_repository(self):
        unit = self.add_unit()
        self.review(unit)
        folder = self.root / "blueprint/units" / unit["id"]
        with tempfile.TemporaryDirectory() as outside:
            moved = Path(outside) / "reviews"
            (folder / "reviews").rename(moved)
            (folder / "reviews").symlink_to(moved, target_is_directory=True)
            with self.assertRaisesRegex(Invalid, "path must stay within"):
                validate(self.root)


    def test_manuscript_change_invalidates_review(self):
        unit = self.add_unit()
        self.review(unit)
        (self.root / unit["manuscript"][0]).write_text("A different theorem.\n")
        with self.assertRaisesRegex(Invalid, "stale lean review"):
            validate(self.root)

    def test_shared_support_changes_invalidate_review(self):
        for filename in ("macros.tex", "references.bib"):
            with self.subTest(filename=filename):
                unit = self.add_unit(10 if filename.endswith("tex") else 11)
                path = self.root / "manuscript" / filename
                path.write_text("Original supporting content.\n")
                unit["manuscript"].append(f"manuscript/{filename}")
                self.save(unit)
                self.review(unit)
                path.write_text("Changed supporting content.\n")
                with self.assertRaisesRegex(Invalid, "stale lean review"):
                    validate(self.root)
                path.write_text("Original supporting content.\n")

    def test_manuscript_path_list_change_invalidates_review(self):
        unit = self.add_unit()
        self.review(unit)
        (self.root / "manuscript/additional.tex").write_text("Another input.\n")
        unit["manuscript"].append("manuscript/additional.tex")
        self.save(unit)
        with self.assertRaisesRegex(Invalid, "stale lean review"):
            validate(self.root)

    def test_missing_manuscript(self):
        unit = self.add_unit()
        (self.root / unit["manuscript"][0]).unlink()
        with self.assertRaisesRegex(Invalid, "missing path"):
            validate(self.root)

    def test_manuscript_constraints(self):
        unit = self.add_unit()
        for paths, error in [([], "cannot be empty"),
                             (["../outside.tex"], "repository-relative"),
                             (["Lean/Test.lean"], "path must stay within"),
                             (["manuscript/a.tex", "manuscript/a.tex"], "duplicate")]:
            with self.subTest(paths=paths):
                unit["manuscript"] = paths
                self.save(unit)
                with self.assertRaisesRegex(Invalid, error):
                    validate(self.root)

    def test_manuscript_symlink_cannot_escape(self):
        unit = self.add_unit()
        path = self.root / unit["manuscript"][0]
        path.unlink()
        path.symlink_to(self.root / "Lean/Test.lean")
        with self.assertRaisesRegex(Invalid, "path must stay within"):
            validate(self.root)

    def test_manuscript_requires_tex_and_supported_formats(self):
        unit = self.add_unit()
        for filename, error in [("only.bib", "needs LaTeX"), ("proof.md", "expected .tex")]:
            (self.root / "manuscript" / filename).write_text("Content.\n")
            unit["manuscript"] = ["manuscript/" + filename]
            self.save(unit)
            with self.assertRaisesRegex(Invalid, error):
                validate(self.root)

    def test_empty_manuscript_rejected(self):
        unit = self.add_unit()
        (self.root / unit["manuscript"][0]).write_text(" \n")
        with self.assertRaisesRegex(Invalid, "nonempty text"):
            validate(self.root)

    def test_rename_manuscript_invalidates_review(self):
        unit = self.add_unit()
        self.review(unit)
        (self.root / unit["manuscript"][0]).rename(self.root / "manuscript/renamed.tex")
        unit["manuscript"] = ["manuscript/renamed.tex"]
        self.save(unit)
        with self.assertRaisesRegex(Invalid, "stale lean review"):
            validate(self.root)


if __name__ == "__main__":
    unittest.main()
