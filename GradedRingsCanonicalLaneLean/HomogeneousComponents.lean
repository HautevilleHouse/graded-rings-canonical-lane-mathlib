import canonicalLaneMathlib.AdmissibleClass
import GradedRingsCanonicalLaneLean.GradedRingDefinition

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure HomogeneousComponent (R : GradedRing α) (d : α) where
  elements : Set R.carrier
  zero_mem : R.zero ∈ elements
  add_mem : ∀ a b, a ∈ elements → b ∈ elements → R.add a b ∈ elements
  mul_mem : ∀ a b, a ∈ elements → b ∈ elements → R.mul a b ∈ R.carrier
  grading_mem : ∀ a ∈ elements, R.grading a = d

structure HomogeneousComponentEvidence (R : GradedRing α) (d : α) (H : HomogeneousComponent R d) where
  zero_memClosed : H.zero_mem
  add_memClosed : H.add_mem
  grading_memClosed : ∀ a, a ∈ H.elements → R.grading a = d

def HomogeneousComponentClosed (R : GradedRing α) (d : α) (H : HomogeneousComponent R d) : Prop :=
  H.zero_mem ∧ H.add_mem ∧ (∀ a, a ∈ H.elements → R.grading a = d)

theorem homogeneous_component_closed_from_evidence (R : GradedRing α) (d : α) (H : HomogeneousComponent R d)
    (E : HomogeneousComponentEvidence R d H) : HomogeneousComponentClosed R d H := by
  exact And.intro E.zero_memClosed (And.intro E.add_memClosed E.grading_memClosed)

end GradedRingsCanonicalLaneLean
end HautevilleHouse