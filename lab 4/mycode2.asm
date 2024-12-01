.model small 
.stack 100h 
.data 
    a db 0 
    even_num db " is even$"   
    odd_num db " is odd$"      
.code 
main proc 
    mov ax, @data      
    mov ds, ax 
     
L3: 
    cmp a, 9           
    jg l4             
     
    mov al, a 
    mov ah,0          
    mov bl, 2          
    div bl             
    cmp ah, 0          
    je even            
     
odd: 
    mov dl,a 
    add dl,30h 
    mov ah,2 
    int 21h 
    lea dx, odd_num    
    mov ah, 9          
    int 21h 
    mov dl,10 
    mov ah,2 
    int 21h 
    mov dl,13 
    mov ah,2 
    int 21h            
    inc a              
    jmp l3           
     
even:     
    mov dl,a 
    add dl,30h 
    mov ah,2 
    int 21h 
    lea dx, even_num   
    mov ah, 9         
    int 21h  
    mov dl,10 
    mov ah,2 
    int 21h 
    mov dl,13 
    mov ah,2 
    int 21h           
    inc a              
    jmp l3             
 
L4: 
            
 
main endp 
end main



