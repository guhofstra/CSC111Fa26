# Audit log: Ch9_64_bit_data_processing

## Summary

Content audit of Chapter 9 (64-bit add/sub, CLZ, sign extension, 64-bit LSL/LSR, 64-bit multiply). The algorithms are all correct (checked by hand and with Python: ADDS/ADC, SUBS/SBC, CLZ chain, LSL/LSR by 3 with 29-bit cross shifts, UMULL+2xMLA = low 64 bits of the product). The fixes are syntax/typo/label errors: missing # on immediates, nonexistent bit index [64:32], wrong "Subtract A from B" comment, misleading "add with carry update" wording, a wrong figure label on slide 10, and "Logic" -> "Logical" shift terminology.

- Slides in deck: 14
- Text edits applied: 15 (on 10 slides)
- Edit method: run-level text replacement only (fonts, colours, bullets, animations, pictures, slide order untouched). Output validated with python-pptx (slide count unchanged) and office/validate.py: PASSED.

## Changes made

| Slide(s) | Before | After | Why |
|---|---|---|---|
| 2 | `[64:32]` | `[63:32]` | Bit range of a 64-bit value is [63:32]; bit 64 does not exist (the figure on the same slide uses [63:32]) |
| 2 | `ADDS (add with carry update)` | `ADDS (add and update flags, including Carry)` | ADDS is a plain add that updates the flags; "add with carry" is ADC |
| 3 | `[64:32]` | `[63:32]` | Bit range of a 64-bit value is [63:32] |
| 3 | `; Subtract A from B` | `; Subtract B from A` | The code computes C = A - B (SUBS r4,r0,r2 / SBC r5,r1,r3), i.e. B is subtracted from A |
| 3 | `SUBS (subtract with carry update)` | `SUBS (subtract and update flags, including Carry)` | SUBS is a plain subtract that updates the flags; "subtract with carry" is SBC |
| 6 | `TST r0, 0x80000000` | `TST r0, #0x80000000` | Missing # on the immediate operand (syntax error in ARM/UAL assembly) |
| 13 | `LSL 29` | `LSL #29` | Missing # on the shift amount (slide 10 uses LSR #29) |
| 7–13 | `Logic Shift` | `Logical Shift` | Terminology: LSL/LSR are "logical" shifts |
| 10 | `R4 (R3, LSL #3)` | `R4 (R3, LSR #29)` | Label for the intermediate term must match the figure and the code: ORR r1, r1, r3, LSR #29 (it is r3 shifted RIGHT by 29, not LSL #3) |

## Needs your decision / not fixed

- Title slide says "Fall 2025" on every deck; today is Oct 2026 (Fall 2026 term). Left unchanged because the label is per-offering; update if these decks are being reused this term.
- Slide 9 (figure label, text box "r4" over the LSR 29 term): the working code on slide 10 does not use r4 (it backs up the lower word in r3 and applies the shift inside ORR). I only corrected the slide-10 label (R4 (R3, LSR #29)); the "r4" on slide 9 is consistent with that label but neither is used in the code. Suggest either dropping the r4 labels or showing MOV r4, r3, LSR #29 / ORR r1, r1, r4.
- Slide 10: MOVS r1, r1, LSL #3 has an unnecessary S suffix (flags are not used; slide 13 uses plain MOV). Harmless, left as is.
- Slides 4, 6: conditional instructions (CLZEQ, ADDEQ, LDRNE, LDREQ) without IT blocks. Fine for armasm/Keil (auto-generated IT) but the Cortex-M3 Thumb-2 GNU assembler requires explicit IT blocks. Suggest a footnote if students use GNU tools.
- Slides 2, 3: the examples never show the expected result. Verified values: slide 2 gives r5:r4 = 0x00002667:0x00000000 (the carry out of the low word is 1); slide 3 gives r5:r4 = 0xFFFFFFFE:0xFFFFFFFE (A - B is negative, C flag = 1 after SUBS so no borrow, SBC = 2 - 4 + 1 - 1 = -2). Suggest adding these to the comments.

## Notes

- Pictures (adder/subtractor diagrams, shift diagrams on slides 7, 8, 11, 12) were viewed and are consistent with the code; no errors found in them.
- Slide 14: MLA r5, r1, r2, r5 / MLA r5, r0, r3, r5 operand order matches the stated "MLA Rd, Rn, Rm, Ra"; the speaker note is consistent.
- Slide 5: statements about CLZ edge cases (r1 != 0; r1 = 0, r0 != 0; both 0 -> 64) are correct.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
