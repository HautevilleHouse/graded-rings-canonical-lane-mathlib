import canonicalLaneMathlib.AdmissibleClass
import GradedRingsCanonicalLaneLean.GradedRingDefinitions

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure HilbertPoincareSeries (R : GradedRing ℕ) where
  series : PowerSeries ℚ
  finiteGeneration : Prop
  rationalFunction : Prop
  poleOrder : ℕ
  poleOrderPositive : poleOrder > 0

def hilbertPoincareAdmissibleClass (R : GradedRing ℕ) (H : HilbertPoincareSeries R) : Prop :=
  H.finiteGeneration ∧ H.rationalFunction

structure HilbertPoincareProof (R : GradedRing ℕ) where
  finGen : Prop
  ratFunc : Prop
  minimalFreeResolution : Prop
  regularity : ℕ
  proof : finGen ∧ ratFunc ∧ minimalFreeResolution

def HilbertPoincareAdmissible (R : GradedRing ℕ) (P : HilbertPoincareProof R) : Prop :=
  P.proof

end GradedRingsCanonicalLaneLean
end HautevilleHouse