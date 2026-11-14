;calculate effective address
;shan/72387
org 100h

mov bx, 1000h
mov si, 0020h

lea ax, [bx+si]

ret



