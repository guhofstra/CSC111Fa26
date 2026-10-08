# Ch6_ARM_Control_Flow_Exercises - audit log

## Summary

- Original: `/tmp/claude-0/w111/orig/Ch6_ARM_Control_Flow_Exercises.pptx` (untouched). Edited deck: `/tmp/claude-0/w111/out/Ch6_ARM_Control_Flow_Exercises.pptx`.
- Slides: 19 (unchanged count/order). Text replacements made: 8 (run-level only; no shapes, images, animations or layouts touched).
- Most important fixes: slide 7 wrong-code exercise now consistent (label `done`, ARM32 register r0 instead of x0); `#` added to the MOV immediates on slides 10/12 (otherwise the exercise skeleton does not assemble); typo `d3` -> `d31` on slide 14; "C rogram" typo.
- Cross-checked against the ANS deck: slide order/values match (ANS has the extra answer slides interleaved).
- Validation: opens with python-pptx, slide count unchanged, `office/validate.py --original` PASSED. Only slide/notes XML parts with text changes were replaced; every other package part is byte-identical to the original.

## Changes made

| Slide | Before -> After | Why |
|---|---|---|
| 1 | `Fall 2025` -> `Fall 2026` | Outdated semester on cover |
| 7 | `Compare x0 with 10 while x0 <=10` -> `Compare r0 with 10 while r0 <= 10` | x0 is an A64 register name; this is ARM32 (r0) |
| 7 | `BEQ end` -> `BEQ done` | Branch target label is "done:" (no label "end" exists) |
| 7 | ` == 10, branch to end` -> ` == 10, branch to done` | Match label |
| 10 | `MOV R0, 0x60000000` -> `MOV R0, #0x60000000` | Missing # on immediate operand |
| 12 | `MOV R0, 0x60000000` -> `MOV R0, #0x60000000` | Missing # on immediate operand |
| 14 | `d30,d3.` -> `d30,d31.` | Typo: last bit is d31 |
| 18 | `rogram` -> `Program` | Typo "C rogram" |

## Needs your decision / not fixed

- Slide 9 speaker notes contain AI-chat residue ("image.jpg") and answer text that belongs to the ANS deck; recommend clearing the notes before distributing this exercise deck.
- Slide 5 asks for `while (save[i] == k) i += 1;` without initialising i; the ANS deck adds `i = 0;`. Harmless (r1 = i is given) but could be aligned.

## Notes

- Method: extracted all slide text, tables, grouped shapes, a14/OMML content inside mc:AlternateContent and speaker notes; rendered every slide with LibreOffice and inspected pictures; re-computed worked examples by script. LibreOffice table layouts differ slightly from PowerPoint, so apparent clipping/overlap in renders was not treated as a content error.
- "Fall 2025" on the cover was changed to "Fall 2026" in all six decks (your course memory says Fall 2026). Revert if the cover year is intentionally the original delivery year.
