
org 100h
jmp start

pos_byte db 29
neg_byte db -6

pos_word dw 400
neg_word dw -200

start:
    mov al, pos_byte
    mov bl, neg_byte
    mov cx, pos_word
    mov dx, neg_word

    nop
    mov ax, 4Ch
    int 21h




