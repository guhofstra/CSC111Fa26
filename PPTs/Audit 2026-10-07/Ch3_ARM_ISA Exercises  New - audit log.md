# Audit log: Ch3_ARM_ISA Exercises  New.pptx (7 slides; two spaces before "New")

## Summary
- THIS FILE is a duplicate of "Ch3_ARM_ISA Exercises ANS.pptx" (slide text identical, including the title "Exercises ANS"; one revision older). Recommend keeping only the ANS file. Details below are the same as the ANS log.
- Answer deck for "Ch3_ARM_ISA Exercises.pptx" (Q slides 2, 4, 6 are identical to that deck; A slides 3, 5, 7). Saved 2025-12-30 (rev 300): CURRENT.
- "Ch3_ARM_ISA Exercises  New.pptx" has identical slide text and is one revision earlier (rev 299, 20 s older, contains a changesInfos part); it is effectively a duplicate. The same edits were applied to both.
- Recomputed: slide 3 answers (Big-endian: MSB at N, MS half-word at N; Little-endian: N+3 and N+2) are correct. Slide 7: bytes 0x20008000..03 = EE 8C 90 A7 -> big-endian word 0xEE8C90A7, little-endian word 0xA7908CEE: correct.
- 3 edits; validation passed.

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 5 | Word 3 address "0x0012" -> "0x000C" | Word 3 starts at byte address 12 (decimal) = 0x0C; 0x0012 would be decimal 18 and is not even a word-aligned address. Words 2, 1, 0 (0x0008, 0x0004, 0x0000) were already right |
| 4, 5 | "memory address of these four words" -> "memory addresses of these four words" | grammar |

## Needs your decision / not fixed
- Slide 5: the diagram's byte labels (0000-0015) are decimal while answers carry the "0x" prefix; after the fix "0x000C" sits beside the label "0012". Either relabel the diagram in hex or write the answers as decimal 12/8/4/0.
- Slides 6 and 7 speaker notes: stale text about "halfword access ... added in v4T ... Link: diagram on next slide", unrelated to this slide. Suggest deleting.
- Slide 1 "Spring 2026" term label.

## Notes
- Slide 7 table overflows the slide bottom in the LibreOffice render; check in PowerPoint.


## Additional change (cover label)

Slide 1 semester label "Fall 2025" / "Spring 2026" -> "Fall 2026" (CSC111Fa26), so all lecture decks carry the same term. Revert if the old label was intentional.
