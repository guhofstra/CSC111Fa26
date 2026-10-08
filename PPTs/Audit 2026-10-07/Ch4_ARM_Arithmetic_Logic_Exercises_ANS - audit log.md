# Audit log: Ch4_ARM_Arithmetic_Logic_Exercises_ANS.pptx (50 slides)

Output: /tmp/claude-0/w111/out/Ch4_ARM_Arithmetic_Logic_Exercises_ANS.pptx (50 slides, validate.py PASSED).

## Summary
All answers were recomputed with Python (bit ops 0x0ABC/0x0DEF, masks on 0xDECB, shifts of 0x11223344/0x81223344 with C/N/Z/V, ADDS/ANDS flags, the 4-bit add/sub table incl. carry rows, 0x488CD100, LSB/last-bit-shifted-out flags, polynomial options). Numeric answers are right except where listed below. 45 paragraph-level edits (about 20 distinct fixes). This (un-suffixed) file is the **more current** of the two ANS versions (last saved 2026-02-26 vs 2025-10-16 for "ANS NEW", see the NEW log). Note: in this deck slide 40 is stored as mc:AlternateContent; PowerPoint shows the edited (Choice) text, but LibreOffice shows the fallback picture, which still contains the old 0xFFFFFFE00/0xFFFFFFE01 typos (picture cannot be edited here).

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 11 (notes) | `ORR r6, r6, #0x1001 (0x1001 = binary 1000000010001)` -> `0x1011` | Bits 0, 4, 12 = 0x1011; 0x1001 is only bits 0 and 12 and does not equal the binary shown. (See decision 1 for the slide itself.) |
| 16-20 | `MOV r0, r0, LSL 7` / `LSR 2` / `ASR 2` / `ROR 2` -> `LSL #7` ... | Missing `#` on immediate shift amount (10 occurrences). |
| 16 | "Assuimg" -> "Assuming" | Typo. |
| 18 | "Q2,2:" -> "Q2.2:" | Typo. |
| 19 | Q3.1 "Original r0 = 1111 1111 1111 1111 1111 1100 0000 0000" -> "1111 1111 1111 1111 1100 0000 0000 0000" | That bit string was 0xFFFFFC00; the value is 0xFFFFC000. |
| 19 | Q3.1 result "0011 1111 1111 1111 1111 1111 0000 0000 = 0x3FFFF000" -> "0011 1111 1111 1111 1111 0000 0000 0000" | Binary did not equal the hex shown (it was 0x3FFFFF00). |
| 19 | "4,294,951,424 / 4 = 1,073,737,728" -> "4,294,950,912 / 4 = ..." | 0xFFFFC000 = 4,294,950,912 (= 2^32 - 16384). |
| 19 | Q3.2 "1111 1111 1111 1111 1111 1111 0000 0000 = 0xFFFFF000" -> "1111 1111 1111 1111 1111 0000 0000 0000" | Binary was 0xFFFFFF00. |
| 20 | body label "Q4:" -> "Q5:" | Title says Q5 ANS and slide 16 defines Q5 = ROR. |
| 24, 27 | `MOV R2, R1, LSLS #4` (and LSRS/ASRS, in questions and in explanations) -> `MOVS R2, R1, LSL #4` | LSLS/LSRS/ASRS cannot appear as the shifted operand of MOV; flag-setting form is MOVS Rd, Rm, shift. (13 lines.) |
| 29 | `... 16*9*r3 = 135*r3` -> `153*r3` | (8+1)*(16+1) = 153. |
| 32, 33 | "number of zeros a 32-bit register" -> "zeros in a 32-bit register" | Typo. |
| 36 | Option D: `MLA r2, r3, r0, #2` -> `MLA r2, r3, r0, r1` with the first comment line turned into `MOV r1, #2 // r3 = x, r1 = 2, result -> r2` | MLA takes four registers; an immediate addend is invalid. |
| 39, 40 | `LDR r0, =0xFFFFFFF00` -> `=0xFFFFFF00` | 9 hex digits (slide 37, the ANDS twin, already has 0xFFFFFF00). |
| 40 | `r2 = 0xFFFFFFE01` / `r0 = 0xFFFFFFE00` (4 places) -> `0xFFFFFE01` / `0xFFFFFE00` | 9 hex digits; correct values are 0xFFFFFE00 and 0xFFFFFE01. |
| 41, 42 | `ADD r4, r0, r2, ASRS #3` -> `ASR #3` (also "First, r2 ASRS #3") | ASRS cannot be embedded; also the ADD has no S, and the Exercises deck (slide 22) says `ASR #3`. |

## Needs your decision / not fixed
1. **Slide 11 (Set bits)**: `ORR r6, r6, #(1<<0)|(1<<4)|(1<<12)` = `#0x1011` is **not a legal immediate** (neither ARM nor Thumb-2: 13-bit span), same for `BIC ... #0x1011` and the `AND ... #~(...)` alternative; the assembler will reject them. Suggest: `MOV r0, #0x1011` then `ORR r6, r6, r0` / `BIC r6, r6, r0` (or three single-bit ORRs). The question asks for "an instruction", so wording needs a decision.
2. **Slides 28/29 (Multiply without MUL)**: question lists 135, 153, 255, 18, **16384**; answer slide lists and solves **1025** (ADD r0, r3, r3, LSL #10). Align question and answer (16384 would be `MOV r0, r3, LSL #14`).
3. **Q numbering (slides 16-20)**: slide 16 has Q1..Q5 (Q3 = LSR, Q4 = ASR, Q5 = ROR) but the answers are titled Q1, Q2 (2.1/2.2), Q3 (3.1/3.2), Q5; ASR answer for 0xFFFFC000 is "Q3.2" instead of "Q4". Suggest relabelling "Q3.2" -> "Q4" or merging in slide 16. (The NEW deck has the Q4 slide.)
4. **Slide 15** `RSBLT` needs an IT block on Cortex-M (Thumb-2): `CMP r0,#0 / IT LT / RSBLT r0, r0, #0` (or `RSBS`-based branch-free code).
5. **Slide 24**: the question lists R2, R3, R4 only, the answer also explains R5 (`LSLS #6`); either add R5 to the question (as on the LSL slide 23) or drop it.
6. **Slide 42 (a)**: sub-bullet "Carry bit is 0 (last bit shifted out ...)" is irrelevant now that the instruction is `ADD ... ASR #3` (ADD without S does not update C); consider deleting.
7. **Slide 38**: "C = 1 ... (ANDS does not affect C flag.)" is misleading: with a shifted register operand, ANDS sets C from the shifter carry-out (see main deck slides 59-61). Suggest "ANDS itself does not compute C, so C = shifter carry-out".
8. **Slide 1 "Fall 2025"**.
9. **Slide 2 notes**: stale "-4096" sentence (see Exercises log). **Slide 48** says "calculate the result of summation" although half the rows are subtractions.
10. Slides 4/5 use `MOV R0, #0x0ABC` (assembles as MOVW) - fine, but `0x0ABC` is not a modified immediate for MOV; keep in mind if students try it with MOVS.

## Notes
- ANS vs Exercises deck: question wording/values for Bit Manipulation, shifts, flags (ANDS, ADDS, (a)-(e), (a)-(f)) now agree. Exercises deck lacks Polynomial, 4-bit table and answers.
- 4-bit table (slides 47-50) verified: every Result/C/V/Correct? entry and every carry row is correct.
- LSLS/LSRS flag results (NZCV 0010/0010/0000/0000, 0000...) and LSL results verified.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
