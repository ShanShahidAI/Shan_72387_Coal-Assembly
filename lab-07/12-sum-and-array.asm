
org 100h
jmp start

marks dw 89,57,60,83

total dw 0
average dw 0

start:
    mov si, offset marks
    mov cx, 4
    mov ax, 0

sum_marks:
    add ax, [si]
    add si, 2
    loop sum_marks

    mov total, ax

    mov dx, 0
    mov bx, 4
    div bx

    mov average, ax

    nop
    mov ax, 4Ch
    int 21h





