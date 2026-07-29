import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

def gateClosed (A : GradedAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : GradedAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end GradedRingsCanonicalLaneLean
end HautevilleHouse