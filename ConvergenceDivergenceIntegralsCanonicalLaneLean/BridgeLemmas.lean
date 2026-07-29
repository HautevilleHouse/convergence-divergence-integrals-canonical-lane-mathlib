import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  IntegrableWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse