.MODEL SMALL
.STACK 100H
.DATA 
    A DB 0DH,0AH,"CORRECT.$"
    B DB 0DH,0AH,"NOT CORRECT.$"
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX              
        
        MOV AX, '$'             
        PUSH AX              

    L1:
        MOV AH, 1                
        INT 21H
        CMP AL, 0DH             
        JE CHK                   

       
        CMP AL, '['
        JE L2
        CMP AL, '{'
        JE L2
        CMP AL, '('
        JE L2 

        CMP AL, ')'
        JE CHK1
        CMP AL, '}'
        JE CHK2
        CMP AL, ']'
        JE CHK3 
        JMP L1               
            
    L2:
        XOR BX, BX                
        MOV BL, AL               
        PUSH BX                  
        JMP L1                

    CHK1:
        POP CX                   
        CMP CL, '('              
        JNE NO                   
        JMP L1                

    CHK2: 
        POP CX
        CMP CL, '{'             
        JNE NO
        JMP L1 

    CHK3:
        POP CX
        CMP CL, '['              
        JNE NO
        JMP L1

    NO:
        LEA DX, B              
        MOV AH, 9
        INT 21H                  
        JMP L4                 

    CHK:
        POP CX
        CMP CL, '$'              
        JNE NO                   
        LEA DX, A              
        MOV AH, 9
        INT 21H                  

    L4:
        MOV AH, 4CH              
        INT 21H

    MAIN ENDP
END MAIN
