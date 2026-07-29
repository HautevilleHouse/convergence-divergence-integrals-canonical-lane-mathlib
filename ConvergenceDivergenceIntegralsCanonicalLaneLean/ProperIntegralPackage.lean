import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure ProperIntegralPackage where
  integrandContinuous : Prop
  intervalClosedBounded : Prop
  cauchyRiemannSum : Prop
  riemannSumLimit : Prop

structure ProperIntegralEvidence (P : ProperIntegralPackage) where
  integrandContinuousClosed : P.integrandContinuous
  intervalClosedBoundedClosed : P.intervalClosedBounded
  cauchyRiemannSumClosed : P.cauchyRiemannSum
  riemannSumLimitClosed : P.riemannSumLimit

def ProperIntegralClosed (P : ProperIntegralPackage) : Prop :=
  P.integrandContinuous ∧ P.intervalClosedBounded ∧
  P.cauchyRiemannSum ∧ P.riemannSumLimit

theorem proper_integral_closed_from_evidence
    (P : ProperIntegralPackage) (E : ProperIntegralEvidence P) :
    ProperIntegralClosed P := by
  exact And.intro E.integrandContinuousClosed
    (And.intro E.intervalClosedBoundedClosed
      (And.intro E.cauchyRiemannSumClosed E.riemannSumLimitClosed))

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse