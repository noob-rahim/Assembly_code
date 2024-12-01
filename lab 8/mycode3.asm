.model small
.stack 100h
.data
    A db 10,9,8,7,6,5,4,3,2,1
    ASE db "Found $"
    NAI db "Not Found $"
    
.code
main proc
    mov ax, @data
    mov ds, ax 
    
    lea si,A 
    mov cx,10
    mov bl,0
    
    l1:
        cmp [si],bl
        je found
        inc si
        loop l1
        
        lea dx,NAI
        mov ah,9
        int 21h
        jmp l2
        found:
            lea dx,ASE
            mov ah,9
            int 21h
            
        l2:
     
main endp
end main
       
        
    




