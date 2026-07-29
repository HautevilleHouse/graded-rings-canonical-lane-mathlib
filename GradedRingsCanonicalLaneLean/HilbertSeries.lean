import canonicalLaneMathlib.AdmissibleClass
import GradedRingsCanonicalLaneLean.GradedRingObjects

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure HilbertSeriesPackage (R : GradedRing) where
  series : ℤ → ℤ
  rationality : Prop
  poleOrder : ℕ
  numeratorPolynomial : Polynomial ℤ
  denominatorPolynomial : Polynomial ℤ
  rationalityEvidence : rationality

structure HilbertSeriesEvidence (R : GradedRing) (H : HilbertSeriesPackage R) where
  rationalityClosed : H.rationality
  poleOrderClosed : H.poleOrder > 0

def HilbertSeriesClosed (R : GradedRing) (H : HilbertSeriesPackage R) : Prop :=
  H.rationality ∧ H.poleOrder > 0

theorem hilbert_series_closed_from_evidence (R : GradedRing) (H : HilbertSeriesPackage R) (E : HilbertSeriesEvidence R H) : HilbertSeriesClosed R H :=
  And.intro E.rationalityClosed E.poleOrderClosed

end GradedRingsCanonicalLaneLean
end HautevilleHouse