.model small
.stack 100h
.data  
       s1 db 'nhap day ky tu: $'
       s2 db 10,13, 'Day chu thuong: $'   
       s3 db 10,13, 'Day chu hoa: $'
       s db 100 dup(?) 
       a db 100 dup(?)     ;chu thuong
       b db 100 dup(?)     ;chu hoa

.code
    main proc 
    
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, s1
    int 21h
    
    mov bx, 0
nhaptiep:    
    mov ah, 1
    int 21h
    cmp al, 13  ;kiem tra co phai enter k
    je hienday
    mov s[bx], al  
    inc bx 
    jmp nhaptiep 
    
hienday:
    
    mov cx, bx 
    
    mov bx, 0
    mov si, 0   ;cho chu hoa  
    mov di, 0   ;cho chu thuong    

doitiep:    
    cmp s[bx], 'a'
    jle chuhoa
    mov dl, s[bx]
    mov a[si], dl
    inc si
    jmp tiep
    
chuhoa:
    mov dl, s[bx]
    mov b[di], dl
    inc di
tiep:
    inc bx
    cmp bx, cx 
    jle doitiep 
    
    mov ah, 9 
    lea dx, s2
    int 21h
    mov a[si], '$'
    lea dx, a
    int 21h
    
    lea dx, s3
    int 21h
    mov b[di], '$'
    lea dx, b
    int 21h 
    

    
    mov ah,4ch
    int 21h
     
    main endp
end main