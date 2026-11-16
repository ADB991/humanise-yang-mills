import FreeField.Main
example : YangMills.JointExistence := YangMills.jointExistence_of_freeField
#check (YangMills.jointExistence_of_freeField : ∀ g : YangMills.GaugeGroup, g.IsSimple → ∃ C : YangMills.WilsonFamily g,
  YangMills.WilsonRegularity C ∧ ∀ p : ℕ → ℕ, StrictMono p → ∃ q : ℕ → ℕ, StrictMono q ∧
    ∃ T : YangMills.Hierarchy C, T.Properties (p ∘ q))
#print axioms YangMills.jointExistence_of_freeField
