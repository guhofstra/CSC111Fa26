# Ch6_ARM_Control_Flow - audit log

## Summary

- Original: `/tmp/claude-0/w111/orig/Ch6_ARM_Control_Flow.pptx` (untouched). Edited deck: `/tmp/claude-0/w111/out/Ch6_ARM_Control_Flow.pptx`.
- Slides: 45 (unchanged count/order). Text replacements made: 25 (run-level only; no shapes, images, animations or layouts touched).
- Most important fixes: (1) slide 16 5-bit example: -10 - 7 wraps to 01111 (15), not 00111 (7); (2) slide 39 C code `continue` skipped `str++` (infinite loop in C, but assembly advances the pointer) - now `{ str++; continue; }`; (3) slide 10 TEQ was described as "r0 - ch" (subtraction) - it is an EOR; (4) slide 18 C condition `x > y` did not match the BLE/BLS (<=) code and captions - now `x <= y`; (5) slide 40 wrongly said Cortex-M0 can use IT (it has no IT instruction).
- Verified correct (no change): condition-code table (13/28/41/42/43), CMP/TST/TEQ flag behaviour, 5-bit examples other than the one above, GE/LT N/V logic, endif/else translations (20-21), all five for-loop implementations (22-27; sum 45, 10 iterations, 2a/2b equivalence), compound conditions (30-33), GCD loops (34), CBZ equivalence (35), break/continue outputs (36), IT-block examples (40).
- Validation: opens with python-pptx, slide count unchanged, `office/validate.py --original` PASSED. Only slide/notes XML parts with text changes were replaced; every other package part is byte-identical to the original.

## Changes made

| Slide | Before -> After | Why |
|---|---|---|
| 1 | `Fall 2025` -> `Fall 2026` | Outdated semester on cover (course is taught Fall 2026) |
| 4 | `Non-arithmetic operations does not touch V bit` -> `Non-arithmetic operations do not touch V bit` | Grammar |
| 8 | `#0:: conditional` -> `#0: conditional` | Typo (double colon) |
| 10 | `computing r0 -` -> `computing r0 EOR` | TEQ computes the bitwise exclusive OR (EOR) of its operands, not a subtraction (that is CMP) |
| 16 | `result is 00111 (decimal 7)` -> `result is 01111 (decimal 15)` | -10 - 7 = -17 wraps modulo 32 to +15 = 01111 (10110 - 00111 = 01111), not 00111; N=0 and V=1 conclusion unchanged |
| 17 | `32-1` -> `32` | 2^32-1 was typeset entirely as superscript (2^(32-1)); only 32 should be superscript |
| 17 | ` > 1` -> ` − 1 > 1` | Non-superscript "- 1" completes 2^32 - 1 > 1 |
| 18 | `if (x > y)` -> `if (x <= y)` | Asm branches with BLE/BLS (<=) to Then_Clause, and the captions say "<=": the C condition must be x <= y for the code to match |
| 20 | `the loop body instruction is ` -> `the then-body instruction is ` | This is an if-statement example, not a loop |
| 20 | `Endif` -> `endif:` | Label is referenced as "endif" by BLT (case-sensitive) and defined without colon like the "then:" label |
| 21 | `r2 = b` -> `r2 = x` | Code and C program use x (r2), not b |
| 24 | `Loop:` -> `loop:` | Label case must match "BLT loop" |
| 25 | ` < 10, and loop iterates from ` -> ` < 10, both loops iterate from ` | Sentence had no main clause |
| 30 | `// a, x are signed integers` -> `// a, y are signed integers` | C code declares a and y |
| 30 | `; CMP if greater than` -> `; compare a and 25` | The 2nd CMP in this (correct) program is unconditional; comment was copied from the incorrect version on the next slide |
| 31 | `if r0 <= 20, then y = 1` -> `if r0 < 20, then y = 1` | With MOVGE, r0 = 20 does set y (flags EQ => GE true); the failing cases are r0 < 20 |
| 31 | `if r0 >= 25, then y = 1` -> `if r0 > 25, then y = 1` | With MOVLE, r0 = 25 does set y (flags EQ => LE true); the failing cases are r0 > 25 (and 21..24 wrongly set) |
| 33 | `; executed if r0 != 7` -> `; executed if r0 != 1 and r0 != 7` | CMPNE #11 runs only if a is neither 1 nor 7 (consistent with slide 30) |
| 34 | `End` -> `end` | Label referenced as "BEQ end" |
| 37 | `Loop:` -> `loop:` | Label case must match "B loop" |
| 38 | `Loop:` -> `loop:` | Label case must match "B loop" |
| 39 | `Loop:` -> `loop:` | Label case must match "B loop" |
| 39 | `continue;` -> `{ str++; continue; }` | As written the C code loops forever on the first 'l' (continue skips str++); assembly (contLoop: ADD r0,r0,#1) does advance the pointer, so C must too |
| 40 | `On smaller ARM cores (Cortex-M0), not all data instructions support condition suffixes directly; instead you must use an IT instruction (Thumb-2) or branches.` -> `On Cortex-M3/M4 (Thumb-2), most instructions need an IT instruction for conditional execution; Cortex-M0 has no IT and must use branches.` | Cortex-M0 does not support IT / Thumb-2 conditional execution |
| 40 | `16-bit SUB, not SUB` -> `16-bit SUB, not SUBS` | Typo; matches the ADD line |

## Needs your decision / not fixed

- Slide 2 (picture): the sequence-structure flowchart is labelled "Statement 1, Statement 2, Statement 2"; the third box should read "Statement 3". It is inside an image, so not edited.
- Slide 38: the C code only breaks at the NUL and counts every character, but its comment says "Count characters that are not 'l'" and the assembly contains a dangling `CMP r2,#'l'` with no branch/condition after it. Suggest either (a) retitle to "Count characters until the null terminator" and delete the CMP line, or (b) turn it into the lead-in to slide 39. Not changed because the intent is a judgment call.
- Slides 22-27 and 34: code comments use `%`, which is not an ARM assembler comment character (slides 20, 21, 30 use `;`). Suggest a global replace of `%` with `;` in the code boxes (left unchanged: stylistic and widespread).
- Slides 10, 38, 39: code uses typographic quotes (`#‘!’`, `#’l’`) which will not assemble; suggest straight quotes `#'!'`. Slide 10 also uses `char` as a variable name (a C keyword); suggest `c`.
- Slide 26: "SUBS r1,r1,#1 is equivalent to SUB r1,r1,#1; CMP r1,#0" holds for N and Z only (CMP #0 always gives C=1,V=0 whereas SUBS sets C/V from the subtraction). Suggest "(for the N and Z flags)". Not changed.
- Slide 34, row 1 (ADDS + BPL/MOVMI/MOVPL): tests only N, so the result is wrong when x+y overflows; the comment "Could use BGE if you assign negative r1 to r2, then SUBS r0,r0,r2" is also confusing. Suggest noting the no-overflow assumption (or using BLT/BGE on N!=V after a CMP against 0 of a non-overflowing sum).
- Slide 35: CBZ/CBNZ are Thumb-2 only (not on Cortex-M0), can only branch forward 0-126 bytes, and (unlike CMP+BEQ) do not touch flags; consider mentioning the range limit.
- Slide 40: "You do not need to write IT instructions" is true for armasm, but GNU as (unified syntax) requires explicit IT blocks for Thumb-2; consider stating which assembler is meant.
- Slide 16 speaker notes contain stray web-citation residue ("sciencedirect+1youtube", "armyoutube"); slide 3 notes describe ARM7/A-profile CPSR fields (Q flag, MSR) not Cortex-M APSR. Not edited.

## Notes

- Method: extracted all slide text, tables, grouped shapes, a14/OMML content inside mc:AlternateContent and speaker notes; rendered every slide with LibreOffice and inspected pictures; re-computed worked examples by script. LibreOffice table layouts differ slightly from PowerPoint, so apparent clipping/overlap in renders was not treated as a content error.
- "Fall 2025" on the cover was changed to "Fall 2026" in all six decks (your course memory says Fall 2026). Revert if the cover year is intentionally the original delivery year.
- Slide references checked: Ch6 exercise decks cite "pp 22-25" (for/do-while slides) and "p. 16" (Signed Comparison Examples) - both match this deck's numbering.
