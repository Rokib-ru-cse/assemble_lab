.MODEL SMALL
.STACK 100H
.DATA
    STR DB 80 DUP (?)
.CODE
MAIN PROC
    MOV AX , @DATA
    MOV DS , AX
    
    MOV SI , 0
    MOV AH , 1
    
    INP:
        INT 21H
        CMP AL , 0DH
        JZ EXINP
        MOV STR[SI] , AL
        INC SI
        JMP INP
    
    EXINP:
        MOV BX , SI
        MOV AH , 2
        MOV SI , 0
        MOV CL , 0    
        ;MOV CH . 0
        
        OP:        
            CMP SI , BX
            JZ EXOP
            
            INT 21H
            MOV DL , STR[SI]
            
            CMP DL , 'A'
            JZ VC
            CMP DL , 'E'
            JZ VC
            CMP DL , 'I'
            JZ VC
            CMP DL , 'O'
            JZ VC
            CMP DL , 'U'
            JZ VC     
            INC SI
            JMP EXOP
            VC:
                INC CL
                JMP OP
                
        EXOP:
            MOV DL , CL
            ADD DL , 48
            INT 21H       
        
    
    MOV BX , SI
    MOV SI , 0
    MOV CL , 0
    COP:    
        CMP SI , BX
        JZ EXCOP  
        
        INT 21H
        MOV DL , STR[SI]
            
        CMP DL , 'B'
        JZ CC
        CMP DL , 'C'
        JZ CC
        CMP DL , 'D'
        JZ CC
        CMP DL , 'F'
        JZ CC
        CMP DL , 'G'
        JZ CC
        CMP DL , 'H'
        JZ CC
        CMP DL , 'J'
        JZ CC
        CMP DL , 'K'
        JZ CC
        CMP DL , 'L'
        JZ CC
        CMP DL , 'M'
        JZ CC
        CMP DL , 'N'
        JZ CC
        CMP DL , 'P'
        JZ CC
        CMP DL , 'Q'
        JZ CC
        CMP DL , 'R'
        JZ CC
        CMP DL , 'S'
        JZ CC
        CMP DL , 'T'
        JZ CC
        CMP DL , 'V'
        JZ CC
        CMP DL , 'W'
        JZ CC
        CMP DL , 'X'
        JZ CC
        CMP DL , 'Y'
        JZ CC
        CMP DL , 'Z'
        JZ CC
        INC SI
        JMP COP   
        
        
        CC:
            INC CL
            JMP COP
            
    EXCOP:
        MOV DL , CL
        ADD DL , 48
        INT 21H
        
        
    MOV AH , 4CH
    INT 21H
    ENDP MAIN
END MAIN