import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure ConvergenceTestPackage where
  comparisonTest : Prop
  ratioTest : Prop
  rootTest : Prop
  integralTest : Prop
  absoluteConvergence : Prop
  conditionalConvergence : Prop

structure ConvergenceTestEvidence (C : ConvergenceTestPackage) where
  comparisonTestClosed : C.comparisonTest
  ratioTestClosed : C.ratioTest
  rootTestClosed : C.rootTest
  integralTestClosed : C.integralTest
  absoluteConvergenceClosed : C.absoluteConvergence
  conditionalConvergenceClosed : C.conditionalConvergence

def ConvergenceTestClosed (C : ConvergenceTestPackage) : Prop :=
  C.comparisonTest ∧ C.ratioTest ∧ C.rootTest ∧ C.integralTest ∧ C.absoluteConvergence ∧ C.conditionalConvergence

theorem convergence_test_closed_from_evidence (C : ConvergenceTestPackage) (E : ConvergenceTestEvidence C) :
    ConvergenceTestClosed C := by
  exact And.intro E.comparisonTestClosed
    (And.intro E.ratioTestClosed
      (And.intro E.rootTestClosed
        (And.intro E.integralTestClosed
          (And.intro E.absoluteConvergenceClosed E.conditionalConvergenceClosed))))

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse
