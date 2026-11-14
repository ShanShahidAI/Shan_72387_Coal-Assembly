org 100h

mov al, 35
mov bl, 28

cmp al, bl
je equal
jge show
mov al, bl          

show:
mov largest, al
mov dx, offset msg
mov ah, 09h
int 21h

mov ah, 4ch
int 21h

equal:
mov dx, offset eq_msg
mov ah, 09h
int 21h

mov ah, 4ch
int 21h

msg     db 'Larger number found $'
eq_msg  db 'Both numbers are equal$'
largest db ?



