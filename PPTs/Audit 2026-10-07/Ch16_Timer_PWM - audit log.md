# Audit log: Ch16_Timer_PWM

## Summary

Content audit of Chapter 16 (prescaler, ARR, up/down/centre-aligned counting, PWM modes, duty-cycle and alignment). Recomputed: ARR = 799999 / 400000 (80 MHz, 100 Hz), ARR = 9999 / 5000 with PSC = 79, period = (ARR+1) vs 2*ARR ticks (7 and 12 for ARR = 6), duty cycles on slides 24-28 (3/7, 4/7, 2/7, 1/2, 5/6 with the matching on/off tick counts 3/4, 5/2, 6/6, 2/10, checked by enumerating the counter sequence against the CNT<CCR / CNT>=CCR tables). The only substantive error is on slide 30 (text says down-counting for a figure and table that are up-counting, PWM mode 2); the rest are typos (f_CL_PSC, "Convertor", stray "(Analog-to-Digital Convertor)" in the PWM definition, missing subject on slide 11).

- Slides in deck: 35
- Text edits applied: 6 (on 5 slides)
- Edit method: run-level text replacement only (fonts, colours, bullets, animations, pictures, slide order untouched). Output validated with python-pptx (slide count unchanged) and office/validate.py: PASSED.

## Changes made

| Slide(s) | Before | After | Why |
|---|---|---|---|
| 5 | `CL_` | `CK_` | Typo f_CL_PSC / f_CL_CNT -> f_CK_PSC / f_CK_CNT (same notation as slides 3, 6, 7) |
| 5 | `𝐶𝐿_` | `𝐶𝐾_` | Typo f_CL -> f_CK in the formula |
| 11 | `the counts down again` | `the counter counts down again` | Missing subject |
| 15 | `Convertor` | `Converter` | Spelling |
| 16 | `(Analog-to-Digital Convertor) Pulse Width` | `Pulse Width` | Stray text in front of the PWM definition |
| 30 | `In the down-counting mode, when multiple PWM signals` | `In the up-counting mode with PWM mode 2, when multiple PWM signals` | Slide shows up-counting + mode 2; per slide 32 mode 2 down-counting is LEFT-edge aligned, right-edge alignment needs up-counting (mode 2) |

## Needs your decision / not fixed

- Title slide says "Fall 2025" on every deck; today is Oct 2026 (Fall 2026 term). Left unchanged because the label is per-offering; update if these decks are being reused this term.
- Notation: slide 3 and the diagrams use f_CK_PSC for the CPU clock, slide 19 and the summary slide 34 use f_SOURCE (and Ch11 Exercises uses f_CK_PSC). I only fixed the f_CL typo; pick one symbol across the Ch16 decks.
- Slide 34 (summary): the PWM duty formulas CCR/(ARR+1) and 1 - CCR/(ARR+1) hold for up/down counting; for centre-aligned counting the denominator is ARR (slides 27/28 use CCR/ARR). Suggest adding "(edge-aligned)" and the centre-aligned versions.
- Speaker notes of slides 13, 14 (and 3-4 of the exercise deck) are the old SysTick script ("generate a SysTick interrupt ... reload value 799999"); on slide 14 (PSC = 79) the stated result 799999 is wrong (ARR = 9999). Notes only, not changed.
- Slides 12/21 (notes): "counter counts from 0 to ARR-1 ... then from ARR down to 1" differs slightly from the slide text (0..6..0) and figure; both give a period of 2*ARR ticks. Left.
- Slide 17/18/23 naming "PWM mode 1 (Low True) / mode 2 (High True)" follows the textbook; STM32 documentation only calls them PWM mode 1/2 (active while CNT<CCR / CNT>=CCR, polarity set by CCxP). Consistent within the deck.

## Notes

- Slide 5: f_CL_PSC / f_CL_CNT appeared in two text boxes and in the equation (OMML); all changed to f_CK_*.
- Slide 30: figure and table show up-counting, ARR = 6, CCR = 3/5; with PWM mode 2 up-counting the pulses are right-edge aligned (consistent with slide 32 table: mode 2 down-counting is left-edge).


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
