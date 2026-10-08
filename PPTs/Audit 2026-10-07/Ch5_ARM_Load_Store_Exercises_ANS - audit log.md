# Ch5_ARM_Load_Store_Exercises_ANS - audit log

## Summary

- Original: `/tmp/claude-0/w111/orig/Ch5_ARM_Load_Store_Exercises_ANS.pptx` (untouched). Edited deck: `/tmp/claude-0/w111/out/Ch5_ARM_Load_Store_Exercises_ANS.pptx`.
- Slides: 37 (unchanged count/order). Text replacements made: 17 (run-level only; no shapes, images, animations or layouts touched).
- Most important fixes: slide 3 Word 3 address `0x0012` (=18) -> `0x000C` (=12); slide 10 post-index answer `r0 after store: 0x20008000` -> `0x20008004` (slide 11 already says 0x20008004); LDSB -> LDRSB (slides 10, 11); slide 17/18 question premise and numbering aligned with the exercise deck and the picture (addresses 96..111, (a)-(d)); slide 15 premise dropped (addresses up to 20 asked); slide 33 speaker notes had wrong register values (R7, R9, R10, R12) contradicting the slide.
- Recomputed by script and found correct: slide 5 (MSB/half-word addresses), 7/9 (0xEE8C90A7 BE, 0xA7908CEE LE), 10-13 (LDRH 0x00008CEE, LDRSB 0xFFFFFFEE, store results), 16 (1/2/2/1 cycles), 18, 20, 22 (except long, below), 25 (LDMIA/LDMIB results), 26-29 (LDRB/LDRSH results big/little endian), 30/31 (R0=0xBADCAFE1, R2=0xABCDFFFF, mem 09 53 67 18, R4=0xFFFF8877), 32-36 (every register, NZCV 0010/0110/0110/1000, REV, RBIT=0x00503D0B, ROR=0x000ABCD0, final memory D0 BC D7 AB, LR=0x260).
- Validation: opens with python-pptx, slide count unchanged, `office/validate.py --original` PASSED. Only slide/notes XML parts with text changes were replaced; every other package part is byte-identical to the original.

## Changes made

| Slide | Before -> After | Why |
|---|---|---|
| 1 | `Fall 2025` -> `Fall 2026` | Outdated semester on cover |
| 3 | `0x0012` -> `0x000C` | Word 3 starts at byte address 12 = 0x0C; 0x0012 would be address 18 |
| 10 | `LDSB` -> `LDRSB` | Mnemonic is LDRSB |
| 10 | `r0 after store: 0x20008000` -> `r0 after store: 0x20008004` | Post-index STR r1,[r0],#4 leaves r0 = 0x20008004 (slide 11 states this) |
| 11 | `LDSB` -> `LDRSB` | Mnemonic is LDRSB |
| 15 | `Consider 16 bytes of memory (addresses 0 to 15) arranged as four 32-bit words (4 bytes each). ` -> `` | Premise contradicts the questions (addresses 15, 16, 20); slide 16 already drops it |
| 17 | `(addresses 0 to 15)` -> `(addresses 96 to 111)` | Question is about address 102; the picture shows addresses 96..111 |
| 17 | `(b) How many memory cycles` -> `(c) How many memory cycles` | Question numbering, matches slide 18 |
| 17 | `(c) How many memory cycles are required to read the half word` -> `(d) How many memory cycles are required to read the half word` | Question numbering, matches slide 18 |
| 18 | `(addresses 0 to 15)` -> `(addresses 96 to 111)` | Question is about address 102; the picture shows addresses 96..111 |
| 18 | `(d) 1cycle` -> `(d) 1 cycle` | Typo |
| 26 | `0x23456789 After` -> `0x23456789. After` | Missing period |
| 31 | `LDRSH R4, (R1, #0xC)` -> `LDRSH R4, [R1, #0xC]` | Brackets, not parentheses, for a memory operand |
| 33 | `R12 = 0xAB8D7BCD0` -> `R12 = 0xABD7BCD0` | Speaker notes contradicted the slide table (and had 9 hex digits) |
| 33 | `R9  = 0x008B3CD0` -> `R9  = 0x000ABCD0` | Speaker notes: ROR 0xABCD0000 by 12 = 0x000ABCD0 |
| 33 | `R10 = 0xDABCDAD0` -> `R10 = 0xD0BC0A00` | Speaker notes: REV of 0x000ABCD0 = 0xD0BC0A00 |
| 33 | `R7  = 0xABCDEFDF` -> `R7  = 0xABCDEFEF` | Speaker notes: BIC clears bit 4 of 0xFF -> 0xEF |

## Needs your decision / not fixed

- Slide 3: the byte-address axis is labelled in decimal-looking digits (0000..0015) while answers are hex; the corrected 0x000C now sits next to an axis label "0012". Consider relabelling the axis in hex (0x0C) or writing "12 = 0x0C".
- Slide 22: "(d) longs: +8" assumes an 8-byte long (LP64). On 32-bit ARM/Cortex-M `long` is 4 bytes (-> 0x1234567C); `long long` is 8. Suggest stating the data model or asking about `long long`.
- Slide 25: the question box lists only two of the three LDM instructions (LDMIB r3!,{r1,r2,r0} missing) although the answer covers all three; and LDMIB (and LDMDA/IB in general) do not exist in Thumb-2/Cortex-M. Consider switching to LDMIA/LDMDB.
- Slides 26-29: `LDRSH R7,[R2,#1]` is an unaligned halfword access (address 9). It works on Cortex-M3/M4 but faults on Cortex-M0; a remark would make the answer complete.
- Slide 23 (picture, same as Ch5 slide 46): "r7 = -0" should be "r7 = 0". Slide 37 (picture, scanned exam solution): the last memory byte is handwritten and reads like "A8" instead of "AB". Neither can be edited.
- Speaker notes of slides 27-29 contain a long pre-signed S3 URL with an `x-amz-security-token` (expired, but should not be distributed) and chat-style text on slide 26 notes; recommend deleting these notes. Slide 24/25 notes hold a garbled register table (r0=0x13, r1=0xFFFFFFFF, r2=0xEEEEEEEE, r3=0x8000 in the source picture).

## Notes

- Method: extracted all slide text, tables, grouped shapes, a14/OMML content inside mc:AlternateContent and speaker notes; rendered every slide with LibreOffice and inspected pictures; re-computed worked examples by script. LibreOffice table layouts differ slightly from PowerPoint, so apparent clipping/overlap in renders was not treated as a content error.
- "Fall 2025" on the cover was changed to "Fall 2026" in all six decks (your course memory says Fall 2026). Revert if the cover year is intentionally the original delivery year.
- Slide 33 speaker-notes edits are notes-only (visible slide was already correct).


## Follow-up edits (2026-10-08, from review comments)

- S3: byte-address axis relabelled in hex (0x0000..0x000F) to match the 0x-prefixed word addresses.
- S22: question now states the data model ("(d) longs (32-bit ARM/Cortex-M: long = 4 bytes)") and adds "(e) long longs (8 bytes)"; answers: (d) 0x1234567C, (e) 0x12345680.
- S24/S25: LDMIB variants (not available in Thumb-2/Cortex-M) replaced by `LDMIA r3!,{r2,r1,r0}` (same result, order irrelevant) and `LDMDB r3!,{r0,r1,r2}` with r3 = 0x800C (reads 0x8000/0x8004/0x8008, r3 -> 0x8000). The third instruction is now listed in the question as well.
- S26: question states "Assume Cortex-M3/M4, which allow unaligned halfword access"; S28 heading marks the unaligned access (note in speaker notes: HardFault on M0/M0+).
- S23 picture (EMF): "r7 = -0" -> "r7 =  0" (the '-' glyph blanked in both the GDI and EMF+ records).
- Speaker notes: S24, S26, S27, S29 cleared (garbled table, chat text, pasted citations incl. an expired pre-signed URL); S25 and S28 notes replaced by short remarks.
- Not changed: S37 picture (handwritten last byte "A8" vs "AB") - needs your check.
