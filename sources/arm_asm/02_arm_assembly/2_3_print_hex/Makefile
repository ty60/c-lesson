print_hex.bin: print_hex.s
	arm-none-eabi-as print_hex.s -o print_hex.o
	arm-none-eabi-ld print_hex.o -Ttext 0x00010000 -o print_hex.elf
	arm-none-eabi-objcopy print_hex.elf -O binary print_hex.bin
run:
	qemu-system-arm -M versatilepb -m 128M -nographic -kernel print_hex.bin -serial mon:stdio
debug:
	qemu-system-arm -M versatilepb -m 128M -nographic -kernel print_hex.bin -serial mon:stdio -s -S
clean:
	rm -f print_hex.o print_hex.elf
