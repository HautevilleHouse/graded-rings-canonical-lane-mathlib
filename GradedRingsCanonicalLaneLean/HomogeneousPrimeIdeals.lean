import canonicalLaneMathlib.AdmissibleClass
import GradedRingsCanonicalLaneLean.GradedRingDefinitions

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure HomogeneousIdeal (R : GradedRing ℕ) where
  carrier : Set (Σ n, R.carrier n)
  zero_mem : (⟨0, R.zero⟩ : Σ n, R.carrier n) ∈ carrier
  add_mem : ∀ {n m : ℕ} {x : R.carrier n} {y : R.carrier m},
    (⟨n, x⟩ : Σ n, R.carrier n) ∈ carrier →
    (⟨m, y⟩ : Σ n, R.carrier n) ∈ carrier →
    (⟨n + m, R.add n m x y⟩ : Σ n, R.carrier n) ∈ carrier
  mul_mem : ∀ {n m : ℕ} {r : R.carrier n} {x : R.carrier m},
    (⟨m, x⟩ : Σ n, R.carrier n) ∈ carrier →
    (⟨n + m, R.mul n m r x⟩ : Σ n, R.carrier n) ∈ carrier
  homogeneous : ∀ (x : Σ n, R.carrier n), x ∈ carrier →
    ∀ (d : ℕ) (y : R.carrier d), (⟨d, y⟩ : Σ n, R.carrier n) = x → (⟨d, y⟩ : Σ n, R.carrier n) ∈ carrier

structure PrimeHomogeneousIdeal (R : GradedRing ℕ) extends HomogeneousIdeal R where
  not_one : (⟨0, R.zero⟩ : Σ n, R.carrier n) ∉ carrier
  prime : ∀ (x y : Σ n, R.carrier n), x ∉ carrier → y ∉ carrier →
    (∃ (n : ℕ) (z : R.carrier n), (⟨n, z⟩ : Σ n, R.carrier n) = R.mul (x.1) (y.1) x.2 y.2) →
    (⟨x.1 + y.1, R.mul x.1 y.1 x.2 y.2⟩ : Σ n, R.carrier n) ∉ carrier

def homogeneousPrimeIdealsAdmissibleClass (R : GradedRing ℕ) : Prop :=
  True

end GradedRingsCanonicalLaneLean
end HautevilleHouse