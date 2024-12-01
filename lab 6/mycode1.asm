.model small
.stack 100h
.data
a db "Correctly bracketed$" 
b db "Not correctly bracketed$"
.code

main proc
    mov ax, @data
    mov ds, ax
    xor bx, bx          

input:
    mov ah, 1         
    int 21h

    cmp al, 0dh        
    je output          

    cmp al, '['
    je push_bracket
    cmp al, '{'
    je push_bracket
    cmp al, '('
    je push_bracket

    cmp al, ')'
    je check_bracket
    cmp al, '}'
    je check_bracket
    cmp al, ']'
    je check_bracket

    jmp input          

push_bracket:
    push ax            
    inc bx            
    jmp input          

check_bracket:
    cmp bx, 0        
    je unmatched      

    pop ax             

    cmp al, ')'       
    je match_paren
    cmp al, '}'
    je match_curly
    cmp al, ']'
    je match_square
    jmp unmatched      

match_paren:
    cmp ax, '('       
    je continue_input
    jmp unmatched

match_curly:
    cmp ax, '{'       
    je continue_input
    jmp unmatched

match_square:
    cmp ax, '['      
    je continue_input
    jmp unmatched

continue_input:
    jmp input         

unmatched:
    
    lea dx, b
    mov ah, 09h
    int 21h
    jmp end_program

output:
    cmp bx, 0         
    je matched         

   
    lea dx, b
    mov ah, 09h
    int 21h
    jmp end_program

matched:
    lea dx, a  
    
end_program :
main endp
end main
