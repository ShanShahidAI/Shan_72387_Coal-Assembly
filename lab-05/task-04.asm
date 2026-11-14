org 100h

mov ah, 00h
mov al, 03h
int 10h

mov al, 15          
mov bl, 28          
mov cl, 9          

cmp al, bl
jl check_two_three  

cmp al, cl
jl num3_larger      

mov dx, offset msg1
jmp show_result

check_two_three:

cmp bl, cl
jl num3_larger      

mov dx, offset msg2
jmp show_result

num3_larger:
mov dx, offset msg3

show_result:
mov ah, 09h
int 21h


mov ah, 4ch
int 21h

msg1 db 'Number 1 is larger$'
msg2 db 'Number 2 is larger$'
msg3 db 'Number 3 is larger$'