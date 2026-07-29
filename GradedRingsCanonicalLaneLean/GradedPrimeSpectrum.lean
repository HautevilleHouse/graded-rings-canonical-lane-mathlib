import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GradedRingsCanonicalLaneLean.GradedRingDefinitions

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure GradedPrimeIdeal (R : Type u) [Ring R] (A : GradedRing R) where
  ideal : Ideal R
  isPrime : Ideal.IsPrime ideal
  homogeneous : ∃ (s : Set ℤ), ideal = ⨁ i ∈ s, A.grading i

structure GradedSpectrum (R : Type u) [Ring R] (A : GradedRing R) where
  carrier : Set (GradedPrimeIdeal R A)
  Zariski : TopologicalSpace carrier

theorem graded_spectrum_nonempty (R : Type u) [Ring R] (A : GradedRing R) : Nonempty (GradedSpectrum R A) := by
  refine ⟨?_, ?_⟩
  · exact { carrier := ∅, Zariski := by infer_instance }
  · exact by infer_instance

end GradedRingsCanonicalLaneLean
end HautevilleHouse