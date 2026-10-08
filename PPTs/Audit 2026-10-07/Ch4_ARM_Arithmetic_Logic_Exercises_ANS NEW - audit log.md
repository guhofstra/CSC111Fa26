# Audit log: Ch4_ARM_Arithmetic_Logic_Exercises_ANS NEW.pptx (52 slides)

Output: /tmp/claude-0/w111/out/Ch4_ARM_Arithmetic_Logic_Exercises_ANS NEW.pptx (52 slides, validate.py PASSED). Not merged with the other ANS deck.

## Summary
**Which is current?** Despite the name, "ANS NEW" is the **older** snapshot: docProps modified 2025-10-16 (rev 346) vs 2026-02-26 (rev 345) for Exercises_ANS.pptx, and it contains several wrong answers that the other file has already corrected. The "ANS NEW" file does have a different (arguably cleaner) slide layout for the shifts section; consider porting that structure into the current ANS deck rather than the other way round.

Differences ANS NEW vs ANS (current):
| Area | ANS (2026-02-26) | ANS NEW (2025-10-16) |
|---|---|---|
| Slides | 50 | 52 (+ separate "Shift LSL" question slide, separate "Shift ASR" question slide, separate "Q4 ANS" slide) |
| Bit ops (S4-5) | `0x0ABC/0x0DEF`, "32-bit", ORN = 0xFFFFFABC, BIC = 0x0210 (correct) | `0xABC/0xDEF`; ORN = 0xF210 and BIC = 0x0533 (**wrong**) |
| Set/clear/toggle 0xDECB (S7) | 0xDEEB / 0xCE4B / 0xCE6B (correct) | 0xEEEB / 0xD84B / 0xC46B (**wrong**) |
| Clearing a register (S9) | 6 methods (adds BFC, BIC) | 4 methods |
| Q2/Q3 answers | Q2.1/2.2 and Q3.1/3.2 (LSR and ASR variants) | Q2, Q3 (LSR only), separate Q4 ANS (ASR) with wrong result 0xFFFFFF00 (-256) and body labelled "Q3:" |
| Shift LSLS answer | explains R2-R5 | explains R2 and R5 only (R3, R4 lines missing), stray "1/2" character |
| Shift ASR (0x81223344) | answer only inside a combined slide | separate question + answer slides |
| ADDS/ANDS slides | `0xFFFFFF00` (ANDS slides) but 9-digit typos on ADDS | 9-digit `0xFFFFFFF00` / `0xFFFFFFE01` typos in 5 slides |
| Flags (a) `ADD r4, r0, r2, ASRS #3` | wrong (ASRS) | correct (`ASR #3`), no stale carry bullet |
| Flags ANS C explanation (ANDS) | "ANDS does not affect C" | longer explanation of shifter carry (better) |
Everything else (flags answers, 4-bit table, polynomial, count ones/zeros) is identical.

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 5 | `ORN: ... = 0xF210 (assuming 32-bit registers)` -> `= 0x00000ABC | 0xFFFFF210 = 0xFFFFFABC` | 0xABC OR NOT(0xDEF) in 32 bits = 0xFFFFFABC. |
| 5 | `BIC ... = 0x0533` -> `= 0x00000ABC & 0xFFFFF210 = 0x00000210` | 0xABC AND NOT(0xDEF) = 0x210. |
| 7 | Set `0xEEEB.` -> `0xDEEB.`; Clear `0xD84B.` -> `0xCE4B.`; Complement `0xC46B` -> `0xCE6B` | Recomputed with mask 0x10A0 (bits 5, 7, 12). |
| 11 (notes) | `#0x1001 (0x1001 = ...)` -> `0x1011` | Bits 0, 4, 12 = 0x1011. |
| 16-21 | `MOV r0, r0, LSL 7` etc. -> `LSL #7` ... (10 lines) | Missing `#`. |
| 16 | "Assuimg" -> "Assuming" | Typo. |
| 19 | Q3 binary strings / "4,294,951,424" | same errors as ANS deck: 0xFFFFC000 = 1111 1111 1111 1111 1100 0000 0000 0000; LSR 2 = 0011 1111 1111 1111 1111 0000 0000 0000 = 0x3FFFF000; value 4,294,950,912. |
| 20 | "Q3:" -> "Q4:"; original/result binary; `0xFFFFFF00 (-256 in decimal)` -> `0xFFFFF000 (-4096 in decimal)` | ASR 2 of 0xFFFFC000 = 0xFFFFF000 = -4096 (the next line already said -4096). |
| 21 | "Q4:" -> "Q5:" | Title says Q5 ANS. |
| 25-26 | `MOV R2, R1, LSLS #4` -> `MOVS R2, R1, LSL #4` (also `MOV R5, R1, LSLS #6`) | Invalid embedded LSLS. |
| 26 | "...was 1)1/2" -> "...was 1)" | Stray character. |
| 31 | `16*9*r3 = 135*r3` -> `153*r3` | 153 = 9 x 17. |
| 34, 35 | "zeros a 32-bit register" -> "zeros in a 32-bit register" | Typo. |
| 38 | Option D MLA with immediate -> `MOV r1, #2` + `MLA r2, r3, r0, r1` | MLA needs a register addend. |
| 39, 40, 41, 42 | `0xFFFFFFF00` -> `0xFFFFFF00`; `0xFFFFFFE00/01` -> `0xFFFFFE00/01` (9 places) | 9 hex digits. |

## Needs your decision / not fixed
1. **Slide 26 (Shift LSLS ANS)** is missing the explanation lines for R3 and R4 (flags 0010 and 0000); the current ANS deck has them. Restoring them needs new paragraphs (copy from ANS deck).
2. Same open items as the ANS deck: slide 11 immediate `#(1<<0)|(1<<4)|(1<<12)` (0x1011) is not encodable; multiply question 16384 vs answer 1025 (slides 30/31); RSBLT needs IT; "Fall 2025"; Q numbering (here Q1-Q5 are consistent, which is a point in favour of this layout).
3. Slide 40 C-flag explanation correctly says the shifter sets C, whereas the current ANS deck says "ANDS does not affect C" (see ANS log).
4. Slide 42 stored with AlternateContent: LibreOffice shows the fallback picture (old typos); PowerPoint shows the corrected text.

## Notes
Recommendation: keep "Exercises_ANS.pptx" as the master, port from NEW only the separate Q4 ANS / Shift ASR question slide structure and the better C-flag wording, and retire "ANS NEW" to avoid the wrong answers on slides 5, 7, 20.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
