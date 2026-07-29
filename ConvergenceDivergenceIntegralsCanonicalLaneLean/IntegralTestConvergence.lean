import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure IntegralTestConvergencePackage where
  integrandDecreasing : Prop
  integrandNonnegative : Prop
  seriesIntegralComparison : Prop
  convergenceCriterion : Prop

structure IntegralTestConvergenceEvidence (I : IntegralTestConvergencePackage) where
  integrandDecreasingClosed : I.integrandDecreasing
  integrandNonnegativeClosed : I.integrandNonnegative
  seriesIntegralComparisonClosed : I.seriesIntegralComparison
  convergenceCriterionClosed : I.convergenceCriterion

def IntegralTestConvergenceClosed (I : IntegralTestConvergencePackage) : Prop :=
  I.integrandDecreasing ∧ I.integrandNonnegative ∧
  I.seriesIntegralComparison ∧ I.convergenceCriterion

theorem integral_test_convergence_closed_from_evidence
    (I : IntegralTestConvergencePackage) (E : IntegralTestConvergenceEvidence I) :
    IntegralTestConvergenceClosed I := by
  exact And.intro E.integrandDecreasingClosed
    (And.intro E.integrandNonnegativeClosed
      (And.intro E.seriesIntegralComparisonClosed E.convergenceCriterionClosed))

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse