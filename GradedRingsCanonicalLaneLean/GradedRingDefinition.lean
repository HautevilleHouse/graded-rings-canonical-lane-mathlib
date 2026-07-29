import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GradedRingsCanonicalLaneLean

structure GradedRingPackage where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  gradingGroup : Type v
  gradingMap : carrier → gradingGroup
  gradeAdditive : Add gradingGroup
  gradeCompatibility : ∀ a b : carrier, gradingMap (addition a b) = (gradeAdditive.add (gradingMap a) (gradingMap b))
  unitGrade : gradingMap one = (gradeAdditive.add (gradeAdditive.zero?) (gradeAdditive.zero?))  -- placeholder

structure GradedRingEvidence (G : GradedRingPackage) where
  additionClosed : ∀ a b : carrier G, gradingMap G (addition G a b) = (gradeAdditive G).add (gradingMap G a) (gradingMap G b)
  multiplicationClosed : ∀ a b : carrier G, gradingMap G (multiplication G a b) = (gradeAdditive G).add (gradingMap G a) (gradingMap G b)
  unitGradeClosed : gradingMap G (one G) = (gradeAdditive G).add ((gradeAdditive G).zero?) ((gradeAdditive G).zero?)

def GradedRingClosed (G : GradedRingPackage) : Prop :=
  G.gradeCompatibility ∧ (∀ a b : carrier G, gradingMap G (multiplication G a b) = (gradeAdditive G).add (gradingMap G a) (gradingMap G b)) ∧
  (gradingMap G (one G) = (gradeAdditive G).add ((gradeAdditive G).zero?) ((gradeAdditive G).zero?))

theorem graded_ring_closed_from_evidence (G : GradedRingPackage) (E : GradedRingEvidence G) : GradedRingClosed G := by
  exact And.intro E.additionClosed (And.intro E.multiplicationClosed E.unitGradeClosed)

end GradedRingsCanonicalLaneLean
end HautevilleHouse