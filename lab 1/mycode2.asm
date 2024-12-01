.model small
.stack 100h 

.data
str1 db "Enter upper case letter:$"
str2 db "Lower case letter is: $"
str3 db "Enter lower case letter:$"
str4 db "Upper case letter is:$"
char db ?

.code 
main proc
    mov ax,@data
    mov ds,ax
     
             
    ;print string
    lea dx,str1
    mov ah,9
    int 21h
      
      
    ;take input
    mov ah,1
    int 21h
    mov char,al
    
    
    ;new line
    mov ah,2
    mov dl,10
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h
           
           
    ;display string
    lea dx,str2
    mov ah,9
    int 21h 
    
    ;conversion
    mov al,char
    add al,32
    mov char,al
    
    ;print uppercase
    mov ah,2
    mov dl,char
    int 21h
    
    ;new line
    mov ah,2
    mov dl,10
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h 
    
    
    ;print string
    lea dx,str3
    mov ah,9
    int 21h
    
    
    ;take input
    mov ah,1
    int 21h
    mov char,al
    
    
    ;new line
    mov ah,2
    mov dl,10
    int 21h
    
    mov ah,2
    mov dl,13
    int 21h 
    
    
    ;display string
    lea dx,str4
    mov ah,9
    int 21h
    
    
    ;conversion
    mov al,char
    sub al,32
    mov char,al
    
    ;print lowercase
    mov ah,2
    mov dl,char
    int 21h
    
    main endp
end main
