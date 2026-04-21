.section .data

Numbers:
    .long 1
    .long 15
    .long 4
    .long 2
    .long 7
    .long 9
    .long 23
    .long 7
    .long 3
    .long 11

Array_length:
    .long 10


.section .text
.globl _start

_start:
    movl Array_length, %edx
    subl $1, %edx
    movl $0, %ecx
    movl Numbers, %eax
    jmp .L1

.L1:
    cmpl %edx, %ecx
    jg done
    jmp .L2

.L2:
    cmpl %eax, Numbers(, %ecx, 4)
    jle .L3

.L3_skip:
    incl %ecx
    jmp .L1

.L3:
    movl Numbers(, %ecx, 4), %eax
    jmp .L3_skip

done:
    movl $60, %eax
    movl $0, %edi
    syscall



