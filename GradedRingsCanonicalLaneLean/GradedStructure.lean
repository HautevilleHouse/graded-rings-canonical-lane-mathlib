import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure Grading (α : Type u) (G : Type v) [AddMonoid G] where
  decompose : α → G → α × α
  add_hom : ∀ (a b : α), decompose (a + b) = (decompose a).1 + (decompose b).1
  mul_hom : ∀ (a b : α), decompose (a * b) = (decompose a).2 * (decompose b).2

structure GradedRing (R : Type u) (G : Type v) [AddMonoid G] where
  ring : Ring R
  grading : Grading R G
  homogeneous : Set R := {x | grading.decompose x = (x, 0) ∨ grading.decompose x = (0, x)}
  homogeneous_add : ∀ x y ∈ homogeneous, x + y ∈ homogeneous
  homogeneous_mul : ∀ x y ∈ homogeneous, x * y ∈ homogeneous

def GradedWitnessClosed (O : GradedAdmissibleObject) : Prop :=
  ∃ (G : Type v) [AddMonoid G], Nonempty (GradedRing O.ring G)

end GradedRingsCanonicalLaneLean
end HautevilleHouse