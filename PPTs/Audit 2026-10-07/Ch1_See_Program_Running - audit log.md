# Ch1_See_Program_Running.pptx - audit log

## Summary
34 slides, 8 edits. Output: out/Ch1_See_Program_Running.pptx (validate.py PASSED, 34 slides). Machine-code examples were decoded by hand: slide 10 (2100/2201/188B/2000/4770 and their binary) correct; slide 27 (17 half-words incl. the 32-bit LDR.W F851 1020, literal-pool offsets 0x24/0x28, B Check E008, BLT Loop DBF4) all consistent; slide 4 (0x70 = 112, 4 GB = 4,294,967,296) correct; slide 28 memory layout (a[0..9] at 0x20000000-0x24, total at 0x28) consistent with slide 27.

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 9 | machine code line 7 `1101110011111011` (0xDCFB = BGT) -> `1101101111111011` (0xDBFB = BLT) | loop is `i < 10`; the picture on the same slide and slide 27 use BLT (cond 1011). With BGT the loop would never execute |
| 10 | `MOVS r0, 0x00` -> `MOVS r0, #0x00` | missing # (the hex listing beside it already says #0x00) |
| 10 | title "See a Program Runs" -> "See a Program Run" | grammar |
| 13, 14 | "Three-state pipeline" -> "Three-stage pipeline" | terminology |
| 16 | `pc = 0x08001AC` -> `0x080001AC` | missing digit (address shown everywhere else is 0x080001AC) |
| 22 | "Decode & Decode: 4770 = BX lr" -> "Decode & Execute" | typo |
| 2 | "Headquarter at Cambridge" -> "Headquarters at" | typo |

## Needs your decision / not fixed
- Slides 21 and 22 (executing MOVS r0 / BX lr): the register diagram no longer shows r3 = 0x00000001 (it was set on slide 20 by ADDS r3,r1,r2) - the r3 value box is simply missing. Needs a shape copied from slide 20 (not done: no shape rebuilding).
- Slide 24 (and 23): "PC is always incremented by 4" and note "PC advances by 4 bytes per fetch". Architecturally PC advances by the instruction size (2 for a 16-bit Thumb instruction, 4 for a 32-bit one); what is always 4 bytes is the fetch width, and reading PC in an instruction gives address+4. Suggest: "Each fetch brings in 4 bytes; PC advances by 2 or 4 depending on the instruction size".
- Slide 7/8/29: "ARM Cortex-M uses a modified Harvard architecture" is true for Cortex-M3/M4/M7 (separate I-Code / D-Code / System buses; STM32L4 = M4) but Cortex-M0/M0+ have a single bus (von Neumann). Also "instruction memory (Flash), data memory (SRAM)" is a simplification (constants in Flash are read via the data bus). Suggest "e.g. Cortex-M3/M4".
- Slide 7 speaker notes contain pasted Markdown/ChatGPT residue ("## 5. Why This Matters", "(If you remember only one thing...)"). Suggest cleaning.
- Slide 2: "2023 Revenue: US$2.68 billion" (Arm FY2023) and "second fastest supercomputer in 2022, Fugaku" are dated (Fugaku is no longer #2; Arm's later fiscal years are higher). Update with current figures if desired. Also "ARM: Acorn RISC Machine, founded 1990" - company was Advanced RISC Machines Ltd in 1990 (Acorn RISC Machine is the original expansion); consider clarifying.
- Slide 34 (picture): label "Cortex-M3 Internal Peripherals (64 KB)" - course target is Cortex-M4 (STM32L4); the private peripheral bus region 0xE0000000-0xE00FFFFF is 1 MB. Picture, not editable.
- Slide 11 (OLE object) and slides 13/14, 29-33 pictures not editable; looked fine.

## Notes
- Slides 5 and 6 are near-duplicates (animation build); slides 21/22 etc. follow the "pc = pc + 2" simplification, then slide 23-24 undo it (intentional "Well, I lied!").
