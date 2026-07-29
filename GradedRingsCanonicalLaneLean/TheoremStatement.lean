import HautevilleHouse.GradedRingsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure GradedRingObject where
  carrier : Type
  grading : carrier → ℤ
  multiplication : carrier → carrier → carrier
  unit : carrier
  associativity : ∀ a b c : carrier, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  identity_left : ∀ a : carrier, multiplication unit a = a
  identity_right : ∀ a : carrier, multiplication a unit = a
  graded_compatibility : ∀ a b : carrier, grading (multiplication a b) = grading a + grading b
  conclusion : GradedRingWitnessClosed this

def GradedRingWitnessClosed (O : GradedRingObject) : Prop :=
  True

end GradedRingsCanonicalLaneLean
end HautevilleHouse
