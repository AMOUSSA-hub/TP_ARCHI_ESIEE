

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;; Section de donnees ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .data

msg :
    db "Hello World",10,0   ; La chaine de caracteres a afficher,
                            ; 10 est le code ASCII du retour a la ligne.

SECTION .bss

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;; Section de code ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SECTION .text

global main
main:



    mov eax,msg
    call print_string2

    ; Fin de l'execution.
    mov ebx, 0
    mov eax, 1
    int 0x80


print_string2:
    push ebx
    push ecx
    push edx
    push eax
    mov edx,12
    mov ecx,[esp]
    mov eax,4
    mov ebx,1
    int 0x80
    pop eax
    pop edx
    pop ecx
    pop ebx
    ret





