import canonicalLaneMathlib.AdmissibleClass
import GradedRingsCanonicalLaneLean.GradedRingDefinitions

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure GradedModule (R : GradedRing ℕ) (M : Type u) [AddCommGroup M] where
  grading : ℕ → Submodule ℤ M
  zero : grading 0
  add : (i j : ℕ) → grading i → grading j → grading (i + j)
  smul : (i j : ℕ) → R.carrier i → grading j → grading (i + j)
  smulAssoc : ∀ (i j k : ℕ) (r : R.carrier i) (s : R.carrier j) (m : grading k),
    smul (i + j) k (R.mul i j r s) m = smul i (j + k) r (smul j k s m)
  distrib : ∀ (i j k : ℕ) (r : R.carrier i) (m : grading j) (n : grading k),
    smul i (j + k) r (GradedModule.add j k m n) = GradedModule.add (i + j) (i + k) (smul i j r m) (smul i k r n)

def gradedModuleAdmissibleClass (R : GradedRing ℕ) (M : GradedModule R ℤ) : Prop :=
  True

end GradedRingsCanonicalLaneLean
end HautevilleHouse