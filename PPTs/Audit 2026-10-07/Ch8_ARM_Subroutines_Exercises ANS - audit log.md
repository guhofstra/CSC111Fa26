# Ch8_ARM_Subroutines_Exercises ANS.pptx - audit log

## Summary
36 slides audited. Answers re-derived by simulation: stack exercises (a: r0=1, r1=2; b: r0=0, r1=3, r2=1, r3=2), swap sequence, PUSH {R1,R3}/POP {R5} memory/registers (little endian), 64-bit argument passing, long fun(...) assignment, r0/r7 loop (r7 += 255 per cycle), NZCV program (CMP 5-10 -> NZCV = 1000, BGE not taken, LR/PC/SP values), conditional-move variants, factorial (iterative and recursive: checked n = 0..3), sign-extension examples (0x1234ABCD -> 0xFFFFABCD). 72 paragraph-level edits (mostly `%` -> `@` comment markers), about 17 distinct fixes. Output: out/Ch8_ARM_Subroutines_Exercises ANS.pptx (36 slides, validate.py passed).

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 1 | Fall 2025 -> Fall 2026 | Stale semester |
| 2, 3 | "i.e. is stored last" / "is loaded first" -> "i.e. r1 is stored last" / "r1 is loaded first" | Missing subject (compare Ch8-2 slides 13, 14) |
| 9 | R13 box "0x20000200" -> "0x200001F8" | After PUSH {R1,R2} SP = 0x200001F8 (the arrow already points there) |
| 11, 12 | `PUSH (R1, R3)`, `POP (R5)` -> braces | Syntax |
| 12 | final R13 "0x10000200" -> "0x100001FC" | After the single POP, SP = 0x100001FC (stated in the text on the same slide) |
| 13, 14 | return label "Register R0" -> "Register R1:R0" | uint64_t result occupies r1:r0 |
| 14 | "Callee pops d16 from stack" -> "Callee reads d16 from stack" | The caller removes stacked arguments (EX slide 6 and Ch8-1 say so) |
| 16 | "cannot use 1 register to pass more than 1 arguments" -> "more than one argument" | Grammar |
| 16 | appended "The result (long, 32 bits) is returned in R0." | The question also asks for the return register |
| 18 | `POP {r0}` after `BL sum` -> `ADD sp, sp, #4` | POP would overwrite the returned result in r0 (the slide itself says the caller must discard the extra argument) |
| 19, 20 | `Extern` -> `extern`; `int32_t s` -> `int32_t s;` | C syntax |
| 20 | corrected callee: `ADD r3, r0, r2` -> `ADD r3, r3, r2`; bullet 1 adds "also ADD r3, r3, r2 (not r0)" | The "corrected" code still computed a1 + a3, not a1 + a2 + a3 |
| 23 | `extern int mystery(int); /* mystery assembler routine */` -> `extern int toLower(int); /* assembler routine */` | Prototype did not match the called function |
| 27 | "CMP R0, R1 (0x858/0x258)" -> "(0x258)"; "Performs: 8 - 10" -> "Performs: 5 - 10 = -5" | R0 = 5; 0x858 is garbage |
| 32, 33 | `%` comments -> `@` | `%` is not an ARM GNU comment character |

## Needs your decision / not fixed
- Slide 19 (question) still contains the extra `ADD r3, r0, r2` bug (same as the Exercises deck); it is now covered by the answer on slide 20.
- Slides 30: variants using `MOVLT/MOVGE/MOVMI/MOVPL` are ARM-state; on Cortex-M (Thumb-2) they need an `IT` block (the notes mention it). `foo` variants with branches are fine on Cortex-M.
- Slide 33: the comment "continue while i > 1" is inaccurate: `SUBS r1,r1,#1; BHI` loops while the new r1 != 0, so the loop multiplies by 1 once more (result still correct). Suggest "continue while i != 0" or `CMP`.
- Slides 32/33: `PUSH {r4, lr}`/`POP {r4, lr}` saves r4 without using it (alignment); the comment is misleading.
- Slides 12/26: "After two PUSHes" / "SP after 2 PUSHes" refers to the two registers of one `PUSH {R1,R3}` (two words); wording could be "after PUSH {R1, R3}".
- Slide 22 / 21 notes use AArch64 names (x0, x7); slide 22 answer does not state the r7 start value (assumed 0: 255, 510, 765, ...).
- Slide 35: `MOV r0, r3, LSL #16` is pre-UAL syntax (UAL: `LSL r0, r3, #16`); armasm accepts both.
- Slides 23/24 notes contain leftover `mystery2` code.
- Slide 8 asks about "PUSH {R2,R1}" while the program shows `PUSH {R1,R2}` (equivalent).

## Notes
- Slide 12 table, memory dump (00 02 00 10 | 09 53 67 18 at 0x1F8-0x1FF) and slide 26 trace are correct.
- Slide 36 examples (0x1234 -> 0x1234, 0xABCD -> 0xFFFFABCD) are correct.
