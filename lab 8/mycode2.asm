.model small
.stack 100h
.data
    A DB 9,8,7,6,5,4,3,2,1
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov cx,9
        XOR si,si
        mov di,8
        L1: 
          cmp si,di
          jge L2
          mov al,A[SI]
          mov bl,A[DI]
          mov A[SI],bl
          mov A[DI],al
          dec di
          inc si
          loop L1 


         
        L2:
          mov cx,9
          XOR si,si
          
          print:
          mov ah,2
          mov dl,A[SI]
          add dl,30H
          int 21H 
          inc si 
          cmp cx,1
          JE L
            mov AH,2
            mov DL,2CH
            int 21H 
            L:
          loop print  
            
endp main


