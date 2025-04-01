.globl startup
.equ STACK_POINTER_TOP, 2048

.balign 4
.section .text.startup
startup:
    li sp, STACK_POINTER_TOP

    call main

.end
