# Ch8_ARM_Subroutines_Exercises.pptx - audit log

## Summary
14 slides audited and cross-checked against the ANS deck. The questions' numbers and values (stack exercises, 64-bit argument passing, `long fun(...)`, toLower, if-then-else, factorial, sum_of_array, r0/r7 loop) were re-derived. 30 paragraph-level edits (about 9 distinct fixes). Output: out/Ch8_ARM_Subroutines_Exercises.pptx (14 slides, validate.py passed).

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 1 | Fall 2025 -> Fall 2026 | Stale semester |
| 5 | `PUSH (R1, R3)`, `POP (R5)` -> `PUSH {R1, R3}`, `POP {R5}` | Register lists use braces |
| 6 | return label "Register R0" -> "Register R1:R0" | uint64_t is returned in r1:r0 (as in the ANS deck) |
| 8 | `Extern` -> `extern`; `int32_t s` -> `int32_t s;` | C keyword is lower case; missing semicolon (these are not the intended bugs of the exercise) |
| 9 | `extern int mystery(int); /* mystery assembler routine */` -> `extern int toLower(int); /* assembler routine */` | The caller calls toLower |
| 12 | `BLE base_case` -> `BLS base_case` | n is uint32_t (unsigned); the ANS deck and the iterative code use BLS |
| 12 | `%` comments -> `@` | `%` is not a comment character for the GNU assembler (the other slides use `@`) |
| 13 | `LDRSH r1, [r0], #2` -> `LDRSH r1, [r0, r2, LSL #1]` | Now identical to the question as shown in the ANS deck (slide 34) |

## Needs your decision / not fixed
- Slide 8 contains an unintended second bug in the callee: `ADD r3, r0, r2` should be `ADD r3, r3, r2`. It was left in the question (it is a "what is wrong" slide); the ANS deck now fixes it and mentions it.
- Slide 7: the question asks about return too; the ANS deck now says R0.
- Slide 11: says "One recursive version, one iterative version" while the ANS deck says the opposite order; trivial.
- Slide 12: `PUSH {r4, lr}` / `POP {r4, lr}` saves r4 which is never used (kept for 8-byte alignment); the comment "save callee-saved we'll use" is misleading.
- Slide 14 notes use AArch64 names (x0, x7) instead of r0/r7.
- Slide 5 ("Program Understanding") and slide 6 are only partly equivalent to ANS slides; ANS also contains extra slides (swap R1/R2, NZCV/PUSH/POP trace, separator, if-then-else, ANS pages) that do not exist here. If you want the decks to have one-to-one numbering, add them.
