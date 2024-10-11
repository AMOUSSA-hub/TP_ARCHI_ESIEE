%include "asm_io.inc"

SECTION .data
prompt1 : db "Entrer un entier strictement positif: ", 0


SECTION .bss
input1 : resd 1

SECTION .text
global  main
main :
    mov eax, prompt1
    call print_string     ; Affichage de prompt1.
    call read_int         ; Lecture d'un entier.
    mov [input1], eax
    call print_int

    mov ebx, 0
    mov eax, 1
    int 0x80
