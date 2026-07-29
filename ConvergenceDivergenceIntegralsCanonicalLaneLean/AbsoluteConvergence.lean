import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure AbsoluteConvergencePackage where
  series : Type u
  absoluteSeries : Type v
  term : series → ℝ
  absoluteTerm : absoluteSeries → ℝ
  absoluteConverges : Prop
  originalConverges : Prop
  absoluteImpliesOriginal : absoluteConverges → originalConverges

structure ConditionalConvergencePackage where
  seriesConverges : Prop
  notAbsolutelyConvergent : Prop
  rearrangementDiverges : Prop

structure AbsoluteConvergenceEvidence (A : AbsoluteConvergencePackage) (C : ConditionalConvergencePackage) where
  absoluteImpliesOriginalClosed : A.absoluteImpliesOriginal A.absoluteConverges → A.originalConverges
  conditionalEvidence : C.seriesConverges ∧ C.notAbsolutelyConvergent ∧ C.rearrangementDiverges

def AbsoluteConvergenceClosed (A : AbsoluteConvergencePackage) (C : ConditionalConvergencePackage) : Prop :=
  (A.absoluteImpliesOriginal A.absoluteConverges → A.originalConverges) ∧
  (C.seriesConverges ∧ C.notAbsolutelyConvergent ∧ C.rearrangementDiverges)

theorem absolute_convergence_closed_from_evidence (A : AbsoluteConvergencePackage) (C : ConditionalConvergencePackage) (E : AbsoluteConvergenceEvidence A C) :
    AbsoluteConvergenceClosed A C := by
  exact And.intro E.absoluteImpliesOriginalClosed E.conditionalEvidence

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse