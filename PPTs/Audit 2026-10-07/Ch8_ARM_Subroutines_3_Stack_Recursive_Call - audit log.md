# Ch8_ARM_Subroutines_3_Stack_Recursive_Call.pptx - audit log

## Summary
33 slides audited. The recursive factorial(3) trace (slides 15-32) was simulated frame by frame: stack frames at 0x200005FC/5F8 (saved lr = 0x134, r4 = 0), 5F4/5F0 (0x148, 3), 5EC/5E8 (0x148, 2); r0 progression 1 -> 2 -> 6; final pc 0x134, sp 0x20000600, r4 = 0, r0 = 6; instruction addresses (BL 0x130, stop 0x134, entry 0x136, ... B loop 0x14C). The fib(5) tree (all 15 nodes and returned values) and the C factorial return chain (2, 6, 24, 120) were checked. 6 fixes. Output: out/Ch8_ARM_Subroutines_3_Stack_Recursive_Call.pptx (33 slides, validate.py passed).

## Changes made
| Slide | Before -> After | Why |
|---|---|---|
| 1 | Fall 2025 -> Fall 2026 | Stale semester |
| 4 | "6! = 6 x 5 x 4!" (letter x) -> multiplication sign | Consistent with the other lines |
| 4 | `Factorial(n – 1)` (en dash) -> `n - 1` | Not valid C |
| 6 | `int fib(int n)` / last line -> added `{` and closing `}` | Function body was missing braces |
| 30 | PC box 0x08000148 -> 0x08000140 | On "Return from factorial(3)" the red arrow is at `POP {r4, pc}` (0x140), as in slide 27 for factorial(2); 0x148 was copied from slide 29 |

## Needs your decision / not fixed
- Slide 5 vs slide 6: slide 5 defines f(0) = f(1) = 1 (sequence 1,1,2,3,5,...; code returns 1 for n <= 1), but slide 6 uses fib(0)=0, fib(1)=1 (returns n), giving fib(5) = 5 instead of 8. Pick one definition for both slides (the fix on slide 6 would require editing the picture-free tree values too).
- Slides 15, 18, 21: callouts "1st/2nd/3rd recursive call factorial(3/2/1)". factorial(3) is the initial call from main; the first recursive call is factorial(2). Suggest "1st/2nd/3rd call".
- Slide 25 shows the post-POP state (pc 0x148, sp 0x5F0, r4 = 2) for "Return from factorial(1)", whereas slides 27 and 30 show the pre-POP state followed by a post-POP slide (28, 31). Numbers are right in each slide; only the convention differs.
- Slide 9: C version tests `n==1`, so factorial(0) recurses forever (slides 4 and 5 use `n < 2`, `n <= 1`); same limitation in the assembly (slides 11-14, `CMP r4,#1; BNE`). Consider `n < 2` / `BHI`.
- Slide 21 contains a second hidden/overlapping caption "3rd recursive call 2 * factorial(1)" in addition to the visible one; consider deleting.
- Slide 33 table renders cramped in LibreOffice; slide 33 lists "SP alignment", which is not covered in the deck.

## Notes
- Slide 9/12 pictures: return values 2, 6, 24, 120 line up with the correct calls.
