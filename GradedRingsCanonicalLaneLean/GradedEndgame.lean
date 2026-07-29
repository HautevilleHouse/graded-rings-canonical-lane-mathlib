import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GradedRingsCanonicalLaneLean.GradedModuleClosure
import HautevilleHouse.GradedRingsCanonicalLaneLean.GradedTensorProduct

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

def ConstrainedGradedClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_graded_endgame (A : AdmissibleClass) : ConstrainedGradedClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GradedRingsCanonicalLaneLean
end HautevilleHouse