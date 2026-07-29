import canonicalLaneMathlib.AdmissibleClass
import GradedRingsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

def ConstrainedGradedRingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_graded_ring_endgame (A : AdmissibleClass) :
    ConstrainedGradedRingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GradedRingsCanonicalLaneLean
end HautevilleHouse