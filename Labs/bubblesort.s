@ ============================================================================  
@ BUBBLE SORT
@ Sorts an array of 32-bit signed integers in ascending order
@ Function: bubble_sort
@ Parameters:
@   r0 = pointer to array (base address)
@   r1 = array length (number of elements)
@  Returns: nothing (sorts in place)
@ ============================================================================

    .text
    .arch armv7-a
    .syntax unified
    .arm

    .global bubble_sort
    .type bubble_sort, %function
bubble_sort:
    @ Prologue: save callee-saved registers and LR
    push {r4, r5, r6, r7, lr}

    @ if (n < 2) return;
    cmp    r1, #2
    blt    bubble_sort_done

    @ outer_count = n - 1
    sub    r4, r1, #1       @ r4 = outer_count

outer_loop:
    movs   r5, #0           @ r5 = swapped = 0
    mov    r6, r4           @ r6 = inner_count = outer_count
    mov    r7, r0           @ r7 = ptr (current element address)

inner_loop:
    ldr    r2, [r7]         @ r2 = a[j]
    ldr    r3, [r7, #4]     @ r3 = a[j+1]
    cmp    r2, r3
    ble    no_swap          @ if a[j] <= a[j+1] skip swap

    @ swap a[j], a[j+1]
    str    r3, [r7]
    str    r2, [r7, #4]
    movs   r5, #1           @ swapped = 1

no_swap:
    add    r7, r7, #4       @ advance ptr by 1 int
    subs   r6, r6, #1       @ inner_count--
    bne    inner_loop

    cmp    r5, #0
    beq    bubble_sort_done @ if !swapped -> array is sorted, exit

    subs   r4, r4, #1       @ outer_count--
    bne    outer_loop

bubble_sort_done:
    @ Epilogue: restore registers and return
    pop    {r4, r5, r6, r7, pc}

    .size bubble_sort, .-bubble_sort


@ ============================================================================  
@ COCKTAIL SORT (Bidirectional Bubble Sort)
@ ============================================================================

cocktail_sort:
@ TODO Your implementation here. Keep the same code for Forward pass (left to right), 
@ and adding a separate Backward pass (right to left) 

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
