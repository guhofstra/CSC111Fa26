# Ch5_ARM_Load_Store_Exercises - audit log

## Summary

- Original: `/tmp/claude-0/w111/orig/Ch5_ARM_Load_Store_Exercises.pptx` (untouched). Edited deck: `/tmp/claude-0/w111/out/Ch5_ARM_Load_Store_Exercises.pptx`.
- Slides: 14 (unchanged count/order). Text replacements made: 9 (run-level only; no shapes, images, animations or layouts touched).
- Most important fixes: LDSB -> LDRSB (not a valid mnemonic) on slide 6; slide 7/8 question premise ("16 bytes, addresses 0 to 15") contradicted the questions (addresses 15/16/20, 102) - slide 7 premise dropped (as the ANS deck already does), slide 8 now says addresses 96..111 to match the picture; duplicated question labels (b)(b)(c) fixed; slide 13 said addresses increase "top to bottom" but the table lists 0x10000200 at the top (increase bottom to top).
- Validation: opens with python-pptx, slide count unchanged, `office/validate.py --original` PASSED. Only slide/notes XML parts with text changes were replaced; every other package part is byte-identical to the original.

## Changes made

| Slide | Before -> After | Why |
|---|---|---|
| 1 | `Fall 2025` -> `Fall 2026` | Outdated semester on cover |
| 6 | `LDSB` -> `LDRSB` | Mnemonic is LDRSB (load register signed byte) |
| 7 | `Consider 16 bytes of memory (addresses 0 to 15) arranged as four 32-bit words (4 bytes each). ` -> `` | Premise contradicts the questions (addresses 15, 16, 20 lie outside 0..15); the answer deck already drops it |
| 8 | `(addresses 0 to 15)` -> `(addresses 96 to 111)` | Question is about address 102; the picture shows addresses 96..111 |
| 8 | `(b) How many memory cycles` -> `(c) How many memory cycles` | Question numbering (a)(b)(b)(c) -> (a)(b)(c)(d) |
| 8 | `(c) How many memory cycles are required to read the half word` -> `(d) How many memory cycles are required to read the half word` | Question numbering |
| 12 | `0x23456789 After` -> `0x23456789. After` | Missing period |
| 13 | `top to bottom, and from left to right` -> `bottom to top, and from left to right` | Table rows are 0x10000200 (top), 0x100001F0, 0x100001E0 (bottom): addresses increase from bottom to top (as the ANS deck says) |
| 14 | `top to bottom, and from left to right` -> `bottom to top, and from left to right` | Consistency with the ANS deck (single-row table, no change in meaning) |

## Needs your decision / not fixed

- Slide 11/12 LDM and slide 12 notes: see ANS log; the slide 12 notes contain AI-chat text ("You are absolutely correct! ... I was wrong earlier") - recommend deleting the notes before distributing.
- Slide 10: "(d) longs" - on 32-bit ARM (Cortex-M) `long` is 4 bytes, so the "+8" in the ANS deck is only right for 64-bit long; consider specifying the data model or asking about `long long`.

## Notes

- Method: extracted all slide text, tables, grouped shapes, a14/OMML content inside mc:AlternateContent and speaker notes; rendered every slide with LibreOffice and inspected pictures; re-computed worked examples by script. LibreOffice table layouts differ slightly from PowerPoint, so apparent clipping/overlap in renders was not treated as a content error.
- "Fall 2025" on the cover was changed to "Fall 2026" in all six decks (your course memory says Fall 2026). Revert if the cover year is intentionally the original delivery year.


## Follow-up edits (2026-10-08)

- S2: byte-address axis relabelled in hex. S10: (d) longs now states 4 bytes on 32-bit ARM/Cortex-M, new (e) long longs (8 bytes). S11: LDMIB variants replaced by LDMIA/LDMDB (r3 = 0x800C for LDMDB). S12: question assumes Cortex-M3/M4 (unaligned halfword OK); AI-chat text removed from the notes.
