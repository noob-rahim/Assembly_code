.model small
.stack 100h
.data


str db "Enter a character: $"
LowerCase db "Corresponding lower case letter:$" 
UpperCase db "Corresponding upper case letter:$"
default db "It's not a letter.$"
char db ?
 
 
.code
main proc

    mov ax, @data
    mov ds, ax
     
     
    ; Display message
    lea dx, str
    mov ah, 9
    int 21h
        
        
    ; Take input
    mov ah, 1
    int 21h     
    mov char, al
    
    ; Condition check
    mov bl, char
    cmp bl, 65            
    jl L1          
    cmp bl, 90            
    jg L2      
        
        
    ; Convert lowercase
    add bl, 32
    mov char, bl
           
           
    ; Newline
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
          
          
    ; Display lower 
    lea dx, LowerCase
    mov ah, 9
    int 21h
           
           
    ; Print lower
    mov dl, char
    mov ah, 2
    int 21h
    jmp L3
    
    L2:
    cmp bl, 97            
    jl L1          
    cmp bl, 122           
    jg L1
    
    
    
    ; Newline
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
     
     
    
    
              
    
    ; Display upper
    lea dx, UpperCase
    mov ah, 9
    int 21h
    
    ; Convert uppercase
    sub bl, 32
    mov char, bl
     
     
    ; Print upper 
    mov dl, char
    mov ah, 2
    int 21h
    jmp L3

    L1:
    ; Newline
    mov ah, 2
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    
    ; Display default
    lea dx, default
    mov ah, 9
    int 21h
    
    L3:

    main endp
end main

   