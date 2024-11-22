.model small
.stack 100h
.data
    s1 db 'Nhap so co 2 chu so: $'   ; Hien thi chuoi de nhap so co 2 chu so
    s2 db 13,10, 'So ban da nhap la: $'  ; Hien thi chuoi ket qua
.code
main proc
    ; Khoi tao du lieu
    mov ax, @data
    mov ds, ax
    
    ; In chuoi "Nhap so co 2 chu so:"
    mov ah, 9
    lea dx, s1
    int 21h
    
    ; Nhap chu so dau tien
    mov ah, 1
    int 21h
    sub al, 30h      ; Chuyen ky tu ASCII thanh so thap phan
    mov bl, al       ; Luu chu so dau tien vao BL
    
    ; Nhap chu so thu hai
    mov ah, 1
    int 21h
    sub al, 30h      ; Chuyen ky tu ASCII thanh so thap phan
    mov bh, al       ; Luu chu so thu hai vao BH
    
    ; In chuoi "So ban da nhap la:"
    mov ah, 9
    lea dx, s2
    int 21h

    ; In chu so thu nhat
    mov ah, 2
    mov dl, bl
    add dl, 30h      ; Chuyen so thap phan thanh ky tu ASCII
    int 21h

    ; In chu so thu hai
    mov ah, 2
    mov dl, bh
    add dl, 30h      ; Chuyen so thap phan thanh ky tu ASCII
    int 21h
    
    ; Ket thuc chuong trinh
    mov ah, 4ch
    int 21h

main endp
end main
