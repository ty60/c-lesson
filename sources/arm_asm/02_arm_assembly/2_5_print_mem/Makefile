TGT := putchar_mem
BIN := $(TGT).bin
ELFS := $(TGT).elf

MAKEFLAGS += --no-builtin-rules
.SUFFIXES:
.PRECIOUS: %.o

all: $(TGT).bin

$(BIN): $(ELFS)
	arm-none-eabi-objcopy $^ -O binary $@

%.elf: %.o
	arm-none-eabi-ld $^ -Ttext 0x00010000 -o $@

%.o: %.s
	arm-none-eabi-as $^ -o $@

run:
	qemu-system-arm -M versatilepb -m 128M -nographic -kernel $(TGT).bin -serial mon:stdio

debug:
	qemu-system-arm -M versatilepb -m 128M -nographic -kernel $(TGT).bin -serial mon:stdio -s -S

clean:
	rm -f *.o *.elf *.bin
