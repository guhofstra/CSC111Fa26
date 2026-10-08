# Audit log: Ch11_Interrupt_1_Introduction

## Summary

Content audit of Chapter 11 part 1 (polling vs interrupt, vector table, stacking/unstacking, MSP/PSP, EXC_RETURN, NVIC enable/priority/mask registers). The stacking/unstacking walkthrough (slides 23-42) was recomputed: frame layout, SP = 0x20000200 -> 0x200001E0, R3 restored to 3 / R4 stays 5, LR = 0xFFFFFFF9/FD, vector-table addresses, ISER/ICER index arithmetic (IRQn>>5, IRQn&0x1F), priority byte for NVIC_SetPriority(7,6) = 0x60, EXC_RETURN table, exception numbers 16+n. Real errors fixed: the stacked-frame picture on slides 38-42 (SP shown in the frame instead of LR/R12, wrong values), memory label 0x200001CF, sine() address, PC "=" 0x00000004 wording, xPSR vs CMSIS number relation (16+n direction), IT[7:6]/IT[5:0] bit labels, BASEPRI width, PRIMASK/BASEPRI wording, reversed/incorrect speaker notes on ISER/ICER, plus a number of typos.

- Slides in deck: 62
- Text edits applied: 75 (on 33 slides)
- Edit method: run-level text replacement only (fonts, colours, bullets, animations, pictures, slide order untouched). Output validated with python-pptx (slide count unchanged) and office/validate.py: PASSED.

## Changes made

| Slide(s) | Before | After | Why |
|---|---|---|---|
| 2 | `Waste lot of CPU cycles` | `Wastes a lot of CPU cycles` | Grammar |
| 4 | `rising or fall edge` | `rising or falling edge` | Typo |
| 4 | `CPU responses to` | `CPU responds to` | Grammar (verb) |
| 6 | `Interrupt Service Handler` | `Interrupt Service Routine` | ISR = Interrupt Service Routine (as on slide 9/10) |
| 10 | `exception hander` | `exception handler` | Typo |
| 10 | `pc = 0x00000004` | `pc = mem[0x00000004]` | After reset the PC is loaded with the CONTENT of address 0x00000004 (Reset vector); PC itself is not 0x00000004 (cf. the table row and the Tutorial deck slide 8) |
| 10 | `via SWI` | `via SVC` | SWI is the pre-Cortex-M name; the instruction behind SVC_Handler is SVC |
| 11 | `: (interrupt shown in the xPSR)` | ` (as in the figure):` | Number n in the figure is the CMSIS number; the xPSR number is derived from it (see slide 47: PSR = 16 + CMSIS) |
| 11 | `For interrupt number ` | `For CMSIS interrupt number ` | see above |
| 11 | `Common Microcontroller Software Interface Standard (CMSIS) Interrupt Number = ` | `Cortex Microcontroller Software Interface Standard (CMSIS). Interrupt Number in xPSR = ` | CMSIS = Cortex (not "Common") Microcontroller Software Interface Standard; the relation was reversed: xPSR number = 16 + CMSIS number (slides 47/48) |
| 12 | `pushes eight register into` | `pushes eight registers into` | Plural |
| 12 | `pops these eight register off` | `pops these eight registers off` | Plural |
| 16 | `eight register out of` | `eight registers out of` | Plural |
| 16 | `interrupt hander exits` | `interrupt handler exits` | Typo |
| 17 | `selected selected` | `selected` | Duplicated word |
| 18 | `int main(void{` | `int main(void){` | Missing closing parenthesis in C code |
| 23–33, 38–42 | `0x200001CF` | `0x200001CC` | Word-aligned address label: after 0x200001D0 comes 0x200001CC (typo CF) |
| 34 | `The main program is executing at R3 = 0 (set by MOV r3, #0) ` | `The main program is about to execute MOV r3, #0 (R3 = 3 at this moment) ` | At the time of the interrupt (PC=0x08000044) MOV r3,#0 has not run yet; R3 = 3 (slides 25-33 and the table on this slide say R3 = 3 in main) |
| 34 | `but these are local to the ISR` | `but R3 is stacked, so its new value is lost on return, whereas R4 is not stacked, so its new value (5) persists` | R4 is NOT local to the ISR: step 4 says R4 remains 5 after the return (slide 33 shows R4 = 5) |
| 38 | `SP` | `LR` | Frame label: stacked registers are xPSR, PC, LR, R12, R3..R0 (SP is not stacked) |
| 38 | `LR` | `R12` | Frame label: stacked registers are xPSR, PC, LR, R12, R3..R0 |
| 38 | `0x20000200` | `0x08001000` | Stacked LR slot must hold LR (0x08001000), not the old SP |
| 38 | `0x08001000` | `12` | Stacked R12 slot must hold R12 = 12 |
| 39 | `SP` | `LR` | Frame label: stacked registers are xPSR, PC, LR, R12, R3..R0 (SP is not stacked) |
| 39 | `LR` | `R12` | Frame label: stacked registers are xPSR, PC, LR, R12, R3..R0 |
| 39 | `0x20000200` | `0x08001000` | Stacked LR slot must hold LR (0x08001000), not the old SP |
| 39 | `0x08001000` | `12` | Stacked R12 slot must hold R12 = 12 |
| 40 | `SP` | `LR` | Frame label: stacked registers are xPSR, PC, LR, R12, R3..R0 (SP is not stacked) |
| 40 | `LR` | `R12` | Frame label: stacked registers are xPSR, PC, LR, R12, R3..R0 |
| 40 | `0x20000200` | `0x08001000` | Stacked LR slot must hold LR (0x08001000), not the old SP |
| 40 | `0x08001000` | `12` | Stacked R12 slot must hold R12 = 12 |
| 41 | `SP` | `LR` | Frame label: stacked registers are xPSR, PC, LR, R12, R3..R0 (SP is not stacked) |
| 41 | `LR` | `R12` | Frame label: stacked registers are xPSR, PC, LR, R12, R3..R0 |
| 41 | `0x20000200` | `0x08001000` | Stacked LR slot must hold LR (0x08001000), not the old SP |
| 41 | `0x08001000` | `12` | Stacked R12 slot must hold R12 = 12 |
| 42 | `SP` | `LR` | Frame label: stacked registers are xPSR, PC, LR, R12, R3..R0 (SP is not stacked) |
| 42 | `LR` | `R12` | Frame label: stacked registers are xPSR, PC, LR, R12, R3..R0 |
| 42 | `0x20000200` | `0x08001000` | Stacked LR slot must hold LR (0x08001000), not the old SP |
| 42 | `0x08001000` | `12` | Stacked R12 slot must hold R12 = 12 |
| 40 | `located at 0x08000024` | `located at 0x080000F0` | sine() cannot be at 0x08000024 (that is the BX lr address on the same slide); the PC shown after BL sine is 0x080000F0 |
| 41–42 | `0x00000002` | `0x08000044` | Stacked PC slot must keep 0x08000044 (stack frame is not modified by BL sine; same slot on slides 38-40) |
| 48 | `Stick saturation` | `Sticky saturation` | Typo (Q flag = sticky saturation) |
| 48 | `NVIC_ClearingPending` | `NVIC_ClearPendingIRQ` | Actual CMSIS function name |
| 48 | `7` | `1` | IT bits in APSR/EPSR: bits [26:25] = IT[1:0] |
| 48 | `6` | `0` | IT bits: bits [26:25] = IT[1:0] |
| 48 | `5` | `7` | IT bits: bits [15:10] = IT[7:2] |
| 48 | `0` | `2` | IT bits: bits [15:10] = IT[7:2] |
| 51 | `Each are control by` | `Each is controlled by` | Grammar |
| 51 | `separate write-only registers` | `separate registers` | ISER/ICER are readable (slide 50: "determine which interrupts are currently enabled") |
| 52 | `Method 2 (Interrupt number for PSR):` | `Method 2 (Interrupt number for CMSIS):` | ISER/ICER bit index is the CMSIS IRQn (0..239) (e.g. TIM7 = 44 -> ISER[1] bit 12); the PSR number would be IRQn + 16 |
| 52 (notes) | `NVIC_ClearingPending` | `NVIC_ClearPendingIRQ` | Actual CMSIS function name |
| 54 | `Diable` | `Disable` | Typo in code comment |
| 54 (notes) | `To enable interrupt 44, we need to set bit 12 of ICER1` | `To disable interrupt 44, we need to set bit 12 of ICER1` | Notes: this is the disable slide |
| 54 (notes) | `interrupt set disable register` | `interrupt clear-enable register` | ICER = Interrupt Clear-Enable Register (slide 50) |
| 55 (notes) | `Setting a bit to 1 in ISER automatically clears the corresponding bit in ICER (sets it to 0), and vice versa.` | `ISER and ICER access the same enable bit: writing 1 to ISER sets it (both registers then read back 1), writing 1 to ICER clears it (both th…` | ISER/ICER are not independent bits; ICER does not read 0 after enabling |
| 60 | `up to 9 bits` | `up to 8 bits` | BASEPRI is an (up to) 8-bit register (priority byte; slide 57/58) |
| 61 | `disable all interrupts except NMI` | `disable all interrupts except NMI and hard fault` | PRIMASK also lets HardFault through (as stated on slide 60 and in the same bullet above) |
| 61 | `priority lower than a certain level` | `priority equal to or lower than a certain level` | BASEPRI masks priority values >= BASEPRI (slide 60: "same or lower importance") |
| 61 | `priority level larger than 0x60` | `priority value of 0x60 or larger` | BASEPRI = 0x60 also masks priority 0x60 itself (>=) |

## Needs your decision / not fixed

- Title slide says "Fall 2025" on every deck; today is Oct 2026 (Fall 2026 term). Left unchanged because the label is per-offering; update if these decks are being reused this term.
- Slide 23 (first slide of the SysTick example): the code box shows the second example (ADD r4,#1 / BL sine / BX lr with green addresses 0x0800001C-0x08000024) while slides 24-33 show ADD r3,#1 / ADD r4,#1 / BX lr. Looks like a copied slide. Fixing it needs removing/hiding the three green address boxes (shape-level change), so not done. Suggest delete slide 23 or paste the slide-24 code.
- Slides 41/42: the stacked PC slot read 0x00000002 (was 0x08000044 on slides 38-40); I restored 0x08000044 because BL sine does not modify the saved frame. If 0x00000002 was intentional (e.g. to dramatise corruption), revert it.
- Slide 59: table maps NVIC_SetPriorityGrouping(n) to "n = number of preemption bits" (default n = 2). That is the STM32 HAL/StdPeriph convention (NVIC_PRIORITYGROUP_n); the CMSIS function NVIC_SetPriorityGrouping(PriorityGroup) takes the AIRCR.PRIGROUP value (0-7), e.g. 2/2 split with 4 implemented bits is PRIGROUP = 5. Suggest renaming to HAL_NVIC_SetPriorityGrouping(NVIC_PRIORITYGROUP_n) or changing the table.
- Slides 49 vs 53/54: slide 49 is the STM32L476 header (TIM7_IRQn = 55 there) while slides 53-55 use TIM7_IRQn = 44 (STM32L1, as the speaker notes say). Math is internally consistent (44 -> ISER[1] bit 12); suggest saying "STM32L1" on the slide or using a consistent chip.
- Slide 9 (picture): label "PUSH {R0-r3,r12,LR,PC,PSR}" describes the hardware stacking with PUSH-style syntax and lists a register order opposite to the stack order; it is inside a picture, not editable. Optional.
- Slides 24-33: the PC shown after each step is the address of the instruction just executed (e.g. PC = 0x0800001C while the arrow is on ADD r3), whereas the real PC already points to the next instruction. Consistent within the animation; consider a one-line remark.
- Slides 13 and 16 (Old SP / New SP arrows): in the LibreOffice render the "New SP" arrow lands on the SP+0x08 row; probably a render artefact, please eyeball in PowerPoint.
- Slide 19: "bits [31:28] = 0xF" is true but the architectural pattern is EXC_RETURN[31:4] = 0xFFFFFFF; fine for teaching, left.

## Notes

- Speaker notes were edited on slides 52 (CMSIS function name), 54 (wrong "To enable interrupt 44" in the disable slide; "interrupt set disable register" -> clear-enable), 55 (ISER/ICER do not have independent bits).
- Slide 11: the relation was written backwards ("CMSIS number = 16 + n" with n defined as the xPSR number). Rewritten so that n is the CMSIS number (the figure column) and the xPSR number is 16 + n, matching slides 47/48.
- Slide 10: "pc = 0x00000004 initially" -> "pc = mem[0x00000004] initially" (PC receives the Reset vector stored at address 4, not the value 4). Table values (priorities -3..6, vector addresses) verified.
- Slide 48 IT labels: per the ARMv7-M ARM, EPSR bits [26:25] = IT[1:0] and bits [15:10] = IT[7:2] (the picture of slide 46 correctly labels both as ICI/IT).
- Verified without change: slide 15 CONTROL register bits, slide 19/20/21 EXC_RETURN values, slides 49 CMSIS numbers (16 + IRQn = exception number), slide 52 ISER/ICER formulas, slide 56 priority table, slide 58 NVIC->IP[7] = 0x60.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
