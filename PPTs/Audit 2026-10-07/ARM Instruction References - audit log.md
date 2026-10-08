# Audit log: ARM Instruction References.pptx (9 slides)

## Summary
- CURRENT reference deck (saved 2025-10-23, 9 slides). Compared with "ARM_Instruction_References OLD.pptx" (2025-09-24, 8 slides) it adds slide 2 (Condition Flags with PSR diagram) and slide 3 (Carry and Overflow flags); all other slides are the same content.
- Verified: condition-code table (slide 6, matched suffix/description/flag by layout: EQ Z=1, NE Z=0, CS/HS C=1, CC/LO C=0, MI N=1, PL N=0, VS V=1, VC V=0, HI C=1&Z=0, LS C=0|Z=1, GE N=V, LT N!=V, GT Z=0&N=V, LE Z=1|N!=V) , branch table (7), conditional-execution table (8), AAPCS register table (9: r0-r3 args, r4-r11 = V1-V8, r9 platform register, r12 IP, SP/LR/PC), carry/overflow rules (3), PSR bit layout (2).
- 8 edits; slide count unchanged; the edited deck has the same single relationship error as the original (see Notes).

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 2 | "Non-arithmetic operations does not touch V bit" -> "...operations do not touch V bit" | grammar |
| 4 | table cell "B LABELAlways Branch to LABEL" (col 2) and empty col 3 -> col 2 "B LABEL", col 3 "Always Branch to LABEL" | two cells had been merged into garbled text ("LABELAlways"); the new run in col 3 is a copy of the existing run's formatting |
| 4 (notes) | "psuedo-instructions" -> "pseudo-instructions" | typo |
| 5 | "MOVN r4, r2" -> "MVN r4, r2" | there is no MOVN; the move-NOT instruction is MVN |
| 5 | example "AND r4, r5, r6, LSL #2 ... shift left r6 by 8 positions" -> "by 2 positions" | text contradicted the instruction (#2) |
| 5 (notes) | "psuedo" -> "pseudo" | typo |
| 7, 8 | titles "Ch6 ARM Flow Control:" -> "Ch6 ARM Control Flow:" | chapter title is "Ch6 ARM Control Flow" (slide 6 already uses it; the file is Ch6_ARM_Control_Flow) |

## Needs your decision / not fixed
- Slide 1: "Fall 2025" term label - other decks say Spring 2026, the current term is Fall 2026.
- Slide 4: the CMP row has no description; consider "Set flags according to [r4] - [r2]".
- Slide 4: "MOV r4, #10 ; 8-bit literal, can be shifted" - on Cortex-M (Thumb-2) the immediate is a "modified immediate" (8-bit value rotated, or repeated byte patterns, or any 16-bit with MOVW). Simplification, left as is.
- Slide 8: ADDEQ etc. on Cortex-M (Thumb-2) must be inside an IT block (or use the IT instruction); the slide shows the ARM-state form. Fine if intended as a concept illustration.
- Slides 7/8 write "N = !V" while slide 6 writes "N!=V"; stylistic.
- Slide 9: r9 marked "Subroutine Preserved: Yes" and called "Platform specific/V6"; under AAPCS r9 is either callee-saved V6 or a platform register, depending on platform. Fine as stated.

## Notes
- Pre-existing package defect (also in the original): ppt/slides/_rels/slide3.xml.rels has an image relationship with Target="NULL" (rId4); validate.py reports "Broken reference to NULL". I did not touch it because it is outside run-level text edits; PowerPoint evidently tolerates it, but removing the dangling relationship would be cleaner.
- Slides 4 and 5 tables run past the bottom of the slide in the LibreOffice render (the last rows are cut off); check in PowerPoint.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
