/*
 arm-none-eabi-as print_hex.s -o print_hex.o
 arm-none-eabi-ld print_hex.o -Ttext 0x00010000 -o print_hex.elf
 arm-none-eabi-objcopy print_hex.elf -O binary print_hex.bin
 qemu-system-arm -M versatilepb -m 128M -nographic -kernel print_hex.bin -serial mon:stdio
*/
.globl _start
_start:
    ldr r0, =0x101f1000
    ldr r1,=0xdeadbeaf
    b print_hex
print_hex:
    // print hex digit
    ldrb r2, =0xf0000000
    and r2, r1, r2
    lsr r2, r2, #28
    ldr r3, =hex_digits
    add r3, r2, r3
    ldrb r4, [r3]
    strb r4, [r0]
    // shift left and goto next loop
    lsl r1, r1, #4
    cmp r1, #0
    bne print_hex
    mov r4, #0xa
    strb r4, [r0]
end:
    b end

hex_digits:
    .asciz "0123456789abcdef"
