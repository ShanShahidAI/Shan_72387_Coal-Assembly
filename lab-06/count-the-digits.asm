org 100h

mov ah, 00h
mov al, 03h
int 10h

mov ax, num
mov count, 0

cmp ax, 0
jne count_digits
mov count, 1
jmp print_result

count_digits:
    mov bx, 10

digit_loop:
    cmp ax, 0
    je print_result
    mov dx, 0
    div bx
    inc count
    jmp digit_loop

print_result:
    mov dx, offset msg
    mov ah, 09h
    int 21h

    mov ax, count
    call print_num

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

num     dw 58821
count   dw ?
msg     db 'Number of digits = $'