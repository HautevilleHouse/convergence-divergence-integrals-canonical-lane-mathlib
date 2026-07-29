import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ConvergenceDivergenceIntegralsCanonicalLaneLean.IntegralTest
import HautevilleHouse.ConvergenceDivergenceIntegralsCanonicalLaneLean.ConvergenceTests
import HautevilleHouse.ConvergenceDivergenceIntegralsCanonicalLaneLean.AbsoluteConvergence
import HautevilleHouse.ConvergenceDivergenceIntegralsCanonicalLaneLean.ImproperIntegrals
import HautevilleHouse.ConvergenceDivergenceIntegralsCanonicalLaneLean.CauchyCriterion
import HautevilleHouse.ConvergenceDivergenceIntegralsCanonicalLaneLean.PowerSeries

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

def ConstrainedConvergenceDivergenceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

theorem constrained_convergence_divergence_endgame (A : AdmissibleClass) :
    ConstrainedConvergenceDivergenceClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse