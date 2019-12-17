 .model small
.stack
print macro p
            lea dx,p
            mov ah,09h
            int 21h
endm

display macro g
            mov dl,g
            mov bh,0ah
            mov ah,00h
            mov al,dl
            div bh
            mov ch,ah
            mov dl,al
            add dl,30h
            mov ah,02h
            int 21h
            mov dl,ch
            add dl,30h
            mov ah,02h
            int 21h
endm
.data
            m1 db 0ah,0dh,"Enter the String: $"
            m2 db 0ah,0dh,"Vowels= $"
            m3 db 0ah,0dh,"Consonants= $"
            m4 db 0ah,0dh,"No of Vowels= $"
            m5 db 0ah,0dh,"No of Consonants= $"
            a db 20h dup("$")
            b db "aeiouAEIOU"
            v db 20h dup("$")
            co db 20h dup("$")
            k dw 0
            f dw 0
            g db 0
            z db 0
.code
            mov ax,@data
            mov ds,ax
            mov es,ax
            mov si,0000h
            print m1

loop1:  mov ah,01h
            int  21h
            mov a[si],al
            inc si
            cmp al,0dh
            jne loop1
           
            mov cx,si
            mov di,0000h
            mov si,0000h
            dec cx

loop3:  mov bh,a[si]
loop4:  mov bl,b[di]
            cmp bh,bl
            jne loop2
            mov dx,0000h
            mov dx,si
            mov si,k
            inc k
            mov v[si],bh
            inc g
            mov si,dx
loop6:  inc si
            mov di,0000h
            cmp si,cx
            jne loop3
            jmp loop5

loop2:  inc di
            cmp di,0ah
            jl loop4
            mov dx,0000h
            mov dx,si
            mov si,f
            inc f
            mov co[si],bh
            inc z
            mov si,dx
            jmp loop6
           

loop5:  print m2
            print v
            print m4
            display g
            print m3
            print co
            print m5
            display z
            mov ah,4ch
            int 21h
end