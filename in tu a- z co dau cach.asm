.model small
.stack 100h
.data

.code
    main proc
        
        mov cx,'z' 
        mov ah, 2
        mov dl, 'a'

back:  
        int 21h 
        mov bl, dl 
        
        mov dl,32
        int 21h
        
        mov dl, bl
        
        inc dl 
        loop back
        
        
        mov ah, 4ch
        int 21h
        
        main endp
   end main   
   
   