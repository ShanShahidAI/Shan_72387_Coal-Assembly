org 100h

;---Black Window---
mov ah, 00h
mov al, 03h
int 10h

;---First Number---
mov dx, offset msg1
mov ah, 09h
int 21h

mov ah, 01h            
int 21h
sub al, '0'            
mov bl, al             

mov dx, offset newline
mov ah, 09h
int 21h

;---Second Number Operation---
mov dx, offset msg2
mov ah, 09h
int 21h

mov ah, 01h            
int 21h
mov bh, al

mov dx, offset newline
mov ah, 09h
int 21h 

;---Third Number---
mov dx, offset msg3
mov ah, 09h
int 21h

mov ah, 01h            
int 21h
sub al, '0'            
mov cl, al    

mov dx, offset newline
mov ah, 09h
int 21h

;---Check Operator---
cmp bh, '+'
je do_add

cmp bh, '-'
je do_sub

cmp bh, '*'
je do_mul

cmp bh, '/'
je do_div 

jmp exit_program

;--- Addition ---
do_add:
    mov al, bl
    add al, cl          
    jmp show_result

;--- Subtraction ---
do_sub:
    mov al, bl
    sub al, cl          
    jmp show_result

;--- Multiplication ---
do_mul:
    mov al, bl
    mul cl             
    jmp show_result

;--- Division --- 
do_div:
    mov ah, 00h
    mov al, bl
    div cl             
    jmp show_result 

;--- Result Display ---
show_result:
    mov ch, al             ;

    ; "Result: " print karna
    mov dx, offset msg4
    mov ah, 09h
    int 21h

    ; 10 se divide karke 2 digits alag karna
    mov ah, 00h            
    mov al, ch             
    mov bl, 10
    div bl                 
                           

    mov cl, ah             

    ; 1. Pehla digit print karein
    mov dl, al
    add dl, '0'            
    mov ah, 02h
    int 21h

    ; 2. Doosra digit print karein
    mov dl, cl
    add dl, '0'            
    mov ah, 02h
    int 21h

    jmp exit_program

;--- Program Exit ---
exit_program:
    mov ah, 4ch
    int 21h


msg1    db 'Enter First Number : $'
msg2    db 'Enter Operator (+, -, *, /): $'
msg3    db 'Enter Second Number : $'
msg4    db 'Result: $'
newline db 0Dh, 0Ah, '$'