import GradedRingsCanonicalLaneLean.GradedStructure

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure GradedModule (R : Type u) (M : Type v) [GradedRing R ℕ] where
  module : Module R M
  grading : ℕ → Submodule R M
  directSum : ⨁ (n : ℕ), grading n ≃ M

def gradation.basis {R M : Type} [GradedRing R ℕ] (M_mod : GradedModule R M) : ℕ → Set M :=
  λ n => SetLike.coe (M_mod.grading n)

noncomputable def hilbertSeries (R : Type) [GradedRing R ℕ] (M_mod : GradedModule R M) : ℕ → ℕ :=
  λ n => Set.toNat (SetLike.finiteDimensional (M_mod.grading n) 𝕜) -- assuming field

theorem hilbertSeries_finite (R : Type) [GradedRing R ℕ] (M_mod : GradedModule R M) (n : ℕ) :
  hilbertSeries R M_mod n < ∞ := by
  exact Set.finiteDimensional_iff.mp ?_

end GradedRingsCanonicalLaneLean
end HautevilleHouse