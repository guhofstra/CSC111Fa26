# CSC111Fa26 PPTs — Content Audit, 2026-10-07

Scope: the 41 top-level .pptx files in `CSC111Fa26\PPTs` (subfolders not touched; PDFs not regenerated).
Method: originals backed up to `bak\audit-20261007\` (41 files, md5-verified), then edited in place. Edits are run-level text changes only (fonts, colours, animations, pictures, slide order untouched). Slide counts unchanged; every edited deck opens in python-pptx and passes `validate.py --original` (three decks — ARM Instruction References, Chxx_Review, Lecture_xx_Review — carry a pre-existing broken "NULL" image relationship that exists in the originals too; left as is).
Per-deck details: `Audit 2026-10-07\<deck> - audit log.md`.

## Result by deck

| Deck | Slides | Changed? | Headline fixes |
|---|---|---|---|
| L0 course overview | 6 | no | (see decisions) |
| L0.1 Why Learn Assembly | 20 | yes | `LWR`→`LDR` (16×), `MSR/MSR`→`MSR/MRS`, typos |
| Ch1_See_Program_Running | 34 | yes | S9 machine code 0xDCFB (BGT)→0xDBFB (BLT); S16 PC 0x08001AC→0x080001AC; "Decode & Decode"→"Decode & Execute" |
| Ch2_Data_Representation | 43 | yes | C-code typo/quotes; MSR→MSB; borrow wording; all numbers verified |
| Ch2 Exercises / ANS | 12 / 23 | yes | missing bit width; option with no correct choice; "Borrow flag"→"Overflow flag"; "Q: depends"→"A: depends" |
| Ch3_ARM_ISA | 34 | yes | `DCD 2,3.5,…`→`DCFS`; comment char `%`→`;`; DCQ description |
| Ch3 Exercises / ANS / New | 4 / 7 / 7 | yes | Word 3 address 0x0012→0x000C |
| Ch3_ARM_ISA_Exercises / ANS (old set) | 1 / 16 | ANS only | (b) Little→Big endian; label numbering; address ranges |
| ARM Instruction References (+OLD) | 9 / 8 | yes | MOVN→MVN; "by 8 positions"→2; merged table cell split |
| Ch4_ARM_Arithmetic_Logic | 85 | yes | RRX description; REVSH/SMULL/UMULL/UMLAL; UDIV→"UDIVS" row; "UMUL"→MUL; ORR comments; SSAT condition |
| Ch4 Exercises / ANS / ANS NEW | 23 / 50 / 52 | yes | invalid `LSLS` syntax; binary strings for 0xFFFFC000; invalid `MLA …,#2`; ANS NEW wrong ORN/BIC/set-clear-toggle values |
| Ch5_ARM_Load_Store | 53 | yes | S21 base address 0x02000000→0x20000000; ±255 offset attribution |
| Ch5 Exercises / ANS | 14 / 37 | yes | `LDSB`→`LDRSB`; post-index r0 result; Word 3 address; premise 0–15 vs questions |
| Ch6_ARM_Control_Flow | 45 | yes | S16 5-bit wrap; `continue` skipping `str++`; TEQ is EOR; `x>y`→`x<=y`; M0 has no IT |
| Ch6 Exercises / ANS | 19 / 40 | yes | `x0`→`r0`; missing `#`; comments out of sync with fixed programs |
| Ch7_Structured_Programming | 22 | yes | C `n=5`→4; address comment; stray colons after labels |
| Ch8-1 Parameters/Registers | 44 | yes | r2/r3 = a3/a4; "pop a4,a6"→a5,a6; odd Thumb addresses 0x…13B→…138; LR bit 0 |
| Ch8-2 Stack/Preserve Env. | 57 | yes | `POP {r0-r3}` after BL destroyed return value → `ADD sp,sp,#16`; "Chapter 10"→8; `EDP`→`ENDP` |
| Ch8-3 Recursive Call | 33 | yes | pc box 0x148→0x140; fib braces |
| Ch8 Exercises / ANS | 14 / 36 | yes | R1:R0 for uint64 return; SP/R13 values; `POP` after BL; `BLE`→`BLS`; CMP value |
| Ch9_64_bit | 14 | yes | bit ranges [63:32]; "Subtract B from A"; ADDS/SUBS wording; LSR #29 label; `#` immediates |
| Ch11_Interrupt_1_Intro | 62 | yes | SWI→SVC; stacked-frame order/values; address labels; NVIC/PRIMASK/BASEPRI wording |
| Ch11_Interrupt_Tutorial | 41 | yes | reset vector 0x2000020D→0x0800020D; External RAM/Device labels swapped back; notes |
| "Ch11 Exercises" | 7 | yes | actually the Ch16 Timer/PWM exercises; title "Chapter 11"→"Chapter 16" |
| Ch12_13 Fixed/Floating | 29 | yes | S16 title 0x40920000→0x40900000; Q3.12 error sign; 9-digit exponent; UQ notation |
| Ch12_13 Exercises ANS | 6 | yes | fraction 0.9271…→0.9290000200271606; 2^-3+2^-7→2^-4+2^-8 |
| Ch16_Timer_PWM | 35 | yes | fCL→fCK; PWM mode 2 right-aligned slide; Convertor→Converter |
| Ch16 Exercises ANS | 10 | yes | wording |
| Chxx_Review | 20 | yes | Handler mode always uses MSP; xPSP→xPSR; exponent 1000010→10000010; SMULL is signed; fCL→fCK |
| Lecture_xx_Review | 23 | yes | `int main(void{`; EDP→ENDP; save/restore; CL→CK |
| ZDELETED | 24 | no | old Ch4 fragment; probably stale duplicate |

Also on the cover slide of all edited decks, the semester label ("Fall 2025" / "Spring 2026") is now "Fall 2026". Revert if intended.

## Needs your decision (not changed)

1. **L0 course overview**: S5 says "Three lab assignments", S6 says "Labs: 30% (10 + 20)"; S4 note recommends a textbook although the deck says "No textbook"; topic list omits floating point and Timer/PWM.
2. **Errors inside pictures** (cannot edit text): Ch2 S34 CPSR label; Ch3 S10–12 `x DCW -2` should be `DCD`; flowchart "Statement 2" twice (Ch6 S2, Ch7 S2); Ch5 S45–46 and Ch5 ANS S23 "r7 = -0"; Ch5 ANS S37 "A8" vs "AB"; Ch11 S9/13/16; Ch12 S24 1.17 vs 1.18×10⁻³⁸.
3. **Cortex-M vs ARM-state** (IT blocks, LDM IB/DA, `long` size: FIXED 2026-10-08, see `01 Cortex-M fixes.md`; remaining items below still open): conditional instructions without IT blocks (Ch4, Ch8 ANS S30, Ch9, Ch7); A32-only LDM IB/DA modes (Ch5); A32 immediate rules (Ch4 S81–82); `long` taken as 8 bytes (Ch3 old ANS S15–16, Ch5 ANS S22); unaligned LDRSH on M0; Cortex-M0 "Modified Harvard"; "CPSR" vs xPSR/APSR (Ch2, Ch4, Ch6, Chxx, ZDELETED).
4. **Exercise/ANS mismatches**: Ch4 Exercises Q (16384) vs ANS answers 1025; Ch4 ANS S11 `#0x1011` not an encodable immediate; Ch6 ANS S16 second program has no CMP; Ch8 Exercises S8 has an extra unintended bug (left as the "what is wrong" question); Ch16 ANS part (2) answer missing (computed values in its log).
5. **Ch8-3**: fib(0)=0 on S6 vs f(0)=1 on S5 (fib(5)=5 vs 8); factorial loops forever for n=0.
6. **Ch11-1**: S23 shows the wrong code (copied slide); S41/42 stacked-PC value changed — revert if 0x00000002 was intentional.
7. **Ch2 Exercises/ANS**: "Fall 2017 – Lecture #1" footers left over from another source.
8. **Notes hygiene**: pasted AI-chat text in speaker notes — Ch5 Exercises S12, Ch5 ANS S26, Ch6 Exercises S9 (contains answers), Ch6 ANS S20/21; reference-URL lists in Ch5 ANS S27–29; "image.jpg" residue. Clear before distributing the student decks.
9. **Duplicates/old versions**: Ch3 "Exercises  New" is a duplicate of "Exercises ANS"; Ch4 "ANS NEW" is the OLDER file (2025-10-16 vs 2026-02-26) despite the name — keep the un-suffixed ANS as master; ARM_Instruction_References OLD, Ch3_ARM_ISA_Exercises(+ANS), Chxx_Review, ZDELETED look stale.
10. **Layout**: LibreOffice renders show tables/code boxes running off the slide on several slides (Ch3 S11/12/25/31, References S4/5, Ch8-2 S54); check in PowerPoint.

## Housekeeping

- PDFs next to the decks (Ch*.pdf) are NOT regenerated; re-export after you review.
- Formula slides edited at the OMML level (Ch4 S34, Ch16 S5, Ch12 S9) have a stale fallback preview image until re-saved in PowerPoint.
- "Ch11 Exercises.pptx" is really Chapter 16 — consider renaming.
