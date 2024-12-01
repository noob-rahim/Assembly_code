.model small
.stack 100h
.data
   a db 15
   cnt db 0
   i db 0
   
.code
   main proc
    mov ax,@data
    mov ds,ax
    
    mov al,a
    
    l1:
       shl al,1
       
       jnc l2
       inc cnt
       
    l2:
       inc i
       cmp i,8
       jl l1               
       
    mov dl,cnt
    add dl,30h
    mov ah,2
    int 21h
    
    main endp
end main 
       
        
       
       