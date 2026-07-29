import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure ComparisonTestPackage where
  referenceIntegralConverges : Prop
  integrandBoundedByReference : Prop
  comparisonInequality : Prop
  limitComparisonCriterion : Prop

structure ComparisonTestEvidence (C : ComparisonTestPackage) where
  referenceIntegralConvergesClosed : C.referenceIntegralConverges
  integrandBoundedByReferenceClosed : C.integrandBoundedByReference
  comparisonInequalityClosed : C.comparisonInequality
  limitComparisonCriterionClosed : C.limitComparisonCriterion

def ComparisonTestClosed (C : ComparisonTestPackage) : Prop :=
  C.referenceIntegralConverges ∧ C.integrandBoundedByReference ∧
  C.comparisonInequality ∧ C.limitComparisonCriterion

theorem comparison_test_closed_from_evidence
    (C : ComparisonTestPackage) (E : ComparisonTestEvidence C) :
    ComparisonTestClosed C := by
  exact And.intro E.referenceIntegralConvergesClosed
    (And.intro E.integrandBoundedByReferenceClosed
      (And.intro E.comparisonInequalityClosed E.limitComparisonCriterionClosed))

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse