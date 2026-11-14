;count using loop
;shan/72387
org 100h

mov ax, 0000h
mov cx, 000Ah

COUNT:
    inc ax
    loop COUNT

ret





