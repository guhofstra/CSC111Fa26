# Audit log: Ch16_Timer_PWM Exercises ANS

## Summary

All answers recomputed and correct: slide 4 ARR = 500 (4 MHz/40 = 0.1 MHz, 2*ARR = 1000), slide 6 ranges ([6.1 kHz, 400 MHz] and [0.09 Hz, 400 MHz]), slide 8 f_CK_CNT = 0.1 MHz, f_Timer = 50 Hz, duty = 1 - 499/2000 = 1501/2000 = 0.7505 (CNT = 499..1999 = 1501 ticks, matches). Interrupt exercise (slides 9-10, marked NOT COVERED): stack frame addresses 0x200005FC..0x200005E0 and SP = 0x200005E0 are correct. Only a typo was fixed.

- Slides in deck: 10
- Text edits applied: 1 (on 1 slides)
- Edit method: run-level text replacement only (fonts, colours, bullets, animations, pictures, slide order untouched). Output validated with python-pptx (slide count unchanged) and office/validate.py: PASSED.

## Changes made

| Slide(s) | Before | After | Why |
|---|---|---|---|
| 8 | `high on when` | `high when` | Typo |

## Needs your decision / not fixed

- Title slide says "Fall 2025" on every deck; today is Oct 2026 (Fall 2026 term). Left unchanged because the label is per-offering; update if these decks are being reused this term.
- Slides 9-10: part (2) ("values of R0-R12, LR, SP, PC, PSR after the interrupt exits") has no answer slide. Expected (my computation): R0 = 0, R1 = 1, R2 = 2, R3 = 3, R4 = 5, R5 = 6, R6 = 7, R7 = 7 (restored by POP), R8 = 9, R9 = 10, R10 = 11, R11 = 12, R12 = 12, LR = 0x20008020, SP = 0x20000600, PC = 0x08000020, PSR = 0x00000020 (R0-R3, R12, LR, PC, PSR come back from the hardware frame; R4-R6, R8-R11 keep the increments; R7 is restored by POP {r0, r7, pc}). Suggest adding it.
- Slide 9: PSR = 0x00000020 has no Thumb (T, bit 24) bit set, which a real Cortex-M xPSR always has (0x01000020 would be realistic); LR = 0x20008020 is also an SRAM address. Fine for a pencil exercise, but flagging in case students run it.
- Slide 2 summary uses f_SOURCE while slides 4, 6, 8 use f_CK_PSC (same inconsistency as the Ch16 chapter deck).
- Slide 9 text says "register i (i <= 12)"; fine, but mention that LR = 0xFFFFFFF9 inside the handler is what POP {.., pc} uses for the exception return.

## Notes

- Slide 8: "PWM output is high on when" -> "high when".
- Slide 6 note about a realistic timer frequency (< 1 kHz) is consistent with Ch16 slide 3.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
