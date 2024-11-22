.model small
.stack 100h
.data  
       s1 db 'nhap day ky tu: $'
       s2 db 10,13, 'chuyen chu hoa: $'
       s db 100 dup(?)

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
    mov ah, 9
    lea dx, s2
    int 21h
    
    mov cx, bx 
    
    mov bx, 0    
doitiep:    
    cmp s[bx], 'a'
    jge doichuhoa
    cmp s[bx], 'A'
    jl khongdoi
    add s[bx], 32  
    jmp khongdoi
   
    
doichuhoa:
    sub s[bx], 32 
khongdoi:      
    inc bx
    loop doitiep 
    
    mov s[bx], '$'
    mov ah, 9
    lea dx, s
    int 21h

    
    mov ah,4ch
    int 21h
     
    main endp
end main