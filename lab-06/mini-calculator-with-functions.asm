org 100h

menu_loop:
    mov dx, offset menu_text
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h
    mov choice, al

    mov dx, offset newline
    mov ah, 09h
    int 21h

    cmp choice, '5'
    je exit_program

    cmp choice, '1'
    jb invalid_choice
    cmp choice, '4'
    ja invalid_choice

    mov dx, offset prompt1
    mov ah, 09h
    int 21h
    call read_num
    mov num1, ax

    mov dx, offset prompt2
    mov ah, 09h
    int 21h
    call read_num
    mov num2, ax

    cmp choice, '1'
    je do_add
    cmp choice, '2'
    je do_sub
    cmp choice, '3'
    je do_mul
    cmp choice, '4'
    je do_div

do_add:
    mov ax, num1
    call print_num
    mov dx, offset msg_add
    mov ah, 09h
    int 21h
    mov ax, num2
    call print_num
    mov dx, offset msg_eq
    mov ah, 09h
    int 21h

    mov ax, num1
    mov bx, num2
    call AddProc
    call print_signed_num
    jmp repeat_menu

do_sub:
    mov ax, num1
    call print_num
    mov dx, offset msg_sub
    mov ah, 09h
    int 21h
    mov ax, num2
    call print_num
    mov dx, offset msg_eq
    mov ah, 09h
    int 21h

    mov ax, num1
    mov bx, num2
    call SubProc
    call print_signed_num
    jmp repeat_menu

do_mul:
    mov ax, num1
    call print_num
    mov dx, offset msg_mul
    mov ah, 09h
    int 21h
    mov ax, num2
    call print_num
    mov dx, offset msg_eq
    mov ah, 09h
    int 21h

    mov ax, num1
    mov bx, num2
    call MulProc
    call print_num
    jmp repeat_menu

do_div:
    mov ax, num2
    cmp ax, 0
    je div_zero_error

    mov ax, num1
    call print_num
    mov dx, offset msg_div
    mov ah, 09h
    int 21h
    mov ax, num2
    call print_num
    mov dx, offset msg_eq
    mov ah, 09h
    int 21h

    mov ax, num1
    mov bx, num2
    call DivProc
    call print_num
    jmp repeat_menu

div_zero_error:
    mov dx, offset err_zero
    mov ah, 09h
    int 21h
    jmp repeat_menu

invalid_choice:
    mov dx, offset err_choice
    mov ah, 09h
    int 21h

repeat_menu:
    mov dx, offset newline
    mov ah, 09h
    int 21h
    jmp menu_loop

exit_program:
    mov ah, 4ch
    int 21h

AddProc proc
    add ax, bx
    ret
AddProc endp

SubProc proc
    sub ax, bx
    ret
SubProc endp

MulProc proc
    mul bx
    ret
MulProc endp

DivProc proc
    mov dx, 0
    div bx
    ret
DivProc endp

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

print_signed_num proc
    push ax
    push bx
    push cx
    push dx

    cmp ax, 0
    jge print_pos

    push ax
    mov dl, '-'
    mov ah, 02h
    int 21h
    pop ax
    neg ax

print_pos:
    call print_num

    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_signed_num endp

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

choice     db ?
num1       dw ?
num2       dw ?

menu_text  db 0Dh, 0Ah, '--- Mini Calculator ---', 0Dh, 0Ah
           db '1. Add', 0Dh, 0Ah
           db '2. Subtract', 0Dh, 0Ah
           db '3. Multiply', 0Dh, 0Ah
           db '4. Divide', 0Dh, 0Ah
           db '5. Exit', 0Dh, 0Ah
           db 'Enter your choice: $'

prompt1    db 'Enter first number: $'
prompt2    db 'Enter second number: $'
err_zero   db 'Error: Division by zero!$'
err_choice db 'Invalid choice! Please select 1-5.$'
msg_add    db ' + $'
msg_sub    db ' - $'
msg_mul    db ' x $'
msg_div    db ' / $'
msg_eq     db ' = $'
newline    db 0Dh, 0Ah, '$'