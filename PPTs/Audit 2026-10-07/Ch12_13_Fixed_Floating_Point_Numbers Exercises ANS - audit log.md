# Audit log: Ch12_13_Fixed_Floating_Point_Numbers Exercises ANS

## Summary

Four answers recomputed. Slides 2 and 3 (5.25 = 0x40A80000, 1.3125 x 2^2) are correct. Slide 4 (0x42F6E979) printed the wrong fraction (0.9271249771... instead of 0.9290000200...), which would give 123.336, not the stated 123.456; slide 5 (0x88888000) listed the wrong fraction bits (2^-3 + 2^-7 = 0.1328) while using 0.06640625 in the next line (correct bits are 2^-4 + 2^-8).

- Slides in deck: 6
- Text edits applied: 3 (on 2 slides)
- Edit method: run-level text replacement only (fonts, colours, bullets, animations, pictures, slide order untouched). Output validated with python-pptx (slide count unchanged) and office/validate.py: PASSED.

## Changes made

| Slide(s) | Before | After | Why |
|---|---|---|---|
| 4 | `9271249771118164` | `9290000200271606` | Fraction of 0x42F6E979 is 0x76E979/2^23 = 0.9290000200271606; the printed 0.92712... gives 123.336, not the stated 123.456 |
| 5 | `2^-3 + 2^-7` | `2^-4 + 2^-8` | Fraction bits 0001 0001 0... set b4 and b8: 2^-4 + 2^-8 (= 0.06640625, as used two lines below) |
| 5 | `=0.1328125` | `=0.06640625` | 2^-4 + 2^-8 = 0.06640625 |

## Needs your decision / not fixed

- Title slide says "Fall 2025" on every deck; today is Oct 2026 (Fall 2026 term). Left unchanged because the label is per-offering; update if these decks are being reused this term.
- Slide 5 never states the final value: -1.06640625 x 2^-110 = -8.2153x10^-34. Suggest adding it.
- Slide 4 still says "(Last step not required)"; the full value 123.45600128173828 is the float32 nearest to 123.456, fine.

## Notes

- Slide 4 binary 0 10000101 11101101110100101111001: fraction = 0x76E979 / 2^23 = 0.9290000200271606; 1.929000020 x 64 = 123.456001.
- Slide 5 binary 1 00010001 00010001000000000000000: exponent 17 (17 - 127 = -110), fraction bits b4 and b8 set.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
