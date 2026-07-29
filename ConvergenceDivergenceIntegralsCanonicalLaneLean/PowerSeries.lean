import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure PowerSeriesPackage where
  coefficients : ℕ → ℝ
  center : ℝ
  radiusOfConvergence : ℝ
  convergesAtPoint : ℝ → Prop
  analyticFunction : ℝ → ℝ

structure PowerSeriesEvidence (P : PowerSeriesPackage) where
  radiusFormula : P.radiusOfConvergence = 1 / limsup (fun n => |P.coefficients n|^(1/n : ℝ)) ∞
  convergenceOnDisk : ∀ x : ℝ, |x - P.center| < P.radiusOfConvergence → P.convergesAtPoint x
  divergenceOutside : ∀ x : ℝ, |x - P.center| > P.radiusOfConvergence → ¬ P.convergesAtPoint x

def PowerSeriesClosed (P : PowerSeriesPackage) : Prop :=
  (P.radiusOfConvergence = 1 / limsup (fun n => |P.coefficients n|^(1/n : ℝ)) ∞) ∧
  (∀ x : ℝ, |x - P.center| < P.radiusOfConvergence → P.convergesAtPoint x) ∧
  (∀ x : ℝ, |x - P.center| > P.radiusOfConvergence → ¬ P.convergesAtPoint x)

theorem power_series_closed_from_evidence (P : PowerSeriesPackage) (E : PowerSeriesEvidence P) :
    PowerSeriesClosed P := by
  exact And.intro E.radiusFormula (And.intro E.convergenceOnDisk E.divergenceOutside)

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse