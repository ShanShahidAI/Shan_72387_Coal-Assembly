org 100h

mov ah, 00h
mov al, 03h
int 10h

mov ax, 0           
mov cx, 1           

sum_loop:
    add ax, cx      
    inc cx          
    cmp cx, n
    jle sum_loop

mov sum, ax

mov dx, offset msg
mov ah, 09h
int 21h

mov ax, sum
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

n   dw 12
sum dw ?
msg db 'Sum = $'