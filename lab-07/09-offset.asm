
org 100h
jmp start

byte_values db 7 dup(0)
word_values dw 5 dup(0)

word_text dw 'A','B','C',0

start:
    mov si, offset byte_values
    mov di, offset word_values
    mov bx, offset word_text

    nop
    mov ax, 4Ch
    int 21h





