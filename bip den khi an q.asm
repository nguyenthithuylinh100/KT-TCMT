.model small
.stack 100h
.data
    s db 'bam phim Q hoac q de ket thuc$'
.code
    main proc
        mov ax, @data
        mov ds, ax
back:        
        mov ah, 2
        mov dl, 7
        int 21h
        
        mov ah, 1
        int 16h
        jz back
        
        mov ah, 0
        int 16h
        cmp al,'Q'
        je thoat
        cmp al, 'q'
        je thoat
        jmp back
        
thoat:
        
        mov ah, 4ch
        int 21h
        
        main endp
    end main