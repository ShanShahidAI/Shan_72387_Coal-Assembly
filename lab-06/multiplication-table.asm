org 100h

mov ah, 00h
mov al, 03h
int 10h

mov cx, 1

table_loop:
    mov ax, n
    call print_num

    mov dx, offset msg_x
    mov ah, 09h
    int 21h

    mov ax, cx
    call print_num

    mov dx, offset msg_eq
    mov ah, 09h
    int 21h

    mov ax, n
    mul cx
    call print_num

    mov dx, offset newline
    mov ah, 09h
    int 21h

    inc cx
    cmp cx, 10
    jle table_loop

    mov ah, 4ch
    int 21h

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

n       dw 9
msg_x   db ' x $'
msg_eq  db ' = $'
newline db 0Dh, 0Ah, '$'