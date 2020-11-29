.MODEL LARGE
.stack 100h 
.DATA
    var_1 db 2d
    var_2 db 3d
    result db ?
    success_msg db "Done c: $"
.CODE code_seg_1

   start:
    mov ax, @data
    mov ds, ax
    

    mov al, var_1 ; копирую var_1 в последние биты ax
    add al, var_2 ; складываю var_2 туда же

    ; сохраняю все в переменную результата
    mov result, al 

    call far ptr print_success
    MOV AH, 4Ch
    INT 21h

.code code_seg_2
    print_success proc
        MOV AX, SEG success_msg
        MOV DS, AX
        ;использую tasm, так что адрес в dx тут загружается вот так
        LEA DX, success_msg
        mov ah,9h
        int 21h
        retf
    print_success endp
    end start
END
