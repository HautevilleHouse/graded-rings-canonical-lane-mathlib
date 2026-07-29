import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure GradedRing where
  carrier : Type u
  grading : Type v
  addGroup : AddCommGroup carrier
  multiplication : carrier → carrier → carrier
  gradingSet : Set grading
  homogeneousComponent : grading → Submodule ℤ carrier
  isDirectSum : DirectSum grading (fun i => homogeneousComponent i) ≃+* carrier
  compatibility : ∀ (r s : carrier), (multiplication r s) ∈ homogeneousComponent (gradingOf r * gradingOf s)
  where gradingOf : carrier → grading

structure GradedRingObject where
  ring : GradedRing
  isGraded : True
  generatorSet : Submodule ℤ ring.carrier
  homogeneousIdeal : Ideal ring.carrier
  primaryDecomposition : List (Ideal ring.carrier)
  hilbertFunction : ℕ → ℕ
  conclusion : isGraded

end GradedRingsCanonicalLaneLean
end HautevilleHouse