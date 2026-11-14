
org 100h
jmp start

message db 'WELCOME Sir Col LAB', 0

start:
    mov si, offset message
    mov cx, 0

count_again:
    cmp byte ptr [si], 0
    je count_done

    inc cx
    inc si
    jmp count_again

count_done:
    nop
    mov ax, 4Ch
    int 21h





