.model small 
.stack 100h 
.data 
    a db ? 
    b db 2    
    c db 10,13,"not prime$" 
    d db 10,13,"prime$"     
.code 
main proc 
    mov ax, @data      
    mov ds, ax 
    mov ah,1 
    int 21h 
    sub al,30h 
    mov a,al 
     
    l3: 
 
    mov al,a 
    cmp b,al 
    je l4 
    jg l1 
    mov ah,0 
    div b 
    cmp ah,0 
    je l1 
    jg l2 
     
    l1: 
    lea dx, c    
    mov ah, 9          
    int 21h 
    jmp l5 
     
    l2: 
        inc b 
        jmp l3 
     
    l4: 
    lea dx, d    
    mov ah, 9          
    int 21h 
     
    l5:                        
 
main endp 
end main