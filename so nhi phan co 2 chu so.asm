.model small
.stack 100h
.data  
       s1 db 'nhap so thap phan: $'
       s2 db 10,13, 'so nhi phan: $'

.code
    main proc 
    
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, s1
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 48
    
    mov bl, 10
    mul bl
    mov bh, al
    mov ah, 1
    int 21h
    sub al, 48
    add al, bh 
    
    mov bl, 2
    mov cx, 0
   

chiatiep:
    mov ah, 0    
    div bl
    push ax 
    inc cx
    cmp al, 0
    je hienso
    jmp chiatiep
    
hienso:
    mov ah, 9
    lea dx, s2
    int 21h
    
intiep:    
    pop dx
    mov ah, 2
    mov dl, dh
    add dl, 48
    int 21h 
    loop intiep
    
    mov ah,4ch
    int 21h
     
    main endp
end main
