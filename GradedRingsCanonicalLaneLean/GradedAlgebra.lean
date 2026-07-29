import canonicalLaneMathlib.AdmissibleClass
import GradedRingsCanonicalLaneLean.GradedRingDefinition
import GradedRingsCanonicalLaneLean.HomogeneousComponents

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure GradedAlgebra (R : GradedRing α) (A : Type v) [DecidableEq α] where
  carrier : Type v
  algebraMap : R.carrier → carrier
  gradedAlgebraStructure : ∀ (d : α), HomogeneousComponent R d → carrier → Prop
  algebraMap_grading : ∀ r : R.carrier, grading (algebraMap r) = R.grading r
  compatibility : ∀ (d : α) (H : HomogeneousComponent R d) (a : carrier), 
    gradedAlgebraStructure d H a → grading a = d
where
  grading : carrier → α
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  zero : carrier
  one : carrier

structure GradedAlgebraEvidence (R : GradedRing α) (A : GradedAlgebra R) where
  algebraMap_gradingClosed : ∀ r : R.carrier, A.grading (A.algebraMap r) = R.grading r
  compatibilityClosed : ∀ (d : α) (H : HomogeneousComponent R d) (a : A.carrier), 
    A.gradedAlgebraStructure d H a → A.grading a = d

def GradedAlgebraClosed (R : GradedRing α) (A : GradedAlgebra R) : Prop :=
  (∀ r : R.carrier, A.grading (A.algebraMap r) = R.grading r) ∧
  (∀ (d : α) (H : HomogeneousComponent R d) (a : A.carrier), 
    A.gradedAlgebraStructure d H a → A.grading a = d)

theorem graded_algebra_closed_from_evidence (R : GradedRing α) (A : GradedAlgebra R)
    (E : GradedAlgebraEvidence R A) : GradedAlgebraClosed R A := by
  exact And.intro E.algebraMap_gradingClosed E.compatibilityClosed

end GradedRingsCanonicalLaneLean
end HautevilleHouse