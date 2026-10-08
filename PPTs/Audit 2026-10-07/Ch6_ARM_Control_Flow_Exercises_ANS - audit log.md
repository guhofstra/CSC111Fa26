# Ch6_ARM_Control_Flow_Exercises_ANS - audit log

## Summary

- Original: `/tmp/claude-0/w111/orig/Ch6_ARM_Control_Flow_Exercises_ANS.pptx` (untouched). Edited deck: `/tmp/claude-0/w111/out/Ch6_ARM_Control_Flow_Exercises_ANS.pptx`.
- Slides: 40 (unchanged count/order). Text replacements made: 25 (run-level only; no shapes, images, animations or layouts touched).
- Most important fixes: slide 14/15 fixed-program comments still described the old compare-with-10 code (now "compare with 11", labels `done`); slide 16 error explanation made accurate (SUB without S leaves BNE testing stale flags); slide 38 C answers used variable `c` while the question defines x=r0; missing `#` on immediates (slides 5, 7, 22, 23); chapter title made consistent with the other Ch6 decks.
- Recomputed and found correct: slides 3, 5 (both programs), 7 (110 in both variants), 9, 10, 12 (RSB/LSL #2 addressing), 18/19 (signed BLE/BGT, unsigned BLS/BHI loops, 10 iterations), 21 (BPL gives 11 iterations), 23 (BPL loop over 200 elements), 25/26 (pow loop, x=7), 28 (sum 1..22), 31 (bit reversal incl. 8-bit trace), 36, 38, 40.
- Validation: opens with python-pptx, slide count unchanged, `office/validate.py --original` PASSED. Only slide/notes XML parts with text changes were replaced; every other package part is byte-identical to the original.

## Changes made

| Slide | Before -> After | Why |
|---|---|---|
| 1 | `Fall 2025` -> `Fall 2026` | Outdated semester on cover |
| 1 | `Flow Control in Assembly` -> `Control Flow in Assembly` | Chapter title differs from the lecture and exercise decks ("Control Flow in Assembly") |
| 5 | `AND r1, r1, 0x0F` -> `AND r1, r1, #0x0F` | Missing # on immediate operand |
| 7 | `ADDGT r0, r0,100` -> `ADDGT r0, r0, #100` | Missing # on immediate operand (the code above and the next example use #100) |
| 10 | `increment the array index r0` -> `increment the array pointer r0` | r0 is the pointer; the index register r1 was removed |
| 13 | `BEQ end` -> `BEQ done` | Branch target label is "done:" |
| 13 | ` == 10, branch to end` -> ` == 10, branch to done` | Match label |
| 14 | `Compare x0 with 10 while x0 <=10` -> `Compare r0 with 10 while r0 <= 10` | x0 is an A64 register name |
| 14 | `branch to end` -> `branch to done` | Match label |
| 14 | `Compare x0 with 10 while x0 <=10` -> `Compare r0 with 11 (exit when cnt reaches 11)` | Comment described the old (wrong) comparison with 10 |
| 14 | ` == 10, branch to end` -> ` == 11, branch to done` | Fixed program compares with 11 and the label is "done" |
| 14 | `(BEQ end)` -> `(BEQ done)` | Label in the original program is "done" |
| 14 | `BEQ end.` -> `BEQ done.` | Label is "done" (Option 1 text) |
| 14 | `BGT end.` -> `BGT done.` | Label is "done" (Option 2 text) |
| 15 | `Compare x0 with 10 while x0 <=10` -> `Compare r0 with 11 (exit when cnt reaches 11)` | Comment described the old comparison with 10; x0 is A64 |
| 15 | ` == 10, branch to end` -> ` == 11, branch to done` | Fixed program compares with 11; label is "done" |
| 15 | `Compare x0 with 10 while x0 <=10` -> `Compare r0 with 10 while r0 <= 10` | x0 is an A64 register name |
| 15 | `branch to end` -> `branch to done` | Label is "done" |
| 15 | `Programu` -> `Program` | Typo "Programu" |
| 16 | `--;ss` -> `-- (no S suffix: flags not updated)` | Stray characters "ss" in comment (apparently a truncated "sets no flags") |
| 16 | `Error:  loop will run infinitely because the subtraction does not update the CPU condition flags.` -> `Error:  BNE tests stale condition flags (typically an infinite loop) because SUB without the S suffix does not update the CPU condition flags.` | Without S the loop outcome depends on whatever flags were set earlier; "will run infinitely" is only the typical case |
| 22 | `MOV R0, 0x60000000` -> `MOV R0, #0x60000000` | Missing # on immediate operand |
| 23 | `MOV R0, 0x60000000` -> `MOV R0, #0x60000000` | Missing # on immediate operand |
| 37 | `rogram` -> `Program` | Typo "C rogram" |
| 38 | `if (c == ‘A’ \|\| c == 'B')` -> `if (x == ‘A’ \|\| x == 'B')` | Variable relation given is x=r0 (not c) |

## Needs your decision / not fixed

- Slide 16, second program (`B check` ... `loop: SUBS ...` / `check: BNE loop`): there is no compare at `check`, so on first entry BNE tests stale flags; the statement "behavior is the same if cnt = 10 initially, but different if cnt = 0" is therefore not true for the code as drawn. A correct pre-test version is `MOV r0,#10 / B check / loop: <body> / SUB r0,r0,#1 / check: CMP r0,#0 / BNE loop`. Not changed (needs a restructure, not a text fix).
- Slide 33: the answer lists CMP, EORS and SUBS; the natural fourth method `TEQ r0, r1` (flags only, Z=1 if equal) is missing - consider adding.
- Slides 10, 20, 21 speaker notes: copied from other questions / contain "image.jpg" residue (slide 10 notes show the array-index version, not the pointer version on the slide). Not edited.

## Notes

- Method: extracted all slide text, tables, grouped shapes, a14/OMML content inside mc:AlternateContent and speaker notes; rendered every slide with LibreOffice and inspected pictures; re-computed worked examples by script. LibreOffice table layouts differ slightly from PowerPoint, so apparent clipping/overlap in renders was not treated as a content error.
- "Fall 2025" on the cover was changed to "Fall 2026" in all six decks (your course memory says Fall 2026). Revert if the cover year is intentionally the original delivery year.
- Slide 14 text edits: "(BEQ end)", "BEQ end.", "BGT end." -> `done`, because the programs branch to label `done`.
