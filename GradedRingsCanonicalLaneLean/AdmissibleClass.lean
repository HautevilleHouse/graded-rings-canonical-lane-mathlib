import HautevilleHouse.GradedRingsCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure AdmissibleClass where
  object : GradedRingObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GradedRingWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GradedRingsCanonicalLaneLean
end HautevilleHouse
