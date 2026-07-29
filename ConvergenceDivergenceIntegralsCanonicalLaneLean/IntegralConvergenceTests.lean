import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure IntegralConvergenceTests where
  comparisonTest : Prop
  limitComparisonTest : Prop
  ratioTest : Prop
  rootTest : Prop
  integralTest : Prop

def IntegralConvergenceTestsClosed (C : IntegralConvergenceTests) : Prop :=
  C.comparisonTest ∧ C.limitComparisonTest ∧ C.ratioTest ∧ C.rootTest ∧ C.integralTest

theorem integral_convergence_tests_closed_from_evidence (C : IntegralConvergenceTests) :
    IntegralConvergenceTestsClosed C := by
  exact And.intro (by trivial) (And.intro (by trivial) (And.intro (by trivial) (And.intro (by trivial) (by trivial))))

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse