org 100h

mov ah, 00h
mov al, 03h
int 10h

mov ax, num
mov bx, 0           

rev_loop:
    cmp ax, 0
    je print_result

    mov dx, 0
    mov cx, 10
    div cx          

    push ax         
    push dx         

    mov ax, bx      
    mov cx, 10
    mul cx          
    mov bx, ax      

    pop dx          
    add bx, dx      

    pop ax          
    jmp rev_loop

print_result:
    mov rev, bx

    mov dx, offset msg
    mov ah, 09h
    int 21h

    mov ax, rev
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

num dw 4693
rev dw ?
msg db 'Reverse = $'