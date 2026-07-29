import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure ConditionalConvergencePackage where
  seriesConverges : Prop
  notAbsolutelyConvergent : Prop
  riemannRearrangement : Prop
  alternatingSeriesCriterion : Prop

structure ConditionalConvergenceEvidence (C : ConditionalConvergencePackage) where
  seriesConvergesClosed : C.seriesConverges
  notAbsolutelyConvergentClosed : C.notAbsolutelyConvergent
  riemannRearrangementClosed : C.riemannRearrangement
  alternatingSeriesCriterionClosed : C.alternatingSeriesCriterion

def ConditionalConvergenceClosed (C : ConditionalConvergencePackage) : Prop :=
  C.seriesConverges ∧ C.notAbsolutelyConvergent ∧
  C.riemannRearrangement ∧ C.alternatingSeriesCriterion

theorem conditional_convergence_closed_from_evidence
    (C : ConditionalConvergencePackage) (E : ConditionalConvergenceEvidence C) :
    ConditionalConvergenceClosed C := by
  exact And.intro E.seriesConvergesClosed
    (And.intro E.notAbsolutelyConvergentClosed
      (And.intro E.riemannRearrangementClosed E.alternatingSeriesCriterionClosed))

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse