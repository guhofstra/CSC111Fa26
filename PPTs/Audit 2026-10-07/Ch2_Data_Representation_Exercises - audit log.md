# Ch2_Data_Representation_Exercises.pptx - audit log

## Summary
12 slides, 7 edits. Output: out/Ch2_Data_Representation_Exercises.pptx (validate.py PASSED, 12 slides). Edited together with the ANS deck so the two decks now have identical question text.

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 1 | "Spring 2026" -> "Fall 2026" | wrong semester (course is Fall 2026) |
| 3 | "...binary number of the negative of its value, for 2's-complement system" -> "...of its negation, for an 8-bit system, with 2's-complement representation." | no bit width given; ANS slide 4 uses 8-bit; answers (10101011, 01010110, 10000000) only make sense for 8 bits |
| 7 | answer table row E "-32 ... 31" -> "0 ... 63" | unsigned 6-bit question had no correct option; ANS slide 12/13 has E = 0...63 |
| 10 | "Q: Q: Consider" -> "Q: Consider" | duplicated label |
| 12 | statement 1 "Overflow is impossible when subtracting one unsigned..." -> "Borrow=1 is impossible ..."; 2 -> "Overflow=1 is impossible ..."; 4 "full-scale negative and full-scale positive" -> "smallest negative and largest positive numbers ...identical." | match the wording that ANS slide 23 actually answers (Overflow flag is a signed concept) |

## Needs your decision / not fixed
- Slides 6 and 7: footer "Fall 2017 - Lecture #1" (leftover from another university's slide source). Suggest removing or replacing with the course footer (footer placeholder; also on ANS slides 10-13). Slide-6/7 date field "12/30/2025" is also stale (field).
- Slide 8: "What is the result of 1001 + 0011?" has no bit width while ANS slide 15 says "Consider a 4-bit system"; harmless but could add.

## Notes
- Recomputed all questions against the ANS deck: see the ANS log.
