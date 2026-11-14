
org 100h
;72387_Shan_Col_Assignmen_1
; Screen
mov ah, 00h
mov al, 03h
int 10h
;72387_Shan_Col_Assignmen_1
;Calculate Total Marks (85 + 78 + 90 + 72 + 75 = 400)
mov ax, 0
mov al, sub1
add al, sub2
adc ah, 0
add al, sub3
adc ah, 0
add al, sub4
adc ah, 0
add al, sub5
adc ah, 0
mov total, ax
;72387_Shan_Col_Assignmen_1
;Calculate Percentage (Total / 5)
mov dx, 0
mov ax, total
mov bx, 5
div bx
mov percentage, ax
;72387_Shan_Col_Assignmen_1
;Display Total Marks
mov dx, offset msg_total
mov ah, 09h
int 21h

mov ax, total
call print_num

mov dx, offset newline
mov ah, 09h
int 21h
;72387_Shan_Col_Assignmen_1
;Display Percentage
mov dx, offset msg_perc
mov ah, 09h
int 21h

mov ax, percentage
call print_num

mov dl, '%'
mov ah, 02h
int 21h

mov dx, offset newline
mov ah, 09h
int 21h
;72387_Shan_Col_Assignmen_1
;Grade Determination
mov dx, offset msg_grade
mov ah, 09h
int 21h

mov ax, percentage

cmp ax, 80
jae grade_a

cmp ax, 70
jae grade_b

cmp ax, 60
jae grade_c

cmp ax, 50
jae grade_d

mov dl, 'F'
jmp print_grade

grade_a:
mov dl, 'A'
jmp print_grade

grade_b:
mov dl, 'B'
jmp print_grade

grade_c:
mov dl, 'C'
jmp print_grade

grade_d:
mov dl, 'D'

print_grade:
mov ah, 02h
int 21h
;72387_Shan_Col_Assignmen_1
; Exit Program
mov ah, 4ch
int 21h
;72387_Shan_Col_Assignmen_1
; Multi-Digit Printing Procedure
print_num proc
    mov cx, 0
    mov bx, 10
div_loop:
    mov dx, 0
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne div_loop

print_loop:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_loop
    ret
print_num endp

; Data Section
sub1        db 85
sub2        db 78
sub3        db 90
sub4        db 72
sub5        db 75

total       dw 0
percentage  dw 0

msg_total   db 'Total Marks: $'
msg_perc    db 'Percentage: $'
msg_grade   db 'Grade: $'
newline     db 0Dh, 0Ah, '$'

