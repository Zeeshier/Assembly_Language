.model small
.stack 100h
.data
Num db "Numerator = $"
Dino db "Denominator = $"
Quo db "Quotient = $"
Rem db "Reminder = $"
N db ?
D db ?
.code
Main proc
mov ax,@data
mov ds,ax
mov ah,1
int 21h
sub al,48
mov N,al ; input numerator
mov ah,1 ; input dinominator
int 21h
sub al,48
mov D,al
mov ah,0 ; division
mov al,N
mov bl,D
DIV bl
push ax ; push content from ax to stack
mov dl,10
mov ah,2
int 21h
mov dl,13
mov ah,2
int 21h
mov dx, offset Num ;print numerator string
mov ah,9
int 21h
mov dl,N
add dl,48
mov ah,2
int 21h
mov dl,10
mov ah,2
int 21h
mov dl,13
mov ah,2
int 21h
mov dx, offset Dino ;print dinominator string
mov ah,9
int 21h
mov dl,D
add dl,48
mov ah,2
int 21h
mov dl,10
mov ah,2
int 21h
mov dl,13
mov ah,2
int 21h
pop cx ; pop content from stack to cx
mov dx, offset Quo ;print quotient string
mov ah,9
int 21h
mov dl,cl
add dl,48
mov ah,2
int 21h
mov dl,10
mov ah,2
int 21h
mov dl,13
mov ah,2
int 21h
mov dx, offset Rem ;print reminder string
mov ah,9
int 21h
mov dl,ch
add dl,48
mov ah,2
int 21h
mov ah,4ch
int 21h
Main endp
end Main
