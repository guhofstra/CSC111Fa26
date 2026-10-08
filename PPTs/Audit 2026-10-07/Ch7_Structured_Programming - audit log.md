# Ch7_Structured_Programming.pptx - audit log

## Summary
22 slides audited (text, formulas, notes, rendered images). Armstrong-number arithmetic (153, 371, 1634), the BASIC examples, the 4! = 24 traces, the count-ones algorithm (16 iterations for 0xAAAAAAAA) and the Algo 1/Algo 2 quiz answers were recomputed and are correct. 21 paragraph-level fixes were made (stale semester, a C/asm value mismatch, a wrong address comment, branch labels with stray colons, other typos). Output: out/Ch7_Structured_Programming.pptx (22 slides, validate.py passed).

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 1 | Fall 2025 -> Fall 2026 | Stale semester label (current term is Fall 2026) |
| 2 | "loop: Structure" -> "Loop Structure" | Stray colon (find/replace artifact); matches "Sequence/Selection Structure" |
| 3 | "'termination of loop: body" -> "...loop body" | Stray colon |
| 9, 10 | "A = B + C – D" (en dash) -> "A = B + C - D" | En dash is not valid C |
| 10 | `; r6 = 0x2000,000B` -> `0x2000,000C` | D is the 4th word: A=0x...0, B=0x...4, C=0x...8, D=0x...C (also what the slide 9 memory picture shows) |
| 13 | C program `n = 5;` -> `n = 4;` | Both assembly programs use `MOV r1,#4` and slide 14 is "Worked example for N = 4" (result 24) |
| 14 | "Entry: r0=4 (input). MOVS r1,r0 -> r1=4" -> "Entry: r1=4 (input). MOVS r0,r1 -> r0=4" | Registers were reversed relative to the code (`MOVS r0, r1`) |
| 16 | `BNE  loop:` -> `BNE  loop` | A colon is not allowed in a branch operand |
| 16 | `Stop:   B stop` -> `stop:   B stop` | Label case must match the branch target `stop` (armasm labels are case-sensitive) |
| 16 | "first loop:: r1" -> "first loop: r1" | Double colon |
| 16 | "the loop: exits" -> "the loop exits" | Stray colon |
| 16 | "r1 = r1 + b28 + b27 = 2 + 1 + 0" -> "r1 + b27 + b28" | Order of terms now matches the values (b27=1, b28=0) and the slide 17 table |
| 17 | "The loop: ends" -> "The loop ends" | Stray colon |
| 20, 21 | "// loop: through the array" -> "// loop through the array" | Stray colon |
| 21 | `B     loop:` -> `B     loop` | Colon in branch operand |
| 21 | "//dead loop:", "; dead loop:", "; loop: over the array", "; loop: index i" -> colon removed | Stray colons in comments |

## Needs your decision / not fixed
- Slide 2 (picture): the sequence-structure figure shows "Statement 1, Statement 2, Statement 2"; the third box should read "Statement 3". It is inside a picture, so it was not changed.
- Slide 8 (picture): the flowchart initialises `count = 0` but increments `counter = counter + 1`. Pick one name. Not editable (picture).
- Slides 13/14, 21 (Cortex-M): conditional instructions (`MOVEQ`, `SUBNES`, `MULNE`, `MOVGT`) are ARM-state code. Cortex-M is Thumb-only and needs `IT` blocks, and `SUBNES` is pre-UAL syntax (UAL: `SUBSNE`). Decide whether to keep as is (armasm-ARM style from the textbook) or add a note.
- Slide 14: the text says "Return: MOV pc, r14 (or BX lr), function returns with r0 = 24" and "fall through to MOV pc,r14", but the code on slide 13 ends with `stop: B stop` (no return). Suggest rewording to "falls into `stop: B stop` with r0 = 24".
- Slide 18: "(Carry flag is set but ignored.)" in the Algo 1 explanation is ambiguous: `MOV r1, r0, LSR #31` (no S) does not set flags; it is the `MOVS r0, r0, LSL #1` that sets C.
- Slide 19 notes: the note says that replacing MOV by `MOVS r1, r0, LSR #31` "is also incorrect", which contradicts the slide's answer ("Yes", which is correct, because the flags are overwritten by the later MOVS). Notes only; consider deleting.
- Slide 14 "Assembly Program 3 (omitted)" is mentioned but never shown on slide 13.

## Notes
- Slide 22 `r2x2^2` is rendered with a superscript (not a typo). Slide 6 exponent formulas are in OMML and are correct.
- "loop:" as a label definition (slides 13, 21) was left unchanged.
