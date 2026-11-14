org 100h

mov ah, 00h
mov al, 03h
int 10h

mov ax, base
call print_num

mov dl, '^'
mov ah, 02h
int 21h

mov ax, exponent
call print_num

mov dx, offset msg_eq
mov ah, 09h
int 21h

mov ax, base
mov cx, exponent
call Power

call print_num

mov ah, 4ch
int 21h

Power proc
    push bx
    push cx

    mov bx, ax
    mov ax, 1

    cmp cx, 0
    je power_done

power_loop:
    mul bx
    loop power_loop

power_done:
    pop cx
    pop bx
    ret
Power endp

print_num proc
    push ax
    push bx
    push cx
    push dx

    mov cx, 0
    mov bx, 10

div_loop:
    mov dx, 0
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne div_loop

print_loop:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_loop

    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_num endp

base     dw 4
exponent dw 4
msg_eq   db ' = $'