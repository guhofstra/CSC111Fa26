/*
 * ARMv7 Assembly Bubble Sort Implementation
 * Sorts an array of 32-bit signed integers in ascending order
 * 
 * Function: bubble_sort
 * Parameters:
 *   r0 = pointer to array (base address)
 *   r1 = array length (number of elements)
 * Returns: nothing (sorts in place)
 */

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
