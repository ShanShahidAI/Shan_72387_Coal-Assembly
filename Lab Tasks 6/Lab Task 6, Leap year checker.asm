org 100h

mov ah, 00h
mov al, 03h
int 10h

mov ax, year
call print_num

mov dx, 0
mov ax, year
mov bx, 400
div bx
cmp dx, 0
je is_leap

mov dx, 0
mov ax, year
mov bx, 100
div bx
cmp dx, 0
je not_leap

mov dx, 0
mov ax, year
mov bx, 4
div bx
cmp dx, 0
je is_leap

not_leap:
mov dx, offset msg_not_leap
mov ah, 09h
int 21h
jmp exit

is_leap:
mov dx, offset msg_leap
mov ah, 09h
int 21h

exit:
mov ah, 4ch
int 21h

print_num proc
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
    ret
print_num endp

year            dw 2028
msg_leap        db ' is a leap year.$'
msg_not_leap    db ' is not a leap year.$'