# Ch2_Data_Representation_Exercises ANS.pptx - audit log

## Summary
23 slides, 8 edits. Output: out/Ch2_Data_Representation_Exercises ANS.pptx (validate.py PASSED, 23 slides). Every answer was recomputed: 0x3A56E2F8 = 0011 1010 0101 0110 1110 0010 1111 1000; 111010 = 0x3A; two's complements 10101011 / 01010110 / 10000000; 10100111 = 167 / -89, 11100001 = 225 / -31, 10000000 = 128 / -128; 1001 = 9 / -7; 6-bit signed range [-32,31]; unsigned [0,63]; 1001+0011 = 1100 (12 / -4); 1011+0110 = 0001 (C=1, V=0); 1011-0110 = 0101 (borrow 0, V=1); 0110-1011 = 1011 (borrow 1, V=1); true/false answers F, T, F, F. All answers correct except the flag naming below.

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 1 | "Spring 2026" -> "Fall 2026" | wrong semester |
| 9 | second "Q: depends on the number system." -> "A:" | label error |
| 17 | "signed addition ... Borrow flag is set to 0" -> "Overflow flag is set to 0"; last bullet "(Borrow = 0)" -> "(Overflow = 0)" | signed addition is about the V flag, not borrow |
| 18 | "Q: Q:" -> "Q:" | duplicated label |
| 22 | true/false statements 1, 2, 4 re-worded to match slide 23 (see Exercises log) | question and answer slides must match |

## Needs your decision / not fixed
- Slides 10-13: footer "Fall 2017 - Lecture #1" is leftover from another source; slide 10/11/12/13 date field "9/21/2026".
- Slide 10 vs 11 (and 12 vs 13): question slide and answer slide look identical in the XML (the correct row is not marked in text; may be marked by animation/colour). Check that the correct option E is highlighted on 11 and 13.
- Slide 16: answer "0001" is shown on the question slide (probably an animation; check it does not appear before the click).
- Slide 5: remark about a 10-bit system is correct (0010000000 = 128, 1110000000 = -128); no change.

## Notes
- This deck contains the same question slides as the Exercises deck (slides 2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22) - now identical.
