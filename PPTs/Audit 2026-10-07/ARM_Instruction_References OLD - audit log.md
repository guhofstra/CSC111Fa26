# Audit log: ARM_Instruction_References OLD.pptx (8 slides)

## Summary
- OLD version (saved 2025-09-24). Superseded by "ARM Instruction References.pptx" (2025-10-23), which adds the Condition Flags (slide 2) and Carry/Overflow (slide 3) slides and replaces this deck's slide 2 ("NZCV Flags in xPSR", flag definitions plus a picture; notes only contain a URL) with the new slide 2 (the N/Z/C/V text is still there, in the notes). All other slides are identical in content, so the same errors were found and fixed. Recommend archiving or deleting this file.
- 8 edits; slide count unchanged; validate.py passed.

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 3 | cells "B LABELAlways Branch to LABEL" + empty -> "B LABEL" and "Always Branch to LABEL" | two cells merged into garbled text |
| 3 (notes) | "psuedo" -> "pseudo" | typo |
| 4 | "MOVN r4, r2" -> "MVN r4, r2" | no such instruction; MVN is move-NOT |
| 4 | "... shift left r6 by 8 positions" -> "by 2 positions" | example uses LSL #2 |
| 4 (notes) | "psuedo" -> "pseudo" | typo |
| 5, 6, 7 | "Ch6 ARM Flow Control:" -> "Ch6 ARM Control Flow:" | chapter title |

## Needs your decision / not fixed
- Slide 1: "Fall 2025" term label.
- Slide 2 (NZCV flag definitions): consistent with the current deck's notes; nothing to fix.
- See the log of the current deck for the remaining non-fixed remarks (slide 3 CMP description, IT block, etc.).

## Notes
- The tables on slides 3 and 4 overflow the bottom of the slide in the LibreOffice render; check in PowerPoint.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
