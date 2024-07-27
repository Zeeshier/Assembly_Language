MODEL SMALL
.STACK 100H
.DATA
iMsg1 db 10,13,"Enter First Number:$"
iMsg2 db 10,13,"Enter Second Number:$"
outputMsg db 10,13,"Their Product is = :$"
n1 db ?
n2 db ?
.CODE
MAIN PROC
MOV AX, @data
MOV DS, AX
LEA DX, iMsg1
MOV AH, 09h
INT 21H
MOV AH, 01H
INT 21H
SUB AL,48
MOV n1,AL
LEA DX, iMsg2
MOV AH, 09h
INT 21H
MOV AH, 01H
INT 21H
SUB AL,48
;MOV n2,AL
MUL n1
LEA DX, outputMsg
MOV AH, 09h
INT 21H
ADD AX,48
MOV DL,AL
MOV AH, 02H
INT 21H
MOV AH, 4CH
INT 21H
MAIN ENDP
END MAIN