import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure ImproperIntegralConvergencePackage where
  integrandLocallyIntegrable : Prop
  unboundedLimitExists : Prop
  limitComparisonTest : Prop
  convergenceAtInfinityCriterion : Prop

structure ImproperIntegralConvergenceEvidence (I : ImproperIntegralConvergencePackage) where
  integrandLocallyIntegrableClosed : I.integrandLocallyIntegrable
  unboundedLimitExistsClosed : I.unboundedLimitExists
  limitComparisonTestClosed : I.limitComparisonTest
  convergenceAtInfinityCriterionClosed : I.convergenceAtInfinityCriterion

def ImproperIntegralConvergenceClosed (I : ImproperIntegralConvergencePackage) : Prop :=
  I.integrandLocallyIntegrable ∧ I.unboundedLimitExists ∧
  I.limitComparisonTest ∧ I.convergenceAtInfinityCriterion

theorem improper_integral_convergence_closed_from_evidence
    (I : ImproperIntegralConvergencePackage) (E : ImproperIntegralConvergenceEvidence I) :
    ImproperIntegralConvergenceClosed I := by
  exact And.intro E.integrandLocallyIntegrableClosed
    (And.intro E.unboundedLimitExistsClosed
      (And.intro E.limitComparisonTestClosed E.convergenceAtInfinityCriterionClosed))

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse