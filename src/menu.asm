draw_menu:
    mov edi, 0xB8000      
    mov ecx, 1840
.loop:
    mov ax, 0x8F20 
	stosw
    loop .loop
    ret
draw_menu_for_key:
    mov edi, 0xB8000      
    mov ecx, 1840
.loop:
    mov ax, 0x0000 
	stosw
    loop .loop
    ret
    
draw_menu_gray2:
    mov edi, 0xB8000      ; Start of text screen
    mov ecx, 1840         ; 80 characters (1 row)
.loop:
    mov ax, 0x0000        ; Green on black, space char (0x20)
    stosw
    loop .loop
    ret
draw_menu_green:
    mov edi, 0xB8000      ; Start of text screen
    mov ecx, 2000          ; 80 characters (1 row)


.loop:
    mov ax, 0x2220        ; Green on black, space char (0x20)
    stosw
    loop .loop
    ret

therebethere:
	call therebethere0
	call therebethere1
	call therebethere2
	call therebethere3
	call therebethere4
	call therebethere5
	call therebethere6
	ret
therebethere0:
    mov edi, 0xB8320      ; Start of text screen
    mov ecx, 80           ; 80 characters (1 row)


.loop:
    mov ax, 0xFF20        ; Green on black, space char (0x20)
    stosw
    loop .loop
    ret

    
therebethere1:
    mov edi, 0xB8820      ; Start of text screen
    mov ecx, 80           ; 80 characters (1 row)


.loop:
    mov ax, 0xFF20        ; Green on black, space char (0x20)
    stosw
    loop .loop
    ret

therebethere2:
    mov edi, 0xB8D20     ; Start of text screen
    mov ecx, 80           ; 80 characters (1 row)


.loop:
    mov ax, 0xFF20        ; Green on black, space char (0x20)
    stosw
    loop .loop
    ret
therebethere3:
	mov word [0xB8000], 0xFF20
	mov word [0xB80A0], 0xFF20
	mov word [0xB8140], 0xFF20
	mov word [0xB81E0], 0xFF20
	mov word [0xB8280], 0xFF20
	mov word [0xB83C0], 0xFF20
	mov word [0xB8460], 0xFF20
	mov word [0xB8500], 0xFF20
	mov word [0xB85A0], 0xFF20
	mov word [0xB8640], 0xFF20
	mov word [0xB86E0], 0xFF20
	mov word [0xB8780], 0xFF20
	mov word [0xB88C0], 0xFF20
	mov word [0xB8960], 0xFF20
	mov word [0xB8A00], 0xFF20
	mov word [0xB8AA0], 0xFF20 
	mov word [0xB8B40], 0xFF20
	mov word [0xB8BE0], 0xFF20
	mov word [0xB8C80], 0xFF20
	ret
therebethere4:
    mov edi, 0xB8DC0     ; Start of text screen
    mov ecx, 240           ; 80 characters (1 row)


.loop:
    mov ax, 0xFF20        ; Green on black, space char (0x20)
    stosw
    loop .loop
    ret
therebethere5:
    mov edi, 0xB8000     ; Start of text screen
    mov ecx, 80           ; 80 characters (1 row)


.loop:
    mov ax, 0xFF20        ; Green on black, space char (0x20)
    stosw
    loop .loop
    ret
    
therebethere6:
	mov word [0xB809E], 0xFF20
	mov word [0xB813E], 0xFF20
	mov word [0xB81DE], 0xFF20
	mov word [0xB827E], 0xFF20
	mov word [0xB831E], 0xFF20
	mov word [0xB845E], 0xFF20
	mov word [0xB84FE], 0xFF20
	mov word [0xB859E], 0xFF20
	mov word [0xB863E], 0xFF20
	mov word [0xB86DE], 0xFF20
	mov word [0xB877E], 0xFF20
	mov word [0xB881E], 0xFF20
	mov word [0xB895E], 0xFF20
	mov word [0xB89FE], 0xFF20
	mov word [0xB8A9E], 0xFF20
	mov word [0xB8B3E], 0xFF20
	mov word [0xB8BDE], 0xFF20
	mov word [0xB8C7E], 0xFF20
	mov word [0xB8D1E], 0xFF20
	mov word [0xB8E5E], 0xFF20
	ret
