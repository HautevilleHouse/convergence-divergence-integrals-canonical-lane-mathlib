import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure IntegrationRulesPackage where
  ruleSet : Type u
  substitutionRule : Prop
  integrationByParts : Prop
  partialFractions : Prop

structure IntegrationRulesEvidence (P : IntegrationRulesPackage) where
  substitutionRuleClosed : P.substitutionRule
  integrationByPartsClosed : P.integrationByParts
  partialFractionsClosed : P.partialFractions

def IntegrationRulesClosed (P : IntegrationRulesPackage) : Prop :=
  P.substitutionRule ∧ P.integrationByParts ∧ P.partialFractions

theorem integration_rules_closed_from_evidence (P : IntegrationRulesPackage)
    (E : IntegrationRulesEvidence P) : IntegrationRulesClosed P := by
  exact And.intro E.substitutionRuleClosed
    (And.intro E.integrationByPartsClosed E.partialFractionsClosed)

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse