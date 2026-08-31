# ARM Control Flow - Multiple Choice Questions

Based on Chapter 6: ARM Control Flow Programming

---

## Questions

### Question 1
Which condition flag is set to 1 when the result of an operation is zero?

A) N (Negative flag)  
B) Z (Zero flag)  
C) C (Carry flag)  
D) V (Overflow flag)

### Question 2
For unsigned subtraction, when is the Carry flag (C) set to 0?

A) When no borrow occurs  
B) When a borrow occurs  
C) When the result is negative  
D) When overflow occurs

### Question 3
The Overflow flag (V) is set to 1 when:

A) Adding two different-signed numbers  
B) Adding two same-signed numbers produces opposite sign result  
C) Performing any multiplication  
D) Using MOV instruction

### Question 4
What does the CMP instruction do?

A) Saves the result of Rn - Op2  
B) Performs Rn - Op2 and discards the result  
C) Performs Rn + Op2 and sets flags  
D) Moves Op2 to Rn

### Question 5
The TST instruction performs which operation?

A) Rn + Op2  
B) Rn - Op2  
C) Rn & Op2 (bitwise AND)  
D) Rn ^ Op2 (bitwise XOR)

### Question 6
When using TEQ instruction, the Z flag is set to 1 when:

A) Rn is greater than Op2  
B) Rn and Op2 are equal  
C) Rn is less than Op2  
D) An overflow occurs

### Question 7
Which instruction branches to a label and saves the return address in the link register (r14)?

A) B label  
B) BX Rm  
C) BL label  
D) BLX Rm

### Question 8
For signed comparison, which branch instruction is used for 'greater than'?

A) BHI  
B) BGT  
C) BHS  
D) BLO

### Question 9
The BGE (Branch if signed Greater or Equal) instruction tests which condition?

A) N = 1  
B) Z = 1  
C) N = V  
D) C = 1

### Question 10
Which values represent 0xFFFFFFFF and 0x00000001 when interpreted as unsigned numbers?

A) -1 and 1  
B) 4294967295 and 1  
C) 1 and -1  
D) 255 and 1

### Question 11
In the instruction 'ADDLT r3, r2, r1', when is the ADD operation executed?

A) When N = V  
B) When N != V  
C) When Z = 1  
D) When C = 1

### Question 12
In a for loop implementation using 'SUBS r1, r1, #1' followed by 'BNE loop', what does this accomplish?

A) Increments counter and loops if zero  
B) Decrements counter and loops if not zero  
C) Sets flags without changing register  
D) Unconditional branch

### Question 13
The CBZ instruction is equivalent to which sequence?

A) CMP Rn, #0; BNE label  
B) CMP Rn, #0; BEQ label  
C) ADD Rn, #0; BEQ label  
D) SUB Rn, #0; BNE label

### Question 14
For signed comparison after 'CMP r0, r1', if N=0 and V=0, what can be concluded?

A) r0 < r1  
B) r0 >= r1  
C) r0 = r1  
D) Overflow occurred

### Question 15
In ARM Thumb-2, what does 'ITE' stand for in IT blocks?

A) If-Then-Else with 2 instructions  
B) If-Then-End  
C) Iterate-Then-Exit  
D) If-Test-Execute

### Question 16
Which condition code tests for 'unsigned higher'?

A) HS  
B) HI  
C) GT  
D) GE

### Question 17
In the assembly sequence 'TEQ r0, #'!'; TEQNE r0, #'?'', what programming concept is being implemented?

A) Logical AND  
B) Logical OR with short-circuit evaluation  
C) Nested if statements  
D) Switch statement

### Question 18
The BLS (Branch if unsigned Lower or Same) instruction tests which condition?

A) C=0 or Z=1  
B) C=1 and Z=0  
C) N=V  
D) N!=V

### Question 19
Which method is used to update condition flags with arithmetic operations?

A) Always automatic  
B) Append 'S' to instruction or use compare instructions  
C) Use special flag register  
D) Only with branch instructions

### Question 20
In break and continue statements, what is the key difference in assembly implementation?

A) Break uses BEQ, continue uses BNE  
B) Break branches out of loop, continue branches to loop increment/test  
C) Break sets flags, continue doesn't  
D) No difference in assembly

---

## Answer Key

**Question 1:** B - The Z (Zero) flag is set to 1 when all bits of the result are 0.

**Question 2:** B - For unsigned subtraction, C = 0 (borrow = 1) when borrow takes place, meaning the true result < 0.

**Question 3:** B - V = 1 when adding 2 same-signed numbers produces a result with the opposite sign (Positive + Positive = Negative, or Negative + Negative = Positive).

**Question 4:** B - CMP performs subtraction Rn - Op2, same as SUBS, except the result is discarded (not written to destination register).

**Question 5:** C - TST performs bitwise AND on Rn and Op2, same as ANDS, except the result is discarded.

**Question 6:** B - TEQ performs XOR operation. If Rn and Op2 are equal, then Rn ⊕ Op2 is zero, and Z is set to 1.

**Question 7:** C - BL (Branch with Link) copies the address of the next instruction into r14 (link register) and branches to the label.

**Question 8:** B - BGT (Branch if signed Greater Than) is used for signed comparison, while BHI is for unsigned comparison.

**Question 9:** C - BGE tests the condition N = V, which indicates signed greater than or equal.

**Question 10:** B - When interpreted as unsigned 32-bit numbers, 0xFFFFFFFF = 4294967295 and 0x00000001 = 1.

**Question 11:** B - ADDLT (Add if signed Less Than) executes when N != V, indicating a signed less than condition.

**Question 12:** B - SUBS decrements the counter and sets flags, BNE branches back to loop if the result is not zero (Z=0).

**Question 13:** B - CBZ Rn, label is equivalent to CMP Rn, #0 followed by BEQ label, except CBZ doesn't change status flags.

**Question 14:** B - When N=0 and V=0, there's no overflow and the result is non-negative, so r0 - r1 >= 0, meaning r0 >= r1.

**Question 15:** A - ITE stands for If-Then-Else, allowing 2 following instructions where the first executes if condition is true, second if false.

**Question 16:** B - HI (unsigned HIgher) tests C=1 & Z=0, while HS tests C=1 (unsigned Higher or Same).

**Question 17:** B - This implements logical OR (||) with short-circuit evaluation. The second TEQ only executes if the first test failed (NE condition).

**Question 18:** A - BLS tests C=0 or Z=1, meaning either the carry is clear (indicating lower) or zero flag is set (indicating same).

**Question 19:** B - Method 1: append 'S' (like ADDS) to update flags with result. Method 2: use compare instructions (CMP, CMN, TEQ, TST) that set flags only.

**Question 20:** B - Break branches completely out of the loop (to end), while continue branches to the loop's increment/condition test part to start the next iteration.

---

## Quick Reference Summary

### Key Condition Codes:
- **EQ/NE**: Z=1 / Z=0 (Equal/Not Equal)
- **LT/GE**: N≠V / N=V (Signed Less Than/Greater Equal)
- **GT/LE**: Z=0 & N=V / Z=1 or N≠V (Signed Greater/Less Equal)
- **LO/HS**: C=0 / C=1 (Unsigned Lower/Higher Same)
- **HI/LS**: C=1 & Z=0 / C=0 or Z=1 (Unsigned Higher/Lower Same)

### Flag Setting Instructions:
- **CMP**: Rn - Op2 (result discarded)
- **TST**: Rn & Op2 (result discarded)
- **TEQ**: Rn ⊕ Op2 (result discarded)
- **CMN**: Rn + Op2 (result discarded)