.model small
.stack 100h
.data
    A db 10,9,8,7,6,5,4,3,2,1
    S db 10
    MIN_MSG db 'Minimum value is: $'
    MAX_MSG db 'Maximum value is: $'
    new_line db 0dh,0ah,'$'
    MIN_VAL db ?
    MAX_VAL db ?
.code
main proc
    mov ax, @data
    mov ds, ax
    mov si, offset A
    mov al, [si]
    mov MIN_VAL, al
    mov MAX_VAL, al
    mov cl, S
    dec cl
    inc si
L1:
    mov al, [si]
    cmp al, MIN_VAL
    jge not_min
    mov MIN_VAL, al
    
    
not_min:
    cmp al, MAX_VAL
    jle not_max
    mov MAX_VAL, al  
    
    
    
not_max:
    inc si
    dec cl
    jnz L1
    lea dx, MIN_MSG
    mov ah, 9
    int 21h
    mov al, MIN_VAL
    call display
    lea dx, new_line
    mov ah, 9
    int 21h
    lea dx, MAX_MSG
    mov ah, 9
    int 21h
    mov al, MAX_VAL
    call display
    mov ah, 4ch
    int 21h 
main endp    

    
display proc
    mov ah, 0
    mov cl, 10
    div cl
    push ax
    cmp al, 0
    je skip_quotient
    call display
    
    
skip_quotient:
    pop ax
    mov dl, ah
    add dl, '0'
    mov ah, 2
    int 21h
    ret
display endp 

end main