; Licensed under Islam and Zagros License v1.0 – See LICENSE.txt
ASM = nasm
ASMFLAGS = -f bin
BOOT = boot.asm
KERNEL = kernel.asm
OSIMG = Zagros-OS.bin
FLPIMG = Zagros-OS.flp

all: $(FLPIMG)

boot.bin: $(BOOT)
	$(ASM) $(ASMFLAGS) $< -o $@

kernel.bin: $(KERNEL)
	$(ASM) $(ASMFLAGS) $< -o $@

$(OSIMG): boot.bin kernel.bin
	dd if=boot.bin of=$(OSIMG) bs=512 count=1 conv=notrunc
	dd if=kernel.bin of=$(OSIMG) bs=512 seek=1 conv=notrunc

$(FLPIMG): $(OSIMG)
	# create 1.44 MB empty floppy
	dd if=/dev/zero of=$(FLPIMG) bs=512 count=2880
	# copy OS image (boot + kernel) into first sectors
	dd if=$(OSIMG) of=$(FLPIMG) bs=512 conv=notrunc

clean:
	rm -f boot.bin kernel.bin $(OSIMG) $(FLPIMG)
