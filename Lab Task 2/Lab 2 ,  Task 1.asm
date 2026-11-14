org 100h

mov ah, 00h
mov al, 03h
int 10h

mov dx, offset array   
mov ah, 09h            
int 21h                

mov ah, 4ch
int 21h
       
array db 'H', 'E', 'L', 'L', 'O',' ','S','H','A','N','$'