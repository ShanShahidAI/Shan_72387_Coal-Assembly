
org 100h
jmp start

nums db 21,12,43,34,65,56,87,88

start:
    mov si, offset nums

    mov al, [si+1]
    mov bl, [si+3]
    mov cl, [si+7]

    nop
    mov ax, 4Ch
    int 21h


