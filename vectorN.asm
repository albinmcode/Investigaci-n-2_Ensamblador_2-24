; Adaptaci?n de TASM a NASM
BITS 16          ; Programa en modo real de 16 bits
ORG 0x100        ; Comenzar en 0x100 (para .COM files)

section .data
    control db 'Ingrese los valores:', '$'
    nums db 9 DUP(1)   ; Arreglo para los n?meros
    suma dw 0
    resASCII db 3 DUP(' ')
    resSize EQU $ - resASCII

section .text
start:
    mov ax, data
    mov ds, ax

    call leerSumarMatriz3X3

    ; Terminar programa
    mov ah, 0x4C
    int 0x21

leerSumarMatriz3X3:
    ; Mostrar mensaje de control
    mov ah, 0x09
    lea dx, [control]
    int 0x21 

    ; Inicializar variables
    lea si, [nums]
    xor cx, cx

    ; Leer y almacenar los 9 valores
    mov cx, 9
leer_loop:
    ; Leer un valor del teclado
    mov ah, 0x01
    int 0x21
    sub al, '0'          ; Convertir de ASCII a n?mero
    mov [si], al         ; Guardar en arreglo
    inc si               ; Avanzar al siguiente n?mero
    loop leer_loop       ; Repetir 9 veces

    ; Sumar todos los valores
    lea si, [nums]
    xor ax, ax
    xor cx, cx
    mov cx, 9
suma_loop:
    add al, [si]         ; Sumar valor actual
    inc si               ; Avanzar al siguiente
    loop suma_loop       ; Repetir 9 veces
    mov [suma], ax       ; Guardar resultado

    ; Convertir resultado a ASCII
    lea di, [resASCII + resSize]
    xor dx, dx
    mov bx, 10
conv_loop:
    xor dx, dx
    div bx               ; Dividir AX entre 10
    add dl, '0'          ; Convertir residuo a ASCII
    dec di
    mov [di], dl
    test ax, ax
    jnz conv_loop

    ; Mostrar resultado
    mov ah, 0x09
    lea dx, [resASCII]
    int 0x21
    ret
