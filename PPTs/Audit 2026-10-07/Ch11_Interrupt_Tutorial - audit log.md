# Audit log: Ch11_Interrupt_Tutorial

## Summary

Content audit of the Chapter 11 interrupt tutorial (memory map, vector table, single-interrupt stacking/unstacking animation, nested interrupts, tail chaining). Recomputed: vector address 64 + 4n (EXTI3 n = 9 -> 0x64; SysTick n = -1 -> 0x3C), stacked frame (8 words = 32 bytes), 12/12/6-cycle stack/unstack/tail-chain figures, priority tables. Real errors fixed: Reset vector content shown as an SRAM address (0x2000020D, now 0x0800020D) on 27 slides, External RAM / External Device regions swapped in the memory map (ARMv7-M), vector-table start address in the notes, plus typos and pasted junk in the notes of slide 15.

- Slides in deck: 41
- Text edits applied: 47 (on 32 slides)
- Edit method: run-level text replacement only (fonts, colours, bullets, animations, pictures, slide order untouched). Output validated with python-pptx (slide count unchanged) and office/validate.py: PASSED.

## Changes made

| Slide(s) | Before | After | Why |
|---|---|---|---|
| 3 | `External RAM` | `External Device` | ARMv7-M map: 0x60000000-0x9FFFFFFF is External RAM, 0xA0000000-0xDFFFFFFF is External Device (labels were swapped; step 1/2) |
| 3 | `External Device` | `External RAM` | ARMv7-M map (labels swapped; step 2/2) |
| 4 | `External RAM` | `External Device` | ARMv7-M map: 0x60000000-0x9FFFFFFF is External RAM, 0xA0000000-0xDFFFFFFF is External Device (labels were swapped; step 1/2) |
| 4 | `External Device` | `External RAM` | ARMv7-M map (labels swapped; step 2/2) |
| 5 | `External RAM` | `External Device` | ARMv7-M map: 0x60000000-0x9FFFFFFF is External RAM, 0xA0000000-0xDFFFFFFF is External Device (labels were swapped; step 1/2) |
| 5 | `External Device` | `External RAM` | ARMv7-M map (labels swapped; step 2/2) |
| 3 | `Off-chip memory for data` | `Such as SD card` | Description follows its (swapped) region label; step 1/2 |
| 3 | `Such as SD card` | `Off-chip memory for data` | Description follows its (swapped) region label; step 2/2 |
| 3 (notes) | `The next region is for external device, such as SD card.` | `The next region is external RAM, which is an executable region for data. It is off-chip memory, primarily used to store large data blocks.` | Notes follow the corrected region order |
| 3 (notes) | `The next is external RAM, which is executable region for data. It is off-chip memory, primarily used to store large data blocks. It has a t…` | `The next is the external device region, for devices such as an SD card. It also has a total of 1 gigabyte.` | Notes follow the corrected region order |
| 6 (notes) | `the interrupt vector table starts at the memory address 4.` | `the interrupt vector table starts at memory address 0 (the first word holds the initial MSP value; the Reset vector is at address 4).` | Table starts at address 0 (cf. slide 8: address 0 = initial MSP, address 4 = Reset handler) |
| 7 (notes) | `the IVT starts at memory address 4.` | `the IVT starts at memory address 0 (the first word holds the initial MSP value; the Reset vector is at address 4).` | as above |
| 8 | `0x2000020D` | `0x0800020D` | Reset_Handler is in Flash (0x0800xxxx; EXTI3 handler is at 0x0800030C on the same slide), not in SRAM 0x2000xxxx |
| 9–33 | `0x2000020D` | `0x0800020D` | Reset vector content: Flash address 0x0800020D (Thumb bit set), not SRAM 0x2000020D |
| 11 | `NVIC starts to the stacking process` | `NVIC starts the stacking process` | Grammar |
| 11 (notes) | `automatically starts to the stacking process` | `automatically starts the stacking process` | Grammar |
| 15 (notes) | `(aka IP or t12)` | `(aka IP)` | "t12" is not a name for R12 |
| 15 (notes) | `stackoverflow+1` | `(removed)` | Pasted chat-tool citation residue in the notes |
| 15 (notes) | `ece.utexas+1` | `(removed)` | Pasted chat-tool citation residue in the notes |
| 15 (notes) | `interrupt.memfault` | `(removed)` | Pasted chat-tool citation residue in the notes |
| 15 (notes) | `添加到后续问题` | `(removed)` | Pasted chat-tool UI text ("add to follow-up questions") in the notes |
| 15 (notes) | `检查来源` | `(removed)` | Pasted chat-tool UI text ("check sources") in the notes |
| 41 | `NVICC` | `NVIC` | Typo |

## Needs your decision / not fixed

- Title slide says "Fall 2025" on every deck; today is Oct 2026 (Fall 2026 term). Left unchanged because the label is per-offering; update if these decks are being reused this term.
- Memory-map swap (slides 3, 4, 5, plus the notes of slide 3): ARMv7-M defines 0x60000000-0x9FFFFFFF as External RAM and 0xA0000000-0xDFFFFFFF as External Device; the slides had them the other way round. I swapped the rectangle labels, the two description boxes on slide 3 and the order in the notes. Please confirm that you agree (the original book may draw it the same way).
- Slide 15 speaker notes: I removed the pasted chat-UI strings and "+1" citation tokens, but kept the 20 raw URLs; delete them too if you do not want a link dump in the notes.
- Slide 6: table is numbered 1..255 (xPSR numbering) with "1 <= x <= 255", while slide 8 uses the CMSIS number n (EXTI3 = 9, SysTick = -1) in "64 + 4n". Both are right in their own convention but not labelled; suggest a remark on slide 6 or 8.
- Slide 4: "96 KB" internal SRAM and top address 0x20017FFF describe SRAM1 only (STM32L476 has 96 KB SRAM1 + 32 KB SRAM2 = 128 KB). Inside a picture/label; left.
- Slides 10-33 use the priority register row (3, 4, 7, 2, 8) while slides 34-40 use (3, 4, 7, 5, 3) for interrupts 12..8. They are two different scenarios and consistent with their own notes (slide 36 note: 3 vs 5); just be aware that EXTI3 has priority 2 in one and 5 in the other.
- Slide 20/21 notes etc. use the word "NVIC" for the hardware that performs stacking; strictly it is the processor core with the NVIC. Left as is.

## Notes

- Slide 8: initial MSP 0x20000068 and handler 0x0800030C / vector content 0x0800030D (Thumb bit) are consistent; the Reset vector content (0x0800020D) is now consistent with this.
- Slides 6, 7 (notes): the vector table starts at address 0 (word 0 = initial MSP, word 1 = Reset vector at address 4); the notes said the table "starts at address 4".
- Slide 11 notes/text: "starts to the stacking process" -> "starts the stacking process".
- Slide 41: "NVICC" typo. Tail chaining numbers (12 + 12 vs 6 cycles) are correct for Cortex-M3/M4 with zero-wait-state memory.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
