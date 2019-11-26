.MODEL SMALL
.STACK 100H
.CODE
MAIN PROC
        
        MOV AH,1
        INT 21H
        MOV BL,AL
        
        CMP BL,91
        JG line1:
        ADD BL,64
        line1:
        SUB BL,32
        
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
        
        MOV DL,BL
        MOV AH,2
        INT 21H
        
        
    
MAIN ENDP
END MAIN