
org 100h
jmp start

FACTOR_A equ 6
FACTOR_B equ 7

product dw 0

start:
    mov ax, FACTOR_A
    mov bx, FACTOR_B

    mul bx
    mov product, ax

    nop
    mov ax, 4Ch
    int 21h




