import canonicalLaneMathlib.AdmissibleClass
import GradedRingsCanonicalLaneLean.GradedRingObjects
import GradedRingsCanonicalLaneLean.HilbertSeries

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure SyzygyPackage (R : GradedRing) (H : HilbertSeriesPackage R) where
  minimalFreeResolution : Type u
  lengthResolution : ℕ
  bettiNumbers : ℕ → ℕ
  syzygyModule : ℕ → Submodule ℤ R.carrier
  regularityBound : ℕ
  lengthBound : lengthResolution ≤ 4

structure SyzygyEvidence (R : GradedRing) (H : HilbertSeriesPackage R) (S : SyzygyPackage R H) where
  lengthBoundClosed : S.lengthBound
  regularityBoundClosed : S.regularityBound = 3

def SyzygyClosed (R : GradedRing) (H : HilbertSeriesPackage R) (S : SyzygyPackage R H) : Prop :=
  S.lengthBound ∧ S.regularityBound = 3

theorem syzygy_closed_from_evidence (R : GradedRing) (H : HilbertSeriesPackage R) (S : SyzygyPackage R H) (E : SyzygyEvidence R H S) : SyzygyClosed R H S :=
  And.intro E.lengthBoundClosed E.regularityBoundClosed

end GradedRingsCanonicalLaneLean
end HautevilleHouse