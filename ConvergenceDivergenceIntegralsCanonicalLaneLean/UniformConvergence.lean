import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure UniformConvergencePackage where
  pointwiseConvergence : Prop
  uniformConvergence : Prop
  weierstrassMTest : Prop
  uniformLimitContinuous : Prop
  termwiseIntegration : Prop

structure UniformConvergenceEvidence (U : UniformConvergencePackage) where
  pointwiseConvergenceClosed : U.pointwiseConvergence
  uniformConvergenceClosed : U.uniformConvergence
  weierstrassMTestClosed : U.weierstrassMTest
  uniformLimitContinuousClosed : U.uniformLimitContinuous
  termwiseIntegrationClosed : U.termwiseIntegration

def UniformConvergenceClosed (U : UniformConvergencePackage) : Prop :=
  U.pointwiseConvergence ∧ U.uniformConvergence ∧ U.weierstrassMTest ∧ U.uniformLimitContinuous ∧ U.termwiseIntegration

theorem uniform_convergence_closed_from_evidence (U : UniformConvergencePackage) (E : UniformConvergenceEvidence U) : UniformConvergenceClosed U := by
  exact And.intro E.pointwiseConvergenceClosed (And.intro E.uniformConvergenceClosed (And.intro E.weierstrassMTestClosed (And.intro E.uniformLimitContinuousClosed E.termwiseIntegrationClosed)))

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse