# Chxx_Review.pptx - audit log

## Summary
20 slides, 16 edits. Output: out/Chxx_Review.pptx (validate.py: only pre-existing "Broken reference to NULL" image relationships on slide 13, present in the original; slide count unchanged). The deck is a stale review deck: title slide says "ECE 271 - Microcomputer Architecture and Applications / Final Review / Fall 2025" (the Univ. of Maine course); it overlaps heavily with Lecture_xx_Review.pptx (CSC111, newer) and appears to be an older/duplicate version of it plus fixed/floating point, interrupt and mixed C/asm topics.

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 3 | "performance bottle" -> "bottleneck"; "such ROR" -> "such as ROR"; "wash machine controller" -> "washing machine controllers"; "how does the processor work" -> "how the processor works" | typos (same as L0.1 slide 18) |
| 6 | `ADD r1, r0, r0, LSL 2` -> `LSL #2` | UAL syntax requires # |
| 9, 11 | "hander" -> "handler" (x2) | typo |
| 11 | "xPSP" -> "xPSR" | stacked register is xPSR |
| 11 | "Determined by operating mode, and CONTROL[0]; Thread mode -> SP = PSP; Handler mode -> SP = MSP if CONTROL[0] = 0; Otherwise PSP" -> "CONTROL[1]; Thread mode -> SP = MSP if CONTROL[1] = 0; Otherwise PSP; Handler mode -> SP = MSP" | wrong: Handler mode always uses MSP; thread mode selects MSP/PSP with CONTROL[1] (SPSEL); CONTROL[0] is nPRIV |
| 15 | `SMULL ... ; Unsigned long multiply` -> "Signed long multiply" | SMULL is signed (UMULL unsigned); title is signed Q15.16 |
| 18 | exponent field `1000010` -> `10000010` | 130 = 10000010 (8 bits); 14.5 = 0x41680000 was correct |
| 19 | `fCL_PSC`, `fCL_CNT` (labels) and the formula f_CK_CNT = f_CL_PSC/(Prescaler+1) -> `CK` | typo (STM32 notation CK_PSC / CK_CNT) |

Also verified: slide 4 string table, 17 (0xC1FF0000 = -31.875, fraction 0.9921875), 18 (fraction 0.8125 = 0.1101b, 14.5 = 1.8125 x 2^3), 13/14 fixed-point formulas, 8 (D/S register allocation of the picture a1->D0, a2->S2, a4->S3, a3->D2, a5->S6, a7->S7, a6->D4, a8->D5), 20.

## Needs your decision / not fixed
- Slide 1: "ECE 271 - Microcomputer Architecture and Applications" and "Fall 2025" are stale for CSC111 Fall 2026. Not changed (course title not known to me).
- Slide 4: "Big Endian or Little Endian?" for a char array - the newer Lecture_xx_Review slide 9 states endianness is irrelevant for single-byte char arrays. Make the two consistent.
- Slide 7: "CPSR" listed as caller-saved state - Cortex-M has xPSR/APSR; and "R14 (LR) must be saved if callee makes nested calls" is OK.
- Slide 11: the bottom bullets overlap the stack table (pre-existing layout); text says pushes go to "the main stack" but with PSP in use they go to the current stack.
- Slide 13: four picture relationships point to "NULL" (broken image links, pre-existing); pictures render, but open in PowerPoint to check no red-X.
- Slide 18: body (normalization formula) is OMML; fine.

## Notes
- Likely stale/duplicate of Lecture_xx_Review.pptx (see that log); consider deleting or merging.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
