.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC  
    
MOV AH, 1
INT 21H 

MOV BL, AL 

MOV AH, 2
MOV DL, 0AH
INT 21H
MOV DL, 0DH
INT 21H 

MOV AL, BL
        
CMP AL, 'a'
JGE LOWER
CMP Al,'A'
JL DISP
CMP AL ,'Z'
JG DISP
ADD AL, 20H
JMP DISP

LOWER:
    CMP AL ,'z'
    JLE LOW
    JMP DISP
    LOW:
        SUB AL, 20H
        JMP DISP

DISP:         
    MOV DL, AL 
    MOV AH,2
    INT 21H
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
    END MAIN