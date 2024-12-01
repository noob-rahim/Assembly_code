.model small 
.stack 100h 
.data 
    a db 1 
    b db 2    
    c db " is not prime$" 
    d db " is prime$"     
.code 
main proc 
    mov ax, @data      
    mov ds, ax 
     
    L6: 
    
    cmp a,9 
    jg L5 
     
    L3: 
 
    mov al,a 
    cmp b,al 
    je L4 
    jg L1 
    mov ah,0 
    div b 
    cmp ah,0 
    je l1 
    jg l2 
     
    L1:  
    mov dl,a 
    add dl,30h 
    mov ah,2 
    int 21h 
    lea dx,c   
    mov ah, 9          
    int 21h 
    mov dl,10 
    mov ah,2 
    int 21h 
    mov dl,13 
    mov ah,2 
    int 21h  
    inc a 
    mov b,2 
    jmp l6 
     
    L2: 
        inc b 
        jmp l3 
     
    L4: 
    mov dl,a 
    add dl,30h 
    mov ah,2 
    int 21h 
    lea dx,d   
    mov ah, 9          
    int 21h 
    mov dl,10 
    mov ah,2 
    int 21h 
    mov dl,13 
    mov ah,2 
    int 21h  
    inc a 
    mov b,2 
    jmp l6 
     
    L5:         
     
     
            
 
main endp 
end main


