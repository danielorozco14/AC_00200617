org 	100h

    section	.text
        mov 	BP, password
        call  	foreach_char    ;Agregamos password a BP y llamamos las funciones
        call    if_equal
        call	wait_input
        int 	20h

    if_equal:
        xor  DI,DI              ;Limpiamos DI, y llamamos la funcion for
        call for
    for:
        cmp     DI,5d
        je      correct_pass
        mov     BL,[saved_pass + DI]    ;Asignamos a BL el caracater de saved_pass + DI
        cmp     BL,[BP + DI]
        jne     wron_pass
        inc     DI
        jmp     for

    section	.data
        message1 	db 	"BIENVENIDO", "$"
        message2 	db 	"INCORRECTO", "$"
        saved_pass	db 	"DAOO1", "$"
        password 	times   100  db 	" " 	
    
    wait_input:
            mov     AH, 01h         ;Esperamos el enter del usuario
            int     21h
            ret
    input_string:
        mov 	AH, 09h             ;Recogemos la cadena del usuario
        int 	21h
        ret
    foreach_char:
            xor     SI, SI          
    while:  
        call    wait_input
        cmp     AL, 0x0D        
        je      exit            
        mov     [BP + SI], AL   	
        inc     SI              
        jmp     while           
    correct_pass:
        mov 	DX, message1
        call 	input_string    ;Funcion que imprime "BIENVENIDO" si la comparacion de ambas cadenas fue exitosa
        call	wait_input
        int 	20h
    wron_pass:
        mov 	DX, message2
        call 	input_string    ;Funcion que imprime "INCORRECTO" si la comparacion de caracteres no fue exitosa
        call	wait_input
        int 	20h
    exit:
        mov 	byte [BP + SI], "$"
        ret

