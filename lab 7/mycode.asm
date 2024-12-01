.MODEL SMALL
.STACK 100H
.DATA

A DB 3         
F DW 1

.CODE
                             
MAIN PROC
    MOV AX,@DATA   
    MOV DS,AX    

    
    CALL FACT        

    RET            

MAIN ENDP


FACT PROC
    MOV AX, F     

L1:
    MUL A            
    MOV F,AX     
    DEC A         
    CMP A, 1       
    JG L1
    JE L2   

    RET            

FACT ENDP

L2: 
    MOV AX, F      
    MOV DL, AL
    ADD DL, 30H
    MOV AH, 2     
    INT 21H


END MAIN
 
 
 
