.model small
.stack 100h
.data  

.code
    main proc 
        
        mov cx,10
      
back:        
        mov ah, 2
        mov dl, 'A'
        int 21h
        loop back 
        
        mov ah, 4ch
        int 21h
        
     main endp
end main
