import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure AbsoluteConvergencePackage where
  integrandAbsoluteValue : Prop
  absoluteConverges : Prop
  impliesConvergence : Prop
  rearrangementInvariance : Prop

structure AbsoluteConvergenceEvidence (A : AbsoluteConvergencePackage) where
  integrandAbsoluteValueClosed : A.integrandAbsoluteValue
  absoluteConvergesClosed : A.absoluteConverges
  impliesConvergenceClosed : A.impliesConvergence
  rearrangementInvarianceClosed : A.rearrangementInvariance

def AbsoluteConvergenceClosed (A : AbsoluteConvergencePackage) : Prop :=
  A.integrandAbsoluteValue ∧ A.absoluteConverges ∧
  A.impliesConvergence ∧ A.rearrangementInvariance

theorem absolute_convergence_closed_from_evidence
    (A : AbsoluteConvergencePackage) (E : AbsoluteConvergenceEvidence A) :
    AbsoluteConvergenceClosed A := by
  exact And.intro E.integrandAbsoluteValueClosed
    (And.intro E.absoluteConvergesClosed
      (And.intro E.impliesConvergenceClosed E.rearrangementInvarianceClosed))

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse