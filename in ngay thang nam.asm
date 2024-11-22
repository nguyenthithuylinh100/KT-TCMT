; ham 2ah, ngat 21h: lay ngay thang
;al: thu <0:sun, 1:mon, ..., 6:sat)
;dl: ngay (0,31), dh: thang (0,12)
;cx : nam (1980-2099)      

.model small
.stack 100h
.data
    ngay db ?
    thang db ?
    nam dw ? 
    thu db 'SUNMONTUEWEDTHUFRISAT'
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah, 2ah
        int 21h
        
        mov ngay, dl
        mov thang, dh
        mov nam, cx
                   
        mov ah, 0
        mov bl, 3
        mul bl
        mov bx, ax
        mov cx, 3
    hienthu:
        mov ah, 2
        mov dl, thu[bx]
        int 21h
        inc bx
        loop hienthu
        
        
    hienngay:   
        mov ah, 2
        mov dl, ' '
        int 21h
        
        mov al, ngay
        mov ah, 0 
        mov bl, 10
        div bl
        
        mov bh, ah
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
        mov dl, bh
        add dl, 48
        int 21h
        mov dl, '-'
        int 21h 
        
        mov al, thang
        mov ah, 0 
        mov bl, 10
        div bl
        
        mov bh, ah
        mov ah, 2
        mov dl, al
        add dl, 48
        int 21h
        mov dl, bh
        add dl, 48
        int 21h
        mov dl, '-'
        int 21h 
        
        mov cx, nam
        mov ah, 0
        mov bl, 10
        div bl 
        mov ah, 0 
        mov bl, 10
        div bl
        mov ah, 0 
        mov bl, 10
        div bl 
        
        mov ax, nam
        mov bx, 10 
        mov cx,4 
chiatiep:        
        mov dx, 0
        div bx
        push dx
        loop chiatiep 
        
        mov cx, 4
hiennam:        
        pop dx
        add dl, 48
        mov ah, 2
        int 21h
        loop hiennam
          
          
        mov ah, 4ch
        int 21h
        main endp
    end main
         