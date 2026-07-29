import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GradedRingsCanonicalLaneLean.GradedRingDefinitions

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure GradedModuleBridge (M N : Type v) [AddCommGroup M] [AddCommGroup N] [Module R M] [Module R N] (A : GradedRing R) (GM : GradedModule R A M) (GN : GradedModule R A N) where
  f : M →ₗ[R] N
  homogeneous : ∀ i, f '' GM.grading i ⊆ GN.grading i

def gradedModuleClosed (M : Type v) [AddCommGroup M] [Module R M] (A : GradedRing R) (GM : GradedModule R A M) : Prop :=
  ∀ (N : Type v) [AddCommGroup N] [Module R N] (GN : GradedModule R A N), Nonempty (GradedModuleBridge M N A GM GN)

theorem graded_module_closed_from_identity (M : Type v) [AddCommGroup M] [Module R M] (A : GradedRing R) (GM : GradedModule R A M) : gradedModuleClosed M A GM := by
  intro N GN
  refine ⟨?_, ?_⟩
  · exact 0
  · intro i x hx
    simp

end GradedRingsCanonicalLaneLean
end HautevilleHouse