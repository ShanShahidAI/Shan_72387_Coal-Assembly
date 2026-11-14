org 100h

mov ah, 00h
mov al, 03h
int 10h

menu_loop:
    mov dx, offset menu_text
    call print_str

    mov ah, 01h
    int 21h
    mov choice, al
    call print_nl

    cmp choice, '1'
    je call_deposit
    cmp choice, '2'
    je call_withdraw
    cmp choice, '3'
    je call_balance
    cmp choice, '4'
    je exit_bank

    mov dx, offset err_choice
    call print_str
    call print_nl
    jmp menu_loop

call_deposit:
    call deposit
    jmp menu_loop

call_withdraw:
    call withdraw
    jmp menu_loop

call_balance:
    call checkBalance
    jmp menu_loop

exit_bank:
    call print_nl
    mov dx, offset msg_final_bal
    call print_str
    mov ax, balance
    call print_num
    call print_nl

    mov dx, offset msg_tot_dep
    call print_str
    mov ax, dep_count
    call print_num
    call print_nl

    mov dx, offset msg_tot_wd
    call print_str
    mov ax, wd_count
    call print_num
    call print_nl

    mov ah, 4ch
    int 21h

deposit proc
    mov dx, offset prompt_dep
    call print_str
    call read_num
    mov temp_val, ax

    cmp temp_val, 0
    jle dep_invalid

    mov ax, temp_val
    add balance, ax
    inc dep_count
    mov dx, offset msg_dep_ok
    call print_str
    call print_nl
    ret

dep_invalid:
    mov dx, offset err_amount
    call print_str
    call print_nl
    ret
deposit endp

withdraw proc
    mov dx, offset prompt_wd
    call print_str
    call read_num
    mov temp_val, ax

    cmp temp_val, 0
    jle wd_invalid

    mov ax, temp_val
    cmp ax, balance
    ja wd_insufficient

    sub balance, ax
    inc wd_count
    mov dx, offset msg_wd_ok
    call print_str
    call print_nl
    ret

wd_insufficient:
    mov dx, offset err_funds
    call print_str
    call print_nl
    ret

wd_invalid:
    mov dx, offset err_amount
    call print_str
    call print_nl
    ret
withdraw endp

checkBalance proc
    mov dx, offset msg_cur_bal
    call print_str
    mov ax, balance
    call print_num
    call print_nl
    ret
checkBalance endp

print_str proc
    mov ah, 09h
    int 21h
    ret
print_str endp

print_nl proc
    push dx
    push ax
    mov dx, offset newline
    mov ah, 09h
    int 21h
    pop ax
    pop dx
    ret
print_nl endp

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
    call print_nl
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

balance        dw 10000[cite: 23]
dep_count      dw 0[cite: 24]
wd_count       dw 0[cite: 24]
temp_val       dw ?
choice         db ?

menu_text      db 0Dh, 0Ah, '=== BANK SIMULATOR ===', 0Dh, 0Ah[cite: 24]
               db '1. Deposit money', 0Dh, 0Ah[cite: 24]
               db '2. Withdraw money', 0Dh, 0Ah[cite: 24]
               db '3. Check balance', 0Dh, 0Ah[cite: 24]
               db '4. Exit', 0Dh, 0Ah[cite: 24]
               db 'Enter choice (1-4): $'

prompt_dep     db 'Enter deposit amount: $'
prompt_wd      db 'Enter withdraw amount: $'
msg_dep_ok     db 'Deposit successful!$'
msg_wd_ok      db 'Withdrawal successful!$'
msg_cur_bal    db 'Current Balance: Rs. $'
err_funds      db 'Error: Insufficient balance!$'[cite: 24]
err_amount     db 'Error: Invalid amount!$'[cite: 24]
err_choice     db 'Error: Invalid choice! Please select 1-4.$'[cite: 24]

msg_final_bal  db 'Final Balance: Rs. $'
msg_tot_dep    db 'Successful Deposits: $'
msg_tot_wd     db 'Successful Withdrawals: $'
newline        db 0Dh, 0Ah, '$'