org 100h

    section .data

    string DB 'DANIEL ALEJANDRO OROZCO ORELLANA'

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d

    MOV DH, 10 
    MOV DL, 20 

    call mostrartexto

    sloop:
        call mcursor
        MOV CL, [string+SI]
        CMP CL, 20h
        JE NEXTLINE
        call showchar
        INC SI
        INC DL
        INC DI 
        CMP DI, 32d 
        JB sloop 
        jmp waitenter

    mostrartexto: 
        MOV AH, 0h 
        MOV AL, 03h 
        INT 10h
        RET

    mcursor:
        MOV AH, 02h 
        MOV BH, 0h 
        INT 10h
        RET

    showchar:
        MOV AH, 0Ah 
        MOV AL, CL 
        MOV BH, 0h 
        MOV CX, 1h 
        INT 10h
        RET

    waitenter:
        MOV AH, 00h 
        INT 16h

    salir:
        int 20h

    NEXTLINE:
        add DH, 5
        INC SI 
        MOV DL, 20 
        INC DI 
        jmp sloop