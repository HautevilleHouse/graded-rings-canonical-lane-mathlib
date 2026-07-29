import canonicalLaneMathlib.AdmissibleClass
import GradedRingsCanonicalLaneLean.GradedRingDefinition

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure GradedHomomorphism (R S : GradedRing α) where
  map : R.carrier → S.carrier
  preserves_add : ∀ a b : R.carrier, map (R.add a b) = S.add (map a) (map b)
  preserves_mul : ∀ a b : R.carrier, map (R.mul a b) = S.mul (map a) (map b)
  preserves_one : map R.one = S.one
  preserves_zero : map R.zero = S.zero
  preserves_grading : ∀ a : R.carrier, S.grading (map a) = R.grading a

structure GradedHomomorphismEvidence (R S : GradedRing α) (φ : GradedHomomorphism R S) where
  addClosed : φ.preserves_add
  mulClosed : φ.preserves_mul
  oneClosed : φ.preserves_one
  zeroClosed : φ.preserves_zero
  gradingClosed : φ.preserves_grading

def GradedHomomorphismClosed (R S : GradedRing α) (φ : GradedHomomorphism R S) : Prop :=
  φ.preserves_add ∧ φ.preserves_mul ∧ φ.preserves_one ∧ φ.preserves_zero ∧ φ.preserves_grading

theorem graded_homomorphism_closed_from_evidence (R S : GradedRing α) (φ : GradedHomomorphism R S)
    (E : GradedHomomorphismEvidence R S φ) : GradedHomomorphismClosed R S φ := by
  exact And.intro E.addClosed (And.intro E.mulClosed (And.intro E.oneClosed (And.intro E.zeroClosed E.gradingClosed)))

end GradedRingsCanonicalLaneLean
end HautevilleHouse