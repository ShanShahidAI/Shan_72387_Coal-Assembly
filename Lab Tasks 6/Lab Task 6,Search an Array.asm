org 100h

mov ah, 00h
mov al, 03h
int 10h

lea si, arr
mov cx, 10
mov bx, 0

search_loop:
    mov ax, [si]
    cmp ax, target
    je found

    add si, 2
    inc bx
    loop search_loop

    mov dx, offset msg_not_found
    mov ah, 09h
    int 21h
    jmp exit

found:
    mov index, bx

    mov dx, offset msg_found
    mov ah, 09h
    int 21h

    mov ax, index
    call print_num

exit:
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

arr             dw 5, 9, 2, 8, 10, 3, 7, 1, 6, 4
target          dw 8
index           dw ?
msg_found       db 'Found at index $'
msg_not_found   db 'Not found$'