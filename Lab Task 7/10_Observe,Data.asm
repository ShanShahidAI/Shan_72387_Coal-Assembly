
org 100h
jmp start

b1 db 11h
w1 dw 1324h

b2 db 22h
w2 dw 5768h

start:
    mov si, offset b1
    mov di, offset w1

    nop
    mov ax, 4Ch
    int 21h





