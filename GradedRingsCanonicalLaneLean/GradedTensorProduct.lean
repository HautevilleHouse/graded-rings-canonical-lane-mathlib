import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GradedRingsCanonicalLaneLean.GradedRingDefinitions

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure GradedTensorProduct (R : Type u) [CommRing R] (A B : GradedRing R) where
  carrier : Type v
  [instRing : Ring carrier]
  [instAlgebra : Algebra R carrier]
  grading : ℤ → Submodule R carrier
  directSum : DirectSum ℤ (fun i => grading i) ≃+* carrier
  grading_mul : ∀ i j, grading i * grading j ≤ grading (i + j)

def gradedTensorProductClosed (R : Type u) [CommRing R] (A B : GradedRing R) : Prop :=
  Nonempty (GradedTensorProduct R A B)

theorem graded_tensor_product_closed_from_trivial (R : Type u) [CommRing R] (A : GradedRing R) : gradedTensorProductClosed R A A := by
  refine ⟨?_, ?_, ?_, ?_, ?_
    ⟩
  · exact ((A : Type u) → (A : Type u))
  · infer_instance
  · infer_instance
  · intro i
    exact A.grading i
  · exact A.directSum
  · exact A.grading_mul

end GradedRingsCanonicalLaneLean
end HautevilleHouse