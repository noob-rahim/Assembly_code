.model small
.stack 100h
.data

.code

main proc
    mov ax,'$'
    push ax
    xor bx,bx
    
    input:
        mov ah,1
        int 21h
        
        cmp al,0dh
        je l1
           
        cmp al,'['
        je l2        
        cmp al,'{'
        je l2        
        cmp al,'('
        je l2
            
            
        cmp al,')'
        je l3
        
        cmp al,'}'
        je l4
        
        cmp al,']'
        je l5
        
        jmp input
        
        
        l2:
            xor bx,bx
            mov bl,al
            push bx   
            jmp input
            
        l1:
            pop bx
            cmp bx,'('
            jne
        
        
