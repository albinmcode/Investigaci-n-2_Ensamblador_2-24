.386
.model small  ; Modelo de memoria plana, adecuado para 32 bits
.stack 512

.data
    num1 db 1
    num2 db 1
    num3 db 1
    num4 db 1
    num5 db 1
    num6 db 1
    num7 db 1
    num8 db 1
    num9 db 1
    
    suma dd 0
    resASCII db 3 DUP(' ')
    control db 'point', '$'
    
.code
begin:

leerSumarMatriz3X3 PROC
    mov BX, @data
    mov DS, BX

    ; reiniciar entradas
    mov EBX, offset num1
    mov EAX, 0
    mov [EBX], EAX
    mov EBX, offset num2
    mov EAX, 0
    mov [EBX], EAX
    mov EBX, offset num3
    mov EAX, 0
    mov [EBX], EAX
    mov EBX, offset num4
    mov EAX, 0
    mov [EBX], EAX
    mov EBX, offset num5
    mov EAX, 0
    mov [EBX], EAX
    mov EBX, offset num6
    mov EAX, 0
    mov [EBX], EAX
    mov EBX, offset num7
    mov EAX, 0
    mov [EBX], EAX
    mov EBX, offset num8
    mov EAX, 0
    mov [EBX], EAX
    mov EBX, offset num9
    mov EAX, 0
    mov [EBX], EAX
    
    control
    mov ah, 09h
    lea dx, control
    int 21h 
    
    ; leer valores
    mov AL, 0
    mov EAX, 0
    ; num 1
    mov AH, 10h                               
    int 16h
    mov AH, 0 ; para solo leer Al
    mov EDX, EAX
    mov EBX, offset num1
    mov [EBX], EDX
    ; num 2
    mov AH, 10h                               
    int 16h
    mov AH, 0 ; para solo leer Al
    mov EDX, EAX
    mov EBX, offset num2
    mov [EBX], EDX
    ; num 3
    mov AH, 10h                               
    int 16h
    mov AH, 0 ; para solo leer Al
    mov EDX, EAX
    mov EBX, offset num3
    mov [EBX], EDX
    ; num 4
    mov AH, 10h                               
    int 16h
    mov AH, 0 ; para solo leer Al
    mov EDX, EAX
    mov EBX, offset num4
    mov [EBX], EDX
    ; num 5
    mov AH, 10h                               
    int 16h
    mov AH, 0 ; para solo leer Al
    mov EDX, EAX
    mov EBX, offset num5
    mov [EBX], EDX
    ; num 6
    mov AH, 10h                               
    int 16h
    mov AH, 0 ; para solo leer Al
    mov EDX, EAX
    mov EBX, offset num6
    mov [EBX], EDX
    ; num 7
    mov AH, 10h                               
    int 16h
    mov AH, 0 ; para solo leer Al
    mov EDX, EAX
    mov EBX, offset num7
    mov [EBX], EDX
    ; num 8
    mov AH, 10h                               
    int 16h
    mov AH, 0 ; para solo leer Al
    mov EDX, EAX
    mov EBX, offset num8
    mov [EBX], EDX
    ; num 9
    mov AH, 10h                               
    int 16h
    mov AH, 0 ; para solo leer Al
    mov EDX, EAX
    mov EBX, offset num9
    mov [EBX], EDX
    
    ; control
    mov ah, 09h
    lea dx, control
    int 21h 
    
    ; sumar entradas
    mov EBX, offset suma
    mov dword ptr [EBX], 0
    mov EAX, 0
    mov EBX, 0
    mov BL, 0
    mov BL, num1
    add EAX, EBX
    mov BL, num2
    add EAX, EBX
    mov BL, num3
    add EAX, EBX
    mov BL, num4
    add EAX, EBX
    mov BL, num5
    add EAX, EBX
    mov BL, num6
    add EAX, EBX
    mov BL, num7
    add EAX, EBX
    mov BL, num8
    add EAX, EBX
    mov BL, num9
    add EAX, EBX
    
    ; guardar resultado
    mov EBX, offset suma
    mov [EBX], EAX
    
    ; codigo muy importante, no tocar
    mov ECX, 0FFFFFFFFh
    cicloImportante:
        loop cicloImportante
    
   ; imprimir resultado
    mov EBX, 10
    mov EAX, suma
    mov EDX, 0
    ; digito 1
    div EBX ; EAX / 10
    add AL, 30h ; ascii de EAX / 10
    mov resASCII, AL
    ; digito 2
    add DL, 30h ; ascii de EAX mod 10
    mov resASCII[1], DL
    mov ah, 09h
    lea dx, resASCII
    int 21h 
           
    leerSumarMatriz3X3 ENDP
    
END begin