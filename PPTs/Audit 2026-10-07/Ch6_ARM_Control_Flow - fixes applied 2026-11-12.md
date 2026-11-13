# Ch6_ARM_Control_Flow.pptx - fixes applied (2026-11-12)

Starting point: saved deck after the instructor deleted old slide 38 (44 slides). Backup: `bak\audit-20261112\Ch6_ARM_Control_Flow (pre-fixes, slide38 deleted).pptx`. Slide count after fixes: 44. Slide numbers below use the current numbering.

## Corrections
- **Slide 39 (IT):** ITE EQ comment no longer says both instructions execute (now "EQ: MOVEQ, NE: ADDNE"). ITT AL last line now `ADD r0,r1,r2 ; 32-bit ADD.W, not in IT block` (the old `ADD r0,r0,r1` has a 16-bit form, so the claim was wrong). Comments shortened so the ITTE and ITE boxes no longer overlap. Notes now say to write IT explicitly on Cortex-M; the ADD.W reasoning is in the notes.
- **Slide 34 row 1 (signed x+y<0):** BPL/MOVPL/MOVMI replaced by BGE / ITE LT + MOVLT / MOVGE (N != V is correct on overflow, N alone is not). Old "Could use BGE..." comment replaced. Notes updated.
- **Slide 20:** note on Assembly Program 2 corrected (idempotent and mutually exclusive conditions; would not work for x += 1 if both could be true).
- **Slides 37, 38:** C code used `str++` on an array (illegal). Now `char *p = str;` with `*p` and `p++`; assembly comments say `p++`.
- **Slide 8:** `IT LT` -> `ITE LT`, added `MOVGE r0, r1`, text box explains r0 = |x|.
- **Slides 8, 10, 29, 33, 42:** "see slide 40" -> "see slide 39".
- **Slide 26:** "Is equivalent to (for the N and Z flags):".
- **Slide 31:** added the 21 <= r0 <= 24 case for MOVLE.
- **Slide 35:** added CBZ/CBNZ restrictions (Thumb-2 only, forward 0-126 bytes, R0-R7).

## Consistency / typography
- Slides 22-27, 34: `%` comments -> `;`.
- Slide 22 notes: registers now match the slide (r0 = sum, r1 = i).
- Slides 10, 38: curly quotes in code -> straight quotes; slide 10 variable `char` -> `c`.
- Slides 29, 41, 42: "N = !V" -> "N != V".
- Notes: slide 4 "overflow" -> "carry out" for C; slide 16 stray "sciencedirect+1youtube" / "armyoutube" removed.

## Intentionally not changed
- Slide 3 notes about ARM7 CPSR; slide 11 LR / Thumb-bit note; the repeated condition-code tables; the `str` label name.

## Check
- Validated against the previous file (validator passed); rendered slides 8, 10, 20, 31, 34, 35, 37, 38, 39 to check layout. Slide 20's Program 2 cell is still tall (it was before); check it in PowerPoint.

## Follow-up (same day)
- Instructor deleted the old "Thought Experiments" slide and gave the old slide 32 the title "Incorrect Version" (reviewed, fine). Deck is now 43 slides; the IT slide is now slide 38.
- Cross-references "see slide 39" -> "see slide 38" on slides 8, 10, 29, 31, 41.
- The MOVLE note (21 <= r0 <= 24) was on the deleted slide, so it is gone with it.
