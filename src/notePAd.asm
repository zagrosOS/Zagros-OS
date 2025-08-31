into_program_notepad:
    call draw_menu_for_key
    call top_about
    call how_exit

    ; your static UI text
    mov word [0xB80A0], 0x8231
    mov word [0xB8140], 0x8232
    mov word [0xB81E0], 0x8233
    mov word [0xB8280], 0x8234
    mov word [0xB8320], 0x8235
    mov word [0xB83C0], 0x8236
    mov word [0xB8460], 0x8236
    mov word [0xB8500], 0x8237
    mov word [0xB85A0], 0x8238
    mov word [0xB8640], 0x8239
    mov word [0xB86E0], 0x8231
    mov word [0xB86E2], 0x8230
    mov word [0xB8780], 0x8231
    mov word [0xB8782], 0x8231
    mov word [0xB8820], 0x8231
    mov word [0xB8822], 0x8232
    mov word [0xB88C0], 0x8231
    mov word [0xB88C2], 0x8233
    mov word [0xB8960], 0x8231
    mov word [0xB8962], 0x8234
    mov word [0xB8A00], 0x8231
    mov word [0xB8A02], 0x8235
    mov word [0xB8AA0], 0x8231
    mov word [0xB8AA2], 0x8236
    mov word [0xB8B40], 0x8231
    mov word [0xB8B42], 0x8237
    mov word [0xB8BE0], 0x8231
    mov word [0xB8BE2], 0x8238
    mov word [0xB8C80], 0x8231
    mov word [0xB8C82], 0x8239
    mov word [0xB8D20], 0x8232
    mov word [0xB8D22], 0x8230
    mov word [0xB80A2], 0x8200
    mov word [0xB8142], 0x8200
    mov word [0xB81E2], 0x8200
    mov word [0xB8282], 0x8200
    mov word [0xB8322], 0x8200	
    mov word [0xB83C2], 0x8200
    mov word [0xB8462], 0x8200
    mov word [0xB8502], 0x8200
    mov word [0xB85A2], 0x8200
    mov word [0xB8642], 0x8200
    mov word [0xB8DC0], 0x8232
    mov word [0xB8DC2], 0x8231

mov edi, 0xB80A6    ; start typing area
.wait_for_key:
    call wait_key
    cmp al, 0x3A      ; 'A' key
    je .toggle_caps
	cmp al, 0x01
	je enter_os
    cmp al, 0x1E
	je .press_A
	cmp al, 0x1C
	je .pixel
	cmp al, 0x0E
	je .removetest
	cmp al, 0x30
	je .press_B
	cmp al, 0x2E
	je .press_C
	cmp al, 0x20
	je .press_D
	cmp al, 0x12
	je .press_E
	cmp al, 0x21
	je .press_F
	cmp al, 0x22
	je .press_G
	cmp al, 0x32
	je .press_M
	cmp al, 0x18
	je .press_O
	cmp al, 0x2F
	je .press_V
	cmp al, 0x39
	je .press_ 
	cmp al, 0x1F
	je .press_S
	cmp al, 0x23
	je .press_H
	cmp al, 0x24
	je .press_J
	cmp al, 0x25
	je .press_K
	cmp al, 0x26
	je .press_L
	cmp al, 0x2C
	je .press_Z
	cmp al, 0x2D
	je .print_X
	cmp al, 0x31
	je .press_N
	cmp al, 0x11
	je .press_W
	cmp al, 0x13
	je .press_R
	cmp al, 0x14
	je .press_T
	cmp al, 0x15
	je .press_Y
	cmp al, 0x16
	je .press_U
	cmp al, 0x17
	je .press_I
	cmp al, 0x19
	je .press_P
	cmp al, 0x10
	je .press_Q

    jmp .wait_for_key

.toggle_caps:
    xor byte [caps_pressed], 1  ; toggle 0 ↔ 1
    jmp .wait_for_key
.press1:
    mov al, 0x31             ; default lowercase
    jz .pixel2
	jmp .press1                 ; convert to uppercase
.pixe9l2:
    mov ah, 0x07
    mov [edi], ax
    add edi, 2
    jmp .wait_for_key
.pixel:
	mov al, 0x77
	jz .pixel2
	jmp .removetest                 ; convert to uppercase
.pixel2:
    mov ah, 0x07
    mov [edi], ax
    add edi, 2
    jmp .wait_for_key
    
.removetest:
   mov al, ' '                ; default lowercase
    mov bl, [caps_pressed]
    test bl, 1
    jz .removelogic
	jmp .removetest                 ; convert to uppercase

.removelogic:
    mov ah, 0x07
    mov [edi], ax
    sub edi, 2
    jmp .wait_for_key

.press_A:
    mov al, 'a'                ; default lowercase
    mov bl, [caps_pressed]
    test bl, 1
    jz .print_A
    sub al, 32                 ; convert to uppercase

.print_A:
    mov ah, 0x07
    mov [edi], ax
    add edi, 2
    jmp .wait_for_key

.press_B:
	mov al, 'b'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_B
	sub al, 32                 ; convert to uppercase

.print_B:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_C:
	mov al, 'c'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_C
	sub al, 32                 ; convert to uppercase

.print_C:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key

.press_D:
	mov al, 'd'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_D
	sub al, 32                 ; convert to uppercase

.print_D:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_E:
	mov al, 'e'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_E
	sub al, 32                 ; convert to uppercase

.print_E:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_F:
	mov al, 'f'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_F
	sub al, 32                 ; convert to uppercase

.print_F:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_G:
	mov al, 'g'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_G
	sub al, 32                 ; convert to uppercase

.print_G:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_M:
	mov al, 'm'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_M
	sub al, 32                 ; convert to uppercase

.print_M:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_O:
	mov al, 'o'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_O
	sub al, 32                 ; convert to uppercase

.print_O:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_V:
	mov al, 'v'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_V
	sub al, 32                 ; convert to uppercase

.print_V:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_ :
	mov al, 'o'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_ 
	jmp .press_                ; convert to uppercase

.print_ :
	mov ah, 0x00
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_S:
	mov al, 's'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_S
	sub al, 32                 ; convert to uppercase

.print_S:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_H:
	mov al, 'h'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_H
	sub al, 32                 ; convert to uppercase

.print_H:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_J:
	mov al, 'j'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_J
	sub al, 32                 ; convert to uppercase

.print_J:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_K:
	mov al, 'k'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_K
	sub al, 32                 ; convert to uppercase

.print_K:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_L:
	mov al, 'l'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_K
	sub al, 32                 ; convert to uppercase

.print_L:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_Z:
	mov al, 'z'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_Z
	sub al, 32                 ; convert to uppercase

.print_Z:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_X:
	mov al, 'x'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_X
	sub al, 32                 ; convert to uppercase

.print_X:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_N:
	mov al, 'n'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_N
	sub al, 32                 ; convert to uppercase

.print_N:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_W:
	mov al, 'w'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_W
	sub al, 32                 ; convert to uppercase

.print_W:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_R:
	mov al, 'r'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_R
	sub al, 32                 ; convert to uppercase

.print_R:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_T:
	mov al, 't'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_T
	sub al, 32                 ; convert to uppercase

.print_T:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_Y:
	mov al, 'y'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_Y
	sub al, 32                 ; convert to uppercase

.print_Y:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_U:
	mov al, 'u'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_U
	sub al, 32                 ; convert to uppercase

.print_U:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_I:
	mov al, 'i'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_I
	sub al, 32                 ; convert to uppercase

.print_I:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_P:
	mov al, 'p'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_P
	sub al, 32                 ; convert to uppercase

.print_P:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
.press_Q:
	mov al, 'q'                ; default lowercase
	mov bl, [caps_pressed]
	test bl, 1
	jz .print_Q
	sub al, 32                 ; convert to uppercase

.print_Q:
	mov ah, 0x07
	mov [edi], ax
	add edi, 2
	jmp .wait_for_key
