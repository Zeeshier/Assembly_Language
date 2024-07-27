

.model small
.stack 100h

.data        
  stu db 0dh,0ah, 'Zeeshan Ahmad $', 0dh, 0ah, 
  menu db 0dh, 0ah, 'Simple Calculator', 0dh, 0ah, 'Enter operator (+, -, *, /): $'
  result_msg db 0dh, 0ah, 'Result: $'
   
  operand1 db ?
  operand2 db ?
  result db ?
  operator db ?
  
.code
main:
  mov ax, @data         
  mov ds, ax           
  
  ; Display menu
  mov ah, 9 
  lea dx, stu
  int 21h
  lea dx, menu           
  
  int 21h
  ; Input operator
  mov ah, 1
  int 21h
  mov operator, al               
  
  ; Input operands
  mov ah, 1
  int 21h 
  sub al, 48     ; Convert ASCII to numerical value
  mov operand1, al
  mov ah, 1
  int 21h
  sub al, 48     ; Convert ASCII to numerical value    
  
  mov operand2, al
  ; Perform operation based on operator
  cmp operator, '+'
  je add_operation
  cmp operator, '-'
  je sub_operation
  cmp operator, '*'
  je mul_operation
  cmp operator, '/'
  je div_operation
  
add_operation:
  mov al, operand1
  add al, operand2
  mov result, al
  jmp display_result

sub_operation:
  mov al, operand1
  sub al, operand2
  mov result, al
  jmp display_result

mul_operation:
  mov al, operand1
  mov bl, operand2 
  mul bl          ; Multiply AL by BL
  mov result, al
  jmp display_result

div_operation:
  mov al, operand1
  mov bl, operand2
  xor ah, ah      ; Clear AH before division
  div bl          ; Divide AX by BL
  mov result, al
  jmp display_result

display_result:
  mov dx, offset result_msg
  mov ah, 9
  int 21h  

  ; Display result
  mov dl, result
  add dl, 48      ; Convert numerical value to ASCII
  mov ah, 2
  int 21h 

  ; Exit program
  mov ah, 4Ch
  int 21h

end main
