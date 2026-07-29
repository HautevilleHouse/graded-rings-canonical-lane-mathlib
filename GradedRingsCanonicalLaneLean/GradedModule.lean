import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GradedRingsCanonicalLaneLean.GradedRingDefinition

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure GradedModulePackage (R : GradedRingPackage) where
  carrier : Type u
  smul : R.carrier → carrier → carrier
  moduleLaw : Prop
  gradeCompatibility : ∀ (r : R.carrier) (m : carrier), gradingMap R (smul r m) = (gradeAdditive R).add (gradingMap R r) (gradingMap R m) -- placeholder
  gradeAdditive : Add (gradingGroup R)  -- placeholder

structure GradedModuleEvidence {R : GradedRingPackage} (M : GradedModulePackage R) where
  smulGradeClosed : ∀ (r : R.carrier) (m : M.carrier), gradingMap R (M.smul r m) = (gradeAdditive R).add (gradingMap R r) (gradingMap R m)

def GradedModuleClosed {R : GradedRingPackage} (M : GradedModulePackage R) : Prop :=
  ∀ (r : R.carrier) (m : M.carrier), gradingMap R (M.smul r m) = (gradeAdditive R).add (gradingMap R r) (gradingMap R m)

theorem graded_module_closed_from_evidence {R : GradedRingPackage} (M : GradedModulePackage R) (E : GradedModuleEvidence M) : GradedModuleClosed M := by
  exact E.smulGradeClosed

end GradedRingsCanonicalLaneLean
end HautevilleHouse