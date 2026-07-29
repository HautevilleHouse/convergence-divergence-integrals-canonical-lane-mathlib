import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure ConditionalConvergencePackage where
  integrand : Type u
  measureSpace : Type v
  integralConditionallyConvergent : Prop
  rearrangementPhenomenon : Prop
  dirichletTestApplied : Prop

structure ConditionalConvergenceEvidence (P : ConditionalConvergencePackage) where
  integralConditionallyConvergentClosed : P.integralConditionallyConvergent
  rearrangementPhenomenonClosed : P.rearrangementPhenomenon
  dirichletTestAppliedClosed : P.dirichletTestApplied

def ConditionalConvergenceClosed (P : ConditionalConvergencePackage) : Prop :=
  P.integralConditionallyConvergent ∧ P.rearrangementPhenomenon ∧ P.dirichletTestApplied

theorem conditional_convergence_closed_from_evidence (P : ConditionalConvergencePackage)
    (E : ConditionalConvergenceEvidence P) : ConditionalConvergenceClosed P := by
  exact And.intro E.integralConditionallyConvergentClosed
    (And.intro E.rearrangementPhenomenonClosed E.dirichletTestAppliedClosed)

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse