.model small
.stack 100h
.data
    str1 db "HELLO$"
    str2 db 5 dup (?)
.code
    main proc
        mov ax,@data
        mov ds,ax
        mov es,ax
        
        lea di,str1
        mov cx,5
        
        L1:
            mov al,'A'
            cld
            stosb
            loop L1
            
            
            lea dx,str1
            mov ah, 09h
            int 21h
            
            
     main endp
end main

