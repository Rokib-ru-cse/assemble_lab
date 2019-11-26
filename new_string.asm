.model small
.stack 100h
.data

x db  26        ;MAX NUMBER OF CHARACTERS ALLOWED (25).
db  ?         ;NUMBER OF CHARACTERS ENTERED BY USER.
db  26 dup(0) ;CHARACTERS ENTERED BY USER.

.code
main:
    mov ax, @data
    mov ds, ax              

;CAPTURE STRING FROM KEYBOARD.                                    
    mov ah, 1 ;SERVICE TO CAPTURE STRING FROM KEYBOARD.
    mov dx, offset x
    int 21h                 

;CHANGE CHR(13) BY '$'.
    mov si, offset x + 1 ;NUMBER OF CHARACTERS ENTERED.
    mov cl, [ si ] ;MOVE LENGTH TO CL.
    mov ch, 0      ;CLEAR CH TO USE CX. 
    inc cx ;TO REACH CHR(13).
    add si, cx ;NOW SI POINTS TO CHR(13).
    mov al, '$'
    mov [ si ], al ;REPLACE CHR(13) BY '$'.            

;DISPLAY STRING.                   
     mov ah, 9 ;SERVICE TO DISPLAY STRING.
     mov dx, offset x + 2 ;MUST END WITH '$'.
     int 21h
     mov ah, 4ch
     int 21h

end main