org 100h

mov ah, 00h
mov al, 03h
int 10h

mov al, marks


cmp al, 0
jl invalid_input    
cmp al, 100
jg invalid_input    


cmp al, 80
jge grade_a       

cmp al, 70
jge grade_b         

cmp al, 60
jge grade_c        

cmp al, 50
jge grade_d         


mov dl, 'F'
jmp show_grade

grade_a:
mov dl, 'A'
jmp show_grade

grade_b:
mov dl, 'B'
jmp show_grade

grade_c:
mov dl, 'C'
jmp show_grade

grade_d:
mov dl, 'D'

show_grade:

push dx             
mov dx, offset msg
mov ah, 09h
int 21h
pop dx             


mov ah, 02h
int 21h
jmp exit

invalid_input:
mov dx, offset err_msg
mov ah, 09h
int 21h

exit:
mov ah, 4ch
int 21h


marks   db 69
msg     db 'Grade = $'
err_msg db 'Invalid Marks! Range must be 0-100.$'