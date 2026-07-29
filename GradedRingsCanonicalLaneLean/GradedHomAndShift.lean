import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GradedRingsCanonicalLaneLean.GradedRingDefinitions

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure GradedHom {R : Type u} [Ring R] {A B : GradedRing R} (f : R →+* R) where
  respects_grading : ∀ i, A.grading i ≤ Submodule.comap (f : R →ₗ[R] R) (B.grading i)

def shift (A : GradedRing R) (d : ℤ) : GradedRing R := {
  A with
  grading := fun i => A.grading (i - d)
}

theorem shift_is_grading (A : GradedRing R) (d : ℤ) : GradedRing R := by
  refine { A with grading := fun i => A.grading (i - d) }
  · exact A.directSum
  · intro i j
    calc
      (fun i => A.grading (i - d)) i * (fun i => A.grading (i - d)) j = A.grading (i - d) * A.grading (j - d) := rfl
      _ ≤ A.grading ((i - d) + (j - d)) := A.grading_mul (i - d) (j - d)
      _ = A.grading ((i + j) - d) := by ring
      _ = (fun i => A.grading (i - d)) (i + j) := rfl

end GradedRingsCanonicalLaneLean
end HautevilleHouse