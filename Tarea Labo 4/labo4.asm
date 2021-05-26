org 100h

        section .text
        
        mov BP,arr
        call evenOdd

        int 20h
        
        section .data
arr db 21,32,41,52,61,72,81,92,101,112,0xA

evenOdd:
    xor SI,SI

while:
    mov AL,[BP+SI]
    mov dl, al
    
    cmp AL,0xA
    je end

    mov bl,01h
    and AL,bl
    
    cmp AL,01h  
    jnz evenodd
    
    mov [0320H+SI],dl
    
    inc SI
    jmp while

evenodd:
    mov [0300H+SI],dl

    inc SI
    jmp while

end:
ret 