        org     100h

        section .text

        mov     byte [200h], "D"
        mov     byte [201h], "A"
        mov     byte [202h], "O"
        mov     byte [203h], "O"
        
        ;Direccionamiento directo
        mov     AX, 200h
        mov     CX, [201h]
        mov     DX, [202h + DI]
        mov     DI, [SI + 203h]

        int 20h