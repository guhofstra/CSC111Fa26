# Ch5_ARM_Load_Store - audit log

## Summary

- Original: `/tmp/claude-0/w111/orig/Ch5_ARM_Load_Store.pptx` (untouched). Edited deck: `/tmp/claude-0/w111/out/Ch5_ARM_Load_Store.pptx`.
- Slides: 53 (unchanged count/order). Text replacements made: 10 (run-level only; no shapes, images, animations or layouts touched).
- Most important fixes: slide 21 `r0` value did not match the addresses drawn (0x20000000..03); slide 32 range claim re-attributed correctly (8-bit offset/U-bit [-255,+255] is the Thumb-2 pre/post-indexed form used on slides 25-31, not "halfword on Cortex-M"); slide 9 missing word ("eggs"); halfword/word wording on slide 4.
- Recomputed and found correct: endianness layouts (10, 12, 13/14: 0xEE8C90A7 BE / 0xA7908CEE LE), LDRB/LDRH/LDR and LDRSB/LDRSH results (20, 21: 0xE1, 0xE3E1, 0x8765E3E1, 0xFFFFFFE1, 0xFFFFE3E1), pre/post/pre-with-update worked examples (24-31: 0x88796A5B, 0x4C3D2E1F, r0 updates), all store examples (37-42), LDRH 0x0000CDEF and LDRSB 0xFFFFFFEF (33-36), unaligned-access description (6), array offsets (7/8), LDM/STM pictures 45/46 (register-to-address assignment), STM/LDM synonym table notes (44), memory-map regions and sizes (47), LDR pseudo-instruction encodings (51: 0xFF0 = MOV modified immediate, 0xFFF = MOVW).
- Validation: opens with python-pptx, slide count unchanged, `office/validate.py --original` PASSED. Only slide/notes XML parts with text changes were replaced; every other package part is byte-identical to the original.

## Changes made

| Slide | Before -> After | Why |
|---|---|---|
| 1 | `Fall 2025` -> `Fall 2026` | Outdated semester on cover |
| 3 | `all 2 bytes in that word.` -> `all 2 bytes in that halfword.` | Speaker notes: halfword, not word |
| 4 | `all 2 bytes in that word.` -> `all 2 bytes in that halfword.` | Slide text and notes: halfword, not word |
| 9 | `break their on the big end` -> `break their eggs on the big end` | Missing word "eggs" |
| 21 | `r0 = 0x02000000` -> `r0 = 0x20000000` | Memory addresses drawn on this slide are 0x20000000..0x20000003 (the 0x02000000 value belongs to the previous slide) |
| 22 | `Offset held r2` -> `Offset held in r2` | Typo |
| 23 | `hold in register r1` -> `held in register r1` | Grammar |
| 32 | `In ARM Cortex‑M/Thumb instruction set, for halfword and signed byte/halfword load/store instructions,` -> `For the pre-/post-indexed (writeback) forms in the Cortex‑M/Thumb‑2 instruction set (and for halfword and signed byte/halfword load/store in A32),` | The unsigned 8-bit offset + U bit ([-255,+255]) applies to the Thumb-2 pre/post-indexed forms used on slides 25-31 (Cortex-M); in Thumb-2 non-writeback LDR/LDRH use a 12-bit offset, so the original claim "Cortex-M halfword offset is 8-bit" was inaccurate |
| 41 | `Example` -> `Example (Little-Endian ordering)` | Consistent with the other question slides (37, 39) |
| 42 | `Example` -> `Example ANS (Little-Endian ordering)` | Answer slide of 41; consistent with answer slides 38, 40 |

## Needs your decision / not fixed

- Slides 45/46 (picture): LDMDA column of the load-multiple figure reads "r7 = -0"; should be "r7 = 0". Same picture on Ch5 ANS slide 23. Inside an image, not edited.
- Slides 43-46: IB and DA modes exist only in the A32 instruction set; Cortex-M (Thumb-2) supports only LDM/STM IA and DB. Since the course targets Cortex-M, consider a one-line note on slide 43.
- Slide 47: "Harvard architecture: physically separated instruction memory and data memory" - Cortex-M3/M4 have separate instruction/data buses (I-Code, D-Code, System) onto a single unified address space. Suggest "Harvard bus architecture: separate instruction and data buses over one 4 GB address space". Left as is (wording choice).
- Slides 25-31: "Offset range is -255 to +255" is accurate for the pre/post-indexed forms; plain `LDR r1,[r0,#imm]` in Thumb-2 allows 0..4095 (A32: +/-4095). Slide 32 now explains the 8-bit case; consider adding the 12-bit case.
- Slide 44: "STM = STMIA = STMEA" and "LDM = LDMIA = LDMFD" are each true, but they are not a matched push/pop pair (STMFD=STMDB pairs with LDMFD=LDMIA; STMEA=STMIA pairs with LDMEA=LDMDB). A short clarification would avoid confusion.
- Slide 51 speaker notes say "Refer to the Slide Summary of Pre-index and Post-index" for modified-immediate patterns - stale cross-reference (that slide is about offsets). The encoding is covered in the arithmetic/ISA chapters; update the pointer.
- Speaker notes on slides 13, 14, 32-42 are an unrelated copy-pasted paragraph about halfword offsets (v4T) plus "Link: diagram on next slide"; only slide 32 is relevant. Not edited.
- Slide 20 uses base address 0x02000000 whereas the rest of the chapter uses 0x2000_0000-style SRAM addresses; self-consistent so left unchanged.

## Notes

- Method: extracted all slide text, tables, grouped shapes, a14/OMML content inside mc:AlternateContent and speaker notes; rendered every slide with LibreOffice and inspected pictures; re-computed worked examples by script. LibreOffice table layouts differ slightly from PowerPoint, so apparent clipping/overlap in renders was not treated as a content error.
- "Fall 2025" on the cover was changed to "Fall 2026" in all six decks (your course memory says Fall 2026). Revert if the cover year is intentionally the original delivery year.


## Follow-up edits (2026-10-08)

- S46 picture (EMF): "r7 = -0" -> "r7 =  0" under LDMDA. (S45 has no such label.)
