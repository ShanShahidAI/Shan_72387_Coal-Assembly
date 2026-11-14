org 100h


mov al, 56
mov bl, 87
mov cl, 91


cmp al, bl
jge check_c
mov al, bl          

check_c:

cmp al, cl
jge store
mov al, cl          

store:
mov largest, al    


mov dx, offset msg
mov ah, 09h
int 21h


mov al, largest    
mov ah, 00h         
mov bl, 10
div bl              

mov cl, ah          


mov dl, al
add dl, '0'        
mov ah, 02h
int 21h


mov dl, cl
add dl, '0'       
mov ah, 02h
int 21h


mov ah, 4ch
int 21h


msg     db 'Largest = $'
largest db ?