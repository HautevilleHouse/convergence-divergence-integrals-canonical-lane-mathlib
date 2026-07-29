import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure DivergenceTestPackage where
  termTest : Prop
  comparisonTestDiv : Prop
  ratioTestDiv : Prop
  rootTestDiv : Prop
  integralTestDiv : Prop
  divergenceCriteria : Prop

structure DivergenceTestEvidence (D : DivergenceTestPackage) where
  termTestClosed : D.termTest
  comparisonTestDivClosed : D.comparisonTestDiv
  ratioTestDivClosed : D.ratioTestDiv
  rootTestDivClosed : D.rootTestDiv
  integralTestDivClosed : D.integralTestDiv
  divergenceCriteriaClosed : D.divergenceCriteria

def DivergenceTestClosed (D : DivergenceTestPackage) : Prop :=
  D.termTest ∧ D.comparisonTestDiv ∧ D.ratioTestDiv ∧ D.rootTestDiv ∧ D.integralTestDiv ∧ D.divergenceCriteria

theorem divergence_test_closed_from_evidence (D : DivergenceTestPackage) (E : DivergenceTestEvidence D) :
    DivergenceTestClosed D := by
  exact And.intro E.termTestClosed
    (And.intro E.comparisonTestDivClosed
      (And.intro E.ratioTestDivClosed
        (And.intro E.rootTestDivClosed
          (And.intro E.integralTestDivClosed E.divergenceCriteriaClosed))))

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse
