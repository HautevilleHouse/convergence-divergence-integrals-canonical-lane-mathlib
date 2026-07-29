import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure IntegralTestPackage where
  monotoneFunction : Type u
  integralConverges : Prop
  seriesConverges : Prop
  testCondition : Prop

structure IntegralTestEvidence (P : IntegralTestPackage) where
  monotoneFunctionClosed : P.monotoneFunction
  integralConvergesClosed : P.integralConverges
  seriesConvergesClosed : P.seriesConverges
  testConditionClosed : P.testCondition

def IntegralTestClosed (P : IntegralTestPackage) : Prop :=
  P.monotoneFunction ∧ P.integralConverges ∧ P.seriesConverges ∧ P.testCondition

theorem integral_test_closed_from_evidence (P : IntegralTestPackage) (E : IntegralTestEvidence P) :
    IntegralTestClosed P := by
  exact And.intro E.monotoneFunctionClosed (And.intro E.integralConvergesClosed (And.intro E.seriesConvergesClosed E.testConditionClosed))

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse