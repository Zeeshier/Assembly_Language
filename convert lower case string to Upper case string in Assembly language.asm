.model small
.stack 100h
.data
var1 db 100 dup("$")
.code
inputString proc
mov ax,@data
mov ds,ax
mov bl, 0 ; counts the length of string
mov si,offset var1 
l1: mov ah,1
int 21h
cmp al,13
je printString
mov [si],al
inc si
inc bl
jmp l1
printString:
mov si,offset var1
mov cl, bl
uppercase:
mov dx,[si]
sub dx, 32
mov ah,2
int 21h
inc si
loop uppercase
mov ah,4ch
int 21h
inputString endp
end inputString