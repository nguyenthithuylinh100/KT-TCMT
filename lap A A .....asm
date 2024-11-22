.model small
.stack 100h
.data

.code
    main proc
              
        mov cl, 1
		
back:		
		mov ah,2
		mov dl,'A'
		int 21h
		mov dl,32
		int 21h   
		inc cl
		cmp cl, 10   
		jle back
		
		mov ah, 4ch
		int 21h
		
		main endp
    end main