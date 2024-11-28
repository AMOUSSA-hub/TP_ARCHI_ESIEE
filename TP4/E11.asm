; Auteurs : ---
; Date de creation : ---
; Objectif : ---

%include "asm_io.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; Section de donnees ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data

msg :
    db "Hello World",10,0   ; La chaine de caracteres a afficher,
                            ; 10 est le code ASCII du retour a la ligne.
prompt1: db "La chaine de caractère passé en argument contient : ", 0
prompt2: db " caractères",10, 0


SECTION .bss

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;; Section de code ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
global main
main:

    mov eax, prompt1
    call print_string
    push msg
    call longueur
    call print_int
    mov eax, prompt2
    call print_string
    


    ; Fin de l'execution.
    mov ebx, 0
    mov eax, 1
    int 0x80

;fonction qui calcule la taille d'une chaine de caractères
longueur:

    push ebp
    mov ebp,esp
    mov eax,[ebp+8]
    dec eax
loop:
    inc eax
    cmp byte [eax],0
    jne loop
    sub eax,[ebp+8]
    pop ebp
    ret