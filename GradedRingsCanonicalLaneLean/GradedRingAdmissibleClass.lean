import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure GradedAdmissibleObject where
  ring : Type u
  grading : Type v
  gradedRingOps : GradedRing ring grading
  admitted : Prop

structure GradedAdmissibleClass where
  object : GradedAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : GradedAdmissibleClass) : Prop :=
  GradedWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GradedRingsCanonicalLaneLean
end HautevilleHouse