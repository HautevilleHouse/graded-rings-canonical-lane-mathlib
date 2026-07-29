import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure GradedRing (R : Type u) [Ring R] where
  grading : ℤ → Submodule R R
  directSum : DirectSum ℤ (fun i => grading i) ≃+* R
  grading_mul : ∀ i j, grading i * grading j ≤ grading (i + j)

structure GradedModule (R : Type u) [Ring R] (A : GradedRing R) (M : Type v) [AddCommGroup M] [Module R M] where
  grading : ℤ → Submodule R M
  directSum : DirectSum ℤ (fun i => grading i) ≃+ M
  grading_smul : ∀ i j, A.grading i • grading j ≤ grading (i + j)

end GradedRingsCanonicalLaneLean
end HautevilleHouse