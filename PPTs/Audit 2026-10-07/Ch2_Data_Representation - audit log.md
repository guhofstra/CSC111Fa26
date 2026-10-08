# Ch2_Data_Representation.pptx - audit log

## Summary
43 slides, 17 edits (incl. 2 speaker notes). Output: out/Ch2_Data_Representation.pptx (validate.py PASSED, 43 slides). Recomputed: range tables (slides 4, 23), conversions (52 = 110100, 32 = 100000), TC examples (slides 12-14, 16, 17), 8-bit table (18), sign extension (19), -2^7+... = -69 and TC method (22), proof ranges (25), (-9)+6 and (-9)-6 (32, 33), ASCII table (all 128 hex/char pairs checked by script), "ARM Assembly" string (37), string ordering (38), toUpper constants (40). All numbers were correct except as listed.

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 22 | "If the MSR sign bit ... MSR sign bit" -> "MSB" (x2) | typo |
| 24 | "adding two positive numbers but getting a non-positive result" -> "negative result" | positive+positive overflow always gives a negative result (matches slide 26) |
| 25 | "A n-bit signed int" -> "An n-bit" | grammar |
| 39 | "Stings are terminated" -> "Strings" | typo |
| 40 | `for(i = 0; c; i++, c = pStr[i];) {` -> `... pStr[i]) {` | syntax error (stray ;) |
| 40 | curly quotes/en dash in C code (`’a’`, `‘a’ – ‘A’`) -> `'a'`, `'a' - 'A'` | not compilable when copied |
| 37 | `“ARM Assembly”` (2x) -> `"ARM Assembly"` | C string literal |
| 36 | ASCII 96 shown as ‘ and 39 as ’ -> ` (backtick) and ' | exact ASCII glyphs |
| 18 | hard-coded slide number "15" -> "18" | copy/paste leftover |
| Notes 7, 8 | "borrow bit is set when the result is positive ... cleared when negative" -> "carry flag is set (C = 1, i.e. borrow = 0) when the result is non-negative ... cleared (C = 0, borrow = 1) when negative"; "can represented" -> "can be represented" | old note contradicted slides 8/35 (borrow = NOT carry) |

## Needs your decision / not fixed
- Slide 34: table of N/Z/C/V is labelled "CPSR (Current Program Status Register)"; on Cortex-M the flags are in APSR (part of xPSR) - Ch1 slide 11 says xPSR. Suggest "APSR/xPSR" (cross-deck consistency; also appears in Chxx_Review slide 7 and ZDELETED slide 6).
- Slide 36: "Unicode 0 - 65535" - Unicode code space is 0 to 0x10FFFF (65,536 is only the BMP / UCS-2). Suggest "Unicode: up to 0x10FFFF (UTF-8/16/32)".
- Slide 41: empty slide (no title/content) - delete or fill.
- Slide 14: the explanatory text box overlaps the table in the render (layout only).
- Slide 17 and notes: wording "(in decimal 3 + 29 = 32)" fine; no change.

## Notes
- Slides 6-8, 26-27 contain OMML formulas inside AlternateContent; all read and correct (e.g. sum >= 2^4, sum < -2^4 for 5 bits).
