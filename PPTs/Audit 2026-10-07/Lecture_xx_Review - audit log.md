# Lecture_xx_Review.pptx - audit log

## Summary
23 slides, 13 edits (incl. 1 note). Output: out/Lecture_xx_Review.pptx (validate.py PASSED with --original; slide count unchanged; slide 21 has a pre-existing "NULL" image relationship). This is the CSC111 "Final Review" deck (newer than Chxx_Review.pptx, which has the older ECE 271 title). It covers Chapters 2-8 and Timer/PWM but not fixed/floating point or interrupts (Chxx_Review has those) - the two decks are partial duplicates.

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 1 | "Fall 2025" -> "Fall 2026" | stale semester |
| 5 | `ADD r1, r0, r0, LSL 2` -> `LSL #2` | UAL syntax |
| 6 | "fills the sign bit ... to preserving the sign" -> "to preserve" | grammar |
| 10 | "Non-arithmetic operations does not touch V bit" -> "do not touch the V bit" | grammar |
| 10 notes | "add-based operation produces an overflow" -> "produces a carry out" | C vs V confusion |
| 12 | `int main(void{` -> `int main(void){` | missing parenthesis |
| 17 | "EDP" (x2) -> "ENDP" | assembler directive |
| 18 | "Callee must save and store it" -> "save and restore it" | wrong word |
| 19 | "Each 8-, 16- or 32-bit variables is passed" -> "variable is" | grammar |
| 21, 23 | `fCL_PSC` / `fCL_CNT` labels and formula symbols -> `CK` | typo (CK_PSC, CK_CNT) |

Verified: slide 3-4 (-9 + 6 example), 7 (LDR/STR type table), 8 (pre/post-index equivalents), 10-11 (flag rules), 13 (argument/return register rules), 16 (PUSH/POP ordering), 23 (f_timer, duty cycle formulas, center-aligned 2*ARR).

## Needs your decision / not fixed
- Slide 23: "PWM duty cycle for Mode 1 (Low-True)" = CCR/(ARR+1) and "Mode 2 (High-True)" = 1 - CCR/(ARR+1): consistent with Ch16, but the names are unconventional (STM32 PWM mode 1 is usually "active while CNT < CCR", i.e. output high with active-high polarity). Ch16 uses the same naming - check once for the whole course.
- Slide 17: "Step 1: LR = PC + 4" for BL: correct only if "PC" means the address of the BL instruction (BL is 32-bit); LR also has bit 0 set. Consider "LR = address of the next instruction".
- Slide 6 notes refer to an example that is no longer on the slide ("LSR (used here) ... -4096").
- Slide 9: heading says "Character String" but the content is the endianness remark; fine.

## Notes
- See Chxx_Review log: older partial duplicate with stale title.
