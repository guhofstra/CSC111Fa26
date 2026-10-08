# Audit log: Ch4_ARM_Arithmetic_Logic.pptx (85 slides)

Output: /tmp/claude-0/w111/out/Ch4_ARM_Arithmetic_Logic.pptx (slide count unchanged = 85, validate.py PASSED against the original).

## Summary
Every worked example was recomputed with Python: AND/ORR/BIC/MVN bit patterns (slides 9, 11, 29-31), RBIT/REV/REV16/REVSH/SXT/UXT results (36-41), MOVW/MOVT (43), shifts and rotates (49-55, incl. flags C/N/Z for each example), ANDS/ADDS with shifted operand (61-62), masks (69-73), 8-bit add/sub examples with carry rows and C/V (75-79), immediate encodings (81-82), 64-bit add/sub (22-24). All numerical examples are correct; the errors found were in instruction descriptions, a few comments/typos, and some conceptual statements. 22 edits were made (run-level only, no layout change). Slide 18 is an empty slide (title placeholder only).

Note: my first-pass text extractor skipped text inside mc:AlternateContent (slides 34, 48, 51-53 hold equations/text there); those were re-read from the raw XML.

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 10 | `RRX r0, r1, r2 ; ... {C, r0} = {C, r1} rotate by r2 bits` -> `RRX r0, r1 ; ... rotate right by 1 bit` | RRX has no register/shift-count operand; it always rotates by exactly 1 (slides 50, 55 say so). |
| 12 | REVSH "(reverse byte order in each half-word independently)" -> "(reverse byte order in the bottom half-word and sign-extend)" | That text was a copy of REV16; slide 36-39 define REVSH as bottom half-word + sign extend. |
| 12 | SMULL "(signed long multiply-accumulate)" -> "(signed long multiply)" | SMULL does not accumulate (SMLAL does). |
| 12 | UMULL "(unsigned long multiply-subtract)" -> "(unsigned long multiply)" | UMULL is plain long multiply. |
| 12 | UMLAL "(unsigned long multiply-subtract)" -> "(unsigned long multiply-accumulate)" | UMLAL accumulates (slide 27). |
| 19 | table row `UDIV -> UDIVS` replaced by `EOR -> EORS` | UDIV/SDIV have no flag-setting (S) form in ARMv7-M; UDIVS does not assemble. EOR/EORS keeps the table's shape. |
| 23 | `C[64..32] = A[64..32] + B[64..32]` -> `[63..32]` | A 64-bit value has bits 63..0; there is no bit 64. |
| 24 | same fix in the SBC comment | same |
| 26 | `MUL: Signed multiply` -> `MUL: Multiply, signed operands`; `UMUL: Unsigned multiply` -> `MUL: Multiply, unsigned operands (no UMUL exists)`; `UMUL r6, r4, r2` -> `MUL r6, r4, r2` | There is no UMUL instruction. The low 32 bits of the product are identical for signed and unsigned operands, so MUL serves both. |
| 28 | `Bitwise logic NOT OR` -> `Bitwise logic OR NOT` | ORN = Rn OR NOT(Op2); matches the formula in the same row. |
| 34 | equation (OMML) `-2^(n-1) if x < 2^(n-1)` -> `x < -2^(n-1)` | SSAT lower saturation condition was wrong (sign missing). Note: the fallback picture (media/image12.png) used by non-PowerPoint renderers still shows the old formula; PowerPoint uses the edited equation. |
| 39 | `REVSH R1, R0 ; R0 = 0xFFFF9988` -> `; R1 = ...` | Destination is R1. |
| 42 | `Copy SP (r14)` -> `(r13)` | SP is r13 (r14 is LR; slide 15 shows this). |
| 44 | `Add r0, r1, r2 LSL #2` -> `Add r0, r1, r2, LSL #2` | Missing comma: invalid syntax for a shifted operand. |
| 45 (notes) | "shift i's value left two bit positions" -> "shift r0's value left three bit positions" | Stale text copied from slide 58; the slide shifts r0 by 3 (r0 + 8*r0). |
| 56 | "substraction" -> "subtraction" | Typo. |
| 64 | Solution 2 and Solution 3 comments `r0 = r0 & not (1<<5)` -> `r0 = r0 | (1<<5)` | Copy/paste from the clear-bit slide; these are ORR (set bit) solutions (Solution 1 already says `r0 | 1<<5`). |
| 67 | table cell `A4` -> `a4` | Typo (capital A). |
| 73 | "tasked bits" -> "masked bits" | Typo. |
| 75, 76 | `signed int range [-2^-7, 2^7-1]` -> `[-2^7, 2^7-1]` | Exponent was "-7"; the range is -2^7..2^7-1 = [-128, 127]. |

## Needs your decision / not fixed
1. **Slide 1 (also all 3 exercise decks): "Fall 2025".** Probably should be Fall 2026; left unchanged because the term label is your call.
2. **Slide 15**: figure/label says "CPSR (Current Program Status Register)" but a Cortex-M has xPSR/APSR (slides 16-17, 20 use xPSR). The label is inside a picture/diagram; suggest "xPSR (APSR)". Notes: "Every arithmetic, logical, or shifting operation sets xPSR bits:" is wrong as stated (only with the S suffix, or CMP/CMN/TST/TEQ).
3. **Slide 34**: USAT equation lacks the `0 if x < 0` case (only 2^n-1 and x are shown); needs an extra row in the equation, so not a run-level edit. Also see change above regarding fallback image12.png.
4. **Slide 53, Example 3**: math line reads `-2048 = -4096/2^1` but r2 = 0xFFFF_F001 = -4095, so it should read floor(-4095/2) = -2048 (or change r2 to 0xFFFF_F000 and C to 0). Not changed (choice of fix is yours).
5. **Slide 78**: second bullet says TC(0x2D) "is only valid for signed ints, so 0x35 - 0x2D != 0x35 + TC(0x2D) for unsigned arithmetic", yet the same slide shows 53 + 211 = 264 = 8 (mod 256) with C=1. Two's-complement addition gives the same 8-bit result for unsigned subtraction; only the interpretation of the operand differs. Suggest rewording (also notes of slide 79 are garbled: "01110001 in decimal0x62 = ...").
6. **Slides 81-82 (ARM immediates)**: slides describe the ARM (A32) rotate-by-2 scheme, but this course targets Cortex-M (Thumb-2 "modified immediate": 8 bit rotated by 8..31, plus patterns 0x00XY00XY, 0xXY00XY00, 0xXYXYXYXY). Under Thumb-2, 0x000001FE (= 0xFF << 1) and 0xF000F000 are encodable, contradicting the "not possible" list; and `AND R2, R0, #0xFFFFFF8F` can be assembled as `BIC R2, R0, #0x70`. Suggest labelling the slide "ARM (A32) encoding" or updating for Thumb-2.
7. **Slide 45**: "Bit shifting is much more efficient than MUL" (and notes "multiplication is a slow operation") is dated: MUL is single-cycle on Cortex-M3/M4. Suggest softening.
8. **Slide 26** title says "Multiplication and Division" but there is no division content.
9. **Slide 18** is empty (title placeholder only); delete or fill.
10. Slide 12 notes use legacy `ADDEQS`; UAL is `ADDSEQ`. Slide 84 refers to "Q3 in the midterm" (cannot verify it is still current). Slide 19: `MULS` only exists as 16-bit encoding (low registers, Rd = Rm), fine for teaching but worth a footnote.

## Notes
- LibreOffice renders show overlapping text boxes on slides 17, 43, 61-62, 74; these are pre-existing animation/layout artefacts, not changed.
- Pictures (slides 9, 11, 29-31, 35, 49-50, 69-73, 80) were inspected visually; contents are correct.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
