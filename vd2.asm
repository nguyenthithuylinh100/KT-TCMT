.model small
.stack 100h
.data
    prompt db 'Nhap vao mot ky tu: $'     ; Thong bao nhap ky tu
    before db 10, 13,'Ky tu truoc no la: $'      ; Thong bao ky tu truoc
    after db 10, 13, 'Ky tu sau no la: $'         ; Thong bao ky tu sau
.code
main proc
    ; Thiet lap phan doan du lieu
    mov ax, @data
    mov ds, ax

    ; In thong bao "Nhap vao mot ky tu:"
    mov ah, 9
    lea dx, prompt
    int 21h

    ; Nhan ky tu tu nguoi dung
    mov ah, 1
    int 21h
    mov bl, al   ; Luu ky tu nguoi dung nhap vao BL


    ; In thong bao "Ky tu truoc no la:"
    mov ah, 9
    lea dx, before
    int 21h

    ; Tinh ky tu truoc (tru di 1) 
    mov ah, 2
    mov dl, bl
    sub dl, 1
    int 21h      ; In ky tu truoc


    ; In thong bao "Ky tu sau no la:"
    mov ah, 9
    lea dx, after
    int 21h

    ; Tinh ky tu sau (cong them 1)     
    mov ah, 2
    mov dl, bl
    add dl,1
    int 21h    ; In ky tu sau 

main endp
end main
