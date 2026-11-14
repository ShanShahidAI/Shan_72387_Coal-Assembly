org 100h

mov ah, 00h
mov al, 03h
int 10h

mov dx, offset msg_input
mov ah, 09h
int 21h

mov bx, 0

read_loop:
    mov ah, 01h
    int 21h
    cmp al, 0Dh
    je show_conversions
    sub al, '0'
    mov ah, 0
    push ax
    mov ax, bx
    mov cx, 10
    mul cx
    mov bx, ax
    pop ax
    add bx, ax
    jmp read_loop

show_conversions:
    mov dx, offset newline
    mov ah, 09h
    int 21h

    mov dx, offset msg_bin
    mov ah, 09h
    int 21h

    mov cx, 16
print_bin:
    rol bx, 1
    jc print_one
    mov dl, '0'
    jmp print_bit
print_one:
    mov dl, '1'
print_bit:
    mov ah, 02h
    int 21h
    loop print_bin

    mov dx, offset newline
    mov ah, 09h
    int 21h

    mov dx, offset msg_hex
    mov ah, 09h
    int 21h

    mov cx, 4
print_hex:
    rol bx, 4
    mov dl, bl
    and dl, 0Fh
    cmp dl, 9
    jbe hex_digit
    add dl, 7
hex_digit:
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_hex

    mov dx, offset newline
    mov ah, 09h
    int 21h

    mov ah, 4ch
    int 21h

msg_input db 'Enter Decimal Number and press Enter: $'
msg_bin   db 'Binary: $'
msg_hex   db 'Hexadecimal: $'
newline   db 0Dh, 0Ah, '$'