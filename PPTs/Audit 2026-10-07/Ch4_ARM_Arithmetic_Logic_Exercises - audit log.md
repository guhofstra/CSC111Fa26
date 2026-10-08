# Audit log: Ch4_ARM_Arithmetic_Logic_Exercises.pptx (23 slides)

Output: /tmp/claude-0/w111/out/Ch4_ARM_Arithmetic_Logic_Exercises.pptx (23 slides, validate.py PASSED).

## Summary
Question-only deck (no answers). 10 edits: invalid assembly syntax, a 9-digit hex typo, typos, and re-ordering of the last flags question so it matches the ANS deck. The deck is an older/shorter subset of the ANS deck (23 vs 50 slides): Compute Polynomial, the 4-bit add/sub table, and the ANDS/ADDS-with-shift answers exist only in the ANS decks. Last modified 2026-02-26.

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 4 | "Compute register values after each instruction" -> "Compute 32-bit register values ..." | Matches the ANS deck wording; the ORN/BIC results depend on 32-bit registers. |
| 10 | "Assuimg" -> "Assuming" | Typo. |
| 10 | `MOV r0, r0, LSL 7`, `LSR 2`, `ASR 2` (x2), `ROR 2` -> `#7`, `#2`... | Immediate shift amounts need `#`. |
| 13 | `MOV R2, R1, LSLS #4` (x3) -> `MOVS R2, R1, LSL #4` | `LSLS` cannot be embedded in an operand (deck slide 59); the flag-setting form is MOVS ..., LSL. |
| 16 | `MOV R2, R1, LSRS #4`, `ASRS ...` (x6) -> `MOVS R2, R1, LSR #4` etc. | same |
| 16 | "initially 0-" -> "initially 0." | Typo. |
| 19 | "zeros a 32-bit register" -> "zeros in a 32-bit register" | Typo. |
| 20, 21 | `LDR r0, =0xFFFFFFF00` -> `=0xFFFFFF00` | 9 hex digits do not fit a 32-bit register; values elsewhere (main deck slide 61, ANS deck) are 0xFFFFFF00. |
| 23 | Instruction order and labels: `ADD, SUBS, ADDS, LSL, LSRS, ANDS` -> `(a) ADD, (b) ADDS, (c) SUBS, (d) LSL, (e) LSRS, (f) ANDS` | Now identical to ANS deck slides 44-46 (a)-(f), so answer labels map to questions. |

## Needs your decision / not fixed
1. **Slide 1 "Fall 2025"** (see main deck log).
2. **Slide 17 (Multiply without MUL)** asks for 135, 153, 255, 18, **16384**; the ANS deck's answer slide (29) lists and answers **1025** instead (the ANS question slide 28 still says 16384). Decide which is intended and align question and answer.
3. **Slide 10 numbering**: Q1, Q2, Q3, **Q5** (no Q4; Q2/Q3 each contain an "Or: ASR" variant). ANS deck lists Q1..Q5 on its question slide but answers with Q2.1/2.2, Q3.1/3.2 and a "Q5" slide. Renumber one way or the other.
4. **Slide 5** "5th, 7th, 12th bit" is ambiguous (ANS treats them as bit numbers 5, 7, 12 counting from 0). Suggest "bits 5, 7 and 12".
5. **Slide 9** (answer RSBLT) needs an IT instruction on Cortex-M (Thumb-2); the solution in the ANS deck omits it.
6. **Slide 2 notes** contain stale text ("... maintaining the negative value (-4096)") copied from the main deck; slide 2 body (equations in AlternateContent) is correct.
7. Slide 3 and 22/23 tables: LibreOffice renders the register table overlapping the text on slide 23; likely a LibreOffice artefact, not changed.
8. Deck is missing the extra ANS-deck questions (polynomial, 4-bit table, ANDS/ADDS with shifted operand). If this is the student handout, consider syncing.

## Notes
Consistency with ANS: slides 20/21 (flags ANDS/ADDS), 22 vs ANS 41, 23 vs ANS 44 now match in values and order.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
