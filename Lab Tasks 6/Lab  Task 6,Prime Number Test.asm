org 100h

mov ah, 00h
mov al, 03h
int 10h

mov ax, num
call print_num

mov ax, num
cmp ax, 2
jl not_prime
je is_prime

mov cx, 2

check_loop:
    mov ax, cx
    mul ax
    cmp ax, num
    ja is_prime

    mov dx, 0
    mov ax, num
    div cx
    cmp dx, 0
    je not_prime

    inc cx
    jmp check_loop

is_prime:
    mov dx, offset msg_prime
    mov ah, 09h
    int 21h
    jmp exit

not_prime:
    mov dx, offset msg_not_prime
    mov ah, 09h
    int 21h

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

num           dw 34
msg_prime     db ' is prime.$'
msg_not_prime db ' is not prime.$'