.model small 
.stack 100h
.data
    s1 db 'nhap 3 so: $'
    s2 db 10,13, 'so vua nhap: $'
    dv db 0
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        mov ah,9
        lea dx, s1
        int 21h
; (a*10 + b)*10 +c
        mov ah, 1   ;nhap so thu nhat
        int 21h
        sub al, 48  ;doi thanh so
        mov ah, 0   ;xoa ah
        
        mov bl, 10
        mul bl  ;al*10
        mov bh, al  ;cat bao bh
        
        mov ah, 1   ;nhap so thu 2 , vd nhap 5
        int 21h
        sub al, 48  ;doi thanh so
        add al, bh  ;cong voi so truoc do: 10+5=15 
        mov  ah, 0
        mov bl, 10  ;nhan 10: 15*5=150
        mul bl
        mov bh, al  ;cat vao bh
        
        mov ah, 1   ; nhap so thu 3
        int 21h
        sub al, 48
        add bh, al  ; 150+6=156  
        
        ;hien thi 3 chu so: a=n/100, b=n%100, c=n%10
        mov ah, 9
        lea dx, s2
        int 21h
        
        mov bl, 10
        mov al, bh
        mov ah, 0
        div bl  ; 156/10=15 du 6
        mov dv, ah  ;cat 6 vao dv
        
        mov bl, 10
        mov ah, 0
        div bl  ; 15/10=1 du 5
        mov bl, al  ;cat 1 vao bl, cat 5 vao bh
        mov bh, ah
        mov ah, 2
        mov dl, al  ;hien 1
        add dl, 48
        int 21h
        mov dl, bh  ;hien 5
        add dl, 48
        int 21h
        mov dl, dv 
        add dl, 48
        int 21h 
        
        mov ah, 4ch
        int 21h
     main endp
end main
     
    
        
      