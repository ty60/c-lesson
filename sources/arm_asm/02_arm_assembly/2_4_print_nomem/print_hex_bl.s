.globl _start
_start:

  mov r0, r15
  bl print_hex

  mov r0, #0x68
  bl print_hex

end:
  b end


print_hex:
    ldr r1, =0x101f1000
    // print first digit
    and r2, r0, #0xf0
    lsr r2, r2, #4
    ldr r3, =hex
    add r3, r2, r3
    ldrb r3, [r3]
    str r3, [r1]
    // print second digit
    and r2, r0, #0x0f
    ldr r3, =hex
    add r3, r2, r3
    ldrb r3, [r3]
    str r3, [r1]
    // new line
    mov r3, #0x0a
    str r3, [r1]
    mov r15, r14

hex:
    .asciz "0123456789abcdef"
