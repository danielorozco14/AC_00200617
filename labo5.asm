org 100h
    section .data
    string DB 'DANIEL ALEJANDRO OROZCO ORELLANA'
    section .text
        XOR AX, AX
        XOR SI, SI
        XOR BX, BX
        XOR CX, CX
        XOR DX, DX

        MOV SI, 0
        MOV DI, 0d
        MOV DH, 10 
        MOV DL, 20 
    call mostrartexto

    senter:
        add DH, 5 ;Numero de lineas que se saltan al momento de ejecutar el salto de linea
        INC SI 
        MOV DL, 20 ; Posicion del cursor, centrado en la pantalla 
        INC DI 
        jmp sloop

    sloop:
        call mcursor 
        MOV CL, [string + SI] ;Seleccionando cada caracter de la cadena
        CMP CL, 20h ;Comparo si el caracter es un espacio o una letra
        JE senter ;Si el caracter es un espacio, entra a esta seccion y se ejecuta un salto de linea \n
        call showchar
        INC SI
        INC DL
        INC DI 
        CMP DI, 32d ;Tamanio de la cadena que contiene mi nombre
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
        RET                           ;Cuerpo del programa, obtenido de un archivo de laboratorio(ejemplo dado)
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
   
