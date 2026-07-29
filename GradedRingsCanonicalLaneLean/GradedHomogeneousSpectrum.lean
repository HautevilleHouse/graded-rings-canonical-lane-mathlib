import GradedRingsCanonicalLaneLean.GradedStructure

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure GradedPrimeSpectrum (R : Type u) [GradedRing R ℕ] where
  carrier : Set (Set R)
  homogeneous : ∀ I ∈ carrier, I ∈ {J : Ideal R | J.IsHomogeneous}
  prime : ∀ I ∈ carrier, I.IsPrime

def Proj (R : Type u) [GradedRing R ℕ] : GradedPrimeSpectrum R :=
  { carrier := {I : Ideal R | I.IsHomogeneous ∧ I.IsPrime ∧ I ≠ (⊤ : Ideal R)},
    homogeneous := λ I hI => hI.1,
    prime := λ I hI => hI.2.1
  }

theorem Proj_nonempty (R : Type u) [GradedRing R ℕ] : Nonempty (Proj R).carrier := by
  sorry

end GradedRingsCanonicalLaneLean
end HautevilleHouse