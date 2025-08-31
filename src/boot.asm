; Licensed under Islam and Zagros License v1.1 – See LICENSE.txt
[BITS 16]
[ORG 0x7C00]

start:
    cli
;   sti
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00        ; Setup stack

    mov [boot_drive], dl  ; Save boot drive passed by BIOS

    ; Load 40 sectors (20 KiB) from sector 2 (LBA 1) to 0x1000
    mov ah, 0x02          ; BIOS read sectors function
    mov al, 40            ; Number of sectors to read
    mov ch, 0             ; Cylinder 0
    mov cl, 2             ; Sector 2 (start reading here)
    mov dh, 0             ; Head 0
    mov dl, [boot_drive]  ; Use saved boot drive
    mov bx, 0x1000        ; Load address at segment 0x0000, offset 0x1000
    int 0x13
    jc disk_error         ; Jump if error

    ; Setup GDT
    lgdt [gdt_descriptor]

    ; Enter protected mode
    mov eax, cr0
    or eax, 1
    mov cr0, eax

    ; Far jump to flush prefetch queue and enter protected mode
    jmp 0x08:protected_mode_start

disk_error:
    hlt
    jmp $

boot_drive: db 0         ; Variable to save boot drive number

; GDT (must be aligned to 8 bytes)
gdt_start:
    dq 0x0000000000000000       ; Null descriptor
    dq 0x00CF9A000000FFFF       ; Code segment (base=0, limit=4GB, exec/read)
    dq 0x00CF92000000FFFF       ; Data segment (base=0, limit=4GB, read/write)
gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

; Switch to 32-bit protected mode
[BITS 32]
protected_mode_start:
    mov ax, 0x10          ; Data segment selector
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax

    ; Jump to loaded kernel at 0x1000
    jmp 0x08:0x1000

times 510 - ($ - $$) db 0
dw 0xAA55
