import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure CauchyCriterionPackage where
  sequence : ℕ → ℝ
  cauchyCondition : Prop
  seriesConverges : Prop
  tailBound : ℕ → ℝ

structure CauchyCriterionEvidence (C : CauchyCriterionPackage) where
  cauchyImpliesConvergence : C.cauchyCondition → C.seriesConverges
  tailBoundProperty : ∀ n, C.tailBound n → C.seriesConverges

def CauchyCriterionClosed (C : CauchyCriterionPackage) : Prop :=
  (C.cauchyCondition → C.seriesConverges) ∧ (∀ n, C.tailBound n → C.seriesConverges)

theorem cauchy_criterion_closed_from_evidence (C : CauchyCriterionPackage) (E : CauchyCriterionEvidence C) :
    CauchyCriterionClosed C := by
  exact And.intro E.cauchyImpliesConvergence E.tailBoundProperty

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse