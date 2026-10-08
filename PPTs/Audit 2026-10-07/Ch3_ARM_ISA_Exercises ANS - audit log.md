# Audit log: Ch3_ARM_ISA_Exercises ANS.pptx (16 slides)

## Summary
- OLD exercise+answer deck (saved 2025-09-04, older template, "L2 (CHAPTER 5)"). It repeats the endianness questions (slides 2-7, same as the current pair) and ADDS topics that the current pair does not have: data alignment (8-12), memory cycles (13-14), array addressing (15-16). The current Ch3 pair ("Ch3_ARM_ISA Exercises" + "ANS") is newer; keep this one only if you still want the alignment/array questions.
- Recomputed all answers: endianness (OK); slide 10 (word at 102, little-endian MSB = 105; big-endian MSB = 102; word at 102 is misaligned: 2 cycles; half-word at 102 stays in word 100-103: 1 cycle) - correct; slide 12 (2 B at 5: 1 cycle; 2 B at 15: 2 cycles; 4 B at 10: 2 cycles; 4 B at 20: aligned, 1 cycle) correct; slide 14 (1; 1 or 2; 1 or 2; 2 or 3) correct; slide 16 (0x12345679, 0x1234567A, 0x1234567C, 0x12345680) arithmetic correct.
- 16 run-level edits (slides 4, 5, 9, 10, 11, 15, 16); validation passed; slide count unchanged.

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 5 | Word 3 address "0x0012" -> "0x000C" | word 3 starts at byte address 12 (decimal) = 0x0C; 0x0012 = decimal 18 |
| 4, 5 | "memory address of these four words" -> "memory addresses of ..." | grammar |
| 9, 10 | "Consider 16 bytes of memory (addresses 0 to 15)" -> "(addresses 96 to 111)" | the diagram on these slides is addresses 96-111 and all questions use address 102 |
| 9, 10 | "word at address 102, , assuming" -> "word at address 102, assuming" (2 per slide) | stray duplicated comma |
| 9, 10 | question (b) "...assuming Little-Endian ordering?" -> "...assuming Big-Endian ordering?" | (a) and (b) were identical; the answers are (a) 105 = little-endian, (b) 102 = big-endian |
| 9, 10 | question labels (b) "How many memory cycles ... word" -> (c); (c) "... half word" -> (d) | labels were (a)(b)(b)(c) but the answers are (a)-(d) |
| 11 | removed "Consider 16 bytes of memory (addresses 0 to 15) arranged as four 32-bit words (4 bytes each)." | the operands are at addresses 15..23, outside a 16-byte memory; slide 12 (answer) already omits the sentence |
| 15 | "(c) longs" -> "(d) longs" | duplicate label (c) |
| 16 | "(c) longs" -> "(d) longs" (question list and answer line) | duplicate label (c) |

## Needs your decision / not fixed
- Slides 15/16: "longs" = 8 bytes (+8 -> 0x12345680). On ARM Cortex-M (AAPCS, Keil/GCC) `long` is 4 bytes; 8 bytes is `long long`. Suggest changing to "long longs" (answer 0x12345680 unchanged) or +4 (0x1234567C) for `long`.
- Slide 12 picture shows addresses 0-15 only; the operands at 15-16 and 20-23 go beyond it (answer text is correct).
- Slide 1: "L2 (CHAPTER 5)" is stale (this is Chapter 3 in the current numbering); not changed because it may be an older-course reference.
- Slides 6/7 speaker notes: stale unrelated text about halfword access in v4T / "diagram on next slide". Suggest deleting.
- Slide 5: diagram byte labels are decimal while answers carry the "0x" prefix (0x000C now sits next to label 0012); relabel in hex or write answers in decimal.

## Notes
- Slides 8-14 tables/diagrams are pictures/tables with correct content (checked: slide 8 ill-aligned example, word at 6 spans 6-9, two cycles).
