org 100h

mov al, 14

test al, 1                
jz is_even                 

lea dx, msg_odd
jmp display

is_even:
lea dx, msg_even

display:

mov ah, 09h
int 21h

mov ah, 4ch
int 21h

msg_even db "The number is Even.$"
msg_odd  db "The number is Odd.$"