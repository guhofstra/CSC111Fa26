/*
 * ARMv7 Assembly Bubble Sort Implementation
 * Sorts an array of 32-bit signed integers in ascending order
 * 
 * Function: bubble_sort
 * Parameters:
 *   r0 = pointer to array (base address)
 *   r1 = array length (number of elements)
 * Returns: nothing (sorts in place)
 * 
 * Registers used:
 *   r0 = array base address
 *   r1 = array length / outer loop limit
 *   r2 = current element index
 *   r3 = next element index  
 *   r4 = current element value
 *   r5 = next element value
 *   r6 = swap flag (0 = no swaps, 1 = swaps occurred)
 *   r7 = temporary register for calculations
 */

.text
.global bubble_sort
.global _start

@ ============================================================================
@ BUBBLE SORT FUNCTION
@ ============================================================================

bubble_sort:
    push    {r2-r7, lr}         @ Save registers on stack

    cmp     r1, #2              @ Check if array has less than 2 elements
    blt     sort_done           @ If so, nothing to sort

outer_loop:
    mov     r2, #0              @ Reset current index to 0
    mov     r6, #0              @ Reset swap flag to 0 (no swaps)
    sub     r7, r1, #1          @ r7 = array_length - 1 (inner loop limit)

inner_loop:
    @ Load current and next elements
    ldr     r4, [r0, r2, lsl #2]    @ r4 = array[r2] (current element)
    add     r3, r2, #1              @ r3 = r2 + 1 (next index)
    ldr     r5, [r0, r3, lsl #2]    @ r5 = array[r3] (next element)

    @ Compare elements
    cmp     r4, r5              @ Compare current with next
    ble     no_swap             @ If current <= next, skip swap

    @ Swap elements (current > next)
    str     r5, [r0, r2, lsl #2]    @ Store next in current position
    str     r4, [r0, r3, lsl #2]    @ Store current in next position
    mov     r6, #1                  @ Set swap flag

no_swap:
    add     r2, r2, #1          @ Increment current index
    cmp     r2, r7              @ Compare with inner loop limit
    blt     inner_loop          @ Continue if more elements to compare

    @ Check if any swaps occurred
    cmp     r6, #0              @ Check swap flag
    bne     outer_loop          @ If swaps occurred, repeat outer loop

sort_done:
    pop     {r2-r7, pc}         @ Restore registers and return

@ ============================================================================  
@ COCKTAIL SORT (Bidirectional Bubble Sort)
@ ============================================================================

cocktail_sort:
@ TODO Your implementation here 

@ ============================================================================
@ EXAMPLE USAGE AND TEST DATA This section must be removed if you use the main.c
@ as test harness. If you do not use main.c, then you can keep this section, but it 
@ does not print out the sorted array, so you will need to use debugger to inspect 
@ registers to verify that the array is sorted.
@ ============================================================================

@_start:
     @ Test the bubble sort function
@    ldr     r0, =test_array     @ Load array address
@    ldr     r1, =array_size     @ Load array size address
@    ldr     r1, [r1]            @ Dereference to get actual size

@    bl      bubble_sort         @ Call bubble sort function

@    @ Exit program
@    mov     r7, #1              @ System call number for exit
@    mov     r0, #0              @ Exit status
@    svc     #0                  @ System call

@ ============================================================================
@ DATA SECTION
@ ============================================================================

.data
.align 4

@ Test array with unsorted integers
test_array:
    .word   64, 34, 25, 12, 22, 11, 90, 5, 77, 30

@ Array size (number of elements)
array_size:
    .word   10

@ Alternative test arrays for different scenarios

@ Already sorted array (best case)
sorted_array:
    .word   1, 2, 3, 4, 5, 6, 7, 8, 9, 10
sorted_size:
    .word   10

@ Reverse sorted array (worst case)  
reverse_array:
    .word   10, 9, 8, 7, 6, 5, 4, 3, 2, 1
reverse_size:
    .word   10

@ Small array
small_array:
    .word   3, 1, 2
small_size:
    .word   3

@ Single element array
single_array:
    .word   42
single_size:
    .word   1

.end
