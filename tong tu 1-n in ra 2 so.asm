.model small
.stack 100h
.data
    s1 db 'nhap n: $'
    s2 db 13,10, 'tong: $'
.code
    main proc 
        mov ax, @data
        mov ds, ax
        
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov ah, 1
        int 21h
        sub al, 30h      ;n
        
        mov cl, 1       ;i
        mov bl, 0       ;s
back:        
        add bl, cl
        inc cl
        cmp cl, al
        jle back
        
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov ah, 0   ;xoa ah
        mov al, bl
        mov bl, 10
        div bl
        
        mov bh, ah
        mov bl, al
        
        mov ah, 2
        mov dl, bl
        add dl, 48
        int 21h 
        mov dl, bh
        add dl, 48
        int 21h
  
        mov ah, 4ch
        int 21h

        
        main endp
   end main
        