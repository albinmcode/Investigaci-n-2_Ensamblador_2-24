;.386
.model small
.stack 512

.data
    control db 'Ingrese los valores:', '$'
    nums db 9 DUP(1)   ; Arreglo para los n?meros
    suma dw 0
    resASCII db 3 DUP(' '), 
    resSize EQU $ - resASCII
        db'$'

.code
begin:
    mov AX, @data
    mov DS, AX

    call leerSumarMatriz3X3

    ; Terminar programa
    .exit

leerSumarMatriz3X3 PROC
    ; Mostrar mensaje de control
    mov AH, 09h
    lea DX, control
    int 21h 

    ; Inicializar variables
    lea SI, nums
    xor CX, CX

    ; Leer y almacenar los 9 valores
    mov CX, 9
leer_loop:
    ; Leer un valor del teclado
    mov AH, 01h
    int 21h
    sub AL, '0'             ; Convertir de ASCII a n?mero
    mov [SI], AL            ; Guardar en arreglo
    inc SI                  ; Avanzar al siguiente n?mero
    loop leer_loop          ; Repetir 9 veces

    ; Sumar todos los valores
    lea SI, nums
    xor AX, AX
    xor CX, CX
    mov CX, 9
suma_loop:
    add AL, [SI]            ; Sumar valor actual
    inc SI                  ; Avanzar al siguiente
    loop suma_loop          ; Repetir 9 veces
    mov suma, AX           ; Guardar resultado

    
    ; Convertir resultado a ASCII
    lea DI, resASCII
    xor CX, CX
    mov CX, resSize
    add DI, CX
    xor DX, DX
    mov BX, 10
conv_loop:
    xor DX, DX
    div BX         ; Dividir EAX entre 10
    add DL, '0'             ; Convertir residuo a ASCII
    dec DI
    mov [DI], DL
    cmp AX, 0
    je result
    loop conv_loop

    ; Mostrar resultado
result:
    mov AH, 09h
    lea DX, resASCII
    int 21h

    ret
leerSumarMatriz3X3 ENDP

END begin
