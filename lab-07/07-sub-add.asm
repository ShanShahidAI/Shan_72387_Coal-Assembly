
org 100h
jmp start

a dw 26
b dw 13
c dw 7
d dw 3

result dw 0

start:
    mov ax, a
    add ax, b

    mov bx, c
    add bx, d

    sub ax, bx
    mov result, ax

    nop
    mov ax, 4Ch
    int 21h





