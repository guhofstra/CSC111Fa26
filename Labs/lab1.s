.data
message: .ascii	"Hello World!\n"

.text
.global main
main:
	push	{ip, lr}
	ldr	r0, =message	@ Load the starting address of the message
	bl	printf	@ Call the printf function
	mov	r0, #0	@ Return 0.
	pop	{ip, pc}



.data
message: .ascii   "Hello World!\n"
length = . - message

.text
.global main
main:
    @ write syscall
    mov r0, #1           @ For stdout
    ldr r1, =message     @ buffer is loaded with message
    ldr r2, =length      @ count is the length of message
    mov r7, #4           @ write is syscall 4
    mov r2, #3
    swi 0                @ interrupt

    @ exit syscall
    mov r7, #1
    swi 0

