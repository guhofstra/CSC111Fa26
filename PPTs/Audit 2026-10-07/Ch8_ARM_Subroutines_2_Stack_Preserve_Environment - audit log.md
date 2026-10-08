# Ch8_ARM_Subroutines_2_Stack_Preserve_Environment.pptx - audit log

## Summary
57 slides audited. Verified by simulation: PUSH/POP ordering (slides 13-16), the swap example (17-21: SP 0x200001FC/0x200001F8, values), the quiz answers (22-23), the full/empty ascending/descending table (12) and LDM/STM pictures (9-10), the QUAD/SQ trace (37-48: R0 2 -> 4 -> 16, LR = 0x140, PC/SP values), func1/func2 (slide 30: final R1=0, R2=1, R3=4) and both extra-argument versions with their offsets (53-54: [sp,#12..#24], saved r5/r6/lr at 0xFE4-0xFEC). 17 paragraph-level fixes. Output: out/Ch8_ARM_Subroutines_2_Stack_Preserve_Environment.pptx (57 slides, validate.py passed).

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 1 | Fall 2025 -> Fall 2026 | Stale semester |
| 1 | Chapter 10 -> Chapter 8 | File is Ch8 part 2; deck 1 and 3 say Chapter 8 |
| 4 | "at the beginning a subroutine" -> "of a subroutine" | Typo |
| 12 | "Stock Name" -> "Stack Name" | Typo |
| 24 | "A subroutines, also called" -> "A subroutine" | Typo |
| 25, 29, 36 | `EDP` -> `ENDP` | Wrong directive (7 occurrences) |
| 26 | r8 "YES" -> "Yes" | Consistency |
| 27 | "must save and store it" -> "save and restore it" | Callee-saved registers are saved and restored |
| 29 | "by saving and restores R4 by PUSH and POP" -> "by saving and restoring R4 with PUSH and POP" | Grammar |
| 36 | "both calls from QUAD to PROC" -> "to SQ" | The callee is SQ |
| 53 | `POP {r0, r1, r2, r3}` after `BL sum` -> `ADD sp, sp, #16` | POP would overwrite r0, which holds the return value (same point as slide 21 of deck 1); this just discards the 4 pushed words |

## Needs your decision / not fixed
- Slide 55: title "Version 2 is Better Programming Practice" is questionable. Version 1 only uses scratch registers r1/r2 (caller-saved) and is AAPCS-compliant and cheaper; Version 2 needlessly uses callee-saved r5/r6. Suggest "Version 2 shows how to preserve callee-saved registers; Version 1 is more efficient".
- Slides 26/27/28: slide 26 says LR "No" (not preserved), slide 27 (picture) highlights LR as callee-saved, and slide 28 lists R14 under callee. Pick one framing ("LR must be saved if the callee makes a nested call").
- Slide 28: the CPSR is listed with caller-saved registers; fine, but note flags are simply not preserved.
- Slide 34 (picture) is titled "Nested Subroutines: Solution #1" like slide 32; the figure is the control-flow diagram. Suggest a title such as "Nested Subroutines: Control Flow".
- Slide 8: IB/DA modes are shown but not available on Cortex-M (only IA and DB); consider a footnote.
- Slide 33: `BX LR` after `POP {r4, PC}` is struck through in the slide (intentional).
- Slide 54: the two tables overlap in the LibreOffice render; check in PowerPoint.
- Slide 29 speaker notes contain a stray "TOFix either R1 or r1" reminder.
- Slides 1/57: lecture video links not verified.

## Notes
- The swap example, address labels (0x138-0x15C) and register boxes in slides 37-48 agree with the code.
