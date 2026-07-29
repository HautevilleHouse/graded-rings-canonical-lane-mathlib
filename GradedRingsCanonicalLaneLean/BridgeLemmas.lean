import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

def bridgeClosed (A : GradedAdmissibleClass) : Prop :=
  GradedWitnessClosed A.object

theorem bridge_from_admissible_class (A : GradedAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.admitted

end GradedRingsCanonicalLaneLean
end HautevilleHouse