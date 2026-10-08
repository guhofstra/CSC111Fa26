# Audit log: Ch3_ARM_ISA.pptx (34 slides)

## Summary
- Current main lecture deck (last saved 2026-09-23; the newest of the files audited). 12 run-level edits on slides 9, 11, 12, 30, 31. Slide count unchanged; passes validate.py (with --original).
- Content checked: processor-register facts (R0-R15, MSP/PSP), instruction format, ADD variants, directives (AREA/ENTRY/END/PROC/ENDP/EXPORT/IMPORT/DCx/SPACE/FILL/EQU/RN/ALIGN/INCLUDE), string-copy program, IRQn numbers (BusFault -11, SVCall -5, PendSV -2, SysTick -1 match CMSIS), ALIGN example arithmetic (a at +0, ALIGN 4,3 -> +3, c at +4, ALIGN -> +8, 3 bytes skipped: correct), Load-Modify-Store numbers (-2 = 0xFFFFFFFE, -1 = 0xFFFFFFFF, little-endian byte FE at 0x20000000).
- Three errors are inside pictures and could not be edited (see below).

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 9 | "peripherals registers" -> "peripheral registers" | typo |
| 11 | comments "%Load...", "%Store...", "% r1 = r1 +1" -> "; Load...", "; Store...", "; r1 = r1 + 1" | ARM assembly comment char is ";" (slide 19 says so; "%" is not a comment in armasm) |
| 12 | "the Byte at mem address 0x20000000 is 0FE" -> "is 0xFE" | hex prefix typo |
| 30 | DCQ description "Define Constant " -> "Define Constant Double-word" | description was cut off (64-bit = double word; slide 24 uses the same word/half-word naming) |
| 30 | "Defined Zeroed Bytes" -> "Define Zeroed Bytes"; "Defined Initialized Bytes" -> "Define Initialized Bytes" | grammar; the other rows read "Define ..." |
| 31 | `scores DCD 2,3.5,-0.8,4.0 ; Allocate 4 words containing decimal values` -> `scores DCFS 2,3.5,-0.8,4.0 ; Allocate 4 single-precision floating-point values` | DCD only accepts integer expressions; fractional constants require DCFS/DCFD (extra space removed to keep column alignment) |
| 31 | `DCB ‘A’` (curly quotes) in the code -> `DCB 'A'` | typographic quotes are not valid assembler syntax (comment text left unchanged) |

## Needs your decision / not fixed
- Slide 1: subtitle "Spring 2026". The course is running in Fall 2026; consider updating the term label (also in all other Ch3 decks; the Instruction References decks say "Fall 2025").
- Slide 10 (picture): assembly listing shows `x DCW -2`. DCW reserves a 16-bit value, but x is an int loaded/stored with 32-bit LDR/STR and slide 12 says x occupies 4 bytes. It should be `DCD -2`. Picture, not editable.
- Slide 11 (picture): listing shows `x DCW -1` (wrong directive, and the slide text says x = -2 before the addition). Should be `x DCD -2`. Picture.
- Slide 12 (picture): listing shows `x DCW -1` — should be `x DCD -2` (wrong directive and wrong initial value). The register/memory picture (R0=0x20000000, R1=0xFFFFFFFE, memory FE FF FF FF) is correct: it shows the state after the load (step 2), before the ADD. [Corrected by main session: an earlier version of this note wrongly claimed a before/after mix.] Picture, not editable.
- Slide 2 (picture, timeline): approximate years only (e.g. ARMv8 placed at 2014, ARMv9 at 2022 although announced 2011/2021, M0/M0+ positions); not edited, check if exact dates matter.
- Slide 32: comments say "Cortex-M3 ..." while the course is Cortex-M4 (these are the CMSIS names, which are valid for M4 as well). Left as is.

## Notes
- Rendering in LibreOffice shows text running beyond the bottom of slides 12 (left text box), 25 and 31 (code boxes) and slide 11 (bottom text); this is likely font substitution (Consolas/Courier) but check in PowerPoint.
- Slide 13 (STM32L4 diagram) uses rotated text boxes that LibreOffice renders garbled; not a content problem.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
