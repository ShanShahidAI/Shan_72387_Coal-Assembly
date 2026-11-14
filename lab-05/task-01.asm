org 100h

    mov al, 5
    mov bl, 5
    cmp al, bl
    je equal

    mov dx, offset msgNo       
    mov ah, 09h
    int 21h
    jmp exit

equal:
    mov dx, offset msgYes
    mov ah, 09h
    int 21h

exit:
    mov ah, 4ch
    int 21h

msgYes db 'Number is 5$'
msgNo  db 'Number is not 5$'