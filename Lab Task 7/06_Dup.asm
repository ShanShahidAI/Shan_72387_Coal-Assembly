
org 100h
jmp start

zeros db 16 dup(0)
spare db 10 dup(?)
stars db 6 dup('*'), 0

start:
    mov si, offset zeros
    mov di, offset stars

    mov al, [si+17]
    mov bl, [di+6]

    nop
    mov ax, 4Ch
    int 21h



