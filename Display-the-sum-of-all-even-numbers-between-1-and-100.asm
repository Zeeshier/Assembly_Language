model small
.stack 100h
.data
.code
main proc
mov ax,@data
mov ds,ax
mov cx,0
mov ax,0
l1:
add ax,cx
add cl,2
cmp cl,100
jle l1
mov dx,0
mov bx,10
mov cx,0
l2:
div bx
push dx
mov dx,0
mov ah,0
inc cx
cmp ax,0
jne l2
mov ah,02h
l3:
pop dx
add dx,48
int 21h
loop l3
mov ah,4ch
int 21h
main endp
end main