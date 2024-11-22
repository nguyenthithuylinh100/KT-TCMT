.model small
.stack 100h
.data
    s1 db 'nhap 1 ky tu: $'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        lea dx, s1
        mov ah, 9
        int 21h
        
        mov ah,1
        int 21h
        
        cmp al, 'A'
        je lenh1 
        
        cmp al, 'B'
        je lenh2
        
        mov dl, al
        mov ah, 2
        int 21h
        
        jmp ketthuc 
        
       
lenh1: 
        mov ah, 2
        mov dl, 10 
        int 21h
 
        jmp ketthuc
       
lenh2:
        mov ah, 2  
        mov dl, 13
        int 21h 

        jmp ketthuc       
        
ketthuc: 
        mov dl,'X'
        int 21h       
        mov ah,4ch
        int 21h
    main endp
end main