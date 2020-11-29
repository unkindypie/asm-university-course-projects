.MODEL LARGE

.DATA

    TABLE_A DB 10, 5, 1
    TABLE_B DB 0, 0, 0
    success_msg db "Congrads! IT WORKS!!1! $"
.CODE code_seg_1

   start:
    MOV AX, SEG TABLE_B
    MOV DS, AX

    MOV SI, 0

    LOOP_:
        MOV AL, TABLE_A[SI] ; копирую siтый TABLE_A в siтый TABLE_B
        MOV TABLE_B[SI], AL

        INC SI
        CMP SI, 2 ; пока si <= 2 делаю инкремент
    JBE LOOP_


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
