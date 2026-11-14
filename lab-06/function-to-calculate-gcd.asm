org 100h

mov ah, 00h
mov al, 03h
int 10h

mov ax, num1
mov bx, num2
call GCD

mov result, ax

mov dx, offset msg
mov ah, 09h
int 21h

mov ax, result
call print_num

mov ah, 4ch
int 21h

GCD proc
    push bx
    push dx

gcd_loop:
    cmp bx, 0
    je gcd_done

    mov dx, 0
    div bx
    mov ax, bx
    mov bx, dx
    jmp gcd_loop

gcd_done:
    pop dx
    pop bx
    ret
GCD endp

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

num1   dw 49
num2   dw 19
result dw ?
msg    db 'GCD = $'