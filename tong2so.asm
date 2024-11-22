.model small
.stack 100h
.data
    s1 db 'Nhap so thu nhat: $'
    s2 db 13,10,'Nhap so thu hai: $' 
    s3 db 13,10,'Tong hai so la: $'
    tong db 0
    dv db 0
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        ;nhap so thu nhat
        mov ah, 9
        lea dx, s1
        int 21h
        
        mov ah, 1
        int 21h
        sub al, 48
        mov bl, 10
        mul bl
        mov bl, al
        mov ah, 1
        int 21h
        sub al, 48
        add bl, al ;so thu nhat trong bl 
        
        ;nhap so thu hai
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov ah, 1
        int 21h 
        sub al, 48
        mov cl, 10
        mul cl
        mov cl, al
        mov ah, 1
        int 21h
        sub al, 48
        add cl, al ;so thu hai trong cl 
        
        add tong, bl
        add tong, cl
        
        ;hien thi 3 chu so: a=n/100, b=n%100, c=n%10
        mov ah, 9
        lea dx, s3
        int 21h
        
        mov bl, 10
        mov al, tong
        mov ah, 0
        div bl  
        mov dv, ah 
        
        mov bl, 10
        mov ah, 0
        div bl  
        mov bl, al  
        mov bh, ah
        mov ah, 2
        mov dl, al  
        add dl, 48
        int 21h
        mov dl, bh  
        add dl, 48
        int 21h
        mov dl, dv 
        add dl, 48
        int 21h 
        
        mov ah, 4ch
        int 21h
     main endp
end main

        
        