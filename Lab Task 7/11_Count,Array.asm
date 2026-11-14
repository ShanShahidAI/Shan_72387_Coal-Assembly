
org 100h
jmp start

result dw 0

start:
    mov ax, 6
    mov bx, 2

    add ax, bx
    mov result, ax

    mov si, offset result
    mov cx, [si]

    nop
    mov ax, 4Ch
    int 21h





