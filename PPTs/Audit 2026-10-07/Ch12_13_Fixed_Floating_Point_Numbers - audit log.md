# Audit log: Ch12_13_Fixed_Floating_Point_Numbers

## Summary

Content audit of Chapters 12/13. Every worked example was recomputed with Python: UQ5.3 10101.101 = 21.625, Q4.3 = -10.375, UQ4.12 for pi (12867.964928 -> 12868 = 0x3244, error +8.5625e-6), Q3.12 for -pi (0xCDBC), IEEE-754 decodes of 0xC1FF0000 (-31.875, also the -127.5 and -255 variants), 0x3F800000 (1.0), 0x41680000 (14.5), 0x3FA66666 (1.2999999523, error 5e-8), encodes of 14.5 and 1.3, smallest normal/subnormal and largest float. Errors fixed: the title of slide 16 (0x40920000 vs the 0x40900000 that the slide actually decodes to 4.5), the sign of the Q3.12 error on slide 9, the 9-digit "111111111" exponent on slide 22, the chapter number on slide 1 and the UQ/U notation on slide 6.

- Slides in deck: 29
- Text edits applied: 6 (on 5 slides)
- Edit method: run-level text replacement only (fonts, colours, bullets, animations, pictures, slide order untouched). Output validated with python-pptx (slide count unchanged) and office/validate.py: PASSED.

## Changes made

| Slide(s) | Before | After | Why |
|---|---|---|---|
| 1 | `Chapter 13` | `Chapter 12` | Fixed-point is Chapter 12 (Exercises ANS deck: "Chapter 12 & 13"; slide 11 of this deck starts Chapter 13 with floating point) |
| 6 | `U5.3` | `UQ5.3` | Notation consistent with slides 2-4 (UQm.n) |
| 6 | `Um.n` | `UQm.n` | Notation consistent with slides 2-4 (UQm.n) |
| 16 | `0x40920000` | `0x40900000` | The binary string, exponent (129), fraction (0.125) and result (4.5) on this slide all correspond to 0x40900000; 0x40920000 = 4.5625 |
| 22 | `111111111` | `11111111` | Exponent field is 8 bits (11111111), not 9 |
| 9 | `=8.5625` | `=−8.5625` | reconstructed - true = -12868/2^12 - (-3.141593) = -8.5625e-6 (negative) |

## Needs your decision / not fixed

- Title slide says "Fall 2025" on every deck; today is Oct 2026 (Fall 2026 term). Left unchanged because the label is per-offering; update if these decks are being reused this term.
- Slide 24 (picture): the number line says +/-1.17x10^-38 but the text under it says 2^-126 ~ 1.18x10^-38 (exact 1.1755x10^-38 rounds to 1.18). Picture, not editable; consider changing it to 1.18.
- Slide 28: the picture lists "BF8 (E3M4)", and the text calls the format "bf8". There is no standard bf8 name for E3M4; the common 8-bit AI formats are FP8 E4M3 and E5M2 (some vendors call E5M2 "BF8"). Suggest rewording or checking the source (notes link).
- Slide 1: I changed "Chapter 13" to "Chapter 12" because slide 11 starts Chapter 13 (floating point) and the ANS deck says "Chapter 12 & 13". If the course numbers fixed-point differently, revert.
- Slide 21: error "5x10^-8" is rounded (exact 1.3 - 1.2999999523 = 4.77x10^-8); acceptable.

## Notes

- Slide 9: reconstructed - true = -12868/4096 - (-3.141593) = -8.5625e-6, so the sign was wrong (slide 8 for +pi, +8.5625e-6, is correct).
- Slide 16: binary string, exponent 129, fraction 0.125 and result 4.5 all belong to 0x40900000 (0x40920000 decodes to 4.5625). Title corrected rather than the body.
- Slide 25: largest float (2 - 2^-23) x 2^127 = 2^128 - 2^104 = 3.4028e38 verified.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
