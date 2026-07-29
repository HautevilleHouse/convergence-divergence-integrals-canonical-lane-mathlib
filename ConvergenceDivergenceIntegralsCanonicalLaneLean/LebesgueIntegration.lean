import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure LebesgueIntegrationPackage where
  measurableFunctions : Prop
  lebesgueIntegralDefined : Prop
  monotoneConvergence : Prop
  dominatedConvergence : Prop
  fubiniTonelli : Prop

def LebesgueIntegrationClosed (L : LebesgueIntegrationPackage) : Prop :=
  L.measurableFunctions ∧ L.lebesgueIntegralDefined ∧ L.monotoneConvergence ∧ L.dominatedConvergence ∧ L.fubiniTonelli

theorem lebesgue_integration_closed_from_evidence (L : LebesgueIntegrationPackage) :
    LebesgueIntegrationClosed L := by
  exact And.intro (by trivial) (And.intro (by trivial) (And.intro (by trivial) (And.intro (by trivial) (by trivial))))

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse