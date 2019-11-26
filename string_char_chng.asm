.MODEL SMALL
.STACK 100H

.DATA 
MSG DB 'PLEASE ENTER A STRING: ', '$' 
X DB 80 DUP (?)

.CODE      

MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX 
    
    LEA DX, MSG
    MOV AH, 09H 
    INT 21H
    
    
    MOV SI,0
    MOV BX,0
    
    NEXT:
    MOV AH,1
    INT 21H
    CMP AL,0DH
    JZ EXIT
    MOV X[SI],AL
    INC SI
    JMP NEXT
    EXIT:
    DEC SI
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    
    MOV AH,2
    MOV DL,0AH
    INT 21H
    
    NEXT2:
    MOV AL,X[BX]
    CMP AL,91
    JG Line1

    ADD AL,64
    Line1:
    SUB AL,32
    
    MOV DL,AL
    MOV AH,2
    INT 21H
    
    CMP SI,BX
    JZ EXIT2
    
    INC BX
    
    JMP NEXT2
    
    
    
     
   EXIT2:
    
           
           
        
    
    
MAIN ENDP
END MAIN