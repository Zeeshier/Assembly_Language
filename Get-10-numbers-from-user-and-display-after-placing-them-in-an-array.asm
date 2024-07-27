.model small
.stack 100h
.data
msg db 'Please 10 Digits: $'
array db 11 dup('$')
.code
main proc
mov ax,@data
mov ds,ax
mov dx,offset msg
mov ah,9
int 21h
lea si,array
l1:
mov ah,1
int 21h
cmp al,13
je Print
mov [si],al ; placing in array
inc si
jmp l1
Print:
mov dx,10
mov ah,2
int 21h
mov dx,13
mov ah,2
int 21h
mov dx,offset array ; displaying array to get confirm numbers are placed
mov ah,9

int 21h
mov ah,4ch
int 21h
main endp
end main
