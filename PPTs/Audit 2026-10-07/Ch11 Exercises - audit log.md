# Audit log: Ch11 Exercises

## Summary

This deck is the (answer-free) exercise set for Timer and PWM, not Chapter 11 interrupts. All exercise data were recomputed and are consistent with the Chapter 16 deck and with Ch16_Timer_PWM Exercises ANS (ARR = 799999 / 400000 for 80 MHz, ARR = 9999 / 5000 with PSC = 79, ARR = 500 for slide 5, f_CK_CNT range [6.1 kHz, 400 MHz] and f_Timer range [0.093 Hz, 400 MHz], 50 Hz and 75.05 % duty for slide 7). Only the chapter label on the title slide was wrong.

- Slides in deck: 7
- Text edits applied: 1 (on 1 slides)
- Edit method: run-level text replacement only (fonts, colours, bullets, animations, pictures, slide order untouched). Output validated with python-pptx (slide count unchanged) and office/validate.py: PASSED.

## Changes made

| Slide(s) | Before | After | Why |
|---|---|---|---|
| 1 | `Chapter 11` | `Chapter 16` | This is the Timer/PWM exercise deck; Timer and PWM is Chapter 16 (Ch16_Timer_PWM deck and its Exercises ANS) |

## Needs your decision / not fixed

- Title slide says "Fall 2025" on every deck; today is Oct 2026 (Fall 2026 term). Left unchanged because the label is per-offering; update if these decks are being reused this term.
- File name "Ch11 Exercises" no longer matches the content (Chapter 16 Timer and PWM). Suggest renaming to e.g. "Ch16_Timer_PWM Exercises" (file names were not changed).
- Slides 3 and 4 (speaker notes): both carry a copy of the SysTick script ("reload value ... 799999"). That is right for slide 3 (up/down mode) but not for slide 4 (PSC = 79 gives ARR = 9999, centre-aligned 5000) and it does not mention centre-aligned mode. Notes are not visible to students; replace if you use them.
- Slide 2 uses f_CK_PSC for the CPU clock, whereas the summary slide in Ch16_Timer_PWM and its Exercises ANS uses f_SOURCE (slides 3/5/6/7 of Ch16 use f_CK_PSC). Pick one symbol across the three decks.
- Slide 2: "Duty Cycle = CCR/(ARR+1)" and "1 - CCR/(ARR+1)" are the edge-aligned (up/down-counting) formulas; for centre-aligned counting (Ch16 slides 27/28) the denominator is ARR. Consider labelling the formulas "up/down-counting" and adding the centre-aligned versions.

## Notes

- Slide 1 only: "Chapter 11" -> "Chapter 16".
- Slide 6 expected answer (for your key): f_CK_CNT max = 400 MHz (PSC = 0), min = 400 MHz / 65536 = 6.10 kHz; f_Timer max = 400 MHz (ARR = 0), min = 6.10 kHz / 65536 = 0.093 Hz.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
