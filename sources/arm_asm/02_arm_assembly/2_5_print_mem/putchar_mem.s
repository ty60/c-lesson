.globl _start
_start:
    ldr r13,=0x08000000
    ldr r0,=msg1
    bl print
    ldr r0,=msg2
    bl print
end:
    b end

putchar:
    stmdb r13!, {r0, r1}
    ldr r1,=0x101f1000
    str r0, [r1]
    ldmia r13!, {r0, r1}
    mov r15, r14


print:
    stmdb r13!, {r0-r5, r14}
    mov r4, r0
    ldrb r3,[r4]
_loop:
    mov r0, r3
    bl putchar
    add r4, r4, #1
    ldrb r3,[r4]
    cmp r3,#0
    bne _loop
    ldmia r13!, {r0-r5, r14}
    mov r15, r14

msg1: .asciz "First text.\n"
msg2: .asciz "Second text!\n"
