import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ConvergenceDivergenceIntegralsCanonicalLaneLean

structure SeriesConvergencePackage where
  geometricSeries : Prop
  pSeries : Prop
  telescopingSeries : Prop
  harmonicSeries : Prop
  alternatingHarmonicSeries : Prop

structure SeriesConvergenceEvidence (S : SeriesConvergencePackage) where
  geometricSeriesClosed : S.geometricSeries
  pSeriesClosed : S.pSeries
  telescopingSeriesClosed : S.telescopingSeries
  harmonicSeriesClosed : S.harmonicSeries
  alternatingHarmonicSeriesClosed : S.alternatingHarmonicSeries

def SeriesConvergenceClosed (S : SeriesConvergencePackage) : Prop :=
  S.geometricSeries ∧ S.pSeries ∧ S.telescopingSeries ∧ S.harmonicSeries ∧ S.alternatingHarmonicSeries

theorem series_convergence_closed_from_evidence (S : SeriesConvergencePackage) (E : SeriesConvergenceEvidence S) : SeriesConvergenceClosed S := by
  exact And.intro E.geometricSeriesClosed (And.intro E.pSeriesClosed (And.intro E.telescopingSeriesClosed (And.intro E.harmonicSeriesClosed E.alternatingHarmonicSeriesClosed)))

end ConvergenceDivergenceIntegralsCanonicalLaneLean
end HautevilleHouse