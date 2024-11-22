.model small
.stack 100h
.data  
    s db 'Nhap vao ki tu: $'   
    h db 10, 13,'Ki tu vua nhap la: $'

.code
    main proc 
        
        mov ax, @data
        mov ds, ax 
        
        mov ah, 9
        lea dx, s
        int 21h
        
        mov ah, 1
        int 21h 
        mov bl, al  ;luu trong bl
        
        
        mov ah, 9
        lea dx, h
        int 21h 
        
        mov ah, 2
        mov dl, bl
        int 21h 
        
        mov ah, 4ch
        int 21h
        
    main endp
end main
