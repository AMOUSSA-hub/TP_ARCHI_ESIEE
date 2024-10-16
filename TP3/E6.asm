%include "asm_io.inc"

SECTION .data
prompt1: db "Entrer un entier strictement positif: ", 0

SECTION .bss
input1: resd 1          ; variable du nombre dont on cherche tous les diviseurs
diviseur: resd 1        ; variable du diviseur

SECTION .text
global main
main:
    ;AFFICHER LA QUESTION ET CAPTURER LA REPONSE
    mov eax, prompt1
    call print_string     
    call read_int         
    mov [input1], eax     

    mov dword [diviseur], 1   ;Initialiser le diviseur à 1

division:
    ;EFFECTUER LA DIVISION
    mov eax, [input1]     
    mov ecx, [diviseur]   
    div ecx               

    ; VERIFIER LE RESTE DE LA DIVISION
    cmp edx , 0
    jg increment
    mov eax, [diviseur] 
    ;AFFICHER SI RESTE=0
    call print_int
    call print_espace

increment:
    ; INCREMENTER DE 1 LE DIVISEUR
    inc dword [diviseur]  ; Increment the divisor.
    mov edx , 0
    mov eax, [input1]     
    mov ecx, [diviseur]  
    cmp   ecx , eax
    jng division
    
    ;ARRETER LE PROGRAMME
    call print_nl
    mov eax, 1            ; Code de sortie
    mov ebx, 0            ; code de status
    int 0x80              ; appel au noyau pour éxécuter l'instruction
