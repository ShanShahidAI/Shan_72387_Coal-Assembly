org 100h

mov ah, 00h
mov al, 03h
int 10h

mov al, -9

cmp al, 0
je is_zero           
jl is_negative       

mov dx, offset msg_pos
jmp display

is_zero:
mov dx, offset msg_zero
jmp display

is_negative:
mov dx, offset msg_neg

display:
mov ah, 09h
int 21h

mov ah, 4ch
int 21h
msg_pos  db 'The number is Positive.$'
msg_neg  db 'The number is Negative.$'
msg_zero db 'The number is Zero.$'