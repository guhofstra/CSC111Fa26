# Ch8_ARM_Subroutines_1_Parameters_Registers.pptx - audit log

## Summary
44 slides audited (text, tables, notes, renders). The SSQ(3,4) walk-through (slides 25-38), the sum6 stack layout (slides 16-19), the 64-bit ADDS/ADC example and the AAPCS table were re-checked. 36 paragraph/cell-level fixes (about 15 distinct issues). Output: out/Ch8_ARM_Subroutines_1_Parameters_Registers.pptx (44 slides, validate.py passed).

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 1 | Fall 2025 -> Fall 2026 | Stale semester |
| 4, 5, 6 | `int main(void{` -> `int main(void){` | Missing parenthesis |
| 8 | "64-bit long" -> "64-bit long long" | On ARM (AAPCS) `long` is 32 bits; the 64-bit type is `long long` (the same slide later says "long long or double") |
| 8 | "If it is less than 32 bits, it is stored in R0" -> "If it is 32 bits or less" | A 32-bit int is also returned in R0 |
| 16, 17, 18 | register table: r2 = a2, r3 = a3 -> r2 = a3, r3 = a4 | The 3rd and 4th arguments were mislabeled |
| 16, 17, 18 | "pop a4, a6" -> "pop a5, a6" | The stacked arguments are a5 and a6 |
| 16, 19 | `ADDS sp, sp, #8` -> `ADD sp, sp, #8` | `ADD sp, sp, #imm` does not take the S suffix; makes slides 16-19 consistent |
| 22 | `int32_t s` -> `int32_t s;` | Missing semicolon |
| 26-38 | `0x0800013B` -> `0x08000138` (memory-address labels and PC boxes on slides 30, 31) | Thumb instruction addresses are halfword aligned; MUL R2,R0,R0 follows B ENDL at 0x136 (2 bytes), and the next MUL is at 0x13C (this MUL is 4 bytes) |
| 30 | "bit 0 of PC should always be 1" -> "bit 0 of LR is always 1 ... Thumb mode" | It is LR (0x08000135) whose bit 0 is set, not PC |
| 41 | "Each 8-, 16- or 32-bit variables is" -> "variable is" | Grammar |
| 43 | "(c.f., )" removed | Dangling reference left from a deleted citation |

## Needs your decision / not fixed
- Slide 40: "PC is always incremented by 4" contradicts slide 39 ("incremented by 2 or 4"). The intended point is that the fetch unit reads 4 bytes at a time; suggest rewording to "4 bytes are fetched each time; PC advances by 2 or 4 depending on instruction size".
- Slide 19 table, row "LDRD loads": r0 shows "-" but r0 already holds the partial sum 10 (and r3 still holds 4). The "-" probably means "not shown"; consider putting 10 / 4 for accuracy.
- Slide 19: the table overlaps the bullet text in the LibreOffice render; check in PowerPoint.
- Slides 26-37: the first two MOVS are drawn 4 bytes apart (0x128, 0x12C); 16-bit `MOVS` would be 2 bytes (0x128, 0x12A, BL at 0x12C, LR 0x130). Left as a pedagogical simplification; the rest is self-consistent.
- Slide 24 (picture): LR (R14) is highlighted with a red box in the callee-saved colour, while slide 23 says LR is not preserved ("No"). See also Chapter 8-2 slide 27.
- Slide 42/43: GNU syntax (`@` comments, `.word`, lower case) is mixed with armasm (`PROC/ENDP`) elsewhere in the chapter. `push {lr}` alone leaves SP only 4-byte aligned (AAPCS wants 8 at public interfaces); fine for teaching.
- Slide 44: the YouTube lecture numbers/links were not verified.

## Notes
- Slide 5 notes (LR = PCcurrent + 4 for a 4-byte BL) are correct. AAPCS table (slide 23) is correct.
