org 100h

  mov al, 15
  mov bl, 18
  cmp al, bl
  jg first_larger
  jl Second_larger          

  mov dx, offset msg_equal
  mov ah, 09h
  int 21h 
  jmp exit
  
first_larger:
  mov dx, offset msg1      
  mov ah, 09h
  int 21h
  jmp exit                  
     
Second_larger:
  mov dx, offset msg2            
  mov ah, 09h
  int 21h  
  
exit:
  mov ah, 4ch
  int 21h

msg1       db 'First number is larger$'
msg2       db 'Second number is larger$'
msg_equal  db 'Both numbers are equal$'