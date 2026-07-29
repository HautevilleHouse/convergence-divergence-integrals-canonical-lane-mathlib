import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure ImproperIntegralPackage where
  unboundedInterval : Prop
  unboundedIntegrand : Prop
  pIntegral : Prop
  gammaFunction : Prop
  betaFunction : Prop
  absoluteConvergenceImproper : Prop

structure ImproperIntegralEvidence (I : ImproperIntegralPackage) where
  unboundedIntervalClosed : I.unboundedInterval
  unboundedIntegrandClosed : I.unboundedIntegrand
  pIntegralClosed : I.pIntegral
  gammaFunctionClosed : I.gammaFunction
  betaFunctionClosed : I.betaFunction
  absoluteConvergenceImproperClosed : I.absoluteConvergenceImproper

def ImproperIntegralClosed (I : ImproperIntegralPackage) : Prop :=
  I.unboundedInterval ∧ I.unboundedIntegrand ∧ I.pIntegral ∧ I.gammaFunction ∧ I.betaFunction ∧ I.absoluteConvergenceImproper

theorem improper_integral_closed_from_evidence (I : ImproperIntegralPackage) (E : ImproperIntegralEvidence I) :
    ImproperIntegralClosed I := by
  exact And.intro E.unboundedIntervalClosed
    (And.intro E.unboundedIntegrandClosed
      (And.intro E.pIntegralClosed
        (And.intro E.gammaFunctionClosed
          (And.intro E.betaFunctionClosed E.absoluteConvergenceImproperClosed))))

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse
