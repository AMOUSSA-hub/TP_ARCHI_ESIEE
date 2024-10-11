; Auteurs : ---
; Date de creation : ---
; Objectif : ---

%include "asm_io.inc"

SECTION .data
prompt1: db "Entrer un entier strictement positif: ", 0

SECTION .bss

SECTION .text

global main
main:

    ;AFFICHER LA QUESTION ET CAPTURER LA REPONSE
    mov eax, prompt1
    call print_string     
    call read_int         
    mov ebx, eax

    mov ecx, 32

test:
    shl ebx, 1

    jc equalOne
    jnc equalZero


equalOne:
    mov eax,1
    call print_int
    jmp continue_loop
equalZero:
    mov eax,0
    call print_int
  
continue_loop: loop test



    






    ; Fin de l'execution.
    mov ebx, 0
    mov eax, 1
    int 0x80



