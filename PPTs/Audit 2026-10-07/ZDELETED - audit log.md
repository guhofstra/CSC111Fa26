# ZDELETED.pptx - audit log

## Summary
24 slides, light audit, no file written to out/ (no change made; deck appears to be an old leftover). It is a "Fall 2025" Chapter 4 (ARM Arithmetic and Logic Instructions) fragment: condition codes, signed comparison, GCD, memory alignment, barrel shifter, ADR, 64-bit shifts, register conventions, extra arguments via stack. Same material exists in Ch4_ARM_Arithmetic_Logic.pptx / Ch6_ARM_Control_Flow.pptx / Ch8 decks, so it is very likely a stale duplicate (file name says deleted).

## Changes made
None.

## Needs your decision / not fixed (obvious errors only)
- Slide 2 (4-bit add table), 3 (condition-code table), 4-5 (signed comparison), 8 (GCD with SUBHI/SUBLO), 10-11 (alignment), 12-16 (rotate-right barrel shifter table), 24 (stack offsets, LDRD [sp,#12] / [sp,#20]) were recomputed and are correct.
- Slide 23: caller restores the stack with `POP {r0, r1, r2, r3}` after `BL sum`, which overwrites the return value in r0. Should be `ADD sp, sp, #16`.
- Slide 17: `ADR r4, start` is said to be `SUB r4, pc, #0xc` with both instructions "32-bit" - true for ARM state; on Cortex-M (Thumb) with a 32-bit MOV.W it would be `#8`.
- Slide 22: APCS table lists "r9 - r12 omitted" and again "r11 fp" (overlapping rows); r4-r8 as v1-v5 only.
- Slide 6: "CPSR" vs slide 7 "xPSR" inconsistency; slide 6 says V is set on "signed addition" only (should be addition or subtraction).
- Slide 1: "Fall 2025".

## Notes
- Recommend deleting the file if Ch4 is already covered.
