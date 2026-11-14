org 100h

    mov al, 7

    cmp al, 0
    jg positive
    jl negative


    mov dx, offset zeroMsg
    mov ah, 09h
    int 21h
    jmp exit

positive:
    mov dx, offset posMsg
    mov ah, 09h
    int 21h
    jmp exit

negative:
    mov dx, offset negMsg
    mov ah, 09h
    int 21h

exit:
    mov ah, 4ch
    int 21h

zeroMsg db 'Number is Zero.$'
posMsg  db 'Number is Positive.$'
negMsg  db 'Number is Negative.$'