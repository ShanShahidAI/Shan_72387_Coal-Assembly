org 100h

mov ah, 00h
mov al, 03h
int 10h

lea si, arr
mov ax, [si]
mov sum, ax
mov max, ax

mov cx, 9
add si, 2

traversal_loop:
    mov ax, [si]
    add sum, ax

    cmp ax, max
    jle skip_max
    mov max, ax

skip_max:
    add si, 2
    loop traversal_loop

mov dx, offset msg_sum
mov ah, 09h
int 21h

mov ax, sum
call print_signed_num

mov dx, offset msg_max
mov ah, 09h
int 21h

mov ax, max
call print_signed_num

mov ah, 4ch
int 21h

print_signed_num proc
    push ax
    push bx
    push cx
    push dx

    cmp ax, 0
    jge print_positive

    push ax
    mov dl, '-'
    mov ah, 02h
    int 21h
    pop ax
    neg ax

print_positive:
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
print_signed_num endp

arr     dw 7, 12, -3, 8, 19, 9, 7, -5, 11, 6
sum     dw ?
max     dw ?
msg_sum db 'Sum = $'
msg_max db ', Maximum = $'