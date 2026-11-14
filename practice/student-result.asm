org 100h

mov ah, 00h
mov al, 03h
int 10h

mov dx, offset prompt_total
mov ah, 09h
int 21h

call read_num
mov total_students, ax

mov pass_count, 0
mov fail_count, 0

student_loop:
    cmp total_students, 0
    je show_summary

    mov dx, offset prompt_name
    mov ah, 09h
    int 21h

    mov dx, offset buffer_name
    mov ah, 0Ah
    int 21h

    mov si, offset buffer_name + 1
    mov cl, [si]
    mov ch, 0
    add si, cx
    inc si
    mov byte ptr [si], '$'

    mov dx, offset newline
    mov ah, 09h
    int 21h

    mov dx, offset prompt_m1
    mov ah, 09h
    int 21h
    call read_num
    mov m1, ax

    mov dx, offset prompt_m2
    mov ah, 09h
    int 21h
    call read_num
    mov m2, ax

    mov dx, offset prompt_m3
    mov ah, 09h
    int 21h
    call read_num
    mov m3, ax

    mov ax, m1
    add ax, m2
    add ax, m3
    mov total_marks, ax

    mov dx, 0
    mov bx, 3
    div bx
    mov percentage, ax

    mov dx, offset msg_out_name
    mov ah, 09h
    int 21h
    mov dx, offset buffer_name + 2
    mov ah, 09h
    int 21h

    mov dx, offset newline
    mov ah, 09h
    int 21h

    mov dx, offset msg_out_tot
    mov ah, 09h
    int 21h
    mov ax, total_marks
    call print_num

    mov dx, offset newline
    mov ah, 09h
    int 21h

    mov dx, offset msg_out_per
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

    mov dx, offset msg_out_grd
    mov ah, 09h
    int 21h

    cmp percentage, 90
    jge grade_aplus
    cmp percentage, 80
    jge grade_a
    cmp percentage, 70
    jge grade_b
    cmp percentage, 60
    jge grade_c
    cmp percentage, 50
    jge grade_d
    jmp grade_fail

grade_aplus:
    mov dx, offset grd_aplus
    mov ah, 09h
    int 21h
    inc pass_count
    jmp next_student

grade_a:
    mov dx, offset grd_a
    mov ah, 09h
    int 21h
    inc pass_count
    jmp next_student

grade_b:
    mov dx, offset grd_b
    mov ah, 09h
    int 21h
    inc pass_count
    jmp next_student

grade_c:
    mov dx, offset grd_c
    mov ah, 09h
    int 21h
    inc pass_count
    jmp next_student

grade_d:
    mov dx, offset grd_d
    mov ah, 09h
    int 21h
    inc pass_count
    jmp next_student

grade_fail:
    mov dx, offset grd_f
    mov ah, 09h
    int 21h
    inc fail_count

next_student:
    mov dx, offset newline
    mov ah, 09h
    int 21h
    dec total_students
    jmp student_loop

show_summary:
    mov dx, offset msg_pass
    mov ah, 09h
    int 21h
    mov ax, pass_count
    call print_num

    mov dx, offset newline
    mov ah, 09h
    int 21h

    mov dx, offset msg_fail
    mov ah, 09h
    int 21h
    mov ax, fail_count
    call print_num

    mov ah, 4ch
    int 21h

read_num proc
    push bx
    push cx
    push dx
    mov bx, 0
read_loop:
    mov ah, 01h
    int 21h
    cmp al, 13
    je read_done
    cmp al, '0'
    jb read_loop
    cmp al, '9'
    ja read_loop
    sub al, '0'
    mov ah, 0
    push ax
    mov ax, bx
    mov cx, 10
    mul cx
    mov bx, ax
    pop ax
    add bx, ax
    jmp read_loop
read_done:
    mov dx, offset newline
    mov ah, 09h
    int 21h
    mov ax, bx
    pop dx
    pop cx
    pop bx
    ret
read_num endp

print_num proc
    push ax
    push bx
    push cx
    push dx
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
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_num endp

total_students dw ?
pass_count     dw 0
fail_count     dw 0
m1             dw ?
m2             dw ?
m3             dw ?
total_marks    dw ?
percentage     dw ?

buffer_name    db 30, ?, 30 dup('$')

prompt_total   db 'Enter number of students: $'
prompt_name    db 0Dh, 0Ah, 'Enter student name: $'
prompt_m1      db 'Enter marks 1: $'
prompt_m2      db 'Enter marks 2: $'
prompt_m3      db 'Enter marks 3: $'

msg_out_name   db 'Name: $'
msg_out_tot    db 'Total Marks: $'
msg_out_per    db 'Percentage: $'
msg_out_grd    db 'Grade: $'

grd_aplus      db 'A+$'
grd_a          db 'A$'
grd_b          db 'B$'
grd_c          db 'C$'
grd_d          db 'D$'
grd_f          db 'Fail$'

msg_pass       db 0Dh, 0Ah, 'Total Students Passed: $'
msg_fail       db 'Total Students Failed: $'
newline        db 0Dh, 0Ah, '$'