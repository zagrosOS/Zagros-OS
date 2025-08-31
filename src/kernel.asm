; Licensed under Islam and Zagros License v1.0 – See LICENSE.txt
[BITS 32]
[ORG 0x1000]
section .data
caps_pressed: db 0

section .text
_start:
	cli   ; Setup segments
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov esp, 0x90000        ; stack
    call draw_menu
    call print_about_text
.hang2:
    call wait_key
    cmp al, 0x1C
    je enter_os
 	jmp .hang2 
enter_os:
	call draw_menu_green
	call therebethere
	call print_app_name

;-------------------start-up-screen------------------------------------------------
print_about_text:

    mov esi, text
    mov edi, 0xB8028      ; Position to print
    call print_string

    mov edi, 0xB80B0      ; New line
    mov esi, text1
    call print_string

	mov esi, text5;	
	mov edi, 0xB8f00
	call print_string

	mov esi, text4
	mov edi, 0xB8150
	call print_string

	mov esi, enter_start
	mov edi, 0xB8E00
	call green_string 

	mov esi, waring
	mov edi, 0xB8830
	call waring_string

	ret
;-------------------texts----------------------------------------------------------
text db "Allah is the God of everything.", 0
text1 db "Zagros-OS", 0
text4 db "Zagros-OS is a 32bit (E-bit)OS make in full assembly", 0
text5 db "indev 0.0.1", 0
about1 db "about", 0
about2 db "menu", 0
;app_name db "clac", 0 is coming soon
app_name1 db "NotePad", 0
text_about_top db "about Zagros-OS", 0
app_about_info db "Zagros-OS Is OS Make In Assembly Only And is support:", 0
line1_about db "1. Ps2 Keybord", 0
line2_about db "2. Vga-Text-Mode", 0
line3_about db "3. Support old hardware", 0
line4_about db "4. Work In Low Ram Like In 1.01MB of ram", 0
line5_about db "5. Work In Very old cpu But only cpu Support 32Bit", 0
line6_about db "But Zagros-OS have fix like:", 0
line7_about db "1. Use 100% cpu", 0
line8_about db "2. Cant Use More Ram Then about 10kib If Say Why Is Os Is 32bit Can Use 4GB Is Kernel Start at 0x1000 Not can up to 0xFFFF If up Is remove Anyting.", 0
who_make_it db "Zagros-OS Make Be Dahen Nawzad", 0
line_about_copy db "Copyright (C) 2025 ZagrosASM INDEV 0.0.1", 0
enter_start db "Press {Enter} to Start Menu OS", 0
waring db "!Note!:if dont have PS2 keybord this os not working with", 0
exit db "Press [Esc] to exit" , 0
show_pages db "Page 1-4",0
coming_soon db "coming soon!", 0
;-------------------includes--------------------------------------------------------
%include "menu.asm"
;-----------------------------programs----------------------------------------------
into_program_about:
	call draw_menu
	call top_about
	mov esi, show_pages
	mov edi, 0xB807C
	call print_string
	mov esi, text_about_top
	mov edi, 0xB803C
    call print_string
	mov esi, app_about_info
	mov edi, 0xB80A0
	call print_string
	mov esi, line1_about
	mov edi, 0xB814C
	call print_string
	mov esi, line2_about
	mov edi, 0xB81EC
	call print_string
	mov esi, line3_about
	mov edi, 0xB828C
	call print_string
	mov esi, line4_about
	mov edi, 0xB832C
	call print_string
	mov esi, line5_about
	mov edi, 0xB83CC
	call print_string
	mov esi, line6_about
	mov edi, 0xB85A0
	call print_string
	mov esi, line7_about
	mov edi, 0xB864C
	call print_string
	mov esi, line8_about
	mov edi, 0xB86EC
	call print_string
	mov esi, who_make_it
	mov edi, 0xB8AA0
	call print_string
	mov esi, line_about_copy
	mov edi, 0xB8B40
	call print_string
.wait_for_key:
	call wait_key
    cmp al, 0x01
    je enter_os
	jmp .wait_for_key
;===========================================
into_program_clac:
	call draw_menu
	call top_about
	call how_exit
	mov esi, coming_soon
	mov edi, 0xB803C
	call print_string
.wait_for_key:
	call wait_key
    cmp al, 0x01
    je enter_os
	jmp .wait_for_key
;===========================================
%include "notePAd.asm"
;----------------------------helper-calls--------------------------------------------

how_exit:
	mov esi, exit
	mov edi, 0xB807A
	call print_string
	ret
waring_string:
.next_char:
    lodsb
    test al, al
    jz .done
    mov ah, 0x84
    stosw
    jmp .next_char
.done:
    ret
green_string:
.next_char:
    lodsb
    test al, al
    jz .done
    mov ah, 0x8A
    stosw
    jmp .next_char
.done:
    ret
print_string_black:
.next_char:
    lodsb
    test al, al
    jz .done
    mov ah, 0x82
    stosw
    jmp .next_char
.done:
    ret
;===========================================
print_string:
.next_char:
    lodsb
    test al, al
    jz .done
    mov ah, 0x82
    stosw
    jmp .next_char
.done:
    ret
;===========================================
wait_key:
.loop:
    in al, 0x64          ; Read status register
    test al, 1           ; Check if output buffer is full
    jz .loop             ; Not ready, loop
    in al, 0x60          ; Read scancode into AL
    ret
;============================================
print_string_black_on_blue:
.next_char:
    lodsb
    test al, al
    jz .done
    mov ah, 0x10     ; Green text on black
    stosw
    jmp .next_char
.done:
    ret
;============================================
top_about:
	mov edi, 0xB8000
	mov ecx, 80
.loop:
	mov ax, 0xFF20
	stosw
	loop .loop
	ret
;============================================
text_about_top_print:
	mov esi, text_about_top
	mov edi, 0xB803C
    call print_string
	mov esi, app_about_info
	mov edi, 0xB80A0
	call print_string
	ret
;----------------------------------moveing-------------------------------------------
print_app_name:
	mov esi, about1
	mov edi, 0xB83D6
	call print_string_black_on_blue
    mov esi, about2
    mov edi, 0xB8020
    call print_string_black
	mov esi, coming_soon
	mov edi, 0xB83FE
	call print_string
	mov esi, app_name1
	mov edi, 0xB8428
	call print_string
	mov esi, text5
	mov edi, 0xB8f00
	call print_string	
.wait_for_key:
    call wait_key
    cmp al, 0x1C
    je into_program_about
    cmp al, 0x4D
    je move
    jmp .wait_for_key 
    ret
;=============================================
move:
	mov esi, about1
	mov edi, 0xB83D6
	call print_string
    mov esi, about2
    mov edi, 0xB8020
    call print_string_black
	mov esi, coming_soon
	mov edi, 0xB83FE 
	call print_string_black_on_blue
	mov esi, app_name1
	mov edi, 0xB8428
	call print_string
.wait_for_key:
	call wait_key
	nop
	cmp al, 0x1C      ; Enter
	je into_program_clac
	cmp al, 0x4B      ; Left arrow
	je enter_os
	cmp al, 0x4D      ; Right arrow
	je nextmove
	jmp .wait_for_key
;=============================================
nextmove:
	mov esi, app_name1
	mov edi, 0xB8428
	call print_string_black_on_blue
	mov esi, coming_soon
	mov edi, 0xB83FE
	call print_string
.wait_for_key:
	call wait_key
    cmp al, 0x1C
	je into_program_notepad
	cmp al, 0x4B
	je move
	jmp .wait_for_key
