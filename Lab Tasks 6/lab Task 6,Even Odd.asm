

org 100h

 mov al, 19
 test al, 01h
 jz even_number 
 
odd_number:
 mov dx, offset oddMsg
 mov ah, 09h
 int 21h
 jmp exit
 
even_number:
 mov dx, offset evenMsg
 mov ah, 09h
 int 21h
 
exit:
 mov ah,4Ch
 int 21h

oddMsg db 'Number is Odd.$'
evenMsg db 'Number is Even.$'
ret




