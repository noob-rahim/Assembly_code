.data
str1 db "Hello",10,13,"world"
str2 db 41h,42h,43h,24h

.code
main proc
    mov ax,@data
    mov ds,ax  
    
                    ;lea= load effective address
    LEA dx,str1 
    mov ah,9
    int 21h
    
    mov ah,2
    int 21h
             
    main endp
end main
    
    
                                                                  