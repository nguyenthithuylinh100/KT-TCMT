.model small
.stack 100h
.data

.code
    main proc
              
        mov cl, 'a'
back:        
        mov ah, 2
        mov dl,cl
        int 21h
        inc cl
        
        mov dl, 32
        int 21h
        
        cmp cl,'z'
        jle back
     		
		mov ah, 4ch
		int 21h
		
		main endp
    end main